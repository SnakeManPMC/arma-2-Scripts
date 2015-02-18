/*
random weather from cipher mission by someone
*/
private
[
	"_Mean",
	"_startWX",
	"_syncing",
	"_Time",
	"_Vhi",
	"_Vlo",
	"_wxd",
	"_WXTimeMax",
	"_WXTimeMin"
];

/*
globals:
ServerOvcReady
ServerWXReady
WX
WXactual
WXfTime
WXfTimeS
WXTime
*/

_startWX = _this select 0;
// 3 mins
_WXTimeMin = 5; // 180
// 4 mins
_WXTimeMax = 10; // 240
_Mean = 0.33;
_syncing = false;

while {true} do
{
	if (isServer) then
	{
		_Vhi = random (1 -_Mean);
		_Vlo = random (_Mean);
		// weather probability = high along mean value
		WX = _Vlo + random (1 -_Vhi - _Vlo);
		// weather probability = linear
		WX = random 1;
		_wxd = abs (WX - overcast);

		if(_startWX)then
		{
			_startWX = false;
			WXTime = 0.1;
		}
		else
		{
			WXTime = _WXTimeMin + (1 + 25) * _wxd * (random (_WXTimeMax - _WXTimeMin));
		};

		WXfTime = WXTime;
		WXfTimeS = WXTime;
		ServerOvcReady = true;
		sleep 1;
		publicvariable "WX";
		publicvariable "WXTime";
		publicvariable "WXfTime";
		publicvariable "ServerOvcReady";
	};

	waitUntil {ServerOvcReady};

	WXTime SetOvercast WX;

	// wait cycle until next Weather Set
	ServerWXReady = false;
	_Time = DayTime * 3600;

	while {!ServerWXReady} do
	{
		if (isServer) then
		{
			WXfTime = WXTime - DayTime * 3600 + _Time;
			if (WXfTime < 0) then
			{
				ServerWXReady = true
			};

			WXactual = Overcast;
			publicvariable "WX";
			publicvariable "WXTime";
			publicvariable "WXfTime";
			publicvariable "WXactual";
			publicvariable "ServerWXReady";
		}
		else
		{
			if (abs(Overcast - WXactual) > 0.01) then
			{
				0.1 SetOverCast WXactual;
				sleep 0.2;
				WXfTime SetOvercast WX;
				_syncing = true;
			}
			else
			{
				_syncing = false;
			};
		};
		hintsilent format["OvcSet: %1\nOvcTime: %2\nOvc-S: %3\nOvc: %4\nTimeF: %5\nsyncing: %6", WX, WXTime, WXactual, Overcast, WXfTime, _syncing];
		sleep 1;
	};
};
