/*

	default killed body and vehicle removal script

*/
PMC_EventHandlersStuff =
{
	private ["_grp","_vcl"];
	_grp = _this select 0;
	
	{		_x addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}];	} forEach units _grp;
	
	// vehicle removal script also
	if (!isNull _vcl) then
	{
		_vcl addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}];
	};
};
