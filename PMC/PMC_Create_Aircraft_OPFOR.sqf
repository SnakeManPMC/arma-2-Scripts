/*
	Create aircraft opfor

Syntax:
[Target, Spawnpoint, Waypoint_Radius] execVM "PMC\PMC_Create_Aircraft_OPFOR.sqf";

Requires:
PMC\PMC_killed.sqf

Return:
-

*/

PMC_Create_Aircraft_OPFOR =
{
	private
	[
		"_grp",
		"_myVec",
		"_respawnpoint",
		"_targetpoint",
		"_vcl",
		"_waypointRanPosit"
	];

	_targetpoint = _this select 0;
	_respawnpoint = _this select 1;
	_waypointRanPosit = _this select 2;

	_myVec = (["L39_TK_EP1", "Su25_TK_EP1"] select floor random 2);
	_vcl = createVehicle [_myVec, _respawnpoint, [], 0, "FLY"];
	_grp = objNull;
	waitUntil
	{
		_grp = createGroup (east);
		!(isNull _grp);
	};

	"TK_Soldier_Pilot_EP1" createUnit [_respawnpoint, _grp, "", (random 1), "SERGEANT"];
	(units _grp select 0) moveInDriver _vcl;

	// these to function somehow nicely, please :(
	{
		_x addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}];
	} forEach units _grp;
	_vcl addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}];

	_grp setBehaviour "COMBAT";
	_grp setCombatMode "RED";
	_grp setSpeedMode "FULL";
	_grp setFormation "WEDGE";

	// combat aircraft flies bit high
	_vcl flyInHeight 400;

	_grp addWaypoint [_targetpoint, _waypointRanPosit];
	[_grp, 1] setWaypointBehaviour "COMBAT";
	[_grp, 1] setWaypointCombatMode "RED";
	[_grp, 1] setWaypointSpeed "FULL";
	[_grp, 1] setWaypointFormation "WEDGE";
	[_grp, 1] setWaypointType "GUARD";
	[_grp, 1] setWaypointCompletionRadius 100;
};
