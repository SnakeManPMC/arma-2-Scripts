
PMC_Create_Takistani_Army_Section_AA =
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

	"TK_Soldier_AA_EP1" createUnit [_respawnpoint, _grp, "", 0.59, "LIEUTENANT"];
	"TK_Soldier_AA_EP1" createUnit [_respawnpoint, _grp, "", 0.46, "SERGEANT"];
	"TK_Soldier_AA_EP1" createUnit [_respawnpoint, _grp, "", 0.46, "SERGEANT"];

	_grp
};
