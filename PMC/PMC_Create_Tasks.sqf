
private
[
	"_markerobj",
	"_targetpoint",
	"_triggerArea",
	"_triggerTimeout",
	"_z"
];

// I dont think we need to do this?
//publicVariable "PMC_create_objectives";
//publicVariable "PMC_target1";
//publicVariable "PMC_target2";
//publicVariable "PMC_array";

//player sidechat "PMC_create_task waiting...";

// waits until server gives go ahead to create objective for client.
waitUntil
{
	PMC_create_objectives
};

// size of trigger area
_triggerArea = 50;
// timeout for trigger to activate
_triggerTimeout = 60;

// create tasks in reverse order :)

// objective 2

if (!PMC_target2) then
{
	_targetpoint = getPos (PMC_Objectives_Array select 1);

	_z = createTrigger ["EmptyDetector", _targetpoint];
// trigger setTriggerActivation [by, type, repeating]
	_z setTriggerActivation ["WEST SEIZED", "PRESENT", false];
	_z setTriggerArea [_triggerArea, _triggerArea, 0, true];
// trigger setTriggerTimeout [min, mid, max, interruptable]
	_z setTriggerTimeout [0, (_triggerTimeout/2), _triggerTimeout, false];
	_z setTriggerStatements ["this", "this = execVM ""PMC\PMC_Obj2.sqf"";", ""];

	_markerobj = createMarkerLocal ["pmc_target2", _targetpoint];
	_markerobj setMarkerShapeLocal "ELLIPSE";
	_markerobj setMarkerColorLocal "ColorRed";
	_markerobj setMarkerBrushLocal "Solid";
	_markerobj setMarkerSizeLocal [_triggerArea, _triggerArea];

	PMC_objective2 = player createSimpleTask ["Clear objective 2"];
	PMC_objective2 setSimpleTaskDescription ["Clear <marker name='pmc_target2'>objective 2</marker>","Clear objective 2","Clear objective 2"];
	PMC_objective2 setSimpleTaskDestination (getMarkerPos "pmc_target2");

	//player sidechat "PMC_target2 created sucessfully.";
}
// objective 2 has been completed!
else
{
	_targetpoint = getPos (PMC_Objectives_Array select 1);
	_markerobj = createMarkerLocal ["pmc_target2", _targetpoint];
	_markerobj setMarkerShapeLocal "dot";
	_markerobj setMarkerColorLocal "ColorGreen";

	PMC_objective2 = player createSimpleTask ["Clear objective 2"];
	PMC_objective2 setSimpleTaskDescription ["Clear <marker name='pmc_target2'>objective 2</marker>","Clear objective 2","Clear objective 2"];
	PMC_objective2 setSimpleTaskDestination (getMarkerPos "pmc_target2");
	PMC_objective2 setTaskState "succeeded";

	//player sidechat "PMC_target2 has been completed sucessfully, have a nice day.";
};


// objective 1

if (!PMC_target1) then
{
	_targetpoint = getPos (PMC_Objectives_Array select 0);

	_z = createTrigger ["EmptyDetector", _targetpoint];
	_z setTriggerActivation ["WEST SEIZED", "PRESENT", false];
	_z setTriggerArea [_triggerArea, _triggerArea, 0, true];
	_z setTriggerTimeout [0, (_triggerTimeout/2), _triggerTimeout, false];
	_z setTriggerStatements ["this", "this = execVM ""PMC\PMC_Obj1.sqf"";", ""];

	_markerobj = createMarkerLocal ["pmc_target1", _targetpoint];
	_markerobj setMarkerShapeLocal "ELLIPSE";
	_markerobj setMarkerColorLocal "ColorRed";
	_markerobj setMarkerBrushLocal "Solid";
	_markerobj setMarkerSizeLocal [_triggerArea, _triggerArea];

	PMC_objective1 = player createSimpleTask ["Clear objective 1"];
	PMC_objective1 setSimpleTaskDescription ["Clear <marker name='pmc_target1'>objective 1</marker>","Clear objective 1","Clear objective 1"];
	PMC_objective1 setSimpleTaskDestination (getMarkerPos "pmc_target1");
	player setCurrentTask PMC_objective1;

	//player sidechat "PMC_target1 created sucessfully.";
}
// objective 1 has been completed!
else
{
	_targetpoint = getPos (PMC_Objectives_Array select 0);
	_markerobj = createMarkerLocal ["pmc_target1", _targetpoint];
	_markerobj setMarkerShapeLocal "dot";
	_markerobj setMarkerColorLocal "ColorGreen";

	PMC_objective1 = player createSimpleTask ["Clear objective 1"];
	PMC_objective1 setSimpleTaskDescription ["Clear <marker name='pmc_target1'>objective 1</marker>","Clear objective 1","Clear objective 1"];
	PMC_objective1 setSimpleTaskDestination (getMarkerPos "pmc_target1");
	PMC_objective1 setTaskState "succeeded";

	//player sidechat "PMC_target1 has been completed sucessfully, have a nice day.";
};
