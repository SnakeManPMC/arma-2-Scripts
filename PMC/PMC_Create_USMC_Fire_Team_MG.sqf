
PMC_Create_USMC_Fire_Team_MG =
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

	// USMC Fire Team

	"USMC_Soldier_TL" createUnit [_respawnpoint, _grp, "", 0.46, "SERGEANT"];
	"USMC_Soldier_MG" createUnit [_respawnpoint, _grp, "", 0.33, "CORPORAL"];
	"USMC_Soldier_AR" createUnit [_respawnpoint, _grp, "", 0.33, "CORPORAL"];
	"USMC_Soldier_LAT" createUnit [_respawnpoint, _grp, "", 0.2, "CORPORAL"];

	_grp
};
