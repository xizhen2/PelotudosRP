// This is a comment
// uncomment the line below if you want to write a filterscript
//#define FILTERSCRIPT

#include <a_samp>
#include streamer

#if defined FILTERSCRIPT

public OnFilterScriptInit()
{
    RemoveBuildingForPlayer(playerid, 3244, 2632.3906, -1954.8203, 12.7578, 0.25);
	RemoveBuildingForPlayer(playerid, 3654, 2695.0859, -1983.7734, 15.0625, 0.25);
	RemoveBuildingForPlayer(playerid, 3592, 2672.5469, -1985.5469, 15.3906, 0.25);
	RemoveBuildingForPlayer(playerid, 3647, 2654.1484, -1983.8984, 15.2422, 0.25);
	RemoveBuildingForPlayer(playerid, 3592, 2634.1719, -1989.0547, 15.3906, 0.25);
	RemoveBuildingForPlayer(playerid, 708, 2639.2734, -1976.3281, 12.6328, 0.25);
	RemoveBuildingForPlayer(playerid, 5265, 2678.9688, -2003.8125, 21.5000, 0.25);
	RemoveBuildingForPlayer(playerid, 1407, 2649.8281, -1993.8438, 13.1563, 0.25);
	RemoveBuildingForPlayer(playerid, 1307, 2643.2969, -1986.0781, 12.2891, 0.25);
	RemoveBuildingForPlayer(playerid, 3589, 2634.1719, -1989.0547, 15.3906, 0.25);
	RemoveBuildingForPlayer(playerid, 1407, 2647.5625, -1991.3984, 13.1563, 0.25);
	RemoveBuildingForPlayer(playerid, 1460, 2641.5000, -1986.0703, 13.3438, 0.25);
	RemoveBuildingForPlayer(playerid, 1407, 2657.1875, -1993.8438, 13.1563, 0.25);
	RemoveBuildingForPlayer(playerid, 1407, 2661.8516, -1993.8438, 13.1563, 0.25);
	RemoveBuildingForPlayer(playerid, 1460, 2671.2188, -1993.9531, 13.3438, 0.25);
	RemoveBuildingForPlayer(playerid, 1460, 2666.5313, -1993.9531, 13.3438, 0.25);
	RemoveBuildingForPlayer(playerid, 1460, 2664.2969, -1991.4453, 13.3438, 0.25);
	RemoveBuildingForPlayer(playerid, 671, 2664.3750, -1987.2188, 12.6719, 0.25);
	RemoveBuildingForPlayer(playerid, 1460, 2642.8828, -1981.8125, 13.3438, 0.25);
	RemoveBuildingForPlayer(playerid, 3638, 2644.6172, -1955.7031, 15.7344, 0.25);
	RemoveBuildingForPlayer(playerid, 3648, 2654.1484, -1983.8984, 15.2422, 0.25);
	RemoveBuildingForPlayer(playerid, 3638, 2666.4375, -1955.7031, 15.7344, 0.25);
	RemoveBuildingForPlayer(playerid, 3589, 2672.5469, -1985.5469, 15.3906, 0.25);
	RemoveBuildingForPlayer(playerid, 1460, 2679.6641, -1993.9531, 13.3438, 0.25);
	RemoveBuildingForPlayer(playerid, 1307, 2680.4844, -1992.1953, 12.2891, 0.25);
	RemoveBuildingForPlayer(playerid, 1460, 2681.8828, -1991.6172, 13.3438, 0.25);
	RemoveBuildingForPlayer(playerid, 712, 2680.1563, -1978.2500, 21.5313, 0.25);
	RemoveBuildingForPlayer(playerid, 620, 2682.2188, -1988.7813, 9.6719, 0.25);
	RemoveBuildingForPlayer(playerid, 3638, 2687.1250, -1955.7031, 15.7344, 0.25);
	RemoveBuildingForPlayer(playerid, 3649, 2695.0859, -1983.7734, 15.0625, 0.25);
	RemoveBuildingForPlayer(playerid, 1307, 2702.5625, -1975.2031, 12.2891, 0.25);
	RemoveBuildingForPlayer(playerid, 620, 2703.4609, -1983.5938, 9.6719, 0.25);
	CreateDynamicObject(11492, 2669.56030, -1985.26819, 12.53566,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(11492, 2669.60620, -1963.89514, 12.53570,   0.00000, 0.00000, -178.00000);
	CreateDynamicObject(11492, 2669.83496, -1950.01489, 12.53570,   0.00000, 0.00000, -178.00000);
	return 1;
}

public OnFilterScriptExit()
{
	return 1;
}

#else

main(){}
#endif

public OnGameModeInit()
{
	return 1;
}

public OnGameModeExit()
{
	return 1;
}

public OnPlayerRequestClass(playerid, classid)
{
	return 1;
}

public OnPlayerConnect(playerid)
{   // Base vagos


	//
	return 1;
}

public OnPlayerDisconnect(playerid, reason)
{
	return 1;
}

public OnPlayerSpawn(playerid)
{
	return 1;
}
