
// is this Chernarus East European OPFOR Guerillas??

PMC_Create_Insurgents_Militia =
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

	"Ins_Worker2" createUnit [_respawnpoint, _grp, "", 0.46, "SERGEANT"];
	"INS_Woodlander3" createUnit [_respawnpoint, _grp, "", 0.33, "CORPORAL"];
	"INS_Villager3" createUnit [_respawnpoint, _grp, "", 0.33, "CORPORAL"];
	"INS_Woodlander2" createUnit [_respawnpoint, _grp, "", 0.2, "CORPORAL"];
	"INS_Woodlander1" createUnit [_respawnpoint, _grp, "", 0.2, "CORPORAL"];
	"INS_Villager4" createUnit [_respawnpoint, _grp, "", 0.2, "CORPORAL"];

	_grp
};
