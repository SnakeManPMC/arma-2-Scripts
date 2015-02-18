/*

	Create sector markers

Syntax:
[mapsize, number_of_sectors] execVM "PMC\PMC_Create_Sectors.sqf";

Requires:
-

Returns:
-

*/

private
[
	"_a",
	"_divider",
	"_mapsize",
	"_mk",
	"_PMC_create_marker",
	"_posmarker_x",
	"_posmarker_y"
];

_PMC_create_marker =
{
	private
	[
		"_color",
		"_divider",
		"_marker",
		"_markerobj",
		"_posmarker_x",
		"_posmarker_y"
	];

	_marker = _this select 0;
	_color = _this select 1;
	_posmarker_x = _this select 2;
	_posmarker_y = _this select 3;
	_divider = _this select 4;

	_markerobj = createMarkerLocal [_marker, [_posmarker_x, _posmarker_y, 0]];
	_markerobj setMarkerShapeLocal "ellipse";//"RECTANGLE";
	_markerobj setMarkerColorLocal _color;
	_markerobj setMarkerBrushLocal "Solid";
	_markerobj setMarkerSizeLocal [_divider, _divider];
};

// mapsize from first parameter
_mapsize = _this select 0;
// divider from second parameter
_divider = _mapsize / (_this select 1);
_posmarker_x = _divider;
_posmarker_y = _divider;

_a = 0;
while {_posmarker_y < _mapsize} do
{
	while {_posmarker_x < _mapsize} do
	{
		_a = _a + 1;
		_mk = format["pmc_sector%1", _a];
		[_mk, "ColorRed", _posmarker_x, _posmarker_y, _divider] call _PMC_create_marker;
		_posmarker_x = _posmarker_x + (_divider * 2);
	};
	_posmarker_y = _posmarker_y + (_divider * 2);
	_posmarker_x = _divider;
};
