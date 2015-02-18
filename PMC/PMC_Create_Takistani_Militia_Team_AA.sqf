
PMC_Create_Takistani_Militia_Team_AA =
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

	"TK_INS_Soldier_AA_EP1" createUnit [_respawnpoint, _grp, "", 0.46, "SERGEANT"];
	"TK_INS_Soldier_AA_EP1" createUnit [_respawnpoint, _grp, "", 0.46, "SERGEANT"];
	"TK_INS_Soldier_AA_EP1" createUnit [_respawnpoint, _grp, "", 0.46, "SERGEANT"];

	_grp
};
