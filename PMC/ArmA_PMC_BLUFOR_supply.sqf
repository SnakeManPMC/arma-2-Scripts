/*

	Supply trucks

*/

private ["_PMC_CreateSupplyVehicles","_PMC_SearchForBLUFORCitys","_respawnpoint"];

_PMC_CreateSupplyVehicles =
{
private ["_grp","_myVec","_vcl","_respawnpoint"];

        _respawnpoint = _this select 0;
        _myVec = objNull;
	_vcl = objNull;
	_grp = objNull;
	_grp = createGroup west;
	waitUntil {!(isNull _grp)};

	// first vehicle
	_myVec = (PMC_blufor_vehicle_unarmed select round random (count PMC_blufor_vehicle_unarmed));
	_vcl = _myVec createVehicle _respawnpoint;
	_vcl addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}];

	"SoldierWCrew" createUnit [_respawnpoint, _grp, "", (random 1), "LIEUTENANT"];
	(units _grp select 0) moveInDriver _vcl;

	// second vehicle
	_myVec = (PMC_blufor_vehicle_unarmed select round random (count PMC_blufor_vehicle_unarmed));
	_vcl = _myVec createVehicle [(_respawnpoint select 0),(_respawnpoint select 1)-40];
	_vcl addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}];

	"SoldierWCrew" createUnit [_respawnpoint, _grp, "", (random 1), "CORPORAL"];
	(units _grp select 1) moveInDriver _vcl;

	// increment the created units count
	PMC_blufor = PMC_blufor + 2;
	publicVariable "PMC_blufor";

	// these to function somehow nicely, please :(
	{
		_x addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}];
	} forEach units _grp;

	// do these need to be set, before waypoint 0 hmm?
	_grp setFormation "COLUMN";
	_grp setCombatMode "YELLOW";
	_grp setSpeedMode "FULL";
	_grp setBehaviour "SAFE";

	// return the group name
	_grp
};

/*

	Search for blufor cities

*/
_PMC_SearchForBLUFORCitys =
{
	private ["_a","_color","_PMC_friendly_city_array"];

	// clean city array
	_PMC_friendly_city_array = [];
	_a = 0;

/*
loop through all target locations, check markers for colors.
if match found, then copy the pmc_? gamelogic name into our friendly array.
*/
	while { _a < (count PMC_targets) } do
	{
		// setup the color for marker comparison.
		_color = call compile format ["PMC_City_%1", _a];

		// green is BLUFOR
		if (_color == "COLORGREEN") then
		{
			//call compile format ["'PMC_Objective_%1' setMarkerColor 'ColorGreen'",_a];
			_PMC_friendly_city_array = _PMC_friendly_city_array + [_a];
		};

		// increment one :)
		_a = _a + 1;
	};
};

[] call _PMC_SearchForBLUFORCitys;

//hintc format["blufor cities for resupply trucks: %1", _PMC_friendly_city_array];
_respawnpoint = getPos PMC_targets select 0;
[_respawnpoint] call _PMC_CreateSupplyVehicles;
