
PMC_Create_USMC_Sniper_Team =
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

	// USMC Sniper Team

	"USMC_SoldierS_Sniper" createUnit [_respawnpoint, _grp, "", 1, "SERGEANT"];
	"USMC_SoldierS_Spotter" createUnit [_respawnpoint, _grp, "", 1, "CORPORAL"];

	_grp
};
