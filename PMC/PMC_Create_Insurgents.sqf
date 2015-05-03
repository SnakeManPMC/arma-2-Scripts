
// is this Chernarus East European OPFOR Guerrillas??

PMC_Create_Insurgents =
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

	"Ins_Soldier_CO" createUnit [_respawnpoint, _grp, "", 0.46, "SERGEANT"];
	"INS_Soldier_AR" createUnit [_respawnpoint, _grp, "", 0.33, "CORPORAL"];
	"INS_Soldier_GL" createUnit [_respawnpoint, _grp, "", 0.33, "CORPORAL"];
	"INS_Soldier_AT" createUnit [_respawnpoint, _grp, "", 0.2, "CORPORAL"];
	"INS_Soldier_2" createUnit [_respawnpoint, _grp, "", 0.2, "CORPORAL"];
	"INS_Soldier_AR" createUnit [_respawnpoint, _grp, "", 0.2, "CORPORAL"];
	"INS_Soldier_1" createUnit [_respawnpoint, _grp, "", 0.2, "CORPORAL"];
	"INS_Soldier_2" createUnit [_respawnpoint, _grp, "", 0.2, "CORPORAL"];

	_grp
};
