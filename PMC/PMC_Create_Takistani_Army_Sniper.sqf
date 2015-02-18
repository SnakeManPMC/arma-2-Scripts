
PMC_Create_Takistani_Army_Sniper =
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

	"TK_Soldier_SniperH_EP1" createUnit [_respawnpoint, _grp, "", 1, "LIEUTENANT"];
	"TK_Soldier_Spotter_EP1" createUnit [_respawnpoint, _grp, "", 1, "SERGEANT"];

	_grp
};
