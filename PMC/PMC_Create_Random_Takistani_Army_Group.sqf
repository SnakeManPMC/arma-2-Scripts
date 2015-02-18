/*

PMC_Create_Random_Takistani_Army_Group.sqf

This will randomize the Takistani Army group functions, creates one group and returns the group name.

Syntax:
[_respawnpoint] call PMC_Create_Random_Takistani_Army_Group;

Returns:
Group

*/

PMC_Create_Random_Takistani_Army_Group =
{
	private["_respawnpoint", "_ran", "_grp"];
	
	// take from parameter
	_respawnpoint = _this select 0;
	
	_ran = floor (random 25);
	switch (_ran) do
	{
		case 0:
		{
			_grp = [_respawnpoint] call PMC_Create_Takistani_Army;
		};
		case 1:
		{
			_grp = [_respawnpoint] call PMC_Create_Takistani_Army_Armor_T34_Platoon;
		};
		case 2:
		{
			_grp = [_respawnpoint] call PMC_Create_Takistani_Army_Armor_T55_Platoon;
		};
		case 3:
		{
			_grp = [_respawnpoint] call PMC_Create_Takistani_Army_Armor_T72_Platoon;
		};
		case 4:
		{
			_grp = [_respawnpoint] call PMC_Create_Takistani_Army_Mechanized_Recon;
		};
		case 5:
		{
			_grp = [_respawnpoint] call PMC_Create_Takistani_Army_Mechanized_Recon_AT;
		};
		case 6:
		{
			_grp = [_respawnpoint] call PMC_Create_Takistani_Army_Mechanized_Special_Squad;
		};
		case 7:
		{
			_grp = [_respawnpoint] call PMC_Create_Takistani_Army_Mechanized_Squad_BMP2;
		};
		case 8:
		{
			_grp = [_respawnpoint] call PMC_Create_Takistani_Army_Mechanized_Squad_BTR60;
		};
		case 9:
		{
			_grp = [_respawnpoint] call PMC_Create_Takistani_Army_Motorized_Patrol;
		};
		case 10:
		{
			_grp = [_respawnpoint] call PMC_Create_Takistani_Army_Motorized_Recon;
		};
		case 11:
		{
			_grp = [_respawnpoint] call PMC_Create_Takistani_Army_Motorized_Squad;
		};
		case 12:
		{
			_grp = [_respawnpoint] call PMC_Create_Takistani_Army_Section;
		};
		case 13:
		{
			_grp = [_respawnpoint] call PMC_Create_Takistani_Army_Section_AA;
		};
		case 14:
		{
			_grp = [_respawnpoint] call PMC_Create_Takistani_Army_Section_AT;
		};
		case 15:
		{
			_grp = [_respawnpoint] call PMC_Create_Takistani_Army_Section_MG;
		};
		case 16:
		{
			_grp = [_respawnpoint] call PMC_Create_Takistani_Army_Sniper;
		};
		case 17:
		{
			_grp = [_respawnpoint] call PMC_Create_Takistani_Army_Special_Purpose;
		};
		case 18:
		{
			_grp = [_respawnpoint] call PMC_Create_Takistani_Army_Support;
		};
		case 19:
		{
			_grp = [_respawnpoint] call PMC_Create_Takistani_Militia;
		};
		case 20:
		{
			_grp = [_respawnpoint] call PMC_Create_Takistani_Militia_Patrol;
		};
		case 21:
		{
			_grp = [_respawnpoint] call PMC_Create_Takistani_Militia_Support;
		};
		case 22:
		{
			_grp = [_respawnpoint] call PMC_Create_Takistani_Militia_Team_AA;
		};
		case 23:
		{
			_grp = [_respawnpoint] call PMC_Create_Takistani_Militia_Team_AT;
		};
		case 24:
		{
			_grp = [_respawnpoint] call PMC_Create_Takistani_Militia_Technicals;
		};
	};
	
	_grp
};
