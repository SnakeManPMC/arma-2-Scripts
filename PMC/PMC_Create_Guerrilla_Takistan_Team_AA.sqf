
PMC_Create_Guerrilla_Takistan_Team_AA =
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

	"TK_GUE_Soldier_AA_EP1" createUnit [_respawnpoint, _grp, "", 0.46, "SERGEANT"];
	"TK_GUE_Soldier_AA_EP1" createUnit [_respawnpoint, _grp, "", 0.33, "CORPORAL"];
	"TK_GUE_Soldier_AA_EP1" createUnit [_respawnpoint, _grp, "", 0.33, "CORPORAL"];

	_grp
};
