/*

this supposedly doesnt work becuse of the TR UNLOAD waypoint command is broken.

Use PMC_TEMP_infTransport.sqf for now.

*/

private
[
	"_grp",
	"_HeloGrp",
	"_respawnpoint",
	"_side",
	"_targetpoint",
	"_vcl",
	"_wp"
];

_grp = _this select 0;
_respawnpoint = _this select 1;
_targetpoint = _this select 2;
_side = _this select 3;

_vcl = objNull;
_HeloGrp = objNull;

if (_side == "West") then 
{
	_HeloGrp = createGroup west;
	waitUntil {!(isNull _HeloGrp)};

	_vcl = "UH60MG" createVehicle _respawnpoint;
	"SoldierWPilot" createUnit [_respawnpoint, _HeloGrp, "", (random 1), "SERGEANT"];
	"SoldierWPilot" createUnit [_respawnpoint, _HeloGrp, "", (random 1), "CORPORAL"];
	"SoldierWPilot" createUnit [_respawnpoint, _HeloGrp, "", (random 1), "CORPORAL"];
	(units _HeloGrp select 0) moveInDriver _vcl;
	(units _HeloGrp select 1) moveinTurret [_vcl,[0]];
	(units _HeloGrp select 2) moveinTurret [_vcl,[1]];
	{_x addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}]} forEach units _HeloGrp;
	_vcl addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}];
}
else
{
	_HeloGrp = createGroup east;
	waitUntil {!(isNull _HeloGrp)};

	_vcl = "Mi17_mg" createVehicle _respawnpoint;
	"SoldierEPilot" createUnit [_respawnpoint, _HeloGrp, "", (random 1), "SERGEANT"];
	"SoldierEPilot" createUnit [_respawnpoint, _HeloGrp, "", (random 1), "CORPORAL"];
	(units _HeloGrp select 0) moveInDriver _vcl;
	(units _HeloGrp select 1) moveinGunner _vcl;
	{_x addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}]} forEach units _HeloGrp;
	_vcl addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}];
};

// load our guys
{_x moveinCargo _vcl} forEach units _grp;

_HeloGrp setBehaviour "AWARE";
_HeloGrp setCombatMode "YELLOW";
_HeloGrp setSpeedMode "FULL";
_HeloGrp setFormation "WEDGE";

// for long distance waypoint plotting
_wp = [_HeloGrp,_targetpoint] call compile preProcessFileLineNumbers "PMC\PMC_plotWaypoints.sqf";
_wp = _wp + 1;

// fly to targetpoint and unload our guys
_HeloGrp addWaypoint [_targetpoint, 0];
[_HeloGrp, _wp] setWaypointBehaviour "AWARE";
[_HeloGrp, _wp] setWaypointCombatMode "YELLOW";
[_HeloGrp, _wp] setWaypointSpeed "FULL";
[_HeloGrp, _wp] setWaypointFormation "WEDGE";
[_HeloGrp, _wp] setWaypointType "TR UNLOAD";

// return to "HQ"
_HeloGrp addWaypoint [_respawnpoint, 0];
[_HeloGrp, (_wp+1)] setWaypointBehaviour "COMBAT";
[_HeloGrp, (_wp+1)] setWaypointCombatMode "RED";
[_HeloGrp, (_wp+1)] setWaypointType "GUARD";
