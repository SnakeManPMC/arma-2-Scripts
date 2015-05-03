/*

	PMC unit Marker Update
	
Syntax:
[unit] execVM "PMC\PMC_unitMarkerUpdate.sqf";

for example a group:

?

Requires:
PMC_unitMarker = 0; publicVariable "PMC_unitMarker";

Returns:
-

*/

private
[
	"_dude",
	"_m",
	"_markerobj"
];

sleep random 1;

_dude = _this select 0;

PMC_unitMarker = PMC_unitMarker + 1;
publicVariable "PMC_unitMarker";

_m = format ["PMC_group_marker_%1", PMC_unitMarker];
_markerobj = createMarkerLocal [_m, getPos _dude];
_markerobj setMarkerTypeLocal "mil_dot";

switch (side _dude) do
{
	case EAST:
	{
		_markerobj setMarkerColorLocal "ColorRed";
	};
	
	case WEST:
	{
		_markerobj setMarkerColorLocal "ColorBlue";
	};
	// todo add guerrilla but its really RESISTANCE you fucking idiot!
	// todo add civilian
};

while {alive _dude} do
{
	_markerobj setMarkerPosLocal (getPos _dude);
	sleep 1;
};

deleteMarker _markerobj;
