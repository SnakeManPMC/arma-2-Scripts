/*

	Run lower skill level for (enemy) AI

Syntax:
[group, maxSkill] execVM "PMC\PMC_setAISkill.sqf";

Requires:
-

Returns:
-

*/
PMC_setAISkill =
{
	private ["_grp", "_skillValue", "_PMC_Process_Skills"];

	_grp = _this select 0;

	// max skill value we want to use
	if (count _this > 1) then
	{
		_skillvalue = _this select 1;
	}
	else
	{
		_skillValue = 0.25;
	};

	_PMC_Process_Skills =
	{
		private ["_guy","_skillValue"];

		_guy = _this select 0;
	        _skillValue = _this select 1;

		{
			_guy setSkill [_x, (random _skillValue)];
		} forEach
		[
			"aimingAccuracy",
			"aimingShake",
			"aimingSpeed",
			"endurance",
			"spotDistance",
			"spotTime",
			"courage",
			"reloadSpeed",
			"commanding",
			"general"
		];
	};


	// run it for all of them
	{
		[_x, _skillValue] call _PMC_Process_Skills;
	} forEach units _grp;
};
