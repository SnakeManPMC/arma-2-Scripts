/*
	PMC Create Marker
	
Syntax:
_createMarker = compile preprocessFileLineNumbers "PMC\PMC_Create_Marker.sqf";

Requires:
-

Returns:
marker name

Note that if you use this on server to create marker, clients see it fine... until you JIP. No JIP player will
see the markers created on v1.62 server :(

*/

private
[
	"_position",
	"_m",
	"_marker"
];

_position = _this select 0;

diag_log format["PMC_Create_Marker _position: %1", _position];

_m = format["pmc_marker_%1", round (random 1000)];

_marker = createMarker [_m, _position];
_marker setMarkerColor "ColorRed";
_marker setMarkerType "mil_objective";

_m
