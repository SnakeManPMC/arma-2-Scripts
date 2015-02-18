/*

	Random US helicopter patrol over the area.
	New one will be created when old is killed/out of ammo or sorts...

*/

private
[
	"_grp",
	"_helos",
	"_maxH",
	"_myVec",
	"_PMC_MakeHeloBLUFOR",
	"_ran",
	"_respawnpoint",
	"_targetNum",
	"_targetpoint",
	"_tlogic",
	"_vcl",
	"_wp"
];

_vcl = objnull;
_helos =
[
	"VTE_ach47a",
	"VTE_ah1g",
	"VTE_ah1j",
	"VTE_ch34_mg",
	"VTE_ch46e_mg",
	"VTE_ch47ca",
	"VTE_ch53_mg",
	"VTE_oh6a",
	"VTE_oh6arg",
	"VTE_s56_mg",
	"VTE_uh1",
	"VTE_uh1a",
	"VTE_uh1gs",
	"VTE_uh1guns"
];
_maxH = count _helos;

_PMC_MakeHeloBLUFOR =
{
	_myVec = (_helos select round random (_maxH - 1));
	_vcl = _myVec createVehicle _respawnpoint;
	_grp = objNull;
	waitUntil
	{
		_grp = createGroup (west);
		!(isNull _grp);
	};

	if (PMC_debug) then { player sideChat format["created: %1",_myVec]; };

	"VTE_acpilot" createUnit [_respawnpoint, _grp, "", 1, "SERGEANT"];
	(units _grp select 0) moveInDriver _vcl;

/*
	// check if have turrets, then creates gunners for them.
	for "_i" from 0 to ((count (configFile >> "CfgVehicles" >> (typeOf _vcl) >> "Turrets")) - 1) do
	{
		"VTE_acpilot" createUnit [_respawnpoint, _grp, "", 1, "CORPORAL"];
		(units _grp select (_i + 1)) moveinTurret [_vcl,[_i]];
		addSwitchableUnit (units _grp select _i);
	};
*/
	// create helo crew
	[_vcl, _grp] execVM "PMC\PMC_create_crew.sqf";

	// these to function somehow nicely, please :(
	{
		_x addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}];
	} foreach units _grp;
	_vcl addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}];

	_grp setbehaviour "COMBAT";
	_grp setcombatmode "RED";
	_grp setspeedmode "FULL";
	_grp setformation "WEDGE";

	_wp = 1;

	_grp addWaypoint [_targetpoint, 500];
	[_grp, _wp] setWaypointBehaviour "COMBAT";
	[_grp, _wp] setWaypointCombatMode "RED";
	[_grp, _wp] setWaypointSpeed "FULL";
	[_grp, _wp] setWaypointFormation "WEDGE";
	[_grp, _wp] setWaypointType "GUARD";
};

_targetNum = count PMC_targets;
_respawnpoint = getPos CV_helopad;

// never ending loop to create units
while {true} do
{
	_ran = (floor random _targetNum);
	_tlogic = (PMC_targets select _ran);
	_targetpoint = getPos _tlogic;

	[] call _PMC_MakeHeloBLUFOR;

	// lets put up a variable showing helo amounts created
	PMC_helo_cv = PMC_helo_cv + 1;
	publicVariable "PMC_helo_cv";
	// do not attempt to create helos more than once a minute
	sleep 60;

	// wait until the helo cannot either; Move or Fire, or its simply dead.
	waitUntil
	{
		// very relaxed script, lets give it 1min room to breathe
		sleep 60;
		(!alive _vcl || !canMove _vcl || !canFire _vcl);
	};
};
