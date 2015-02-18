/*

	VTE random weapons for unit

Syntax:
[unit] execVM "PMC\PMC_Random_Weapons.sqf";

Required:
-

*/
private ["_pistol","_PMC_Random_Pistol","_PMC_Random_Rifle","_u"];

_PMC_Random_Rifle =
{
	private ["_ran","_u","_pistol"];
        
        _u = _this select 0;

	_ran = round (random 51);
	switch (_ran) do
	{
		case 0:
	    	{
			_u addMagazine "VTE_20Rnd_762x63_Stanag";
			_u addMagazine "VTE_20Rnd_762x63_Stanag";
			_u addMagazine "VTE_20Rnd_762x63_Stanag";
			_u addMagazine "VTE_20Rnd_762x63_Stanag";
			_u addMagazine "VTE_20Rnd_762x63_Stanag";
			_u addMagazine "VTE_20Rnd_762x63_Stanag";
			_u addMagazine "VTE_20Rnd_762x63_Stanag";
			_u addMagazine "VTE_20Rnd_762x63_Stanag";
			_u addWeapon "VTE_bar";
		};

		case 1:
	    	{
			_u addMagazine "VTE_32Rnd_uzi";
			_u addMagazine "VTE_32Rnd_uzi";
			_u addMagazine "VTE_32Rnd_uzi";
			_u addMagazine "VTE_32Rnd_uzi";
			_u addMagazine "VTE_32Rnd_uzi";
			_u addMagazine "VTE_32Rnd_uzi";
			_u addMagazine "VTE_32Rnd_uzi";
			_u addMagazine "VTE_32Rnd_uzi";
			_u addWeapon "VTE_uzi";
		};

		case 2:
	    	{
			_u addMagazine "VTE_32Rnd_sten";
			_u addMagazine "VTE_32Rnd_sten";
			_u addMagazine "VTE_32Rnd_sten";
			_u addMagazine "VTE_32Rnd_sten";
			_u addMagazine "VTE_32Rnd_sten";
			_u addMagazine "VTE_32Rnd_sten";
			_u addMagazine "VTE_32Rnd_sten";
			_u addMagazine "VTE_32Rnd_sten";
			_u addWeapon "VTE_sten";
		};

		case 3:
	    	{
			_u addMagazine "VTE_32Rnd_stensd";
			_u addMagazine "VTE_32Rnd_sten";
			_u addMagazine "VTE_32Rnd_stensd";
			_u addMagazine "VTE_32Rnd_sten";
			_u addMagazine "VTE_32Rnd_stensd";
			_u addMagazine "VTE_32Rnd_sten";
			_u addMagazine "VTE_32Rnd_stensd";
			_u addMagazine "VTE_32Rnd_sten";
			_u addWeapon "VTE_stensd";
		};

		case 4:
	    	{
			_u addMagazine "VTE_36Rnd_M45";
			_u addMagazine "VTE_36Rnd_M45";
			_u addMagazine "VTE_36Rnd_M45";
			_u addMagazine "VTE_36Rnd_M45";
			_u addMagazine "VTE_36Rnd_M45";
			_u addMagazine "VTE_36Rnd_M45";
			_u addMagazine "VTE_36Rnd_M45";
			_u addMagazine "VTE_36Rnd_M45";
			_u addWeapon "VTE_m45";
		};

		case 5:
	    	{
			_u addMagazine "VTE_30Rnd_45ACP";
			_u addMagazine "VTE_100Rnd_45ACP_Drum";
			_u addMagazine "VTE_30Rnd_45ACP";
			_u addMagazine "VTE_100Rnd_45ACP_Drum";
			_u addWeapon "VTE_thompson";
		};

		case 6:
	    	{
			_u addMagazine "VTE_5Rnd_762x51_nato";
			_u addMagazine "VTE_5Rnd_762x51_nato";
			_u addMagazine "VTE_5Rnd_762x51_nato";
			_u addMagazine "VTE_5Rnd_762x51_nato";
			_u addMagazine "VTE_5Rnd_762x51_nato";
			_u addMagazine "VTE_5Rnd_762x51_nato";
			_u addMagazine "VTE_5Rnd_762x51_nato";
			_u addMagazine "VTE_5Rnd_762x51_nato";
			_u addWeapon "VTE_mas36";
		};

		case 7:
	    	{
			_u addMagazine "VTE_32Rnd_765x20";
			_u addMagazine "VTE_32Rnd_765x20";
			_u addMagazine "VTE_32Rnd_765x20";
			_u addMagazine "VTE_32Rnd_765x20";
			_u addMagazine "VTE_32Rnd_765x20";
			_u addMagazine "VTE_32Rnd_765x20";
			_u addMagazine "VTE_32Rnd_765x20";
			_u addMagazine "VTE_32Rnd_765x20";
			_u addWeapon "VTE_mas38";
		};

		case 8:
	    	{
			_u addMagazine "VTE_32Rnd_uzi";
			_u addMagazine "VTE_32Rnd_uzi";
			_u addMagazine "VTE_32Rnd_uzi";
			_u addMagazine "VTE_32Rnd_uzi";
			_u addMagazine "VTE_32Rnd_uzi";
			_u addMagazine "VTE_32Rnd_uzi";
			_u addMagazine "VTE_32Rnd_uzi";
			_u addMagazine "VTE_32Rnd_uzi";
			_u addWeapon "VTE_mp40";
		};

		case 9:
	    	{
			_u addMagazine "VTE_32Rnd_MPK";
			_u addMagazine "VTE_32Rnd_MPK";
			_u addMagazine "VTE_32Rnd_MPK";
			_u addMagazine "VTE_32Rnd_MPK";
			_u addMagazine "VTE_32Rnd_MPK";
			_u addMagazine "VTE_32Rnd_MPK";
			_u addMagazine "VTE_32Rnd_MPK";
			_u addMagazine "VTE_32Rnd_MPK";
			_u addWeapon "VTE_mpk";
		};

		case 10:
	    	{
			_u addMagazine "VTE_32Rnd_MPK";
			_u addMagazine "VTE_32Rnd_MPK";
			_u addMagazine "VTE_32Rnd_MPK";
			_u addMagazine "VTE_32Rnd_MPK";
			_u addMagazine "VTE_32Rnd_MPK";
			_u addMagazine "VTE_32Rnd_MPK";
			_u addMagazine "VTE_32Rnd_MPK";
			_u addMagazine "VTE_32Rnd_MPK";
			_u addWeapon "VTE_mpl";
		};

		case 11:
	    	{
			_u addMagazine "VTE_20Rnd_556x45_Stanag";
			_u addMagazine "VTE_20Rnd_556x45_Stanag";
			_u addMagazine "VTE_20Rnd_556x45_Stanag";
			_u addMagazine "VTE_20Rnd_556x45_Stanag";
			_u addMagazine "VTE_20Rnd_556x45_Stanag";
			_u addMagazine "VTE_20Rnd_556x45_Stanag";
			_u addMagazine "VTE_20Rnd_556x45_Stanag";
			_u addMagazine "VTE_20Rnd_556x45_Stanag";
			_u addWeapon "VTE_ar15";
		};

		case 12:
	    	{
			_u addMagazine "VTE_20Rnd_556x45_Stanag";
			_u addMagazine "VTE_20Rnd_556x45_Stanag";
			_u addMagazine "VTE_20Rnd_556x45_Stanag";
			_u addMagazine "VTE_20Rnd_556x45_Stanag";
			_u addMagazine "VTE_20Rnd_556x45_Stanag";
			_u addMagazine "VTE_20Rnd_556x45_Stanag";
			_u addMagazine "VTE_20Rnd_556x45_Stanag";
			_u addMagazine "VTE_20Rnd_556x45_Stanag";
			_u addWeapon "VTE_xm177e";
		};

		case 13:
	    	{
			_u addMagazine "VTE_20Rnd_556x45_Stanag";
			_u addMagazine "VTE_20Rnd_556x45_Stanag";
			_u addMagazine "VTE_20Rnd_556x45_Stanag";
			_u addMagazine "VTE_20Rnd_556x45_Stanag";
			_u addMagazine "VTE_20Rnd_556x45_Stanag";
			_u addMagazine "VTE_20Rnd_556x45_Stanag";
			_u addMagazine "VTE_20Rnd_556x45_Stanag";
			_u addMagazine "VTE_20Rnd_556x45_Stanag";
			_u addWeapon "VTE_m16a1";
		};

		case 14:
	    	{
			_u addMagazine "VTE_20Rnd_556x45_Stanag";
			_u addMagazine "VTE_20Rnd_556x45_Stanag";
			_u addMagazine "VTE_40mm_AmmoBag";
			_u addMagazine "VTE_40mm_HE";
			_u addMagazine "VTE_40mm_Buckshot";
			_u addMagazine "VTE_FlareWhite_Rifle";
			_u addMagazine "VTE_FlareGreen_Rifle";
			_u addMagazine "VTE_FlareRed_Rifle";
			_u addMagazine "VTE_FlareYellow_Rifle";
			_u addMagazine "VTE_MarkerRound";
			_u addWeapon "VTE_car15gl";
			// set pistol to false because we use pistol mag slots
			// for the flare grenades.
			_pistol = false;
		};

		case 15:
	    	{
			_u addMagazine "VTE_20Rnd_762x51_nato";
			_u addMagazine "VTE_20Rnd_762x51_nato";
			_u addMagazine "VTE_20Rnd_762x51_nato";
			_u addMagazine "VTE_20Rnd_762x51_nato";
			_u addMagazine "VTE_20Rnd_762x51_nato";
			_u addMagazine "VTE_20Rnd_762x51_nato";
			_u addMagazine "VTE_20Rnd_762x51_nato";
			_u addMagazine "VTE_20Rnd_762x51_nato";
			_u addWeapon "VTE_m14";
		};

		case 16:
	    	{
			_u addMagazine "VTE_20Rnd_762x51_nato";
			_u addMagazine "VTE_5Rnd_762x51_nato";
			_u addMagazine "VTE_20Rnd_762x51_nato";
			_u addMagazine "VTE_5Rnd_762x51_nato";
			_u addMagazine "VTE_20Rnd_762x51_nato";
			_u addMagazine "VTE_5Rnd_762x51_nato";
			_u addMagazine "VTE_20Rnd_762x51_nato";
			_u addMagazine "VTE_5Rnd_762x51_nato";
			_u addWeapon "VTE_m21";
		};

		case 17:
	    	{
			_u addMagazine "VTE_40mm_AmmoBag";
			_u addMagazine "VTE_40mm_HE";
			_u addMagazine "VTE_40mm_Buckshot";
			_u addWeapon "VTE_m79";
		};

		case 18:
	    	{
			_u addMagazine "VTE_40mm_AmmoBag";
			_u addMagazine "VTE_40mm_HE";
			_u addMagazine "VTE_40mm_Buckshot";
			_u addWeapon "VTE_ex41";
		};

		case 19:
	    	{
			_u addMagazine "VTE_20Rnd_556x45_Stanag";
			_u addMagazine "VTE_20Rnd_556x45_Stanag";
			_u addMagazine "VTE_20Rnd_556x45_Stanag";
			_u addMagazine "VTE_20Rnd_556x45_Stanag";
			_u addMagazine "VTE_20Rnd_556x45_Stanag";
			_u addMagazine "VTE_20Rnd_556x45_Stanag";
			_u addMagazine "VTE_20Rnd_556x45_Stanag";
			_u addMagazine "VTE_20Rnd_556x45_Stanag";
			_u addWeapon "VTE_stoner_ar";
		};

		case 20:
	    	{
			_u addMagazine "VTE_100Rnd_556x45_M23";
			_u addMagazine "VTE_20Rnd_556x45_Stanag";
			_u addMagazine "VTE_100Rnd_556x45_M23";
			_u addMagazine "VTE_20Rnd_556x45_Stanag";
			_u addWeapon "VTE_stoner_mg";
		};

		case 21:
	    	{
			_u addMagazine "VTE_100Rnd_762x51_M60";
			_u addMagazine "VTE_100Rnd_762x51_M60";
			_u addMagazine "VTE_100Rnd_762x51_M60";
			_u addWeapon "VTE_m60";
		};

		case 22:
	    	{
			_u addMagazine "VTE_100Rnd_762x51_M60";
			_u addMagazine "VTE_100Rnd_762x51_M60";
			_u addMagazine "VTE_100Rnd_762x51_M60";
			_u addWeapon "VTE_m60s";
		};

		case 23:
	    	{
			_u addMagazine "VTE_30Rnd_762x51_nato";
			_u addMagazine "VTE_30Rnd_762x51_nato";
			_u addMagazine "VTE_30Rnd_762x51_nato";
			_u addMagazine "VTE_30Rnd_762x51_nato";
			_u addMagazine "VTE_30Rnd_762x51_nato";
			_u addMagazine "VTE_30Rnd_762x51_nato";
			_u addMagazine "VTE_30Rnd_762x51_nato";
			_u addMagazine "VTE_30Rnd_762x51_nato";
			_u addWeapon "VTE_bren2";
		};

		case 24:
	    	{
			_u addMagazine "VTE_10Rnd_77x56";
			_u addMagazine "VTE_10Rnd_77x56";
			_u addMagazine "VTE_10Rnd_77x56";
			_u addMagazine "VTE_10Rnd_77x56";
			_u addMagazine "VTE_10Rnd_77x56";
			_u addMagazine "VTE_10Rnd_77x56";
			_u addMagazine "VTE_10Rnd_77x56";
			_u addMagazine "VTE_10Rnd_77x56";
			_u addWeapon "VTE_enfieldn4";
		};

		case 25:
	    	{
			_u addMagazine "VTE_8Rnd_762x63";
			_u addMagazine "VTE_8Rnd_762x63";
			_u addMagazine "VTE_8Rnd_762x63";
			_u addMagazine "VTE_8Rnd_762x63";
			_u addMagazine "VTE_8Rnd_762x63";
			_u addMagazine "VTE_8Rnd_762x63";
			_u addMagazine "VTE_8Rnd_762x63";
			_u addMagazine "VTE_8Rnd_762x63";
			_u addWeapon "VTE_garand";
		};

		case 26:
	    	{
			_u addMagazine "VTE_15Rnd_762x33";
			_u addMagazine "VTE_30Rnd_762x33";
			_u addMagazine "VTE_15Rnd_762x33";
			_u addMagazine "VTE_30Rnd_762x33";
			_u addMagazine "VTE_15Rnd_762x33";
			_u addMagazine "VTE_30Rnd_762x33";
			_u addMagazine "VTE_15Rnd_762x33";
			_u addMagazine "VTE_30Rnd_762x33";
			_u addWeapon "VTE_m1carbine";
		};

		case 27:
	    	{
			_u addMagazine "VTE_25Rnd_45ACP";
			_u addMagazine "VTE_25Rnd_45ACP";
			_u addMagazine "VTE_25Rnd_45ACP";
			_u addMagazine "VTE_25Rnd_45ACP";
			_u addMagazine "VTE_25Rnd_45ACP";
			_u addMagazine "VTE_25Rnd_45ACP";
			_u addMagazine "VTE_25Rnd_45ACP";
			_u addMagazine "VTE_25Rnd_45ACP";
			_u addWeapon "VTE_m3a1";
		};

		case 28:
	    	{
			_u addMagazine "VTE_25Rnd_45ACPSD";
			_u addMagazine "VTE_25Rnd_45ACP";
			_u addMagazine "VTE_25Rnd_45ACPSD";
			_u addMagazine "VTE_25Rnd_45ACP";
			_u addMagazine "VTE_25Rnd_45ACPSD";
			_u addMagazine "VTE_25Rnd_45ACP";
			_u addMagazine "VTE_25Rnd_45ACPSD";
			_u addMagazine "VTE_25Rnd_45ACP";
			_u addWeapon "VTE_m3sd";
		};

		case 29:
	    	{
			_u addMagazine "VTE_ithacashell";
			_u addMagazine "VTE_ithacaslug";
			_u addMagazine "VTE_ithacashell";
			_u addMagazine "VTE_ithacaslug";
			_u addMagazine "VTE_ithacashell";
			_u addMagazine "VTE_ithacaslug";
			_u addMagazine "VTE_ithacashell";
			_u addMagazine "VTE_ithacaslug";
			_u addWeapon "VTE_ithaca";
		};

		case 30:
	    	{
			_u addMagazine "VTE_30Rnd_762x43_AK";
			_u addMagazine "VTE_30Rnd_762x43_AK";
			_u addMagazine "VTE_30Rnd_762x43_AK";
			_u addMagazine "VTE_30Rnd_762x43_AK";
			_u addMagazine "VTE_30Rnd_762x43_AK";
			_u addMagazine "VTE_30Rnd_762x43_AK";
			_u addMagazine "VTE_30Rnd_762x43_AK";
			_u addMagazine "VTE_30Rnd_762x43_AK";
			_u addWeapon "VTE_ak47";
		};

		case 31:
	    	{
			_u addMagazine "VTE_30Rnd_762x43_AK";
			_u addMagazine "VTE_30Rnd_762x43_AK";
			_u addMagazine "VTE_30Rnd_762x43_AK";
			_u addMagazine "VTE_30Rnd_762x43_AK";
			_u addMagazine "VTE_30Rnd_762x43_AK";
			_u addMagazine "VTE_30Rnd_762x43_AK";
			_u addMagazine "VTE_30Rnd_762x43_AK";
			_u addMagazine "VTE_30Rnd_762x43_AK";
			_u addWeapon "VTE_type56";
		};

		case 32:
	    	{
			_u addMagazine "VTE_10Rnd_SKS";
			_u addMagazine "VTE_10Rnd_SKS";
			_u addMagazine "VTE_10Rnd_SKS";
			_u addMagazine "VTE_10Rnd_SKS";
			_u addMagazine "VTE_10Rnd_SKS";
			_u addMagazine "VTE_10Rnd_SKS";
			_u addMagazine "VTE_10Rnd_SKS";
			_u addMagazine "VTE_10Rnd_SKS";
			_u addWeapon "VTE_sks";
		};

		case 33:
	    	{
			_u addMagazine "VTE_20Rnd_762x43_AK";
			_u addMagazine "VTE_20Rnd_762x43_AK";
			_u addMagazine "VTE_20Rnd_762x43_AK";
			_u addMagazine "VTE_20Rnd_762x43_AK";
			_u addMagazine "VTE_20Rnd_762x43_AK";
			_u addMagazine "VTE_20Rnd_762x43_AK";
			_u addMagazine "VTE_20Rnd_762x43_AK";
			_u addMagazine "VTE_20Rnd_762x43_AK";
			_u addWeapon "VTE_type68";
		};

		case 34:
	    	{
			_u addMagazine "VTE_5Rnd_mosin";
			_u addMagazine "VTE_5Rnd_mosin";
			_u addMagazine "VTE_5Rnd_mosin";
			_u addMagazine "VTE_5Rnd_mosin";
			_u addMagazine "VTE_5Rnd_mosin";
			_u addMagazine "VTE_5Rnd_mosin";
			_u addMagazine "VTE_5Rnd_mosin";
			_u addMagazine "VTE_5Rnd_mosin";
			_u addWeapon "VTE_mosin38";
		};

		case 35:
	    	{
			_u addMagazine "VTE_5Rnd_mosin";
			_u addMagazine "VTE_5Rnd_mosin";
			_u addMagazine "VTE_5Rnd_mosin";
			_u addMagazine "VTE_5Rnd_mosin";
			_u addMagazine "VTE_5Rnd_mosin";
			_u addMagazine "VTE_5Rnd_mosin";
			_u addMagazine "VTE_5Rnd_mosin";
			_u addMagazine "VTE_5Rnd_mosin";
			_u addWeapon "VTE_mosin";
		};

		case 36:
	    	{
			_u addMagazine "VTE_5Rnd_mosin";
			_u addMagazine "VTE_5Rnd_mosin";
			_u addMagazine "VTE_5Rnd_mosin";
			_u addMagazine "VTE_5Rnd_mosin";
			_u addMagazine "VTE_5Rnd_mosin";
			_u addMagazine "VTE_5Rnd_mosin";
			_u addMagazine "VTE_5Rnd_mosin";
			_u addMagazine "VTE_5Rnd_mosin";
			_u addWeapon "VTE_mosina";
		};

		case 37:
	    	{
			_u addMagazine "VTE_10Rnd_svt";
			_u addMagazine "VTE_10Rnd_svt";
			_u addMagazine "VTE_10Rnd_svt";
			_u addMagazine "VTE_10Rnd_svt";
			_u addMagazine "VTE_10Rnd_svt";
			_u addMagazine "VTE_10Rnd_svt";
			_u addMagazine "VTE_10Rnd_svt";
			_u addMagazine "VTE_10Rnd_svt";
			_u addWeapon "VTE_svt40";
		};

		case 38:
	    	{
			_u addMagazine "VTE_71Rnd_mp";
			_u addMagazine "VTE_71Rnd_mp";
			_u addMagazine "VTE_71Rnd_mp";
			_u addWeapon "VTE_ppsh41";
		};

		case 39:
	    	{
			_u addMagazine "VTE_35Rnd_mp";
			_u addMagazine "VTE_35Rnd_mp";
			_u addMagazine "VTE_35Rnd_mp";
			_u addMagazine "VTE_35Rnd_mp";
			_u addMagazine "VTE_35Rnd_mp";
			_u addMagazine "VTE_35Rnd_mp";
			_u addMagazine "VTE_35Rnd_mp";
			_u addMagazine "VTE_35Rnd_mp";
			_u addWeapon "VTE_pps43";
		};

		case 40:
	    	{
			_u addMagazine "VTE_47Rnd_762x51_drum";
			_u addMagazine "VTE_47Rnd_762x51_drum";
			_u addMagazine "VTE_47Rnd_762x51_drum";
			_u addWeapon "VTE_dp27";
		};

		case 41:
	    	{
			_u addMagazine "VTE_100Rnd_RPD_drum";
			_u addMagazine "VTE_100Rnd_RPD_drum";
			_u addMagazine "VTE_100Rnd_RPD_drum";
			_u addWeapon "VTE_rpd";
		};

		case 42:
	    	{
			_u addMagazine "VTE_25Rnd_762x25_PPD_Box";
			_u addMagazine "VTE_71Rnd_762x25_PPD_Drum";
			_u addMagazine "VTE_25Rnd_762x25_PPD_Box";
			_u addMagazine "VTE_71Rnd_762x25_PPD_Drum";
			_u addWeapon "VTE_ppd40";
		};

		case 43:
	    	{
			_u addMagazine "VTE_35Rnd_762x25";
			_u addMagazine "VTE_35Rnd_762x25";
			_u addMagazine "VTE_35Rnd_762x25";
			_u addMagazine "VTE_35Rnd_762x25";
			_u addMagazine "VTE_35Rnd_762x25";
			_u addMagazine "VTE_35Rnd_762x25";
			_u addMagazine "VTE_35Rnd_762x25";
			_u addMagazine "VTE_35Rnd_762x25";
			_u addWeapon "VTE_k50m";
		};

		case 44:
	    	{
			_u addMagazine "VTE_5Rnd_762x51_nato";
			_u addMagazine "VTE_5Rnd_762x51_nato";
			_u addMagazine "VTE_5Rnd_762x51_nato";
			_u addMagazine "VTE_5Rnd_762x51_nato";
			_u addMagazine "VTE_5Rnd_762x51_nato";
			_u addMagazine "VTE_5Rnd_762x51_nato";
			_u addMagazine "VTE_5Rnd_762x51_nato";
			_u addMagazine "VTE_5Rnd_762x51_nato";
			_u addWeapon "VTE_k98k";
		};

		case 45:
	    	{
			_u addMagazine "VTE_20Rnd_762x51_nato";
			_u addMagazine "VTE_20Rnd_762x51_nato";
			_u addMagazine "VTE_20Rnd_762x51_nato";
			_u addMagazine "VTE_20Rnd_762x51_nato";
			_u addMagazine "VTE_20Rnd_762x51_nato";
			_u addMagazine "VTE_20Rnd_762x51_nato";
			_u addMagazine "VTE_20Rnd_762x51_nato";
			_u addMagazine "VTE_20Rnd_762x51_nato";
			_u addWeapon "VTE_l1a1";
		};

		case 46:
	    	{
			_u addMagazine "VTE_M72";
			_u addMagazine "VTE_M72";
			_u addWeapon "VTE_law";
		};

		case 47:
	    	{
			_u addMagazine "VTE_90mmrocket";
			_u addWeapon "VTE_90mmrecoiless";
		};

		case 48:
	    	{
			_u addMagazine "VTE_PG2";
			_u addMagazine "VTE_PG2";
			_u addWeapon "VTE_rpg2";
		};

		case 49:
	    	{
			_u addMagazine "VTE_sa7missile";
			_u addWeapon "VTE_sa7launcher";
		};

		case 50:
	    	{
			_u addMagazine "VTE_PG7V";
			_u addMagazine "VTE_PG7V";
			_u addWeapon "VTE_rpg7";
		};
	};
        _pistol
};

