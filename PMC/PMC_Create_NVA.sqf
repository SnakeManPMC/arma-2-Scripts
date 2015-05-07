/*
	Create NVA

Syntax:
[respawnpoint, waypoint_radius] execVM "PMC\PMC_Create_NVA.sqf";

Requires:
-

Returns:
-

*/

private
[
	"_grp",
	"_respawnpoint",
	"_targetpoint",
	"_waypointRanPosit"
];

_respawnpoint = getPos (_this select 0);
_targetpoint = _respawnpoint;
_waypointRanPosit = 100;

_grp = objNull;
_grp = createGroup east;
waitUntil {!(isNull _grp)};

"VTE_NVAofficer" createUnit [_respawnpoint, _grp, "", (random 1), "LIEUTENANT"];
"VTE_NVAsoldier" createUnit [_respawnpoint, _grp, "", (random 1), "SERGEANT"];
"VTE_NVAsoldier" createUnit [_respawnpoint, _grp, "", (random 1), "SERGEANT"];
"VTE_NVAmg" createUnit [_respawnpoint, _grp, "", 1, "CORPORAL"];
"VTE_NVAat" createUnit [_respawnpoint, _grp, "", (random 1), "CORPORAL"];
"VTE_NVAsoldier" createUnit [_respawnpoint, _grp, "", (random 1), "PRIVATE"];
"VTE_NVAsoldier" createUnit [_respawnpoint, _grp, "", (random 1), "PRIVATE"];
"VTE_NVAmg" createUnit [_respawnpoint, _grp, "", 1, "PRIVATE"];
"VTE_NVAaa" createUnit [_respawnpoint, _grp, "", 1, "PRIVATE"];

_grp setBehaviour "AWARE";
_grp setCombatMode "RED";
_grp setSpeedMode "NORMAL";
_grp setFormation "WEDGE";

_grp addWaypoint [_targetpoint, _waypointRanPosit];
[_grp, 1] setWaypointBehaviour "AWARE";
[_grp, 1] setWaypointCombatMode "RED";
[_grp, 1] setWaypointSpeed "NORMAL";
[_grp, 1] setWaypointFormation "WEDGE";
[_grp, 1] setWaypointType "GUARD";
[_grp, 1] setWaypointCompletionRadius 50;
