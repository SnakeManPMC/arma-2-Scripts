
PMC_Create_Takistani_Militia_Patrol =
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

	"TK_INS_Soldier_2_EP1" createUnit [_respawnpoint, _grp, "", 0.33, "CORPORAL"];
	"TK_INS_Soldier_AR_EP1" createUnit [_respawnpoint, _grp, "", 0.33, "CORPORAL"];
	"TK_INS_Soldier_EP1" createUnit [_respawnpoint, _grp, "", 0.2, "CORPORAL"];
	"TK_INS_Soldier_3_EP1" createUnit [_respawnpoint, _grp, "", 0.2, "CORPORAL"];
	"TK_INS_Soldier_4_EP1" createUnit [_respawnpoint, _grp, "", 0.2, "CORPORAL"];

	_grp
};
