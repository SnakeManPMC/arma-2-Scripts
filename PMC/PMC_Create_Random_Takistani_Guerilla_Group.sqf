/*

PMC_Create_Random_Takistani_Guerrilla_Group.sqf

This will randomize the Takistani Guerrilla group functions, creates one group and returns the group name.

Syntax:
[_respawnpoint] call PMC_Create_Random_Takistani_Guerrilla_Group;

Returns:
Group

*/

PMC_Create_Random_Takistani_Guerrilla_Group =
{
	private["_respawnpoint", "_ran", "_grp"];
	
	// take from parameter
	_respawnpoint = _this select 0;
	
	_ran = floor (random 13);
	switch (_ran) do
	{
		case 0:
		{
			_grp = [_respawnpoint] call PMC_Create_Guerrilla_Takistan_Armor_T34_Platoon;
		};
		case 1:
		{
			_grp = [_respawnpoint] call PMC_Create_Guerrilla_Takistan_Armor_T55_Section;
		};
		case 2:
		{
			_grp = [_respawnpoint] call PMC_Create_Guerrilla_Takistan_Group;
		};
		case 3:
		{
			_grp = [_respawnpoint] call PMC_Create_Guerrilla_Takistan_Group_Weapons;
		};
		case 4:
		{
			_grp = [_respawnpoint] call PMC_Create_Guerrilla_Takistan_Mechanized_Group;
		};
		case 5:
		{
			_grp = [_respawnpoint] call PMC_Create_Guerrilla_Takistan_Mechanized_Patrol;
		};
		case 6:
		{
			_grp = [_respawnpoint] call PMC_Create_Guerrilla_Takistan_Motorized_Group;
		};
		case 7:
		{
			_grp = [_respawnpoint] call PMC_Create_Guerrilla_Takistan_Motorized_Patrol;
		};
		case 8:
		{
			_grp = [_respawnpoint] call PMC_Create_Guerrilla_Takistan_Motorized_Technicals;
		};
		case 9:
		{
			_grp = [_respawnpoint] call PMC_Create_Guerrilla_Takistan_Patrol;
		};
		case 10:
		{
			_grp = [_respawnpoint] call PMC_Create_Guerrilla_Takistan_Sniper;
		};
		case 11:
		{
			_grp = [_respawnpoint] call PMC_Create_Guerrilla_Takistan_Team_AA;
		};
		case 12:
		{
			_grp = [_respawnpoint] call PMC_Create_Guerrilla_Takistan_Team_AT;
		};
	};
	
	_grp
};
