// Create locations for custom islands
// Will scan island and create all keypoints where possible
// Relies on towns having been set on terrain
// Will create CityCenters, Strategic, StrongPointArea, FlatArea, FlatAreaCity, FlatAreaCitySmall, BorderCrossing 

private ["_ctypes","_objs","_size","_twn","_tempObjs","_cx","_cy","_ax","_ay","_bestplaces","_temploc","_debug","_Posi","_nearlocs","_exp","_position","_name","_done","_loop","_northpoint","_southpoint","_eastpoint","_westpoint","_edge","_incr","_by","_bx","_rad","_list","_twnlist","_loc","_output","_neigh","_neighbors","_currentPos","_Pos","_initNeighbors","_strategic","_military","_names","_natural"];

// Choose whether or not to output the location configs
_output = true;
_debug = false;
_showonmap = true;

// Set locs types
_strategic = ["Strategic","StrongpointArea","FlatArea","FlatAreaCity","FlatAreaCitySmall","CityCenter","Airport"];
_military = ["HQ","FOB","Heliport","Artillery","AntiAir","City","Strongpoint","Depot","Storage","PlayerTrail","WarfareStart"];
_names = ["NameCityCapital","NameCity","NameVillage","NameLocal","fakeTown"];
_natural = ["Hill","ViewPoint","RockArea","BorderCrossing","VegetationBroadleaf","VegetationFir","VegetationPalm","VegetationVineyard"];

waitUntil{!isNil "BIS_fnc_init"};

tup_fn_findObjectsByType = {
private ["_types","_locations","_radius","_debug","_color","_icon","_objects","_objpos","_objcenter"];

_types = _this select 0;
_locations = _this select 1;
_radius = _this select 2;
_debug = _this select 3;
_color = _this select 4;
_icon = _this select 5;

if (count _locations == 0)  then 
{	
	_objpos = getArray (configFile >> "CfgWorlds" >> worldName >> "centerPosition");
	_objcenter = createLocation ["Name", _objpos, 1, 1];
	_locations = [_objcenter];
};

_objects = [];
{
		_objects = _objects + nearestObjects [position _x, _types, _radius];

} forEach _locations;

_objects;
};

if (_debug) then {player globalChat "initLocs: Custom Locs(" + worldName + ")";};
[] call BIS_fnc_locations;

waituntil {sleep 1;isnil {bis_functions_mainscope getvariable "BIS_fnc_locations_pending"}};

CRB_CENTER = (getArray (configFile >> "CfgWorlds" >> worldName >> "centerPosition"));
CRB_LOC_DIST = (CRB_CENTER select 0) * 2;

player globalChat format["Create Locations: %1 Mapsize is %2", worldname, CRB_LOC_DIST];
diag_log format ["MSO-%1 Create Locations: %2 Mapsize is %3", time, worldname, CRB_LOC_DIST];
player globalChat format["Create Locations: %1 Map Center is %2", worldname, CRB_CENTER];

_initNeighbors = {
        private ["_twn"];
        {
                _twn = _x;
                if (isnil {_twn getvariable "neighbors"}) then {
                        _twn setvariable ["neighbors",[],true];
                };
                {
                        if (_x distance _twn < 1500) then {
                                [_x,"neighbors",[_twn],true,true] call bis_fnc_variablespaceadd;
                        };
                } foreach (bis_functions_mainscope getvariable "locations");
        } foreach (bis_functions_mainscope getvariable "locations");
};

// Airports -TBD

// CityCenters - Requires (bis_fnc_locations) to initialise locations on map
// Get all locations
_loc = bis_functions_mainscope getvariable "locations";

if (_debug) then {diag_log format ["MSO-%1 Create Locations: current locations = %2", time, count _loc];};
player globalChat format["Create Locations: current locations = %1", count _loc];

