
PMC_Create_US_Army_Team_AT_Heavy =
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

	"US_Soldier_HAT_EP1" createUnit [_respawnpoint, _grp, "", 0.46, "SERGEANT"];
	"US_Soldier_HAT_EP1" createUnit [_respawnpoint, _grp, "", 0.33, "CORPORAL"];
	"US_Soldier_AHAT_EP1" createUnit [_respawnpoint, _grp, "", 0.33, "CORPORAL"];

	_grp
};
