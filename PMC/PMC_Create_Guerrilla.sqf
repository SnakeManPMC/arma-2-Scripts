
// is this Chernarus East European Guerillas??

PMC_Create_Guerrilla =
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

	"GUE_Soldier_CO" createUnit [_respawnpoint, _grp, "", 0.46, "SERGEANT"];
	"GUE_Soldier_GL" createUnit [_respawnpoint, _grp, "", 0.33, "CORPORAL"];
	"GUE_Soldier_AR" createUnit [_respawnpoint, _grp, "", 0.33, "CORPORAL"];
	"GUE_Soldier_1" createUnit [_respawnpoint, _grp, "", 0.2, "CORPORAL"];
	"GUE_Soldier_3" createUnit [_respawnpoint, _grp, "", 0.2, "CORPORAL"];
	"GUE_Soldier_GL" createUnit [_respawnpoint, _grp, "", 0.2, "CORPORAL"];
	"GUE_Soldier_2" createUnit [_respawnpoint, _grp, "", 0.2, "CORPORAL"];

	_grp
};
