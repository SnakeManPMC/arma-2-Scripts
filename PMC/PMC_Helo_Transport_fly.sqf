/*

	PMC helo transport system fly part

"sub" script for PMC\PMC_Helo_Transport.sqf

Syntax:
[LZ, Helo, Group, HQ] execVM "PMC\PMC_Helo_Transport_fly.sqf";

LZ	= landing zone or "target" spot.
Helo	= name of the helicopter vehicle.
Group	= name of the infantry group.
HQ	= home base gamelogic or object.

Requires:
-

Returns:
-

*/

private
[
	"_grp",
	"_Helo",
	"_homebase",
	"_lz",
	"_tmp"
];

_tmp = _this select 0;
_Helo = _this select 1;
_grp = _this select 2;
_homebase = _this select 3;
_lz = getPos _tmp;

_Helo setbehaviour "AWARE";
_Helo setcombatmode "YELLOW";
_Helo setspeedmode "FULL";
_Helo setformation "WEDGE";

// helo send to destination.
_Helo move _lz;

waitUntil
{
	sleep 2;
	(_Helo distance _lz < 100) || (!canMove _helo);
};

if (!canMove _helo) exitWith{};

// troops unloaded from the helo.
{
	unAssignVehicle _x;
} forEach units _grp;

// this makes sure function runs "easy" and not return
// while helo is still very much unloading troops. its not perfect though.
waitUntil
{
	sleep 2;
	(((getPos _Helo select 2) < 3 ) || (!canMove _Helo));
};

if (!canMove _helo) exitWith{};

// helo returns to base.
_Helo move getPos _homebase;

waitUntil
{
	sleep 2;
	(_Helo distance _homebase < 100) || (!canMove _Helo);
};

if (!canMove _helo) exitWith{};

_Helo land "land";

waitUntil
{
	sleep 1;
	((getPos _Helo select 2) < 2 ) || (!canMove _Helo);
};

if (!canMove _helo) exitWith{};

PMC_HeloList = PMC_HeloList + [_Helo];
