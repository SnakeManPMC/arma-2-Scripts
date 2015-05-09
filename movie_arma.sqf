/*

	PMC universal movie script :)

*/
private
[
	"_camera",
	"_doka",
	"_PMC_Camera_Commit",
	"_PMC_getMeUnit",
	"_PMC_Soldier_Loop",
	"_PMC_TitleText_Stats",
	"_PMC_Vehicle_Loop"
];

_PMC_getMeUnit =
{
	private
	[
		"_d",
		"_n"
	];

	_n = random (count list pmc_list);
	_d = list pmc_list select _n;

	_d
};

// status title text displayed regularly.
_PMC_TitleText_Stats =
{
	titleText
	[
		format
		[
			"Our war has: %1 tanks, %2 aircrafts, %3 men (BLUFOR: %4, OPFOR: %5)\n",
			('tank' countType list pmc_list),
			('air' countType list pmc_list),
			('man' countType list pmc_list),
			(west countSide list pmc_list),
			(east countSide list pmc_list)
		], "plain down", 2
	];
};

_PMC_Vehicle_Loop =
{
	titleText [format["In _PMC_Vehicle_Loop %1, %2", _this select 0, _this select 1], "plain down", 2];
	private
	[
		"_LoopTime",
		"_LoopType",
		"_pl",
		"_r1",
		"_rPos1",
		"_rPos2",
		"_rPos3",
		"_rPos4",
		"_rPos5",
		"_VehArray"
	];

	_VehArray = [];
	_LoopTime = _this select 0;
	_LoopType = _this select 1;
	_pl = 0;

	{
		if (_LoopType countType [_x] == 1) then
		{
			_VehArray = _VehArray + [_x];
		};
	} forEach (list pmc_list);

	// check if the array is empty, what if all vehicles are dead? :)
	if (count _VehArray == 0) exitWith { titleText["Veh array empty!","plain down",1]; };

	if (_LoopType == "Air") then
	{
		_rPos1 = -50;
		_rPos2 = 100;
		_rPos3 = 100;
		_rPos4 = 100;
		_rPos5 = 10;
	};

	if (_LoopType == "Tank") then
	{
		_rPos1 = -25;
		_rPos2 = 50;
		_rPos3 = 50;
		_rPos4 = 50;
		_rPos5 = 10;
	};

//titletext [format["_rPos1 %1\n_rPos2 %2\n_rPos3 %3\n_rPos4 %4\n_rPos5 %5", _rPos1, _rPos2, _rPos3, _rPos4, _rPos5],"plain down",3];

	while {_pl < _LoopTime} do
	{
		_pl = _pl + 1;

		_r1 = random (count _VehArray);
		_r1 = _r1 - (_r1 mod 1);
		_doka = _VehArray select _r1;
		_camera camSetTarget _doka;
		_camera camSetRelPos [(_rPos1 + random _rPos2), (_rPos3 + random _rPos4), (random _rPos5)];
		_camera camCommit 0;
		waitUntil { camCommitted _camera; };
		sleep 7;
	};
};

_PMC_Soldier_Loop = 
{
	private
	[
		"_a",
		"_SolLoopPos"
	];

	_a = 0;

	_SolLoopPos = [-1 + random 2, -3.5, 1];

	while {_a < 300} do
	{
		_a = _a + 1;
		sleep .001;
		_camera camSetTarget _doka;
		_camera camSetRelPos _SolLoopPos;
		_camera camCommit 0;
		waitUntil { camCommitted _camera; };
		if (!alive _doka) exitWith {};
	};
	sleep 7;
};

_PMC_Camera_Commit =
{
	private
	[
		"_PMC_Commit_Time",
		"_PMC_Sleep"
	];

	// pick the parameters.
	_PMC_Commit_Time = _this select 0;
	_PMC_Sleep = _this select 1;

	// issue camera orders
	_camera camCommit _PMC_Commit_Time;
	waitUntil { camCommitted _camera; };
	sleep _PMC_Sleep;
};

