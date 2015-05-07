/*

	Support trucks on support waypoint

Syntax:
[respawnpoint, targetpoint] execVM "PMC\PMC_Create_Support_BLUFOR.sqf";

Requires:
PMC\PMC_killed.sqf

Returns:
-

*/

PMC_Create_Support_BLUFOR =
{
	private ["_tmp","_grp","_targetpoint","_waypointRanPosit","_crewType","_respawnpoint","_myVec","_vcl","_wp"];

	_tmp =
	[
		"MtvrReammo_DES_EP1",
		"MtvrRefuel_DES_EP1",
		"MtvrRepair_DES_EP1"
	];

	// destination point
        _respawnpoint = _this select 0;
	_targetpoint = _this select 1;
	_waypointRanPosit = 100;

	_grp = objNull;
	_grp = createGroup west;
	waitUntil {!(isNull _grp)};

	_crewType = getText (configFile >> "CfgVehicles" >> (typeOf (_tmp select 0)) >> "Crew");

	// truck drivers
	_crewType createUnit [_respawnpoint, _grp, "", random 1, "SERGEANT"];
	_crewType createUnit [_respawnpoint, _grp, "", random 1, "CORPORAL"];
	_crewType createUnit [_respawnpoint, _grp, "", random 1, "PRIVATE"];
	_crewType createUnit [_respawnpoint, _grp, "", random 1, "PRIVATE"];
	// security vehicle
	_crewType createUnit [_respawnpoint, _grp, "", random 1, "PRIVATE"];
	_crewType createUnit [_respawnpoint, _grp, "", 1, "PRIVATE"];

	// truck 1
	_myVec = (_tmp select round random (count _tmp - 1));
	_vcl = _myVec createVehicle _respawnpoint;
	(units _grp select 0) moveInDriver _vcl;

	// truck 2
	_myVec = (_tmp select round random (count _tmp - 1));
	_vcl = _myVec createVehicle [(_respawnpoint select 0), (_respawnpoint select 1)-10];
	(units _grp select 1) moveInDriver _vcl;

	// truck 3
	_myVec = (_tmp select round random (count _tmp - 1));
	_vcl = _myVec createVehicle [(_respawnpoint select 0), (_respawnpoint select 1)-20];
	(units _grp select 2) moveInDriver _vcl;

	// truck 3
	_myVec = (_tmp select round random (count _tmp - 1));
	_vcl = _myVec createVehicle [(_respawnpoint select 0), (_respawnpoint select 1)-30];
	(units _grp select 3) moveInDriver _vcl;

	// security vehicle
	_myVec = "HMMWV_M1151_M2_DES_EP1";
	_vcl = _myVec createVehicle [(_respawnpoint select 0), (_respawnpoint select 1)-40];
	(units _grp select 4) moveInDriver _vcl;
	(units _grp select 5) moveInGunner _vcl;

	// increment the created units count
	PMC_blufor = PMC_blufor + 6;
	publicVariable "PMC_blufor";

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
