
PMC_Create_Takistani_Army_Mechanized_Recon_AT =
{
	private
	[
		"_grp",
		"_respawnpoint"
	];

	_respawnpoint = _this select 0;

	_grp = objNull;
	waitUntil
	{
		_grp = createGroup (east);
		!(isNull _grp);
	};

	_vcl = "BRDM2_ATGM_TK_EP1" createVehicle _respawnpoint;
	_vcl addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}];
	// create crew, SERGEANT? skill 0.46
	// get crew type for this vehicle
	_crewType = getText (configFile >> "CfgVehicles" >> (typeOf _vcl) >> "Crew");
	
	_crewType createUnit [_respawnpoint, _grp, "", 0.46, "SERGEANT"];
	_crewType createUnit [_respawnpoint, _grp, "", 0.46, "SERGEANT"];
	(units _grp select 0) moveInGunner _vcl;
	(units _grp select 1) moveInDriver _vcl;

	_vcl = "BRDM2_ATGM_TK_EP1" createVehicle [(_respawnpoint select 0)+20, (_respawnpoint select 1), 0];
	_vcl addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}];
	// create crew, SERGEANT? skill 0.46
	// get crew type for this vehicle
	_crewType = getText (configFile >> "CfgVehicles" >> (typeOf _vcl) >> "Crew");
	
	_crewType createUnit [_respawnpoint, _grp, "", 0.46, "SERGEANT"];
	_crewType createUnit [_respawnpoint, _grp, "", 0.46, "SERGEANT"];
	(units _grp select 2) moveInGunner _vcl;
	(units _grp select 3) moveInDriver _vcl;

	_grp
};
