private
[
	"_i",
	"_loc_type",
	"_color",
	"_locs",
	"_n",
	"_m"
];

waitUntil {!isNil "bis_fnc_init"};

_i = 0;
markLoc =
{
	_loc_type = _this select 0;
	_color = _this select 1;
	_locs = [_loc_type, [[0,0,0],1000000], true] call BIS_fnc_locations;
	{
		_i = _i + 1;
		_n = format["x_%1", _i];
		_m = createMarker [_n, position _x];
		_m setMarkerType "Dot";
		_m setMarkerColor _color;
		_m setMarkerText _loc_type;
	} forEach _locs;
};

["Airport", "ColorWhite"] call markLoc;
["CityCenter", "ColorBlack"] call markLoc;
["FlatArea", "ColorBlue"] call markLoc;
["FlatAreaCity", "ColorGreen"] call markLoc;
["FlatAreaCitySmall", "ColorYellow"] call markLoc;
["Strategic", "ColorRed"] call markLoc;
["StrongpointArea", "ColorRed"] call markLoc;
["HQ", "ColorRed"] call markLoc;

/*
Or you can do:

["StrongpointArea",[],[true]] call bis_fnc_locations;

and it would place grey marker on all those StrongPointArea locations.


http://community.bistudio.com/wiki/ArmA_2:_CfgLocationTypes
http://community.bistudio.com/wiki/createLocation


StrongpointArea: Someone going to create a Warfare mission on your island would like them. (If tactically placed)
On Chernarus you can see that they mark the places for the satellite outposts guarding the cities. They are placed pretty good.
- 2 up to 4, based on the city size / approaches
- each overlooking at least one general approach (not especially roads) towards the city
- while being far away enough to deny engaged attackers a line of sight towards the city
- on a somewhat flat area which does look ok with a bunker on it

You can open Chernarus in the mission editor.
Place the bis function module.
Execute this line after the module initalized itself:
["StrongpointArea",[],[true]] call bis_fnc_locations
This debug function will mark all locations of that kind on the player map with grey cirlces.


Airport
BorderCrossing
CityCenter
FlatArea
FlatAreaCity
FlatAreaCitySmall
Hill
NameCity
NameCityCapital
NameLocal
NameMarine
NameVillage
RockArea
Strategic
StrongpointArea
VegetationBroadleaf
VegetationFir
VegetationPalm
VegetationVineyard
ViewPoint
*/
