
PMC_Create_Guerilla_Takistan_Motorized_Technicals =
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
		_grp = createGroup (resistance);
		!(isNull _grp);
	};

	"TK_GUE_Soldier_TL_EP1" createUnit [_respawnpoint, _grp, "", 0.46, "SERGEANT"];

	_vcl = "Offroad_DSHKM_TK_GUE_EP1" createVehicle [(_respawnpoint select 0)+20, (_respawnpoint select 1), 0];
	_vcl addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}];
	// create crew, corporal? skill 0.33
	// get crew type for this vehicle
	_crewType = getText (configFile >> "CfgVehicles" >> (typeOf _vcl) >> "Crew");
	
	_crewType createUnit [_respawnpoint, _grp, "", 0.33, "CORPORAL"];
	_crewType createUnit [_respawnpoint, _grp, "", 0.33, "CORPORAL"];
	(units _grp select 1) moveInGunner _vcl;
	(units _grp select 2) moveInDriver _vcl;

	_vcl = "Offroad_SPG9_TK_GUE_EP1" createVehicle [(_respawnpoint select 0)+20, (_respawnpoint select 1)+20, 0];
	_vcl addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}];
	// create crew, corporal? skill 0.33
	_crewType createUnit [_respawnpoint, _grp, "", 0.33, "CORPORAL"];
	_crewType createUnit [_respawnpoint, _grp, "", 0.33, "CORPORAL"];
	(units _grp select 3) moveInGunner _vcl;
	(units _grp select 4) moveInDriver _vcl;

	_vcl = "Pickup_PK_TK_GUE_EP1" createVehicle [(_respawnpoint select 0)+30, (_respawnpoint select 1), 0];
	_vcl addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}];
	// create crew, corporal? skill 0.33
	_crewType createUnit [_respawnpoint, _grp, "", 0.33, "CORPORAL"];
	_crewType createUnit [_respawnpoint, _grp, "", 0.33, "CORPORAL"];
	(units _grp select 5) moveInGunner _vcl;
	(units _grp select 6) moveInDriver _vcl;

	"TK_GUE_Soldier_AT_EP1" createUnit [_respawnpoint, _grp, "", 0.33, "CORPORAL"];
	"TK_GUE_Soldier_EP1" createUnit [_respawnpoint, _grp, "", 0.2, "CORPORAL"];

	_grp
};
