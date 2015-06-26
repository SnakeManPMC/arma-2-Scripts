/*

	Crea illumination flares until variable is set to false
	

Syntax:
[getPosASL object] execVM "PMC\PMC_Illumination_flares.sqf";

Requires:
-

Returns:
-

*/

private["_flare", "_flareColors", "_type", "_pos"];

_pos = _this select 0;

_flareColors = ["F_40mm_Red", "F_40mm_White", "F_40mm_Green", "F_40mm_Yellow"];

// if the variable is not set, we set it true and continue
if (isNil "PMC_IlluminationFlares") then
{
	PMC_IlluminationFlares = true;
};

// create flares until this variable changes to false
while {PMC_IlluminationFlares} do
{
	_type = _flareColors select (floor (random count _flareColors));
	_pos = [(_pos select 0) - (random 50) + (random 50), (_pos select 1) - (random 50) + (random 50), 250];
	_flare = _type createVehicle _pos;

	// let the flare fall...
	sleep 30;
};
