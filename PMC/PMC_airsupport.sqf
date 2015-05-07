/*

CAS driven by AI

*/

private ["_PMC_typeOfsupport","_PMC_WaypointCreation","_respawnpoint","_targetpoint","_z","_PMC_Airsupport_A10","_PMC_Airsupport_AH1", "_grp"];

/*
This creates the waypoints for the airsupport. Basically making them fly from far
away using the plotwaypoints function, then search and destroy waypoint and finally
return to far away location and get deleteVehicle'd. ZZZZUP!
*/
_PMC_WaypointCreation = 
{
	private ["_tmppos","_wp","_grp","_targetpoint"];
        _grp = _this select 0;
        _targetpoint = _this select 1;
	_grp setBehaviour "COMBAT";
	_grp setCombatMode "RED";
	_grp setSpeedMode "FULL";
	_grp setFormation "WEDGE";

	// for long distance waypoint plotting
	_wp = [_grp,_targetpoint] call compile preProcessFileLineNumbers "PMC\PMC_plotWaypoints.sqf";
	_wp = _wp + 1;

	// kill them all search and destroy
	_grp addWaypoint [_targetpoint, 0];
	[_grp, _wp] setWaypointBehaviour "COMBAT";
	[_grp, _wp] setWaypointCombatMode "RED";
	[_grp, _wp] setWaypointSpeed "FULL";
	[_grp, _wp] setWaypointFormation "WEDGE";
	[_grp, _wp] setWaypointType "SAD";

	// for long distance waypoint plotting
	_tmppos = [0,0,0];
	_wp = [_grp,_tmppos] call compile preProcessFileLineNumbers "PMC\PMC_plotWaypoints.sqf";
	_wp = _wp + 1;

	// final waypoint guard
	_grp addWaypoint [_targetpoint, 0];
	[_grp, _wp + 1] setWaypointType "GUARD";
};

_PMC_Airsupport_A10 =
{
        private ["_grp","_vcl","_respawnpoint"];

        _respawnpoint = _this select 0;
        _vcl = createVehicle ["A10", _respawnpoint, [], 0, "FLY"];
	_vcl addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}];
	_grp = objNull;
	_grp = createGroup west;
	waitUntil {!(isNull _grp)};

	"USMC_Soldier_Pilot" createUnit [_respawnpoint, _grp, "", 1, "SERGEANT"];
	(units _grp select 0) moveInDriver _vcl;

	// these to function somehow nicely, please :(
	{
		_x addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}];
	} forEach units _grp;

	_vcl FlyInHeight 200;
	// plot waypoints
	_grp
};

_PMC_Airsupport_AH1 =
{
	private ["_vcl2","_grp","_vcl","_respawnpoint"];

        _respawnpoint = _this select 0;
        _vcl = createVehicle ["AH1Z", _respawnpoint, [], 0, "FLY"];
	_vcl addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}];
	// create second one 100m away and 150m altitude.
	_vcl2 = createVehicle ["AH1Z", [(_respawnpoint select 0),(_respawnpoint select 1)+100,125], [], 0, "FLY"];
	_vcl2 addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}];

	_grp = objNull;
	_grp = createGroup west;
	waitUntil {!(isNull _grp)};

	"USMC_Soldier_Pilot" createUnit [_respawnpoint, _grp, "", 1, "SERGEANT"];
	"USMC_Soldier_Pilot" createUnit [_respawnpoint, _grp, "", 1, "CORPORAL"];
	(units _grp select 0) moveInDriver _vcl;
	(units _grp select 1) moveInGunner _vcl;

	"USMC_Soldier_Pilot" createUnit [_respawnpoint, _grp, "", 1, "CORPORAL"];
	"USMC_Soldier_Pilot" createUnit [_respawnpoint, _grp, "", 1, "PRIVATE"];
	(units _grp select 2) moveInDriver _vcl2;
	(units _grp select 3) moveInGunner _vcl2;

	// these to function somehow nicely, please :(
	{
		_x addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}];
	} forEach units _grp;

	// plot waypoints
	_grp
};


// airsupport location
_targetpoint = _this select 0;

// aircraft starting point
_respawnpoint = getPos (_this select 1);

// type of support
_PMC_typeOfsupport = _this select 2;

// check that we dont have airsupport already running.
// but this should still allow A10 AND Cobra at the same time, hmm...
if (PMC_airsupportrunning) exitWith
{
	player globalChat "Airsupport is busy. Over.";
};

PMC_airsupportrunning = true;
publicVariable "PMC_airsupportrunning";

// main calling code here
player globalChat "Airsupport running. Over.";
if (PMC_debug) then
{
	player sideChat format["_respawnpoint: %1. _targetpoint: %2. _PMC_typeOfsupport: %3",_respawnpoint,_targetpoint,_PMC_typeOfsupport];
};

/*
create the trigger to delete all west units in [0,0,0];
*/
_z = createTrigger ["EmptyDetector", [0,0,0]];
_z setTriggerActivation ["WEST", "PRESENT", true];
_z setTriggerArea [200, 200, 0, true];
_z setTriggerStatements ["this", "{deleteVehicle _x} forEach thislist;", ""];

// type of airsupport
if (_PMC_typeOfsupport == "A10") then
{
	if (PMC_debug) then
	{
		player sideChat "hello we are in _PMC_Airsupport_A10!";
	};
	_grp = [_respawnpoint] call _PMC_Airsupport_A10;
        [_grp, _targetpoint] call _PMC_WaypointCreation;
};

if (_PMC_typeOfsupport == "AH1") then
{
	if (PMC_debug) then
	{
		player sideChat "hello we are in _PMC_Airsupport_AH1!";
	};
	_grp = [_respawnpoint] call _PMC_Airsupport_AH1;
        [_grp, _targetpoint] call _PMC_WaypointCreation;
};

// end, clear the lock
PMC_airsupportrunning = false;
publicVariable "PMC_airsupportrunning";
