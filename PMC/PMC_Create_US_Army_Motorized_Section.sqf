
PMC_Create_US_Army_Motorized_Section =
{
	private
	[
		"_grp",
		"_respawnpoint"
	];

	_respawnpoint = _this select 0;

	_grp = objNull;
	_grp = createGroup west;
	waitUntil {!(isNull _grp)};

	"US_Soldier_SL_EP1" createUnit [_respawnpoint, _grp, "", 0.59, "LIEUTENANT"];

	_vcl = "HMMWV_M1151_M2_DES_EP1" createVehicle [(_respawnpoint select 0)+20, (_respawnpoint select 1), 0];
	_vcl addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}];
	// create crew, sergeant? skill 0.46
	// get crew type for this vehicle
	_crewType = getText (configFile >> "CfgVehicles" >> (typeOf _vcl) >> "Crew");
	
	_crewType createUnit [_respawnpoint, _grp, "", 0.46, "SERGEANT"];
	_crewType createUnit [_respawnpoint, _grp, "", 0.46, "SERGEANT"];
	(units _grp select 1) moveInGunner _vcl;
	(units _grp select 2) moveInDriver _vcl;

	_vcl = "HMMWV_MK19_DES_EP1" createVehicle [(_respawnpoint select 0)+20, (_respawnpoint select 1)+20, 0];
	_vcl addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}];
	// create crew, sergeant? skill 0.46
	// get crew type for this vehicle
	_crewType = getText (configFile >> "CfgVehicles" >> (typeOf _vcl) >> "Crew");
	
	_crewType createUnit [_respawnpoint, _grp, "", 0.46, "SERGEANT"];
	_crewType createUnit [_respawnpoint, _grp, "", 0.46, "SERGEANT"];
	(units _grp select 3) moveInGunner _vcl;
	(units _grp select 4) moveInDriver _vcl;

	"US_Soldier_AT_EP1" createUnit [_respawnpoint, _grp, "", 0.33, "CORPORAL"];
	"US_Soldier_GL_EP1" createUnit [_respawnpoint, _grp, "", 0.33, "CORPORAL"];
	"US_Soldier_GL_EP1" createUnit [_respawnpoint, _grp, "", 0.33, "CORPORAL"];
	"US_Soldier_AAT_EP1" createUnit [_respawnpoint, _grp, "", 0.2, "CORPORAL"];
	"US_Soldier_Marksman_EP1" createUnit [_respawnpoint, _grp, "", 0.33, "CORPORAL"];

	_grp
};
