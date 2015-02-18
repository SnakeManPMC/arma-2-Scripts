
private
[
	"_r1",
	"_doka",
	"_camera",
	"_PMC_Statistics"
];

// camera basic initialization
_camera = "camera" camCreate [6400, 6400, 0];
_camera camSetTarget [6400, 6400, 0];
_camera cameraEffect ["internal","back"];
_camera camSetFOV 0.700;

titleCut ["Loading...", "BLACK OUT", 0.0001];
waitUntil { count pmc_list > 0; };
titleText ["Welcome to PMC video cutscene", "plain down", 2];
sleep 1;
titleCut ["","black in",2];

// no cinema borders in our video.
showCinemaBorder false;

_PMC_Statistics =
{
	titleText
	[
	format
		[
			"Our war has: %1 tanks, %2 aircrafts, %3 helicopters, %4 cars, %5 statics, %6 men.\nBLUFOR %7, OPFOR %8, INDEPENDENT %9.",
			('tank' countType pmc_list),
			('Plane' countType pmc_list),
			('helicopter' countType pmc_list),
			('car' countType pmc_list),
			('StaticWeapon' countType pmc_list),
			('man' countType pmc_list),
			(WEST countSide pmc_list),
			(EAST countSide pmc_list),
			(RESISTANCE countSide pmc_list)
		],
		"plain down",
		2
	];
};

while {true} do
{
	call _PMC_Statistics;

	_r1 = random (count pmc_list);
	_r1 = _r1 - (_r1 mod 1);
	_doka = pmc_list select _r1;

	if (alive _doka) then
	{
		_camera camSetTarget _doka;
	};
	_camera camSetRelPos [-20 + random 40, -20 + random 40, 0.5 + random 4.8];
	_camera camCommit 0;
	sleep 7 + random 8;

	_r1 = random (count pmc_list);
	_r1 = _r1 - (_r1 mod 1);
	_doka = pmc_list select _r1;

	if (alive _doka) then
	{
		_camera camSetTarget _doka;
	};

	_camera camSetRelPos [-5 + random 20, -5 + random 15, 1.5 + random 2];
	_camera camCommit 0;
	sleep 10 + random 8;
};

_camera camSetTarget getPos player;
_camera camSetRelPos [-200 + random 400, -200 + random 400, 0.2 + random 20.8];
_camera camCommit 30;
waitUntil { camCommitted _camera; };
sleep 7;

//titletext["","plain down",2];
titlecut ["","BLACK OUT",4];
4 fademusic 0;
sleep 6;

// Destroy the camera
_camera cameraeffect ["terminate", "back"];
camDestroy _camera;

// end the intro
endcut = true;
