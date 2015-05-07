/*

	Artillery site 4 M119 guns

syntax:
[_startPos] execVM "PMC\PMC_MakeArtillerySiteBLUFOR.sqf"

Requires:
PMC\PMC_killed.sqf

Returns:
-

*/

PMC_MakeArtillerySiteBLUFOR =
{
        private ["_grp","_myVec","_vcl","_respawnpoint"];
        
        _respawnpoint = _this select 0;

        _myVec = "M119";
	_vcl = _myVec createVehicle _respawnpoint;
	_vcl addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}];
	_vcl setPos _respawnpoint;

        _grp = objNull;
	_grp = createGroup west;
	waitUntil {!(isNull _grp)};

	// first vehicle	
	"USMC_Soldier_Crew" createUnit [_respawnpoint, _grp, "", (random 1), "LIEUTENANT"];
	(units _grp select 0) moveInGunner _vcl;

	// second vehicle
	_vcl = objNull;
	_vcl = _myVec createVehicle [(_respawnpoint select 0),(_respawnpoint select 1)+50,0];
	_vcl addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}];
	"USMC_Soldier_Crew" createUnit [_respawnpoint, _grp, "", (random 1), "SERGEANT"];
	(units _grp select 1) moveInGunner _vcl;

	// third vehicle	
	_vcl = objNull;
	_vcl = _myVec createVehicle [(_respawnpoint select 0),(_respawnpoint select 1)-50,0];
	_vcl addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}];
	"USMC_Soldier_Crew" createUnit [_respawnpoint, _grp, "", (random 1), "CORPORAL"];
	(units _grp select 2) moveInGunner _vcl;

	// fourth vehicle	
	_vcl = objNull;
	_vcl = _myVec createVehicle [(_respawnpoint select 0),(_respawnpoint select 1)+100,0];
	_vcl addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}];
	"USMC_Soldier_Crew" createUnit [_respawnpoint, _grp, "", (random 1), "PRIVATE"];
	(units _grp select 3) moveInGunner _vcl;

	// increment the created units count
	PMC_cu = PMC_cu + 4;
	publicVariable "PMC_cu";

	// these to function somehow nicely, please :(
	{
		_x addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}];
	} forEach units _grp;

	_grp setBehaviour "COMBAT";
	_grp setCombatMode "RED";
};
