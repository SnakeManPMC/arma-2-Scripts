
PMC_Create_Russian_Infantry_Sniper_Team =
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

	// Russian infantry section

	"RU_Soldier_Sniper" createUnit [_respawnpoint, _grp, "", 1, "SERGEANT"];
	"RU_Soldier_Spotter" createUnit [_respawnpoint, _grp, "", 1, "CORPORAL"];

	_grp
};