// Count citycenters
_twnlist = [];
{
	if ((_x getvariable "type") == "CityCenter") then {_twnlist = _twnlist + [_x]};
	if (_debug) then {diag_log format ["MSO-%1 Create Locations: Found %2 %3 class:%4", time, _x getvariable "type", _x getvariable "name", _x getvariable "class"];};
} foreach _loc;
if (_debug) then {diag_log format ["MSO-%1 Create Locations: CityCenter count = %2", time, count _twnlist]};;

// If no citycenters, then create a citycenter for each city, town, village.
if (count _twnlist == 0) then {
	{
		_twn = createLocation ["CityCenter", position _x, size _x select 0, size _x select 1];
		diag_log format ["MSO-%1 Create Locations: Name %4 - Size %2,%3 ", time, size _x select 0, size _x select 1, text _x];
		_twn setVariable ["name", text _x]; 
		_twn setVariable ["neighbors",[]];
		[[_twn], []] call BIS_fnc_locations;
	} foreach nearestLocations [CRB_CENTER, _names , CRB_LOC_DIST];
	// Set neighbors
	[] call _initNeighbors;	
};

// Strategic - Find objects such as powerstations, industrial, oil fields, military barracks etc
_ctypes = ["Land_A_TVTower_Base", "Land_Dam_ConcP_20", "Land_Ind_Expedice_1","Land_Ind_SiloVelke_02","Land_Mil_Barracks","Land_Mil_Barracks_i","Land_Mil_Barracks_L","Land_Mil_Guardhouse","Land_Mil_House","Land_trafostanica_velka","Land_Ind_Oil_Tower_EP1","Land_A_Villa_EP1","Land_Mil_Barracks_EP1","Land_Mil_Barracks_i_EP1","Land_Mil_Barracks_L_EP1","Land_Ind_PowerStation_EP1","Land_Ind_PowerStation"];
_objs = [_ctypes,[],CRB_LOC_DIST,_debug,"ColorGreen","Dot"] call tup_fn_findObjectsByType;

// If no other locations nearby, for each object check how many objects in the area, set size
{
	_nearlocs = nearestLocations [position _x, ["Strategic","CityCenter","Airport"], 500];
	if ((count _nearlocs) == 0) then 
	{
		// Find any other objects in the vicinity
		_tempObjs = [_ctypes,[_x], 400,_debug,"ColorRed","Dot"] call tup_fn_findObjectsByType;
		// If more than one object then create a strategic location
		if (count _tempObjs > 1) then
		{
			// Increase the size of the area if more objects
			_size = count _tempObjs * 50;
			if (_size > 500) then {_size = 500;};
			if (_size < 100) then {_size = 100;};
			// Calculate the average position of all objects
			_cx = 0;
			_cy = 0;
			{
				_cx = _cx + ((position _x) select 0);
				_cy = _cy + ((position _x) select 1);
			} foreach _tempObjs;
			_ax = _cx / (count _tempObjs);
			_ay = _cy / (count _tempObjs);
			createLocation ["Strategic",[_ax,_ay,0],_size,_size];
			if (_debug) then 
			{
				diag_log format ["MSO-%1 Create Locations: Creating Strategic Location at %2,%3 ", time, _ax, _ay];
			};
		};
	};
} foreach _objs;

