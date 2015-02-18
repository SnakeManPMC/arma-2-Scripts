/*

	PMC helo transport system

Syntax:
[helipad] execVM "PMC\PMC_Helo_Transport.sqf";

Requires:
PMC_HeloList and PMC_Infantry infantry arrays.
PMC\PMC_Helo_Transport_fly.sqf

Returns:
-

*/

private
[
	"_grp",
	"_Helo",
	"_lz",
	"_PMC_Check_Helo_List",
	"_PMC_Load_Troops",
	"_helipad"
];

/*
// array list of helicopters
PMC_HeloList =
[
	helo1,
	helo2
];

// array list of infantry groups
PMC_Infantry =
[
	usinf1,
	usinf2,
	usinf3,
	usinf4
];
*/

// check and return helo name
_PMC_Check_Helo_List =
{
	private ["_helo"];

	// clear the _Helo variable
	_helo = objnull;

	// check if we have available helos.
	if (count PMC_HeloList > 0) then
	{
		// grab the first helo
		_helo = (PMC_HeloList select 0);
		// remove it from the helolist
		PMC_HeloList = PMC_HeloList - [PMC_HeloList select 0];
		hint format["_PMC_HeloList after we took first guy out:\n%1\n\nAnd first guy: %2", PMC_HeloList, _helo];
	};

	// return the helo name
	_helo;
};

_PMC_Load_Troops =
{
	private
	[
		"_grp",
		"_helo"
	];

	_grp = _this select 0;
	_helo = _this select 1;

	// troops are loaded into helo.
	{
		_x assignAsCargo _helo;
		[_x] orderGetIn true;
		player sidechat format["_x: %1. _Helo: %2", _x, _helo];
	} forEach units _grp;
};

/*

	main program ;)

*/

// PMCTODO hardcoded junk, remove please.
_lz = pmc_1;

// location of helo at mission start, base hq if you will.
_helipad = _this select 0;

while {true} do
{
	// until we have helo and infantry available.
	waitUntil
	{
		sleep 5;
		player sidechat format["PMC_HeloList: %1, PMC_Infantry: %2", (count PMC_HeloList), (count PMC_Infantry)];
		( (count PMC_HeloList > 0) && (count PMC_Infantry > 0) );
	};
	// first infantry group calls in for transport
	_grp = PMC_Infantry select 0;
	// remove the first group from the array.
	PMC_Infantry = PMC_Infantry - [PMC_Infantry select 0];

	_helo = call _PMC_Check_Helo_List;
	player sidechat "_PMC_Check_Helo_List completed.";

	[_grp, _helo] call _PMC_Load_Troops;
	player sidechat "_PMC_Load_Troops completed.";

	// make the helo fly.
	[_lz, _helo, _grp, _helipad] execVM "PMC\PMC_Helo_Transport_fly.sqf";
};
