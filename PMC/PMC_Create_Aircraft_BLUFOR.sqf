/*
	Create aircraft blufor

Syntax:
[Target, Spawnpoint, Waypoint_Radius] execVM "PMC\PMC_Create_Aircraft_BLUFOR.sqf";

Requires:
PMC\PMC_killed.sqf

Return:
-

*/

PMC_Create_Aircraft_BLUFOR =
{
	private
	[
		"_grp",
		"_myVec",
		"_vcl",
		"_respawnpoint",
		"_targetpoint",
		"_waypointRanPosit"
	];
	_targetpoint = _this select 0;
	_respawnpoint = _this select 1;
	_waypointRanPosit = _this select 2;

	_myVec = (["A10_US_EP1", "MQ9PredatorB_US_EP1"] select floor random 2);
	_vcl = createVehicle [_myVec, _respawnpoint, [], 0, "FLY"];
	_grp = objNull;
	_grp = createGroup west;
	waitUntil {!(isNull _grp)};

	"US_Soldier_Pilot_EP1" createUnit [_respawnpoint, _grp, "", (random 1), "SERGEANT"];
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
	_vcl FlyInHeight 400;

	_grp addWaypoint [_targetpoint, _waypointRanPosit];
	[_grp, 1] setWaypointBehaviour "COMBAT";
	[_grp, 1] setWaypointCombatMode "RED";
	[_grp, 1] setWaypointSpeed "FULL";
	[_grp, 1] setWaypointFormation "WEDGE";
	[_grp, 1] setWaypointType "GUARD";
	[_grp, 1] setWaypointCompletionRadius 100;
};