_PMC_Random_Pistol =
{
	private ["_ran","_u"];
        _u = _this select 0;

	_ran = round (random 5);
	switch (_ran) do
	{
		case 0:
	    	{
			_u addMagazine "VTE_FlareGreen_Rifle";
			_u addMagazine "VTE_FlareRed_Rifle";
			_u addMagazine "VTE_FlareWhite_Rifle";
			_u addMagazine "VTE_FlareYellow_Rifle";
			_u addMagazine "VTE_FlareGreen_Rifle";
			_u addMagazine "VTE_FlareRed_Rifle";
			_u addMagazine "VTE_FlareWhite_Rifle";
			_u addMagazine "VTE_FlareYellow_Rifle";
			_u addWeapon "VTE_flaregun";
	    	};

		case 1:
		{
			_u addMagazine "VTE_7Rnd_1911";
			_u addMagazine "VTE_7Rnd_1911";
			_u addMagazine "VTE_7Rnd_1911";
			_u addMagazine "VTE_7Rnd_1911";
			_u addMagazine "VTE_7Rnd_1911";
			_u addMagazine "VTE_7Rnd_1911";
			_u addMagazine "VTE_7Rnd_1911";
			_u addMagazine "VTE_7Rnd_1911";
			_u addWeapon "VTE_m1911";
		};

		case 2:
		{
			_u addMagazine "VTE_8Rnd_tokarevt33";
			_u addMagazine "VTE_8Rnd_tokarevt33";
			_u addMagazine "VTE_8Rnd_tokarevt33";
			_u addMagazine "VTE_8Rnd_tokarevt33";
			_u addMagazine "VTE_8Rnd_tokarevt33";
			_u addMagazine "VTE_8Rnd_tokarevt33";
			_u addMagazine "VTE_8Rnd_tokarevt33";
			_u addMagazine "VTE_8Rnd_tokarevt33";
			_u addWeapon "VTE_tokarevt33";
		};

		case 3:
		{
			_u addMagazine "VTE_10Rnd_Browning";
			_u addMagazine "VTE_10Rnd_Browning";
			_u addMagazine "VTE_10Rnd_Browning";
			_u addMagazine "VTE_10Rnd_Browning";
			_u addMagazine "VTE_10Rnd_Browning";
			_u addMagazine "VTE_10Rnd_Browning";
			_u addMagazine "VTE_10Rnd_Browning";
			_u addMagazine "VTE_10Rnd_Browning";
			_u addWeapon "VTE_browning";
		};

		case 4:
		{
			_u addMagazine "VTE_8Rnd_45ACPSD";
			_u addMagazine "VTE_8Rnd_45ACPSD";
			_u addMagazine "VTE_8Rnd_45ACPSD";
			_u addMagazine "VTE_8Rnd_45ACPSD";
			_u addMagazine "VTE_8Rnd_45ACPSD";
			_u addMagazine "VTE_8Rnd_45ACPSD";
			_u addMagazine "VTE_8Rnd_45ACPSD";
			_u addMagazine "VTE_8Rnd_45ACPSD";
			_u addWeapon "VTE_m39hp";
		};
	};
};

