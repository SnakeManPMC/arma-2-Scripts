
PMC_Create_Takistani_Army_Section_AT =
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

	"TK_Soldier_HAT_EP1" createUnit [_respawnpoint, _grp, "", 0.46, "SERGEANT"];
	"TK_Soldier_HAT_EP1" createUnit [_respawnpoint, _grp, "", 0.33, "CORPORAL"];
	"TK_Soldier_AT_EP1" createUnit [_respawnpoint, _grp, "", 0.33, "CORPORAL"];
	"TK_Soldier_AT_EP1" createUnit [_respawnpoint, _grp, "", 0.33, "CORPORAL"];
	"TK_Soldier_AAT_EP1" createUnit [_respawnpoint, _grp, "", 0.2, "CORPORAL"];

	_grp
};
