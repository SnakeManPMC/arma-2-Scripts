
// is this Chernarus East European Guerrillas??

PMC_Create_Guerrilla_Militia =
{
	private
	[
		"_grp",
		"_respawnpoint"
	];

	_respawnpoint = _this select 0;

	_grp = objNull;
	_grp = createGroup resistance;
	waitUntil {!(isNull _grp)};

	"GUE_Worker2" createUnit [_respawnpoint, _grp, "", 0.46, "SERGEANT"];
	"GUE_Woodlander3" createUnit [_respawnpoint, _grp, "", 0.33, "CORPORAL"];
	"GUE_Villager3" createUnit [_respawnpoint, _grp, "", 0.33, "CORPORAL"];
	"GUE_Woodlander2" createUnit [_respawnpoint, _grp, "", 0.2, "CORPORAL"];
	"GUE_Woodlander1" createUnit [_respawnpoint, _grp, "", 0.2, "CORPORAL"];
	"GUE_Villager4" createUnit [_respawnpoint, _grp, "", 0.2, "CORPORAL"];

	_grp
};
