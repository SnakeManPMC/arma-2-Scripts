
PMC_Create_US_Army_Team_AT =
{
	private
	[
		"_grp",
		"_respawnpoint"
	];

	_respawnpoint = _this select 0;

	_grp = objNull;
	_grp = createGroup west;
	waitUntil {!(isNull _grp)};

	"US_Soldier_TL_EP1" createUnit [_respawnpoint, _grp, "", 0.46, "SERGEANT"];
	"US_Soldier_AT_EP1" createUnit [_respawnpoint, _grp, "", 0.33, "CORPORAL"];
	"US_Soldier_AT_EP1" createUnit [_respawnpoint, _grp, "", 0.33, "CORPORAL"];
	"US_Soldier_AAT_EP1" createUnit [_respawnpoint, _grp, "", 0.2, "CORPORAL"];

	_grp
};
