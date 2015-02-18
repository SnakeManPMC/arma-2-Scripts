/*
	Random music player
*/

private ["_ArmA_QG_Tracks","_m","_ran"];

// all ArmA + Queens Gambit tracks
_ArmA_QG_Tracks =
[
	"ATrack1",
	"ATrack2",
	"ATrack3",
	"ATrack4",
	"ATrack5",
	"ATrack6",
	"ATrack7",
	"ATrack8",
	"ATrack9",
	"ATrack10",
	"ATrack11",
	"ATrack12",
	"ATrack13",
	"ATrack14",
	"ATrack15",
	"ATrack16",
	"ATrack17",
	"ATrack18",
	"ATrack19",
	"ATrack20",
	"ATrack21",
	"ATrack22",
	"ATrack23",
	"ATrack23b",
	"ATrack24",
	"ATrack25",
	"ATrack26",
	"ATrack27",
	"QGTrack1",
	"QGTrack2",
	"QGTrack3",
	"QGTrack4",
	"QGTrack5",
	"QGTrack6",
	"QGTrack7",
	"QGTrack8",
	"QGTrack9",
	"WithCare_Smile",
	"WithCare_Suicide",
	"WithCare_War",
	"WithCare_What"
];

_ran = (round random (count _ArmA_QG_Tracks));
_m = (_ArmA_QG_Tracks select _ran);

playMusic [_m, 0];

/*
$STOP$ 	 Silence 	 ?
ATrack6 	01 Street Combat 	?
ATrack25 	02 Flashpoint Rearmed 	?
ATrack1 	03 Primo In Mortis 	?
ATrack18 	04 Arma Magna 	?
ATrack3 	05 Dogs Of War 	?
ATrack24 	06 Black Ops 	?
ATrack4 	07 Seventh Company 	?
ATrack5 	08 Field Track 	?
ATrack27 	09 Team Bravo 	?
ATrack7 	10 Arma Vera 	?
ATrack23 	11 Second Assault 	?
ATrack8 	12 Paradise On Earth 	?
ATrack2 	13 Team Alpha 	?
ATrack23b 	14 First Assault 	?
ATrack9 	Crescendo 1 	?
ATrack10 	Crescendo 2 	?
ATrack11 	Short: Sahrani 1 	?
ATrack12 	Short: Sahrani 2 	?
ATrack13 	Short: Sahrani 3 	?
ATrack14 	Short: Combat 	?
ATrack15 	Short: Riff 	?
ATrack16 	Short: Bells 	?
ATrack17 	Short: Casualties Of War 	?
ATrack22 	Short: Street Combat 	?
ATrack19 	Short: Arma Magna Rock 1 	?
ATrack20 	Short: Arma Magna Rock 2 	?
ATrack21 	Short: Arma Magna 	?
ATrack26 	Semper Fidelis 	?
QGTrack1 	Mission 02 	?
QGTrack2 	Mission 02 - outro 	?
QGTrack3 	Mission 03 	?
QGTrack4 	Mission 03 - outro (lagr) 	?
QGTrack5 	Mission 04 	?
QGTrack6 	Mission 04 - outro 	?
QGTrack7 	Mission 05 	?
QGTrack8 	Mission 05 - outro 	?
QGTrack9 	Mission 06 	?
WithCare_Smile 	WithCare - I Will Smile 	?
WithCare_Suicide 	WithCare - Suicide Song 	?
WithCare_War 	WithCare - War 	?
WithCare_What 	WithCare - What 	? 
*/