// FlatAreaCity - Find 1 flat area per town/city
{
		// Select best places within 100 meters of city center, check they are empty and flat
		_name = text _x;
		_position = [position _x select 0, position _x select 1, 0];
		_currentPos = [0,0,0];
		_done = false;
		_loop = 0;
		_exp = "(1 - meadow) * (1 - forest) * (0.5 + trees) * (1 - hills) * (0.5 + houses) * (1 - sea)";
		// Return the best 10 places near the town center (try 10 times)
		while {(not _done) and (_loop < 10)} do 
		{
			_bestplaces = selectBestPlaces [ _position, 85,_exp, 10, 100];
			if (_debug) then 
			{
				//diag_log format ["MSO-%1 Create Locations: Found %2 best places for %3", time, count _bestplaces, _name];
			};

			// Work out the closest position that is flat and empty
			{
				_Posi =  _x select 0;
				// Check the current position is 10 meters from any object, flat (0.4 gradient) and empty (radius of 10) and not on water or on the shore
				_temploc = _Posi isFlatEmpty [10,0,0.4,10,0,false];
				if ((count _temploc) > 0) then 
				{
					// Check if position is closest to city center
					if ((_Posi distance _position) < (_currentPos distance _position)) then
					{
						_currentPos = _Posi;
					};
				};
			} foreach _bestplaces;
			
			if ((_currentPos distance _position) < 1000) then 
			{
				createLocation ["FlatAreaCity",_currentPos,25,25];
				_done = true;
				if (_debug) then 
				{
					diag_log format ["MSO-%1 Create Locations: Creating FlatAreaCity location at %2", time, _Posi];
				};
			} else {
				if (_debug) then 
				{
					//diag_log format ["MSO-%1 Create Locations: Cannot find suitable FlatAreaCity location for %2", time, _name];
				};
			};
			_loop = _loop + 1;
		};	
} foreach nearestLocations [CRB_CENTER, _names, CRB_LOC_DIST];

// FlatAreaCitySmall - Find 3 small flat area per town/city
{
		// Select best places within 200 meters of city center, check they are empty and flat
		_name = text _x;
		_exp = "(1 - meadow) * (1 - forest) * (0.5 + trees) * (1 - hills) * (0.5 + houses) * (1 - sea)";
	    _bestplaces = selectBestPlaces [ position _x, 200,_exp, 10, 5];
	
		{
			_Pos =  _x select 0;
			_temploc = _Pos isFlatEmpty [8,0,0.4,8,0,false];
			if ((count _temploc) > 0 and (count (nearestLocations [_Pos, ["FlatAreaCitySmall"], 25]) == 0)) then 
			{
				createLocation ["FlatAreaCitySmall",_Pos,10,10];
				if (_debug) then 
				{
					diag_log format ["MSO-%1 Create Locations: Creating FlatAreaCitySmall Location at %2", time, _name];
				};
			};
		} foreach _bestplaces;
} foreach nearestLocations [CRB_CENTER, _names , CRB_LOC_DIST];

// FlatArea - Look for large open spaces that are flat and empty
_exp = "(0.5 + meadow) * (1 - forest) * (0.5 + trees) * (1 - hills) * (1 - houses) * (1 - sea)";
_bestplaces = selectBestPlaces [ CRB_CENTER, CRB_LOC_DIST / 2,_exp, 75, 50];
if (_debug) then 
{
	diag_log format ["MSO-%1 Create Locations: Found %2 flat areas", time, count _bestplaces];
};

{
	_Pos =  _x select 0;
	_temploc = _Pos isFlatEmpty [75,0,0.25,125,0,false];
	if ((count _temploc) > 0 and (count (nearestLocations [_Pos, _names, 125]) == 0)) then 
	{
		createLocation ["FlatArea",_Pos,125,125];
		if (_debug) then 
		{
			diag_log format ["MSO-%1 Create Locations: Creating FlatArea Location at %2", time, _Pos];
		};
	};
} foreach _bestplaces;

