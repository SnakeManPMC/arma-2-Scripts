
PMC_Create_Takistani_Army_Armor_T72_Platoon =
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

	_vcl = "T72_TK_EP1" createVehicle _respawnpoint;
	_vcl addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}];
	// create crew, CAPTAIN? skill 0.73
	// get crew type for this vehicle
	_crewType = getText (configFile >> "CfgVehicles" >> (typeOf _vcl) >> "Crew");
	
	_crewType createUnit [_respawnpoint, _grp, "", 0.73, "CAPTAIN"];
	_crewType createUnit [_respawnpoint, _grp, "", 0.73, "CAPTAIN"];
	_crewType createUnit [_respawnpoint, _grp, "", 0.73, "CAPTAIN"];
	(units _grp select 0) moveInCommander _vcl;
	(units _grp select 1) moveInGunner _vcl;
	(units _grp select 2) moveInDriver _vcl;

	_vcl = "T72_TK_EP1" createVehicle [(_respawnpoint select 0)+20, (_respawnpoint select 1), 0];
	_vcl addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}];
	// create crew, LIEUTENANT? skill 0.59
	// get crew type for this vehicle
	_crewType = getText (configFile >> "CfgVehicles" >> (typeOf _vcl) >> "Crew");
	
	_crewType createUnit [_respawnpoint, _grp, "", 0.59, "LIEUTENANT"];
	_crewType createUnit [_respawnpoint, _grp, "", 0.59, "LIEUTENANT"];
	_crewType createUnit [_respawnpoint, _grp, "", 0.59, "LIEUTENANT"];
	(units _grp select 3) moveInCommander _vcl;
	(units _grp select 4) moveInGunner _vcl;
	(units _grp select 5) moveInDriver _vcl;

	_vcl = "T72_TK_EP1" createVehicle [(_respawnpoint select 0)+20, (_respawnpoint select 1)+20, 0];
	_vcl addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}];
	// create crew, LIEUTENANT? skill 0.59
	// get crew type for this vehicle
	_crewType = getText (configFile >> "CfgVehicles" >> (typeOf _vcl) >> "Crew");
	
	_crewType createUnit [_respawnpoint, _grp, "", 0.59, "LIEUTENANT"];
	_crewType createUnit [_respawnpoint, _grp, "", 0.59, "LIEUTENANT"];
	_crewType createUnit [_respawnpoint, _grp, "", 0.59, "LIEUTENANT"];
	(units _grp select 6) moveInCommander _vcl;
	(units _grp select 7) moveInGunner _vcl;
	(units _grp select 8) moveInDriver _vcl;

	_grp
};
