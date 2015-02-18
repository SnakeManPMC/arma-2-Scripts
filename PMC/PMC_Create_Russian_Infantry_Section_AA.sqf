
PMC_Create_Russian_Infantry_Section_AA =
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

	"RU_Soldier_AA" createUnit [_respawnpoint, _grp, "", 0.46, "SERGEANT"];
	"RU_Soldier_AA" createUnit [_respawnpoint, _grp, "", 0.33, "CORPORAL"];
	"RU_Soldier_AA" createUnit [_respawnpoint, _grp, "", 0.33, "CORPORAL"];

	_grp
};
