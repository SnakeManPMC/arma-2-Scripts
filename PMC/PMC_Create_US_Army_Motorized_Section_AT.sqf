
PMC_Create_US_Army_Motorized_Section_AT =
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

	"US_Soldier_SL_EP1" createUnit [_respawnpoint, _grp, "", 0.46, "SERGEANT"];

	_vcl = "HMMWV_TOW_DES_EP1" createVehicle [(_respawnpoint select 0)+20, (_respawnpoint select 1), 0];
	_vcl addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}];
	// create crew, corporal? skill 0.33
	// get crew type for this vehicle
	_crewType = getText (configFile >> "CfgVehicles" >> (typeOf _vcl) >> "Crew");
	
	_crewType createUnit [_respawnpoint, _grp, "", 0.33, "CORPORAL"];
	_crewType createUnit [_respawnpoint, _grp, "", 0.33, "CORPORAL"];
	(units _grp select 1) moveInGunner _vcl;
	(units _grp select 2) moveInDriver _vcl;

	_vcl = "HMMWV_TOW_DES_EP1" createVehicle [(_respawnpoint select 0)+20, (_respawnpoint select 1)+20, 0];
	_vcl addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}];
	// create crew, corporal? skill 0.33
	// get crew type for this vehicle
	_crewType = getText (configFile >> "CfgVehicles" >> (typeOf _vcl) >> "Crew");
	
	_crewType createUnit [_respawnpoint, _grp, "", 0.33, "CORPORAL"];
	_crewType createUnit [_respawnpoint, _grp, "", 0.33, "CORPORAL"];
	(units _grp select 3) moveInGunner _vcl;
	(units _grp select 4) moveInDriver _vcl;

	"US_Soldier_AR_EP1" createUnit [_respawnpoint, _grp, "", 0.2, "CORPORAL"];

	_grp
};
