
PMC_Create_Russian_Infantry_Section =
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

	// Russian infantry section

	"RU_Soldier_TL" createUnit [_respawnpoint, _grp, "", 0.46, "SERGEANT"];
	"RU_Soldier_AR" createUnit [_respawnpoint, _grp, "", 0.33, "CORPORAL"];
	"RU_Soldier_AT" createUnit [_respawnpoint, _grp, "", 0.33, "CORPORAL"];
	"RU_Soldier_GL" createUnit [_respawnpoint, _grp, "", 0.2, "CORPORAL"];
	"RU_Soldier" createUnit [_respawnpoint, _grp, "", 0.2, "CORPORAL"];

	_grp
};
