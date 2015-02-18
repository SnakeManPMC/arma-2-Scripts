/*

Civilians around the objective to make things... interesting.

Syntax:
[targetPoint] execVM "PMC\PMC_objective_civilians.sqf";

*/

private ["_a","_PMC_MakeCivis","_PMC_MakeStatics","_PMC_RandomTargetLocation","_targetpoint","_waypointRanPosit","_pos"];

// grab the objective location from parameter
_targetpoint = _this select 0;

// select random position.
_PMC_RandomTargetLocation =
{
	private ["_randompos","_targetpoint"];
        _targetpoint = _this select 0;
        
	_randompos = [((_targetpoint select 0)-200 + random 400), ((_targetpoint select 1)-200 + random 400), 0];
	if (PMC_debug) then
	{
		player sidechat format["oldpos: %1. new pos: %2", _targetpoint, _randompos];
	};
	// return the random position
	_randompos;
};

_PMC_MakeCivis =
{
	
private ["_grp","_targetpoint","_waypointRanPosit"];

        _targetpoint = _this select 0;
        _waypointRanPosit = _this select 1;
        
        _grp = objNull;
	waitUntil
	{
		_grp = createGroup (CIVILIAN);
		!(isNull _grp);
	};

	"vte_villager1" createUnit [_targetpoint, _grp, "", (random 1), "LIEUTENANT"];
	"vte_villager2" createUnit [_targetpoint, _grp, "", (random 1), "SERGEANT"];
	"vte_villager3" createUnit [_targetpoint, _grp, "", (random 1), "SERGEANT"];
	"vte_villager4" createUnit [_targetpoint, _grp, "", (random 1), "CORPORAL"];
	"vte_villager5" createUnit [_targetpoint, _grp, "", (random 1), "CORPORAL"];
	"vte_villager6" createUnit [_targetpoint, _grp, "", (random 1), "PRIVATE"];
	"vte_villager7" createUnit [_targetpoint, _grp, "", (random 1), "PRIVATE"];
	"vte_villager8" createUnit [_targetpoint, _grp, "", (random 1), "PRIVATE"];

	_grp setBehaviour "AWARE";
	_grp setCombatMode "RED";
	_grp setSpeedMode "NORMAL";
	_grp setFormation "WEDGE";

	// wp 1
	_grp addWaypoint [_targetpoint, _waypointRanPosit];
	[_grp, 1] setWaypointBehaviour "AWARE";
	[_grp, 1] setWaypointCombatMode "RED";
	[_grp, 1] setWaypointSpeed "NORMAL";
	[_grp, 1] setWaypointFormation "WEDGE";
	[_grp, 1] setWaypointType "MOVE";
	[_grp, 1] setWaypointTimeout [60*2, 0, 60*20];

	// wp 2
	_grp addWaypoint [_targetpoint, _waypointRanPosit];
	[_grp, 2] setWaypointType "MOVE";
	[_grp, 2] setWaypointTimeout [60*2, 0, 60*20];

	// wp 3
	_grp addWaypoint [_targetpoint, _waypointRanPosit];
	[_grp, 3] setWaypointType "MOVE";
	[_grp, 3] setWaypointTimeout [60*2, 0, 60*20];

	// wp cycle
	_grp addWaypoint [_targetpoint, 0];
	[_grp, 4] setWaypointType "CYCLE";
};

_PMC_MakeStatics =
{
private ["_myVec","_a","_statics","_targetpoint"];

        _statics =
	[
		"VTE_vilbasket1",
		"VTE_vilbasket2",
		"VTE_vilbasket3",
		"VTE_vilbasketcart1",
		"VTE_vilbench1",
		"VTE_vilcloth1",
		"VTE_vilcloth2",
		"VTE_vilcrate1",
		"VTE_vilfence1",
		"VTE_vilfence2",
		"VTE_vilhaycone1",
		"VTE_vilmat1",
		"VTE_vilmat2",
		"VTE_vilpaper1",
		"VTE_vilpot1",
		"VTE_vilricebasket1",
		"VTE_vilricebasket2",
		"VTE_viltable1",
		"VTE_viltire1"
	];

        _targetpoint = _this select 0;
        
	_a = 0;
	while { _a < (round random 5) } do
	{
		_myVec = (_statics select round random (count _statics - 1));
		_myVec createVehicle _targetpoint;

		if (PMC_debug) then { player sideChat format["created civie static: %1",_myVec]; };
		_a = _a + 1;
	};
};

// our waypoints random circle range
_waypointRanPosit = 250;

// create units
_a = 0;
while { _a < (1 + round random 5) } do
{
	_a = _a + 1;
	_pos = [_targetpoint] call _PMC_RandomTargetLocation;

	[_pos, _waypointRanPosit] call _PMC_MakeCivis;
	[_pos] call _PMC_MakeStatics;
	sleep 1;
	[_pos] call _PMC_MakeStatics;
	sleep 1;
        [_pos] call _PMC_MakeStatics;
	sleep 1;
        [_pos] call _PMC_MakeStatics;
};
