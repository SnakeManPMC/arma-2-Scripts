/*

	intro cutscene generic

	DEBUG version that runs only once ;)

Syntax:
players init line:
this = [mapsize, altitude, seconds] execVM "movie_debug.sqf";

Requires:
-

Returns:
-
*/

private
[
	"_alt",
	"_camera",
	"_mapsize",
	"_PanSmoothness",
	"_pantime"
];;

_mapsize = _this select 0;
_alt = _this select 1;
_pantime = _this select 2;
_PanSmoothness = 3;

// create camera
_camera = "camera" camCreate [0,0,0];
_camera cameraEffect ["internal","back"];;

[] spawn
{
	sleep .3;
	// disable movie borders
	showCinemaBorder false;
};

// across map edges camera

// look to north west corner
_camera camPrepareTarget [0, _mapsize, _alt];
// position at south east corner
_camera camPreparePos [_mapsize, 0, _alt];
_camera camCommitPrepared 0;
waitUntil { camCommitted _camera; };
// move to south east corner
_camera camPreparePos [0, _mapsize, _alt];
// nice minute move time
_camera camCommitPrepared _pantime;
waitUntil { camCommitted _camera; };

// now from nort east corner to south west corner

// look to south west corner
_camera camPrepareTarget [0, 0, _alt];
// position at north east corner
_camera camPreparePos [_mapsize, _mapsize, _alt];
_camera camCommitPrepared 0;
waitUntil { camCommitted _camera; };
// small pause to at least some models can be loaded :)
sleep 1;
// move to south east corner
_camera camPreparePos [0, 0, _alt];
// nice minute move time
_camera camCommitPrepared _pantime;
waitUntil { camCommitted _camera; };

/*
// airport pan 1
_camera camPrepareTarget [7801.97,-97954.57,21.25];
_camera camPreparePos [10670.93,2004.26,6.05];
_camera camCommitPrepared 0;
waitUntil { camCommitted _camera; };
_camera camPrepareTarget [108068.33,24670.23,21.50];
_camera camPreparePos [10670.93,2004.26,6.05];
_camera camCommitPrepared _PanSmoothness;
waitUntil { camCommitted _camera; };
*/

// Destroy the camera
_camera cameraeffect ["terminate", "back"];;
camDestroy _camera;

// end the intro
endcut = true;
