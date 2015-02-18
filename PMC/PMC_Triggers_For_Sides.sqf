/*

	Creates triggers for east and west covering whole map.
	
	WARNING: if terrain has faulty class centerPosition[] = { 51200, 51200 }; setting,
	this will not work properly. Check the terrain config to make sure.

*/
private
[
	"_targetpoint",
	"_triggerArea"
];

// center of the map
_targetpoint = getArray (configFile >> "CfgWorlds" >> worldName >> "centerPosition");
_triggerArea = (_targetpoint select 0) * 2;

// BLUFOR
pmc_blufor_list = createTrigger ["EmptyDetector", _targetpoint];
pmc_blufor_list setTriggerActivation ["WEST", "PRESENT", true];
pmc_blufor_list setTriggerArea [_triggerArea, _triggerArea, 0, true];
pmc_blufor_list setTriggerTimeout [0, 0, 0, false];
pmc_blufor_list setTriggerStatements ["this", "", ""];

// OPFOR
pmc_opfor_list = createTrigger ["EmptyDetector", _targetpoint];
pmc_opfor_list setTriggerActivation ["EAST", "PRESENT", true];
pmc_opfor_list setTriggerArea [_triggerArea, _triggerArea, 0, true];
pmc_opfor_list setTriggerTimeout [0, 0, 0, false];
pmc_opfor_list setTriggerStatements ["this", "", ""];

// Anybody, DEBUG!
pmc_list = createTrigger ["EmptyDetector", _targetpoint];
pmc_list setTriggerActivation ["ANY", "PRESENT", true];
pmc_list setTriggerArea [_triggerArea, _triggerArea, 0, true];
pmc_list setTriggerTimeout [0, 0, 0, false];
pmc_list setTriggerStatements ["this", "", ""];
