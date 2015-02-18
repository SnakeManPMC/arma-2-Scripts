
// United Nations bitches :)

PMC_Create_Guerrilla_UNO =
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

	"UN_CDF_Soldier_Guard_EP1" createUnit [_respawnpoint, _grp, "", 0.46, "SERGEANT"];
	"UN_CDF_Soldier_EP1" createUnit [_respawnpoint, _grp, "", 0.33, "CORPORAL"];
	"UN_CDF_Soldier_AT_EP1" createUnit [_respawnpoint, _grp, "", 0.33, "CORPORAL"];
	"UN_CDF_Soldier_MG_EP1" createUnit [_respawnpoint, _grp, "", 0.33, "CORPORAL"];

	_grp
};
