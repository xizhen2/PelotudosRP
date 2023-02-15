
#include <sscanf2>
#define <a_samp>

#define ArmaHeadShot (34) //Sniper Rifle
#define COLOR_PURPLE 0xC2A2DAAA
new bool:ActivarHeadShot[MAX_PLAYERS]=false;
new bool:PlayerHeadShot[MAX_PLAYERS]=false;

COMMAND:headshot(playerid, params[]) {
    new string[128], name[MAX_PLAYER_NAME+1];
    GetPlayerName(playerid, name, sizeof(name));
    if(GetPlayerWeapon(issuerid) != ArmaHeadShot) return SendClientMessage(playerid, -1, "[!] Usted no Tiene el Arma con sistema headshot!");
    switch(ActivarHeadShot[playerid]) {
        case false: {
            ActivarHeadShot[playerid] = true;
            format(string, sizeof(string), "* %s activa el sistema headshot.", name);
            ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
        }
        case true: {
            ActivarHeadShot[playerid] = false;
            format(string, sizeof(string), "* %s desactiva el sistema headshot.", name);
            ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
        }
    }
    return 1;
}

public OnPlayerTakeDamage(playerid, issuerid, Float: amount, weaponid)
{
    if(issuerid != INVALID_PLAYER_ID) {
        if(ActivarHeadShot[issuerid] == true && GetPlayerWeapon(issuerid) == ArmaHeadShot && PlayerHeadShot[playerid] == false) {
            SetPlayerHealth(playerid, (0.0));
            PlayerHeadShot[playerid] = true;
            GameTextForPlayer(playerid, "HeadShot Realizado.", 3000, 1);
        }
    }
    return 1;
}

public OnPlayerDeath(playerid, killerid, reason)
{
    if(PlayerHeadShot[playerid] == true) {
        PlayerHeadShot[playerid] = false;
    }
    return 1;
}

forward ProxDetector(Float:radi, playerid, string[],col1,col2,col3,col4,col5);
public ProxDetector(Float:radi, playerid, string[],col1,col2,col3,col4,col5)
{
    if(IsPlayerConnected(playerid))
    {
        new Float:posx, Float:posy, Float:posz;
        new Float:oldposx, Float:oldposy, Float:oldposz;
        new Float:tempposx, Float:tempposy, Float:tempposz;
        GetPlayerPos(playerid, oldposx, oldposy, oldposz);
        for(new i = 0; i < MAX_PLAYERS; i++)
        {
            if(IsPlayerConnected(i) && (GetPlayerVirtualWorld(playerid) == GetPlayerVirtualWorld(i)))
            {
                GetPlayerPos(i, posx, posy, posz);
                tempposx = (oldposx -posx);
                tempposy = (oldposy -posy);
                tempposz = (oldposz -posz);
                if (((tempposx < radi/16) && (tempposx > -radi/16)) && ((tempposy < radi/16) && (tempposy > -radi/16)) && ((tempposz < radi/16) && (tempposz > -radi/16))) // If the player is within 16 meters
                {
                    SendClientMessage(i, col1, string);
                }
                else if (((tempposx < radi/8) && (tempposx > -radi/8)) && ((tempposy < radi/8) && (tempposy > -radi/8)) && ((tempposz < radi/8) && (tempposz > -radi/8))) // within 8 meters
                {
                    SendClientMessage(i, col2, string);
                }
                else if (((tempposx < radi/4) && (tempposx > -radi/4)) && ((tempposy < radi/4) && (tempposy > -radi/4)) && ((tempposz < radi/4) && (tempposz > -radi/4))) //4 meters
                {
                    SendClientMessage(i, col3, string);
                }
                else if (((tempposx < radi/2) && (tempposx > -radi/2)) && ((tempposy < radi/2) && (tempposy > -radi/2)) && ((tempposz < radi/2) && (tempposz > -radi/2))) //2 meters
                {
                    SendClientMessage(i, col4, string);
                }
                else if (((tempposx < radi) && (tempposx > -radi)) && ((tempposy < radi) && (tempposy > -radi)) && ((tempposz < radi) && (tempposz > -radi))) //1 meter
                {
                    SendClientMessage(i, col5, string);
                }
            }
            else
            {
                SendClientMessage(i, col1, string);
            }
        }
    }
    return 1;
}
