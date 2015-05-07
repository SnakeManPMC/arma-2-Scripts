
PMC_Create_Russian_Infantry_Squad =
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

	// Russian rifle squad

	"RU_Soldier_SL" createUnit [_respawnpoint, _grp, "", 0.59, "LIEUTENANT"];
	"RU_Soldier_MG" createUnit [_respawnpoint, _grp, "", 0.46, "SERGEANT"];
	"RU_Soldier_AT" createUnit [_respawnpoint, _grp, "", 0.46, "SERGEANT"];
	"RU_Soldier_LAT" createUnit [_respawnpoint, _grp, "", 0.33, "CORPORAL"];
	"RU_Soldier_GL" createUnit [_respawnpoint, _grp, "", 0.33, "CORPORAL"];
	"RU_Soldier_Marksman" createUnit [_respawnpoint, _grp, "", 0.33, "CORPORAL"];
	"RU_Soldier_MG" createUnit [_respawnpoint, _grp, "", 0.33, "CORPORAL"];
	"RU_Soldier_AT" createUnit [_respawnpoint, _grp, "", 0.33, "CORPORAL"];
	"RU_Soldier_AR" createUnit [_respawnpoint, _grp, "", 0.2, "CORPORAL"];
	"RU_Soldier_LAT" createUnit [_respawnpoint, _grp, "", 0.2, "CORPORAL"];
	"RU_Soldier_GL" createUnit [_respawnpoint, _grp, "", 0.2, "CORPORAL"];
	"RU_Soldier" createUnit [_respawnpoint, _grp, "", 0.2, "CORPORAL"];

	_grp
};