_u = _this select 0;
_pistol = true;

removeAllWeapons _u;
_pistol = [_u] call _PMC_Random_Rifle;

if (_pistol) then
{
	[_u] call _PMC_Random_Pistol;
};

/*
--- PISTOLS
VTE_flaregun
VTE_FlareGreen_Rifle
VTE_FlareRed_Rifle
VTE_FlareWhite_Rifle
VTE_FlareYellow_Rifle

VTE_m1911
VTE_7Rnd_1911

VTE_tokarevt33
VTE_8Rnd_tokarevt33

VTE_browning
VTE_10Rnd_Browning

VTE_m39hp
VTE_8Rnd_45ACPSD


--- RIFLES
VTE_bar
VTE_20Rnd_762x63_Stanag

VTE_uzi
VTE_32Rnd_uzi

VTE_sten
VTE_32Rnd_sten

VTE_stensd
VTE_32Rnd_sten
VTE_32Rnd_stensd

VTE_m45
VTE_36Rnd_M45

VTE_thompson
VTE_30Rnd_45ACP
VTE_100Rnd_45ACP_Drum

VTE_mas36
VTE_5Rnd_762x51_nato

VTE_mas38
VTE_32Rnd_765x20

VTE_mp40
VTE_32Rnd_uzi

VTE_mpk
VTE_32Rnd_MPK

VTE_mpl
VTE_32Rnd_MPK

VTE_ar15
VTE_20Rnd_556x45_Stanag

VTE_xm177e
VTE_20Rnd_556x45_Stanag

VTE_m16a1
VTE_20Rnd_556x45_Stanag

VTE_car15gl
VTE_20Rnd_556x45_Stanag
VTE_40mm_AmmoBag
VTE_40mm_HE
VTE_40mm_Buckshot
VTE_FlareWhite_Rifle
VTE_FlareGreen_Rifle
VTE_FlareRed_Rifle
VTE_FlareYellow_Rifle
VTE_MarkerRound"

VTE_m14
VTE_20Rnd_762x51_nato

VTE_m21
VTE_20Rnd_762x51_nato
VTE_5Rnd_762x51_nato

VTE_m79
VTE_40mm_AmmoBag
VTE_40mm_HE
VTE_40mm_Buckshot"

VTE_ex41
VTE_40mm_AmmoBag
VTE_40mm_HE
VTE_40mm_Buckshot"

VTE_stoner_ar
VTE_20Rnd_556x45_Stanag

VTE_stoner_mg
VTE_100Rnd_556x45_M23
VTE_20Rnd_556x45_Stanag

VTE_m60
VTE_100Rnd_762x51_M60

VTE_m60s
VTE_100Rnd_762x51_M60

VTE_bren2
VTE_30Rnd_762x51_nato

VTE_enfieldn4
VTE_10Rnd_77x56

VTE_garand
VTE_8Rnd_762x63

VTE_m1carbine
VTE_15Rnd_762x33
VTE_30Rnd_762x33

VTE_m3a1
VTE_25Rnd_45ACP

VTE_m3sd
VTE_25Rnd_45ACPSD
VTE_25Rnd_45ACP

VTE_ithaca
VTE_ithacashell
VTE_ithacaslug

VTE_ak47
VTE_30Rnd_762x43_AK

VTE_type56
VTE_30Rnd_762x43_AK

VTE_sks
VTE_10Rnd_SKS

VTE_type68
VTE_20Rnd_762x43_AK

VTE_mosin38
VTE_5Rnd_mosin

VTE_mosin
VTE_5Rnd_mosin

VTE_mosina
VTE_5Rnd_mosin

VTE_svt40
VTE_10Rnd_svt

VTE_ppsh41
VTE_71Rnd_mp

VTE_pps43
VTE_35Rnd_mp

VTE_dp27
VTE_47Rnd_762x51_drum

VTE_rpd
VTE_100Rnd_RPD_drum

VTE_ppd40
VTE_25Rnd_762x25_PPD_Box
VTE_71Rnd_762x25_PPD_Drum

VTE_k50m
VTE_35Rnd_762x25

VTE_k98k
VTE_5Rnd_762x51_nato

VTE_l1a1
VTE_20Rnd_762x51_nato


--- LAUNCHERS
VTE_law
VTE_M72

VTE_90mmrecoiless
VTE_90mmrocket

VTE_rpg2
VTE_PG2

VTE_sa7launcher
VTE_sa7missile

VTE_rpg7
VTE_PG7V


--- RADIOS
VTE_prc25

VTE_typ63
*/
