
PMC_Create_US_Army_Delta_Patrol_HMMWV =
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

	"US_Delta_Force_TL_EP1" createUnit [_respawnpoint, _grp, "", 0.46, "SERGEANT"];

	_vcl = "HMMWV_M998A2_SOV_DES_EP1" createVehicle [(_respawnpoint select 0)+20, (_respawnpoint select 1), 0];
	_vcl addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}];
	// create crew, corporal? skill 0.33
	"US_Delta_Force_TL_EP1" createUnit [_respawnpoint, _grp, "", 0.33, "CORPORAL"];
	"US_Delta_Force_TL_EP1" createUnit [_respawnpoint, _grp, "", 0.33, "CORPORAL"];
	(units _grp select 1) moveInGunner _vcl;
	(units _grp select 2) moveInDriver _vcl;

	"US_Delta_Force_Assault_EP1" createUnit [_respawnpoint, _grp, "", 0.33, "CORPORAL"];
	"US_Delta_Force_Marksman_EP1" createUnit [_respawnpoint, _grp, "", 0.33, "CORPORAL"];

	_grp
};
