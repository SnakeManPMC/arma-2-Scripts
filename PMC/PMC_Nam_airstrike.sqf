/*

	VTE airstrike script.
	Just a GUARD waypoint AI creation, nothing more.

Syntax:
[_respawnpoint, _targetpoint] execVM "PMC\PMC_Nam_airstrike.sqf";

Requires:
PMC\PMC_killed.sqf

*/
private ["_PMC_Aircrafts","_PMC_Airsupport","_vcl","_respawnpoint","_targetpoint"];

_PMC_Aircrafts =
[
	"VTE_A4",
	"VTE_A4_B",
	"VTE_A4_Napalm",
	"VTE_A4_R",
	"VTE_ac130",
	"VTE_b52",
	"VTE_birddog",
	"VTE_C130",
	"VTE_f105",
	"VTE_f105_r",
	"VTE_F4_GREY_AA",
	"VTE_F4_GREY_AG",
	"VTE_F4_TAN_AA",
	"VTE_F4_TAN_AG",
	"VTE_F5GREY",
	"VTE_F5SEA",
	"VTE_Intruder",
	"VTE_Intruder_mk82",
	"VTE_IntruderFire",
	"VTE_MC130",
	"vte_ov1c",
	"vte_ov1a",
	"vte_ov1b",
	"vte_ov1d",
	"vte_ov10",
	"vte_ov10a",
	"vte_ov10c",
	"vte_ov10d",
	"VTE_RaiderCAS",
	"VTE_RaiderSAR",
	"VTE_RaiderSEA"
];

_PMC_Airsupport =
{
        private ["_grp","_ran","_PMC_Aircrafts","_MyVcl","_vcl","_respawnpoint","_wp","_targetpoint"];
        
        _PMC_Aircrafts = _this select 0;
        _respawnpoint = _this select 1;
        _targetpoint = _this select 2;
        
        _ran = (floor random count _PMC_Aircrafts);
	_MyVcl = (_PMC_Aircrafts select _ran);

	_vcl = createVehicle [_MyVcl, _respawnpoint, [], 0, "FLY"];
	_vcl addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}];
	_grp = objNull;
	_grp = createGroup west;
	waitUntil {!(isNull _grp)};

	"vte_acpilot" createUnit [_respawnpoint, _grp, "", 1, "SERGEANT"];
	(units _grp select 0) moveInDriver _vcl;

	// these to function somehow nicely, please :(
	{
		_x addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}];
	} forEach units _grp;

	_wp = 1;

	_grp addWaypoint [_targetpoint, 500];
	[_grp, _wp] setWaypointBehaviour "COMBAT";
	[_grp, _wp] setWaypointCombatMode "RED";
	[_grp, _wp] setWaypointSpeed "FULL";
	[_grp, _wp] setWaypointFormation "WEDGE";
	[_grp, _wp] setWaypointType "GUARD";
        
        _vcl
};

//_respawnpoint = _this select 1;
//_targetpoint = _this select 2;
_respawnpoint = getPosASL _this select 0;
_targetpoint = getPosASL _this select 1;

while {true} do
{
	_vcl = [_PMC_Aircrafts, _respawnpoint, _targetpoint] call _PMC_Airsupport;

	waitUntil
	{
		sleep 10;
		//player sidechat format["looping PMC_Airsupport thing... alive: %1. canmove: %2", alive _vcl, canMove _vcl];
		(!canMove _vcl);
	};
};