// StrongpointArea - Find towns, cities, find roads into towns, find flatempty space, 4 for each town/city
{
		_name = text _x;
		// Get roads within 250 meters of town/city
	    _list = [position _x select 0, position _x select 1, 0] nearRoads 250;
		_westpoint = [position _x select 0, position _x select 1, 0];
		_eastpoint = [position _x select 0, position _x select 1, 0];
		_southpoint = [position _x select 0, position _x select 1, 0];
		_northpoint = [position _x select 0, position _x select 1, 0];
		// Find most western, northern, eastern, southern road points
		{
			if (position _x select 0 < _westpoint select 0) then {_westpoint = position _x;};
			if (position _x select 0 > _eastpoint select 0) then {_eastpoint = position _x;};
			if (position _x select 1 < _southpoint select 0) then {_southpoint = position _x;};
			if (position _x select 1 > _northpoint select 0) then {_northpoint = position _x;};
		} foreach _list;
		if (_debug) then 
		{
			diag_log format ["MSO-%1 Create Locations: Strong points for %2 are N:%3, S:%4, E:%5, W:%6", time, _name, _northpoint, _southpoint, _eastpoint, _westpoint];
		};
		// for each point find a flat/empty space nearby, preferably higher than road height (uses almost same code as FlatAreaCity)
		{		
			_position = _x;
			_currentPos = [0,0,0];
			_done = false;
			_loop = 0;
			_exp = "(0.5 - meadow) * (1 - forest) * (0.5 + trees) * (0.5 + hills) * (0.5 + houses) * (1 - sea)";
			// Return the best 10 places near the road (try 10 times)
			while {(not _done) and (_loop < 10)} do 
			{
				_bestplaces = selectBestPlaces [ _position, 50,_exp, 5, 10];
				if (_debug) then 
				{
					//diag_log format ["MSO-%1 Create Locations: Found %2 strongpoint best places for %3", time, count _bestplaces, _name];
				};

				// Work out the closest position that is flat and empty
				{
					_Posi =  _x select 0;
					// Check the current position is 5 meters from any object, any gradient and empty (radius of 5) and not on water or on the shore
					_temploc = _Posi isFlatEmpty [5,0,1,5,0,false];
					if ((count _temploc) > 0) then 
					{
						//Check if position is closest to road (but not on it)
						if ((_Posi distance _position) < (_currentPos distance _position) and (count (nearestLocations [_Posi, ["StrongPointArea"], 50]) == 0) and !(isOnRoad _Posi)) then
						{
							_currentPos = _Posi;
						};
					};
				} foreach _bestplaces;
				
				// Create Strongpoint area
				if ((_currentPos distance _position) < 300) then 
				{
					createLocation ["StrongPointArea",_currentPos,25,25];
					_done = true;
					if (_debug) then 
					{
						diag_log format ["MSO-%1 Create Locations: Creating StrongPointArea location at %2", time, _Posi];
					};
				} else {
					if (_debug) then 
					{
						//diag_log format ["MSO-%1 Create Locations: Cannot find suitable StrongPointArea location for %2", time, _name];
					};
				};
				_loop = _loop + 1;
			};	

		} foreach [_northpoint, _southpoint, _eastpoint, _westpoint];
		
} foreach nearestLocations [CRB_CENTER, ["NameCityCapital","NameCity","NameVillage","Strategic","Airport"] , CRB_LOC_DIST];

// BorderCrossing - road within x meters of edge of map
// For each edge of map, 
if (count (nearestLocations [CRB_CENTER, ["BorderCrossing"],CRB_LOC_DIST]) == 0) then
{
	_edge = ["north","east","west","south"];
	{

		_rad = 300;
		_bx = 10;
		_by = 10;
		_Posi = [0,0,0];
		if (_x == "north") then {_by = CRB_LOC_DIST-10; _incr = "horz";};
		if (_x == "south") then {_incr = "horz";};
		if (_x == "east") then {_bx = CRB_LOC_DIST-10; _incr = "vert";};
		if (_x == "west") then {_incr = "vert";};
		for "_i" from 0 to round(CRB_LOC_DIST/_rad) do
		{
			//check every x meters for road
			_list = [_bx,_by,0] nearRoads _rad;
			//get closest road point
			if (count _list > 0) then 
			{
				// Place Bordercrossing if none exist
				_Posi =  position (_list select floor(random(count _list)));
				if (count (nearestLocations [_Posi, ["BorderCrossing"], _rad]) == 0) then	
				{
					createLocation ["BorderCrossing",_Posi,25,25];
					if (_debug) then 
					{
						diag_log format ["MSO-%1 Create Locations: Creating %3 BorderCrossing at %2", time, _Posi,_x];
					};
				};
			};		
			// increment 
			if (_incr == "horz") then {_bx = (_i * _rad);};
			if (_incr == "vert") then {_by = (_i * _rad);};
		};
	} foreach _edge;
};

