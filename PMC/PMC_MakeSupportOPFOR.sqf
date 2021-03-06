/*

	Support trucks on support waypoint

Syntax:
[_startPos, _targetPos, _waypointRanPosit] execVM "PMC\PMC_MakeSupportOPFOR.sqf";

Requires:
PMC\PMC_killed.sqf

Returns:
-

*/

PMC_MakeSupportOPFOR =
{
	private ["_tmp","_grp","_respawnpoint","_myVec","_vcl","_wp","_targetpoint","_waypointRanPosit"];

        _respawnpoint = _this select 0;
        _targetpoint = _this select 1;
        _waypointRanPosit = _this select 2;

	_tmp =
	[
		"UralReammo",
		"UralRefuel",
		"UralRepair"
	];

	_grp = objNull;
	_grp = createGroup east;
	waitUntil {!(isNull _grp)};

	// truck drivers	
	"RU_Soldier" createUnit [_respawnpoint, _grp, "", random 1, "SERGEANT"];
	"RU_Soldier" createUnit [_respawnpoint, _grp, "", random 1, "CORPORAL"];
	"RU_Soldier" createUnit [_respawnpoint, _grp, "", random 1, "PRIVATE"];
	"RU_Soldier" createUnit [_respawnpoint, _grp, "", random 1, "PRIVATE"];
	// security vehicle
	"RU_Soldier" createUnit [_respawnpoint, _grp, "", random 1, "PRIVATE"];
	"RU_Soldier" createUnit [_respawnpoint, _grp, "", 1, "PRIVATE"];

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
	_myVec = (PMC_opfor_vehicle_car_armed select round random (count PMC_opfor_vehicle_car_armed - 1));
	_vcl = _myVec createVehicle _respawnpoint;
	(units _grp select 4) moveInDriver _vcl;
	(units _grp select 5) moveInGunner _vcl;

	// increment the created units count
	PMC_opfor = PMC_opfor + 4;
	publicVariable "PMC_opfor";

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
