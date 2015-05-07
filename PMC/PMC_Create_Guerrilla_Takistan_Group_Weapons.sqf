
// this was PMC_Create_GuerRilla_Takistan_Weapons before :)

PMC_Create_Guerrilla_Takistan_Group_Weapons =
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

	"TK_GUE_Soldier_TL_EP1" createUnit [_respawnpoint, _grp, "", 0.46, "SERGEANT"];
	"TK_GUE_Soldier_MG_EP1" createUnit [_respawnpoint, _grp, "", 0.33, "CORPORAL"];
	"TK_GUE_Soldier_AT_EP1" createUnit [_respawnpoint, _grp, "", 0.33, "CORPORAL"];
	"TK_GUE_Soldier_MG_EP1" createUnit [_respawnpoint, _grp, "", 0.33, "CORPORAL"];
	"TK_GUE_Soldier_HAT_EP1" createUnit [_respawnpoint, _grp, "", 0.33, "CORPORAL"];
	"TK_GUE_Soldier_4_EP1" createUnit [_respawnpoint, _grp, "", 0.2, "CORPORAL"];

	_grp
};
