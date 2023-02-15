#include <a_samp>
//#include "../include/gl_common.inc"

#define GATES_CLOSED  	0
#define GATES_CLOSING  	1
#define GATES_OPEN    	2
#define GATES_OPENING   3

new LSPrisonWallsObject;
new LSPrisonGatesObject[4];
new Text3D:LabelGates[2];
new EasternGatesStatus = GATES_CLOSED;
new SouthernGatesStatus = GATES_CLOSED;

public OnFilterScriptInit()
{
    LSPrisonWallsObject = CreateObject(19794, 1787.13, -1565.68, 11.9688, 0, 0, 0);
    LSPrisonGatesObject[0] = CreateObject(19795, 1824.318481, -1534.731201, 14.296878 - 0.01, 0, 0, 343.0);
    LSPrisonGatesObject[1] = CreateObject(19795, 1822.407592, -1540.949951, 14.296878 - 0.01, 0, 0, 163.0);
    LSPrisonGatesObject[2] = CreateObject(19796, 1752.004150, -1591.186523, 14.267195 - 0.01, 0, 0, 77.0);
    LSPrisonGatesObject[3] = CreateObject(19796, 1756.914062, -1592.316284, 14.267195 - 0.01, 0, 0, 257.0);

    LabelGates[0] = Create3DTextLabel("{FFFFFF}Toque el {00CCFF}claxón{FFFFFF} para pasar.", 0xFFFFFFAA, 1823.78, -1537.98, 13.54, 10.5, 0, 1);
    LabelGates[1] = Create3DTextLabel("{FFFFFF}Toque el {00CCFF}claxón{FFFFFF} para pasar.", 0xFFFFFFAA, 1754.27, -1592.18, 13.54, 10.5, 0, 1);

    for (new i = 0; i < MAX_PLAYERS; i++)
    {
        if (IsPlayerConnected(i) && !IsPlayerNPC(i))
        {
			RemoveBuildingForPlayer(i, 4000, 1787.13, -1565.68, 11.9688, 250.0); // Walls
			RemoveBuildingForPlayer(i, 4080, 1787.13, -1565.68, 11.9688, 250.0); // LOD
        }
    }
	return 1;
}

public OnFilterScriptExit()
{
	if (IsValidObject(LSPrisonWallsObject))
	{
		DestroyObject(LSPrisonWallsObject);
    }

	if (IsValidObject(LSPrisonGatesObject[0]))
	{
		DestroyObject(LSPrisonGatesObject[0]);
    }

	if (IsValidObject(LSPrisonGatesObject[1]))
	{
		DestroyObject(LSPrisonGatesObject[1]);
    }

	if (IsValidObject(LSPrisonGatesObject[2]))
	{
		DestroyObject(LSPrisonGatesObject[2]);
    }

	if (IsValidObject(LSPrisonGatesObject[3]))
	{
		DestroyObject(LSPrisonGatesObject[3]);
    }

    Delete3DTextLabel(LabelGates[0]);
    Delete3DTextLabel(LabelGates[1]);
	return 1;
}

public OnPlayerConnect(playerid)
{
	RemoveBuildingForPlayer(playerid, 4000, 1787.13, -1565.68, 11.9688, 250.0); // Walls
	RemoveBuildingForPlayer(playerid, 4080, 1787.13, -1565.68, 11.9688, 250.0); // LOD
	return 1;
}

public OnObjectMoved(objectid)
{
	if (objectid == LSPrisonGatesObject[0])
	{
	    if (EasternGatesStatus == GATES_CLOSING)
	    {
		    EasternGatesStatus = GATES_CLOSED;
	    }
	    else
	    {
		    EasternGatesStatus = GATES_OPEN;
	    }
	}
	else if (objectid == LSPrisonGatesObject[2])
	{
	    if (SouthernGatesStatus == GATES_CLOSING)
	    {
		    SouthernGatesStatus = GATES_CLOSED;
	    }
	    else
	    {
		    SouthernGatesStatus = GATES_OPEN;
	    }
	}

	// Exit here
	return 1;
}

public OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
	if (newkeys & KEY_CROUCH)
	{
	    if (IsPlayerInRangeOfPoint(playerid, 10.0, 1823.78, -1537.98, 13.54))
	    {
	        if (EasternGatesStatus == GATES_OPENING)
	        {
	            return 1;
	        }
	        else if (EasternGatesStatus == GATES_CLOSING)
	        {
	            return 1;
	        }

	        //PlaySoundForPlayersInRange(1035, 50.0, 1823.78, -1537.98, 13.54);

	        if (EasternGatesStatus == GATES_CLOSED)
	        {
		    	MoveObject(LSPrisonGatesObject[0], 1824.318481, -1534.731201, 14.296878 + 0.01, 0.008, 0, 0, 258);
		    	MoveObject(LSPrisonGatesObject[1], 1822.407592, -1540.949951, 14.296878 + 0.01, 0.008, 0, 0, 253);
		    	EasternGatesStatus = GATES_OPENING;
	    	}
	    	else
	    	{
		    	MoveObject(LSPrisonGatesObject[0], 1824.318481, -1534.731201, 14.296878 - 0.01, 0.008, 0, 0, 343);
		    	MoveObject(LSPrisonGatesObject[1], 1822.407592, -1540.949951, 14.296878 - 0.01, 0.008, 0, 0, 163);
		    	EasternGatesStatus = GATES_CLOSING;
	    	}
	    }
	    else if (IsPlayerInRangeOfPoint(playerid, 10.0, 1754.27, -1592.18, 13.54))
	    {
	        if (SouthernGatesStatus == GATES_OPENING)
	        {
	            return 1;
	        }
	        else if (SouthernGatesStatus == GATES_CLOSING)
	        {
	            return 1;
	        }
	        //PlaySoundForPlayersInRange(1035, 50.0, 1754.27, -1592.18, 13.54);
	        if (SouthernGatesStatus == GATES_CLOSED)
	        {
		    	MoveObject(LSPrisonGatesObject[2], 1752.004150, -1591.186523, 14.267195 + 0.01, 0.008, 0, 0, 172);
		    	MoveObject(LSPrisonGatesObject[3], 1756.914062, -1592.316284, 14.267195 + 0.01, 0.008, 0, 0, 187);
		    	SouthernGatesStatus = GATES_OPENING;
	    	}
	    	else
	    	{
		    	MoveObject(LSPrisonGatesObject[2], 1752.004150, -1591.186523, 14.267195 - 0.01, 0.008, 0, 0, 77);
		    	MoveObject(LSPrisonGatesObject[3], 1756.914062, -1592.316284, 14.267195 - 0.01, 0.008, 0, 0, 257);
		    	SouthernGatesStatus = GATES_CLOSING;
	    	}
	    }
	}
	return 1;
}
