
PMC_Create_USMC_Rifle_Squad =
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

	// USMC rifle squad

	"USMC_Soldier_SL" createUnit [_respawnpoint, _grp, "", 0.59, "LIEUTENANT"];
	"USMC_Soldier_TL" createUnit [_respawnpoint, _grp, "", 0.46, "SERGEANT"];
	"USMC_Soldier_AR" createUnit [_respawnpoint, _grp, "", 0.33, "CORPORAL"];
	"USMC_Soldier_LAT" createUnit [_respawnpoint, _grp, "", 0.33, "CORPORAL"];
	"USMC_Soldier" createUnit [_respawnpoint, _grp, "", 0.2, "CORPORAL"];
	"USMC_Soldier_TL" createUnit [_respawnpoint, _grp, "", 0.46, "SERGEANT"];
	"USMC_Soldier_AR" createUnit [_respawnpoint, _grp, "", 0.33, "CORPORAL"];
	"USMC_Soldier_LAT" createUnit [_respawnpoint, _grp, "", 0.33, "CORPORAL"];
	"USMC_Soldier" createUnit [_respawnpoint, _grp, "", 0.2, "CORPORAL"];
	"USMC_Soldier_TL" createUnit [_respawnpoint, _grp, "", 0.46, "SERGEANT"];
	"USMC_Soldier_AR" createUnit [_respawnpoint, _grp, "", 0.33, "CORPORAL"];
	"USMC_Soldier_LAT" createUnit [_respawnpoint, _grp, "", 0.33, "CORPORAL"];
	"USMC_Soldier" createUnit [_respawnpoint, _grp, "", 0.2, "CORPORAL"];

	_grp
};
