#include <a_samp>
#include <a_actor>

#pragma tabsize 0 // para no tenes los famosos warnings "loose identation"

//constantes para los tipos de armas

#define WEAPON_TYPE_NONE        (0)
#define WEAPON_TYPE_HEAVY   (1)
#define WEAPON_TYPE_LIGHT   (2)
#define WEAPON_TYPE_MELEE   (3)

//variables para cada jugador
#define ARMEDBODY_USE_HEAVY_WEAPON               (false)
new HoldingWeapon[MAX_PLAYERS];


//como veran, puse todo en cualquier lado xD, pero igual funciona y no tenia ganas de poner bien los espacios
//soy muy desorganizado al scriptear xD
public OnPlayerUpdate(playerid){
	 new weaponid=GetPlayerWeapon(playerid);
				new hweapontype=GetWeaponType(HoldingWeapon[playerid]);
							new weapon, ammo;
				GetPlayerWeaponData(playerid, 6, weapon, ammo);
				if(weapon == 0 || ammo <= 0){
					GetPlayerWeaponData(playerid, 5, weapon, ammo);
					if(weapon == 0 || ammo <= 0){
						GetPlayerWeaponData(playerid, 3, weapon, ammo);
						if(weapon == 0 || ammo <= 0){
							GetPlayerWeaponData(playerid, 4, weapon, ammo);
							if(weapon == 0 || ammo <= 0){
								GetPlayerWeaponData(playerid, 2, weapon, ammo);
							}
						}
					}
				}
				HoldingWeapon[playerid] = weapon;
			

                
                   
                
                    new modelid=GetWeaponModel(HoldingWeapon[playerid]);
                    if(weaponid != HoldingWeapon[playerid] || GetPlayerWeapon(playerid) == 0 || GetPlayerWeapon(playerid) == 1)
                    {
                        //HoldingWeapon[playerid]=OldWeapon[playerid];
                        switch(hweapontype)
                        {
                            case WEAPON_TYPE_LIGHT:
                                                SetPlayerHoldingObject(playerid, modelid, 8,0.0,-0.1,0.15, -100.0, 0.0, 0.0);
                                               
                                        case WEAPON_TYPE_MELEE:
                                            SetPlayerHoldingObject(playerid, modelid, 7,0.0,0.0,-0.18, 100.0, 45.0, 0.0);
 
                                        case WEAPON_TYPE_HEAVY:
                                            SetPlayerHoldingObject(playerid, modelid, 1, 0.2,-0.125,-0.1,0.0,25.0,180.0);
                        }
                    } else {
						StopPlayerHoldingObject(playerid);
					}
}

//funcion para saber que tipo de arma es
//liviana(light), cuerpo a cuerpo(melee), pesada(heavy) o ninguna(none)
GetWeaponType(weaponid)
{
        switch(weaponid)
        {
            case 22,23,24,26,28,32:
                return WEAPON_TYPE_LIGHT;
 
                case 3,4,16,17,18,39,10,11,12,13,14,40,41:
                    return WEAPON_TYPE_MELEE;
 
                case 2,5,6,7,8,9,25,27,29,30,31,33,34,35,36,37,38:
                    return WEAPON_TYPE_HEAVY;
        }
        return WEAPON_TYPE_NONE;
}

//funcion para obtener el model de cada arma
stock GetWeaponModel(weaponid)
{
        switch(weaponid)
        {
            case 1:
                return 331;
 
                case 2..8:
                    return weaponid+331;
 
        case 9:
                    return 341;
 
                case 10..15:
                        return weaponid+311;
 
                case 16..18:
                    return weaponid+326;
 
                case 22..29:
                    return weaponid+324;
 
                case 30,31:
                    return weaponid+325;
 
                case 32:
                    return 372;
 
                case 33..45:
                    return weaponid+324;
 
                case 46:
                    return 371;
        }
        return 0;
}
