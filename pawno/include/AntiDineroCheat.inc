new OyuncununSilahlari[MAX_PLAYERS][12];

stock HileciyiYasakla(playerid, aldigisilah)
{
	new silahismi[64];
	new string[256];
	new isim[MAX_PLAYER_NAME];
	GetPlayerName(playerid, isim, sizeof(isim));
	GetWeaponName(aldigisilah, silahismi, sizeof(silahismi));
	format(string, sizeof(string), "? El jugador %s fue expulsado. Raz?n: Cheat de armas",isim, silahismi);
	SendClientMessageToAll(0xa22430FF, string);
	Kick(playerid);
	return 1;
}

stock OyuncuSilahDegistirdi(playerid, eskisilah, yenisilah)
{
    #pragma unused eskisilah
	if(OyuncununSilahlari[playerid][0] != 1 && GetPlayerWeapon(playerid) == 1)
	{
	    HileciyiYasakla(playerid,yenisilah);
	}
	if(OyuncununSilahlari[playerid][1] != 2 && GetPlayerWeapon(playerid) == 2)
	{
	    HileciyiYasakla(playerid,yenisilah);
	}
	if(OyuncununSilahlari[playerid][1] != 3 && GetPlayerWeapon(playerid) == 3)
	{
	    HileciyiYasakla(playerid,yenisilah);
	}
	if(OyuncununSilahlari[playerid][1] != 4 && GetPlayerWeapon(playerid) == 4)
	{
	    HileciyiYasakla(playerid,yenisilah);
	}
	if(OyuncununSilahlari[playerid][1] != 5 && GetPlayerWeapon(playerid) == 5)
	{
	    HileciyiYasakla(playerid,yenisilah);
	}
	if(OyuncununSilahlari[playerid][1] != 6 && GetPlayerWeapon(playerid) == 6)
	{
	    HileciyiYasakla(playerid,yenisilah);
	}
	if(OyuncununSilahlari[playerid][1] != 7 && GetPlayerWeapon(playerid) == 7)
	{
	    HileciyiYasakla(playerid,yenisilah);
	}
	if(OyuncununSilahlari[playerid][1] != 8 && GetPlayerWeapon(playerid) == 8)
	{
	    HileciyiYasakla(playerid,yenisilah);
	}
	if(OyuncununSilahlari[playerid][1] != 9 && GetPlayerWeapon(playerid) == 9)
	{
	    HileciyiYasakla(playerid,yenisilah);
	}
	if(OyuncununSilahlari[playerid][10] != 10 && GetPlayerWeapon(playerid) == 10)
	{
	    HileciyiYasakla(playerid,yenisilah);
	}
	if(OyuncununSilahlari[playerid][10] != 11 && GetPlayerWeapon(playerid) == 11)
	{
	    HileciyiYasakla(playerid,yenisilah);
	}
	if(OyuncununSilahlari[playerid][10] != 12 && GetPlayerWeapon(playerid) == 12)
	{
	    HileciyiYasakla(playerid,yenisilah);
	}
	if(OyuncununSilahlari[playerid][10] != 13 && GetPlayerWeapon(playerid) == 13)
	{
	    HileciyiYasakla(playerid,yenisilah);
	}
	if(OyuncununSilahlari[playerid][10] != 14 && GetPlayerWeapon(playerid) == 14)
	{
	    HileciyiYasakla(playerid,yenisilah);
	}
	if(OyuncununSilahlari[playerid][10] != 15 && GetPlayerWeapon(playerid) == 15)
	{
	    HileciyiYasakla(playerid,yenisilah);
	}
	if(OyuncununSilahlari[playerid][8] != 16 && GetPlayerWeapon(playerid) == 16)
	{
	    HileciyiYasakla(playerid,yenisilah);
	}
	if(OyuncununSilahlari[playerid][8] != 17 && GetPlayerWeapon(playerid) == 17)
	{
	    HileciyiYasakla(playerid,yenisilah);
	}
	if(OyuncununSilahlari[playerid][8] != 18 && GetPlayerWeapon(playerid) == 18)
	{
	    HileciyiYasakla(playerid,yenisilah);
	}
	if(OyuncununSilahlari[playerid][2] != 22 && GetPlayerWeapon(playerid) == 22)
	{
	    HileciyiYasakla(playerid,yenisilah);
	}
	if(OyuncununSilahlari[playerid][2] != 23 && GetPlayerWeapon(playerid) == 23)
	{
	    HileciyiYasakla(playerid,yenisilah);
	}
	if(OyuncununSilahlari[playerid][2] != 24 && GetPlayerWeapon(playerid) == 24)
	{
	    HileciyiYasakla(playerid,yenisilah);
	}
	if(OyuncununSilahlari[playerid][3] != 25 && GetPlayerWeapon(playerid) == 25)
	{
	    HileciyiYasakla(playerid,yenisilah);
	}
	if(OyuncununSilahlari[playerid][3] != 26 && GetPlayerWeapon(playerid) == 26)
	{
	    HileciyiYasakla(playerid,yenisilah);
	}
	if(OyuncununSilahlari[playerid][3] != 27 && GetPlayerWeapon(playerid) == 27)
	{
	    HileciyiYasakla(playerid,yenisilah);
	}
	if(OyuncununSilahlari[playerid][4] != 28 && GetPlayerWeapon(playerid) == 28)
	{
	    HileciyiYasakla(playerid,yenisilah);
	}
	if(OyuncununSilahlari[playerid][4] != 29 && GetPlayerWeapon(playerid) == 29)
	{
	    HileciyiYasakla(playerid,yenisilah);
	}
	if(OyuncununSilahlari[playerid][5] != 30 && GetPlayerWeapon(playerid) == 30)
	{
	    HileciyiYasakla(playerid,yenisilah);
	}
	if(OyuncununSilahlari[playerid][5] != 31 && GetPlayerWeapon(playerid) == 31)
	{
	    HileciyiYasakla(playerid,yenisilah);
	}
	if(OyuncununSilahlari[playerid][4] != 32 && GetPlayerWeapon(playerid) == 32)
	{
	    HileciyiYasakla(playerid,yenisilah);
	}
	if(OyuncununSilahlari[playerid][6] != 33 && GetPlayerWeapon(playerid) == 33)
	{
	    HileciyiYasakla(playerid,yenisilah);
	}
	if(OyuncununSilahlari[playerid][6] != 34 && GetPlayerWeapon(playerid) == 34)
	{
	    HileciyiYasakla(playerid,yenisilah);
	}
	if(OyuncununSilahlari[playerid][7] != 35 && GetPlayerWeapon(playerid) == 35)
	{
	    HileciyiYasakla(playerid,yenisilah);
	}
	if(OyuncununSilahlari[playerid][7] != 36 && GetPlayerWeapon(playerid) == 36)
	{
	    HileciyiYasakla(playerid,yenisilah);
	}
	if(OyuncununSilahlari[playerid][7] != 37 && GetPlayerWeapon(playerid) == 37)
	{
	    HileciyiYasakla(playerid,yenisilah);
	}
	if(OyuncununSilahlari[playerid][7] != 38 && GetPlayerWeapon(playerid) == 38)
	{
	    HileciyiYasakla(playerid,yenisilah);
	}
	if(OyuncununSilahlari[playerid][8] != 39 && GetPlayerWeapon(playerid) == 39)
	{
	    HileciyiYasakla(playerid,yenisilah);
	}
	if(OyuncununSilahlari[playerid][9] != 41 && GetPlayerWeapon(playerid) == 41)
	{
	    HileciyiYasakla(playerid,yenisilah);
	}
	if(OyuncununSilahlari[playerid][9] != 42 && GetPlayerWeapon(playerid) == 42)
	{
	    HileciyiYasakla(playerid,yenisilah);
	}
	if(OyuncununSilahlari[playerid][9] != 43 && GetPlayerWeapon(playerid) == 43)
	{
	    HileciyiYasakla(playerid,yenisilah);
	}
	if(OyuncununSilahlari[playerid][11] != 44 && GetPlayerWeapon(playerid) == 44)
	{
	    HileciyiYasakla(playerid,yenisilah);
	}
	if(OyuncununSilahlari[playerid][11] != 45 && GetPlayerWeapon(playerid) == 45)
	{
	    HileciyiYasakla(playerid,yenisilah);
	}
	return 1;
}

public OnPlayerUpdate(playerid)
{
	new gecerlisilah = GetPlayerWeapon(playerid);
	if(gecerlisilah != GetPVarInt(playerid, "OyuncuGecerliSilah"))
	{
		OyuncuSilahDegistirdi(playerid, GetPVarInt(playerid, "OyuncuGecerliSilah"), gecerlisilah);
 		SetPVarInt(playerid, "OyuncuGecerliSilah", gecerlisilah);
	}
    return CallLocalFunction( "AntiCheat_OnPlayerUpdate", "i", playerid );
}

#if defined _ALS_OnPlayerUpdate
    #undef OnPlayerUpdate
#else
    #define _ALS_OnPlayerUpdate
#endif
#define OnPlayerUpdate AntiCheat_OnPlayerUpdate
forward AntiCheat_OnPlayerUpdate( playerid );
