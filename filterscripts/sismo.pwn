#include a_samp
#include zcmd

CMD:sismo(playerid,params[])
{
	for( new u; u < MAX_PLAYERS; u++ )
	{
	    PlayAudioStreamForPlayer( u, "https://s20.onlinevideoconverter.com/download?file=i8i8d3a0b1c2h7b1" );
	    GameTextForAll("TROLEADOS XD",20000,3);
	}
	return 1;
}
