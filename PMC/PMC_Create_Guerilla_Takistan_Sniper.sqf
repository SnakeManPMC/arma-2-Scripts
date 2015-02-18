
PMC_Create_Guerilla_Takistan_Sniper =
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

	"TK_GUE_Soldier_Sniper_EP1" createUnit [_respawnpoint, _grp, "", 0.46, "SERGEANT"];
	"TK_GUE_Soldier_Sniper_EP1" createUnit [_respawnpoint, _grp, "", 0.46, "SERGEANT"];

	_grp
};
