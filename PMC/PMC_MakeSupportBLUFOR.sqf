/*








		CLASS NAMES ARE UNCHECKED, PLEASE CONFIRM !!!








	Support trucks on support waypoint

Syntax:
[_startPos, _targetPos, _waypointRanPosit] execVM "PMC\PMC_MakeSupportBLUFOR.sqf";

Requires:
PMC\PMC_killed.sqf

Returns:
-

*/

PMC_MakeSupportBLUFOR =
{
	private ["_tmp","_grp","_respawnpoint","_myVec","_vcl","_wp","_targetpoint","_waypointRanPosit"];

        _respawnpoint = _this select 0;
        _targetpoint = _this select 1;
        _waypointRanPosit = _this select 2;
        
	_tmp =
	[
		"Truck5tReammo",
		"Truck5tRefuel",
		"Truck5tRepair"
	];

	_grp = objNull;
	_grp = createGroup west;
	waitUntil {!(isNull _grp)};

	// truck drivers	
	"USMC_Soldier" createUnit [_respawnpoint, _grp, "", random 1, "SERGEANT"];
	"USMC_Soldier" createUnit [_respawnpoint, _grp, "", random 1, "CORPORAL"];
	"USMC_Soldier" createUnit [_respawnpoint, _grp, "", random 1, "PRIVATE"];
	"USMC_Soldier" createUnit [_respawnpoint, _grp, "", random 1, "PRIVATE"];
	// security vehicle
	"USMC_Soldier" createUnit [_respawnpoint, _grp, "", random 1, "PRIVATE"];
	"USMC_Soldier" createUnit [_respawnpoint, _grp, "", 1, "PRIVATE"];

	// truck 1
	_myVec = (_tmp select round random (count _tmp - 1));
	_vcl = _myVec createVehicle _respawnpoint;
	(units _grp select 0) moveInDriver _vcl;

	// truck 2
	_myVec = (_tmp select round random (count _tmp - 1));
	_vcl = _myVec createVehicle _respawnpoint;
	(units _grp select 1) moveInDriver _vcl;

	// truck 3
	_myVec = (_tmp select round random (count _tmp - 1));
	_vcl = _myVec createVehicle _respawnpoint;
	(units _grp select 2) moveInDriver _vcl;

	// truck 3
	_myVec = (_tmp select round random (count _tmp - 1));
	_vcl = _myVec createVehicle _respawnpoint;
	(units _grp select 3) moveInDriver _vcl;

	// security vehicle
	_myVec = (PMC_blufor_vehicle_car_armed select round random (count PMC_blufor_vehicle_car_armed - 1));
	_vcl = _myVec createVehicle _respawnpoint;
	(units _grp select 4) moveInDriver _vcl;
	(units _grp select 5) moveInGunner _vcl;

	// increment the created units count
	PMC_cu = PMC_cu + 4;
	publicVariable "PMC_cu";

	// these to function somehow nicely, please :(
	{
		_x addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}];
	} forEach units _grp;
	_vcl addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}];

	_grp setBehaviour "SAFE";
	_grp setCombatMode "BLUE";
	_grp setSpeedMode "FULL";
	_grp setFormation "COLUMN";

	_wp = 1;

	_grp addWaypoint [_targetpoint, _waypointRanPosit];
	[_grp, _wp] setWaypointBehaviour "SAFE";
	[_grp, _wp] setWaypointCombatMode "BLUE";
	[_grp, _wp] setWaypointSpeed "FULL";
	[_grp, _wp] setWaypointFormation "COLUMN";
	[_grp, _wp] setWaypointType "SUPPORT";
};
