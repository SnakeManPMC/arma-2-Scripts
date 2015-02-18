/*
	VTE Random music player
*/

private
[
	"_m",
	"_ran",
	"_VTE_Tracks"
];

// all VTE tracks
_VTE_Tracks =
[
	"VTE_badmoon",
	"VTE_bird",
	"VTE_bornwild",
	"VTE_caldreaming",
	"VTE_caligirls",
	"VTE_crosstown",
	"VTE_evedestruction",
	"VTE_fortunateson",
	"VTE_foxeylady",
	"VTE_goodlovin",
	"VTE_gottagetout",
	"VTE_greenriver",
	"VTE_hellovietnam",
	"VTE_heyjoe",
	"VTE_houserisingsun",
	"VTE_kemppainen",
	"VTE_ontheroad",
	"VTE_paintitblack",
	"VTE_purplehaze",
	"VTE_runthroughjungle",
	"VTE_satisfaction",
	"VTE_sitdockbay",
	"VTE_theend",
	"VTE_theseboots",
	"VTE_toldnation",
	"VTE_trackmytears",
	"VTE_wagner",
	"VTE_whatsound",
	"VTE_whiterabbit",
	"VTE_whitershade",
	"VTE_whodoyoulove",
	"VTE_wildthing",
	"VTE_wipeout",
	"VTE_wooly"
];

_ran = (floor random (count _VTE_Tracks));
_m = (_VTE_Tracks select _ran);

playMusic [_m, 0];
