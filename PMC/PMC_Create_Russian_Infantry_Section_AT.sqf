
PMC_Create_Russian_Infantry_Section_AT =
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

	// Russian infantry section

	"RU_Soldier_HAT" createUnit [_respawnpoint, _grp, "", 0.46, "SERGEANT"];
	"RU_Soldier_HAT" createUnit [_respawnpoint, _grp, "", 0.33, "CORPORAL"];
	"RU_Soldier_AT" createUnit [_respawnpoint, _grp, "", 0.33, "CORPORAL"];
	"RU_Soldier_AT" createUnit [_respawnpoint, _grp, "", 0.2, "CORPORAL"];
	"RU_Soldier" createUnit [_respawnpoint, _grp, "", 0.2, "CORPORAL"];

	_grp
};
