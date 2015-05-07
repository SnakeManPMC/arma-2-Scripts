/*

	Create VTE artillery pieces

Syntax:
[] execVM "PMC\PMC_VTE_artillery_test.sqf";

Requires:
-

Returns:
-

*/
private
[
	"_grp",
	"_pos",
	"_vcl"
];

_grp = objNull;
_grp = createGroup west;
waitUntil {!(isNull _grp)};

_pos = getPos player;

_vcl = "VTE_m3" createVehicle _pos;
"VTE_Armysoldier" createUnit [_pos, _grp, "", 1, "SERGEANT"];
(units _grp select 0) moveInGunner _vcl;

_vcl = "VTE_m55" createVehicle [(_pos select 0)+10, (_pos select 1), 0];
"VTE_Armysoldier" createUnit [_pos, _grp, "", 1, "CORPORAL"];
(units _grp select 1) moveInGunner _vcl;

_vcl = "VTE_m101" createVehicle [(_pos select 0)+20, (_pos select 1), 0];
"VTE_Armysoldier" createUnit [_pos, _grp, "", 1, "CORPORAL"];
(units _grp select 2) moveInGunner _vcl;

_vcl = "VTE_m107" createVehicle [(_pos select 0)+30, (_pos select 1), 0];
"VTE_Armysoldier" createUnit [_pos, _grp, "", 1, "CORPORAL"];
(units _grp select 3) moveInGunner _vcl;

_vcl = "VTE_m108" createVehicle [(_pos select 0)+40, (_pos select 1), 0];
"VTE_Armysoldier" createUnit [_pos, _grp, "", 1, "CORPORAL"];
(units _grp select 4) moveInGunner _vcl;

_vcl = "VTE_m109" createVehicle [(_pos select 0)+50, (_pos select 1), 0];
"VTE_Armysoldier" createUnit [_pos, _grp, "", 1, "CORPORAL"];
(units _grp select 5) moveInGunner _vcl;

_vcl = "VTE_m110" createVehicle [(_pos select 0)+60, (_pos select 1), 0];
"VTE_Armysoldier" createUnit [_pos, _grp, "", 1, "CORPORAL"];
(units _grp select 6) moveInGunner _vcl;

_vcl = "VTE_m114" createVehicle [(_pos select 0)+70, (_pos select 1), 0];
"VTE_Armysoldier" createUnit [_pos, _grp, "", 1, "CORPORAL"];
(units _grp select 7) moveInGunner _vcl;

_vcl = "VTE_60mortarus" createVehicle [(_pos select 0)+80, (_pos select 1), 0];
"VTE_Armysoldier" createUnit [_pos, _grp, "", 1, "CORPORAL"];
(units _grp select 8) moveInGunner _vcl;

_vcl = "VTE_60mortarusmc" createVehicle [(_pos select 0)+90, (_pos select 1), 0];
"VTE_Armysoldier" createUnit [_pos, _grp, "", 1, "CORPORAL"];
(units _grp select 9) moveInGunner _vcl;

_vcl = "VTE_60mortaraircav" createVehicle [(_pos select 0)+100, (_pos select 1), 0];
"VTE_Armysoldier" createUnit [_pos, _grp, "", 1, "CORPORAL"];
(units _grp select 10) moveInGunner _vcl;

_vcl = "VTE_m29mortar_us" createVehicle [(_pos select 0)+20, (_pos select 1)+10, 0];
"VTE_Armysoldier" createUnit [_pos, _grp, "", 1, "CORPORAL"];
(units _grp select 11) moveInGunner _vcl;

_vcl = "VTE_m30mortar_us" createVehicle [(_pos select 0)+20, (_pos select 1)+20, 0];
"VTE_Armysoldier" createUnit [_pos, _grp, "", 1, "CORPORAL"];
(units _grp select 12) moveInGunner _vcl;

_vcl = "VTE_m56" createVehicle [(_pos select 0)+20, (_pos select 1)+30, 0];
"VTE_Armysoldier" createUnit [_pos, _grp, "", 1, "CORPORAL"];
(units _grp select 13) moveInGunner _vcl;

_vcl = "VTE_bm8" createVehicle [(_pos select 0)+20, (_pos select 1)+40, 0];
"VTE_Armysoldier" createUnit [_pos, _grp, "", 1, "CORPORAL"];
(units _grp select 14) moveInGunner _vcl;

_vcl = "VTE_120mmartynva" createVehicle [(_pos select 0)+20, (_pos select 1)+50, 0];
"VTE_Armysoldier" createUnit [_pos, _grp, "", 1, "CORPORAL"];
(units _grp select 15) moveInGunner _vcl;

_vcl = "VTE_122mmkatyushanva" createVehicle [(_pos select 0)+20, (_pos select 1)+60, 0];
"VTE_Armysoldier" createUnit [_pos, _grp, "", 1, "CORPORAL"];
(units _grp select 16) moveInGunner _vcl;

_vcl = "VTE_60mortarnva" createVehicle [(_pos select 0)+20, (_pos select 1)+70, 0];
"VTE_Armysoldier" createUnit [_pos, _grp, "", 1, "CORPORAL"];
(units _grp select 17) moveInGunner _vcl;

_vcl = "VTE_60mortarvc" createVehicle [(_pos select 0)+20, (_pos select 1)+80, 0];
"VTE_Armysoldier" createUnit [_pos, _grp, "", 1, "CORPORAL"];
(units _grp select 18) moveInGunner _vcl;

_vcl = "VTE_82mm_mortar_nva" createVehicle [(_pos select 0)+20, (_pos select 1)+90, 0];
"VTE_Armysoldier" createUnit [_pos, _grp, "", 1, "CORPORAL"];
(units _grp select 19) moveInGunner _vcl;

_vcl = "VTE_120mm_mortar_nva" createVehicle [(_pos select 0)+20, (_pos select 1)+100, 0];
"VTE_Armysoldier" createUnit [_pos, _grp, "", 1, "CORPORAL"];
(units _grp select 20) moveInGunner _vcl;

_vcl = "VTE_m30_m1938" createVehicle [(_pos select 0)+30, (_pos select 1)+100, 0];
"VTE_Armysoldier" createUnit [_pos, _grp, "", 1, "CORPORAL"];
(units _grp select 21) moveInGunner _vcl;