// camera basic initialization
_camera = "camera" camCreate [0, 0, 0];
_camera camSetTarget [0, 0, 0];
_camera cameraEffect ["internal", "back"];
_camera camSetFOV 0.700;

// this was beginning of the script at first,
// maybe it works only hafter the camera has been created?
titleCut ["", "BLACK OUT", 0];

sleep 1;
// no cinema borders in our video.
showCinemaBorder false;
titleText["Welcome to a PMC War!", "plain down", 2];
sleep 2;
titleCut ["", "BLACK IN", 2];

/*

	Main loop to run this cutscene

*/
while {true} do
{
	// show stats title text
	call _PMC_TitleText_Stats;

	_camera camSetTarget call _PMC_getMeUnit;
	_camera camSetRelPos [random 20, random 20, random 5];
//	_camera camCommit 0;
//	waitUntil { camCommitted _camera; };
//	sleep 5;
	[0, 5] call _PMC_Camera_Commit;

	_camera camSetRelPos [-20 + random 40, -20 + random 40, random 5];
//	_camera camCommit 5;
//	waitUntil { camCommitted _camera; };
//	sleep 3;
	[5, 3] call _PMC_Camera_Commit;

	_camera camSetTarget call _PMC_getMeUnit;
	_camera camSetRelPos [-random 20, -random 20, random 5];
//	_camera camCommit 0;
//	waitUntil { camCommitted _camera; };
//	sleep 5;
	[0, 5] call _PMC_Camera_Commit;

	_doka = call _PMC_getMeUnit;

	_camera camSetTarget _doka;
	_camera camSetRelPos [-20 + random 40, -20 + random 40, random 5];
//	_camera camCommit 0;
//	waitUntil { camCommitted _camera; };
//	sleep 5;
	[0, 5] call _PMC_Camera_Commit;

	_camera camSetTarget getPosASL _doka;
	_camera camSetRelPos [-20 + random 40,-20 + random 40, random 5];
//	_camera camCommit 5;
//	waitUntil { camCommitted _camera; };
//	sleep 3;
	[5, 3] call _PMC_Camera_Commit;
	_camera camSetTarget getPosASL _doka;
	_camera camSetRelPos [random 20, random 20, random 5];
//	_camera camCommit 5;
//	waitUntil { camCommitted _camera; };
//	sleep 3;
	[5, 3] call _PMC_Camera_Commit;

	_doka = call _PMC_getMeUnit;

	_camera camSetTarget _doka;
	_camera camSetRelPos [-random 20, -random 20, random 5];
//	_camera camCommit 0;
//	waitUntil { camCommitted _camera; };
//	sleep 5;
	[0, 5] call _PMC_Camera_Commit;
	_camera camSetTarget getPosASL _doka;
	_camera camSetRelPos [-20 + random 40, -20 + random 40, random 5];
//	_camera camCommit 5;
//	waitUntil { camCommitted _camera; };
//	sleep 3;
	[5, 3] call _PMC_Camera_Commit;

	_doka = call _PMC_getMeUnit;

	[] call _PMC_Soldier_Loop;

	_doka = call _PMC_getMeUnit;

	_camera camSetTarget _doka;
	_camera camSetRelPos [50, 100, 50];
//	_camera camCommit 0;
//	waitUntil { camCommitted _camera; };
	[0, 0] call _PMC_Camera_Commit;
	_camera camSetTarget _doka;
	_camera camSetRelPos [0, 1, 1];
//	_camera camCommit 25;
//	waitUntil { camCommitted _camera; };
//	sleep 5;
	[25, 5] call _PMC_Camera_Commit;

	[10, "Air"] call _PMC_Vehicle_Loop;
	[20, "Tank"] call _PMC_Vehicle_Loop;

	// show stats title text
	call _PMC_TitleText_Stats;
};

titletext["Our mission has ended, hope you enjoyed the fight...", "plain down", 2];
sleep 7;

3 fademusic 0;
titlecut ["", "BLACK OUT", 3];
sleep 3;

// destroy camera - if we use mission cutscene
_camera cameraEffect ["terminate", "back"];

// Destroy the camera
camDestroy _camera;

// end the intro
endcut = true;
