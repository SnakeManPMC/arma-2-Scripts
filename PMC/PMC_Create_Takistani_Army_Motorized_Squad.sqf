
PMC_Create_Takistani_Army_Motorized_Squad =
{
	private
	[
		"_grp",
		"_respawnpoint"
	];

	_respawnpoint = _this select 0;

	_grp = objNull;
	_grp = createGroup east;
	waitUntil {!(isNull _grp)};

	"TK_Soldier_SL_EP1" createUnit [_respawnpoint, _grp, "", 0.46, "SERGEANT"];
	
	_vcl = "V3S_Open_TK_EP1" createVehicle [(_respawnpoint select 0)+20, (_respawnpoint select 1), 0];
	_vcl addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}];
	// create crew, corporal? skill 0.33
	// get crew type for this vehicle
	_crewType = getText (configFile >> "CfgVehicles" >> (typeOf _vcl) >> "Crew");
	
	_crewType createUnit [_respawnpoint, _grp, "", 0.33, "CORPORAL"];
	(units _grp select 1) moveInDriver _vcl;

	"TK_Soldier_MG_EP1" createUnit [_respawnpoint, _grp, "", 0.33, "CORPORAL"];
	"TK_Soldier_AT_EP1" createUnit [_respawnpoint, _grp, "", 0.33, "CORPORAL"];
	"TK_Soldier_GL_EP1" createUnit [_respawnpoint, _grp, "", 0.33, "CORPORAL"];
	"TK_Soldier_EP1" createUnit [_respawnpoint, _grp, "", 0.33, "CORPORAL"];
	"TK_Soldier_MG_EP1" createUnit [_respawnpoint, _grp, "", 0.33, "CORPORAL"];
	"TK_Soldier_LAT_EP1" createUnit [_respawnpoint, _grp, "", 0.33, "CORPORAL"];
	"TK_Soldier_GL_EP1" createUnit [_respawnpoint, _grp, "", 0.2, "CORPORAL"];
	"TK_Soldier_AMG_EP1" createUnit [_respawnpoint, _grp, "", 0.2, "CORPORAL"];

	_grp
};
