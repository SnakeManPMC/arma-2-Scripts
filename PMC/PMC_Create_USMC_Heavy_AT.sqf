
PMC_Create_USMC_Heavy_AT =
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
		_grp = createGroup (west);
		!(isNull _grp);
	};

	// USMC Heavy AT

	"USMC_Soldier_HAT" createUnit [_respawnpoint, _grp, "", 0.46, "SERGEANT"];
	"USMC_Soldier_AT" createUnit [_respawnpoint, _grp, "", 0.33, "CORPORAL"];
	"USMC_Soldier_LAT" createUnit [_respawnpoint, _grp, "", 0.33, "CORPORAL"];

	_grp
};
