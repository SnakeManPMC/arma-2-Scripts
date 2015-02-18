
/*

	loops VTE_music.sqf every 4 minutes

*/

[] execVM "PMC\PMC_VTE_Music.sqf";

while {true} do
{
	sleep 240;
	[] execVM "PMC\PMC_VTE_Music.sqf";
};
