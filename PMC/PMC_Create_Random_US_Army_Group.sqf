/*

PMC_Create_Random_US_Army_Group.sqf

This will randomize the US Army group functions, creates one group and returns the group name.

Syntax:
[_respawnpoint] call PMC_Create_Random_US_Army_Group;

Returns:
Group

*/

PMC_Create_Random_US_Army_Group =
{
	private["_respawnpoint", "_ran", "_grp"];
	
	// take from parameter
	_respawnpoint = _this select 0;
	
	_ran = floor (random 20);
	switch (_ran) do
	{
		case 0:
		{
			_grp = [_respawnpoint] call PMC_Create_US_Army;
		};
		case 1:
		{
			_grp = [_respawnpoint] call PMC_Create_US_Army_Armor_M1A1_Platoon;
		};
		case 2:
		{
			_grp = [_respawnpoint] call PMC_Create_US_Army_Armor_M1A2_Platoon;
		};
		case 3:
		{
			_grp = [_respawnpoint] call PMC_Create_US_Army_Armor_M1A2_Section;
		};
		case 4:
		{
			_grp = [_respawnpoint] call PMC_Create_US_Army_Armor_Stryker_MGS;
		};
		case 5:
		{
			_grp = [_respawnpoint] call PMC_Create_US_Army_Delta_Patrol_ATV;
		};
		case 6:
		{
			_grp = [_respawnpoint] call PMC_Create_US_Army_Delta_Patrol_HMMWV;
		};
		case 7:
		{
			_grp = [_respawnpoint] call PMC_Create_US_Army_Mechanized_ICV_MK2;
		};
		case 8:
		{
			_grp = [_respawnpoint] call PMC_Create_US_Army_Mechanized_ICV_MK19;
		};
		case 9:
		{
			_grp = [_respawnpoint] call PMC_Create_US_Army_Mechanized_Recon;
		};
		case 10:
		{
			_grp = [_respawnpoint] call PMC_Create_US_Army_Motorized_Section;
		};
		case 11:
		{
			_grp = [_respawnpoint] call PMC_Create_US_Army_Motorized_Section_AT;
		};
		case 12:
		{
			_grp = [_respawnpoint] call PMC_Create_US_Army_Sniper;
		};
		case 13:
		{
			_grp = [_respawnpoint] call PMC_Create_US_Army_Support;
		};
		case 14:
		{
			_grp = [_respawnpoint] call PMC_Create_US_Army_Team;
		};
		case 15:
		{
			_grp = [_respawnpoint] call PMC_Create_US_Army_Team_AT;
		};
		case 16:
		{
			_grp = [_respawnpoint] call PMC_Create_US_Army_Team_AT_Heavy;
		};
		case 17:
		{
			_grp = [_respawnpoint] call PMC_Create_US_Army_Team_MG;
		};
		case 18:
		{
			_grp = [_respawnpoint] call PMC_Create_US_ArmyWeapons;
		};
		case 19:
		{
			_grp = [_respawnpoint] call PMC_Create_US_DeltaForce;
		};
	};
	
	_grp
};
