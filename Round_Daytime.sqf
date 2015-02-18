_Daytime = _this select 0;
_Minute = _this select 1;

// Round _Daytime as per _Minute accuracy
_Fraction = _Minute / 60;
_RoundedDaytime = (round (_Daytime / _Fraction)) * _Fraction;

// Turn to 4 digit hours (6.25 = 0615 Hours)

if (_RoundedDaytime < 10) then
{
	_Digit1 = "0";
}
else
{
	_Digit1 = "";
};

_Digit2 = floor _RoundedDaytime;

_Digit4 = round ((_RoundedDaytime - (floor _RoundedDaytime)) * 60);

if (_Digit4 < 10) then
{
	_Digit3 = "0";
}
else
{
	_Digit3 = "";
};

format ["%1%2%3%4",_Digit1,_Digit2,_Digit3,_Digit4]
