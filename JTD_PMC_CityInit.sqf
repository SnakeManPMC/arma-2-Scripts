/*
JTD PMC City Initialization script
by Trexian

Purpose: run the JTD City functions for PMC

Implementation: executed from init.sqf.
ooooooooooooooooooooooooooooooooooooooooooooooooooo
Credits:
OFPEC
Command HQ - dos game from 1990 by Microprose, it had a mode where it randomly set your units
DMarkwick
ooooooooooooooooooooooooooooooooooooooooooooooooooo
Version history
01a -
proof of concept

ooooooooooooooooooooooooooooooooooooooooooooooooooo
"JTD_CityPosition.sqf"
- passed no parameters
- returns an array of all cities in the config, and the config positions
- JTD_citylist array with subarray - subarray select 0 = string of city name, select 1 = position array of config location
"JTD_CityCenter.sqf"
- passed a position array (most likely from JTDCityPosition)
- determines the approximate center of the city, by density
- returns the position of the center
"JTD_CityBorder.sqf"
- passed a position array (most likely from JTDCityCenter)
- determines an approximate geographic size of the city in X (radius A) and Y (radius B)
- returns radius A/B for use in marker or trigger
*/
//ooooooooooooooooooooooooooooooooooooooooooooooooooo
// start of city stuff
_i = 0;
JTD_CityCenters = [];
JTD_CityBorders = [];
JTD_CityDebug = false;
JTD_CityMarkers = true;

//ooooooooooooooooooooooooooooooooooooooooooooooooooo
// start the cool stuff

if (JTD_CityDebug) then
{
	hint "DEBUG city init";
	sleep 1;
};

JTD_cityPos = compile preprocessFileLineNumbers "JTD_CityPosition.sqf";
JTD_cityCent = compile preprocessFileLineNumbers "JTD_CityCenter.sqf";
JTD_cityBord = compile preprocessFileLineNumbers "JTD_CityBorder.sqf";

JTD_citylist = call JTD_cityPos;
_count = (count JTD_citylist) -1;

for [{_i = 0}, {_i <= _count}, {_i = _i + 1}] do
//for [{_i = 0}, {_i < 5}, {_i = _i + 1}] do            // for testing, to limit the iterations
{
	_citypos = ((JTD_citylist select _i) select 1);
	_citycenter = [_citypos] call JTD_cityCent;
	_cityborder = [_citycenter] call JTD_cityBord;
	_posX = _citycenter select 0;
	_posY = _citycenter select 1;
	_radA = _cityborder select 0;
	_radB = _cityborder select 1;
	//ooooooooooooooooooooooooooooooooooooooooooooooooooo
	// set markers
	if (JTD_CityMarkers) then
	{
		_trigName = format ["JTDTrig%1", ((JTD_citylist select _i) select 0)];
		_JTDTrigMarker = createMarker [_trigName, (_posX, _posY)];
		_JTDTrigMarker setMarkerColor "ColorRedAlpha";
		_JTDTrigMarker setMarkerShape "ELLIPSE";
		_JTDTrigMarker setMarkerSize [_radA, _radB];
	};
	// ooooooooooooooooooooooooooooooooooooooooooooooooooo
	JTD_CityCenters = JTD_CityCenters + [_citycenter];
	JTD_CityBorders = JTD_CityBorders + [_cityborder];
};

if (JTD_CityDebug) then
{
	hint "City Scripts Initialized";
	sleep 1;
};
