
PMC_Create_Guerrilla_Takistan_Patrol =
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

	"TK_GUE_Soldier_EP1" createUnit [_respawnpoint, _grp, "", 0.33, "CORPORAL"];
	"TK_GUE_Soldier_EP1" createUnit [_respawnpoint, _grp, "", 0.33, "CORPORAL"];
	"TK_GUE_Soldier_3_EP1" createUnit [_respawnpoint, _grp, "", 0.33, "CORPORAL"];
	"TK_GUE_Soldier_2_EP1" createUnit [_respawnpoint, _grp, "", 0.33, "CORPORAL"];

	_grp
};