// Heliport - Find helipads on map

// Hills

// ViewPoint - Hill near location with direct line of site

// Vegetation

// Output locations to rpt for inclusion in name.hpp file
if (_output) then 
{
	// Locations except CityCenters
	{
		diag_log format ["class TUP_%1_custom_%2", type _x, round(random 9999)];
		diag_log format ["{"];
		diag_log format ["   name=%1", text _x];
		diag_log format ["   position[]={%1,%2}", position _x select 0, position _x select 1];
		diag_log format ["   type=%1", type _x];
		diag_log format ["   radiusA=%1", size _x select 0];
		diag_log format ["   radiusB=%1", size _x select 1];
		diag_log format ["}"];
	} foreach nearestLocations [CRB_CENTER, ["NameCityCapital","NameCity","NameVillage","Strategic","Airport","FlatArea","FlatAreaCity","FlatAreaCitySmall","Heliport","Hill","ViewPoint","BorderCrossing","StrongPointArea"] , CRB_LOC_DIST];
	
	// also do CityCenters
	{
		_neigh = [];
		_neighbors = _x getvariable "neighbors";
		if !(isnil "_neighbors") then {
			if (count _neighbors > 0) then {
				{
					_neigh = _neigh + [_x getvariable "class"];
				} foreach _neighbors;
			};
		};
		diag_log format ["class %1", _x getvariable "class"];
		diag_log format ["{"];
		diag_log format ["   name=%1", _x getvariable "name"];
		diag_log format ["   position[]={%1,%2}", position _x select 0, position _x select 1];
		diag_log format ["   type=%1",  _x getvariable "type"];
		diag_log format ["   neighbors={%1}", _neigh];
		diag_log format ["}"];
	} foreach (bis_functions_mainscope getvariable "locations");
};

// Mark the map with locations

if (_showonmap) then {
    
        private["_t","_m","_locs"];
		_locs = [];
		{
				_locs = _locs + nearestLocations [CRB_CENTER, _x , CRB_LOC_DIST];
		} forEach [_strategic, _military, _natural, _names];
		
		 player globalChat format["Create Locations: %1 now has %2 locations (check map)", worldname, count _locs];
		 
        {
                _t = format["l%1",floor(random 10000)];
                _m = createMarker [_t, position _x];
                _m setMarkerType "Dot";
                _m setMarkerText str (type _x);
                
                switch(type _x) do {
                        case "NameCityCapital": {
                                _m setMarkerColor "ColorBlue";
                        };
                        case "NameCity": {
                                _m setMarkerColor "ColorBlue";
                        };
                        case "CityCenter": {
                                _m setMarkerColor "ColorBlue";
                        };
                        case "NameVillage": {
                                _m setMarkerColor "ColorBlue";
                        };
                        case "NameLocal": {
                                _m setMarkerColor "ColorBlue";
                        };
                        case "StrongpointArea": {
                                _m setMarkerColor "ColorGreen";
                        };
                        case "FlatArea": {
                                _m setMarkerColor "ColorGreen";
                        };
                        case "FlatAreaCitySmall": {
                                _m setMarkerColor "ColorGreen";
                        };
                        case "Hill": {
                                _m setMarkerColor "ColorGreen";
                        };
                        case "VegetationBroadleaf": {
                                _m setMarkerColor "Default";
                        };
                        case "VegetationFir": {
                                _m setMarkerColor "Default";
                        };
                        case "VegetationPalm": {
                                _m setMarkerColor "Default";
                        };
                        case "VegetationVineyard": {
                                _m setMarkerColor "Default";
                        };
                        case "BorderCrossing": {
                        };
                        case "Airport": {
                                _m setMarkerType "Airport";
                        };
                };
                
        } forEach _locs;
};


