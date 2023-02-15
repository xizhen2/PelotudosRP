/*
GM base by KRISSTI4N
Contiene:
-Registro
-Ingreso
-Guardado automatico de informacion
-Cargado automatico de informacion
*/

//Includes
#include <a_samp>
#include <a_mysql>
#include <streamer>
#include <sscanf2>
#include <zcmd>

//Configuracion
#define SQL_HOST ""
#define SQL_USUARIO ""
#define SQL_CONTRA ""
#define SQL_DB ""
//Colores
#define VERDECLARO 0x00FF00FF
//Atajos
#define SCM SendClientMessage
#define SPP SetPlayerPos
//Dialogos
#define DIALOG_REGISTRO   0
#define DIALOG_GENERO     1
#define DIALOG_EDAD       2
#define DIALOG_INGRESO    3
//news
new MySQL;
//Enum
enum jInfo
{
Contra[128],
Genero,
Edad,
Ropa,
Float:X,
Float:Y,
Float:Z,
Float:Vida,
Float:Chaleco,
Muertes,
Asesinatos,
Faccion,
Rango,
Trabajo,
Dinero,
Int,
VW,
Nivel
}
new Jugador[MAX_PLAYERS][jInfo];
//Forward
forward VerificarUsuario(playerid);
forward CrearCuenta(playerid);
forward IngresoJugador(playerid);
forward IngresarJugador(playerid);
forward GuardarJugador(playerid);
//
main()
{
print("GM base creada por KRISSTI4N - 2015");
}


public OnGameModeInit()
{
	SetGameModeText("Roleplay");
	MySQL = mysql_connect(SQL_HOST,SQL_USUARIO,SQL_DB,SQL_CONTRA);
	print("Conectando...");
	if(mysql_errno() != 0)
	{
	print("No se pudo conectar.");
	}
	else
	{
	print("Conectado.");
	}
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
{
   new query[520],nombre[MAX_PLAYER_NAME];
   GetPlayerName(playerid, nombre, sizeof(nombre));
   mysql_format(MySQL, query, sizeof(query), "SELECT * FROM `cuentas` WHERE `Nombre`='%s'", nombre);
   mysql_pquery(MySQL, query, "VerificarUsuario","d", playerid);
   return 1;
}

public OnPlayerDisconnect(playerid, reason)
{
    GuardarJugador(playerid);
	return 1;
}

public OnPlayerSpawn(playerid)
{
	if(GetPVarInt(playerid, "PuedeIngresar") == 0)
	{
	Kick(playerid);
	}
	return 1;
}

public OnPlayerDeath(playerid, killerid, reason)
{
	Jugador[playerid][Muertes]++;
	Jugador[killerid][Asesinatos]++;
	return 1;
}

public OnVehicleSpawn(vehicleid)
{
	return 1;
}

public OnVehicleDeath(vehicleid, killerid)
{
	return 1;
}

public OnPlayerText(playerid, text[])
{
	return 1;
}

public OnPlayerEnterVehicle(playerid, vehicleid, ispassenger)
{
	return 1;
}

public OnPlayerExitVehicle(playerid, vehicleid)
{
	return 1;
}

public OnPlayerStateChange(playerid, newstate, oldstate)
{
	return 1;
}

public OnPlayerEnterCheckpoint(playerid)
{
	return 1;
}

public OnPlayerLeaveCheckpoint(playerid)
{
	return 1;
}

public OnPlayerEnterRaceCheckpoint(playerid)
{
	return 1;
}

public OnPlayerLeaveRaceCheckpoint(playerid)
{
	return 1;
}

public OnRconCommand(cmd[])
{
	return 1;
}

public OnPlayerRequestSpawn(playerid)
{
	return 1;
}

public OnObjectMoved(objectid)
{
	return 1;
}

public OnPlayerObjectMoved(playerid, objectid)
{
	return 1;
}

public OnPlayerPickUpPickup(playerid, pickupid)
{
	return 1;
}

public OnVehicleMod(playerid, vehicleid, componentid)
{
	return 1;
}

public OnVehiclePaintjob(playerid, vehicleid, paintjobid)
{
	return 1;
}

public OnVehicleRespray(playerid, vehicleid, color1, color2)
{
	return 1;
}

public OnPlayerSelectedMenuRow(playerid, row)
{
	return 1;
}

public OnPlayerExitedMenu(playerid)
{
	return 1;
}

public OnPlayerInteriorChange(playerid, newinteriorid, oldinteriorid)
{
	return 1;
}

public OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
	return 1;
}

public OnRconLoginAttempt(ip[], password[], success)
{
	return 1;
}

public OnPlayerUpdate(playerid)
{
	return 1;
}

public OnPlayerStreamIn(playerid, forplayerid)
{
	return 1;
}

public OnPlayerStreamOut(playerid, forplayerid)
{
	return 1;
}

public OnVehicleStreamIn(vehicleid, forplayerid)
{
	return 1;
}

public OnVehicleStreamOut(vehicleid, forplayerid)
{
	return 1;
}

public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	switch(dialogid)
	{
	//
	case DIALOG_REGISTRO:
	{
        if(response)
		{
		new contra[128];
		SCM(playerid, VERDECLARO, "¡Bien!{ffffff} Continuemos con el registro.");
		ShowPlayerDialog(playerid, DIALOG_GENERO, DIALOG_STYLE_MSGBOX, "Genero", "Seleccione su genero.", "Masculino", "Femenino");
		format(contra,sizeof(contra),"%s",inputtext);
		Jugador[playerid][Contra] = contra;
		}
		else
		{
		Kick(playerid);
		}
    }
    //
	case DIALOG_GENERO:
	{
		if(response)
		{
		Jugador[playerid][Genero] = 0;
		Jugador[playerid][Ropa] = 46;
		SCM(playerid,-1,"Has seleccionado {FFFF00}masculino{FFFFFF}.");
		ShowPlayerDialog(playerid, DIALOG_EDAD, DIALOG_STYLE_INPUT, "Edad", "Ingrese su edad\n\nMinimo 18 - Maximo 90.", "Continuar", "Cancelar");
		}
		else
		{
		Jugador[playerid][Genero] = 1;
		Jugador[playerid][Ropa] = 12;
		SCM(playerid,-1,"Has seleccionado {FFFF00}femenino{FFFFFF}.");
		ShowPlayerDialog(playerid, DIALOG_EDAD, DIALOG_STYLE_INPUT, "Edad", "Ingrese su edad\n\nMinimo 18 - Maximo 90.", "Continuar", "Cancelar");
		}
	  }
	//
	case DIALOG_EDAD:
	{
	     if(response)
		 {
		 if(strval(inputtext) < 18 || strval(inputtext) > 100) return ShowPlayerDialog(playerid, DIALOG_EDAD, DIALOG_STYLE_INPUT, "Edad", "Ingrese su edad\n\n{FF0000}Minimo 18 - Maximo 90.", "Continuar", "Cancelar");
		 Jugador[playerid][Edad] = strval(inputtext);
		 SetSpawnInfo(playerid, 0, Jugador[playerid][Ropa], 1484.1082, -1668.4976, 14.9159, 0.0000, 0,0,0,0,0,0);
		 SetPVarInt(playerid, "PuedeIngresar", 1);
		 SpawnPlayer(playerid);
		 CrearCuenta(playerid);
	     }
		 else
		 {
		 Kick(playerid);
		 }
	}
	//
	case DIALOG_INGRESO:
	{
        if(response)
		{
		new query[520];
		mysql_format(MySQL,query,sizeof(query),"SELECT * FROM `cuentas` WHERE `Nombre`='%s' AND `Contra`='%s'",NombreJugador(playerid),inputtext);
		mysql_pquery(MySQL, query, "IngresoJugador","d", playerid);
		}
		else
		{
		Kick(playerid);
		}
	}
	//
	}
	return 1;
}

public OnPlayerClickPlayer(playerid, clickedplayerid, source)
{
	return 1;
}
public VerificarUsuario(playerid)
{
	new Rows;
    Rows = cache_get_row_count();
    if(!Rows)
    {
    CamaraInicio(playerid);
	ShowPlayerDialog(playerid, DIALOG_REGISTRO, DIALOG_STYLE_INPUT, "Registro", "Bienvenido\n\nIngrese una contraseña para registrarse.", "Registrar", "Cancelar");
	}
	else
	{
	CamaraInicio(playerid);
	ShowPlayerDialog(playerid, DIALOG_INGRESO, DIALOG_STYLE_INPUT, "Ingreso", "Bienvenido\n\nIngrese su contraseña para ingresar.", "Continuar", "Cancelar");
	}
	return 1;
}
stock CamaraInicio(playerid)
{
SetPlayerCameraPos(playerid, 1533.2587, -1763.7717, 73.6204);
SetPlayerCameraLookAt(playerid, 1532.9288, -1762.8286, 73.0504);
SetPlayerPos(playerid,1513.4531, -1782.2853, 68.0610);
TogglePlayerControllable(playerid,0);
return 1;
}
stock NombreJugador(playerid)
{
new nombre[MAX_PLAYER_NAME];
GetPlayerName(playerid, nombre, sizeof(nombre));
return nombre;
}
public CrearCuenta(playerid)
{
new query[520],aviso[125];
mysql_format(MySQL, query, sizeof(query), "INSERT INTO `cuentas`(`Nombre`, `Contra`, `Ropa`, `X`, `Y`, `Z`, `Genero`, `Vida`, `Dinero`) VALUES ('%s','%s','%i','1484.1082', '-1668.4976', '14.9159','%i','100','100000')",
NombreJugador(playerid),
Jugador[playerid][Contra],
Jugador[playerid][Ropa],
Jugador[playerid][Genero]);
mysql_query(MySQL, query);
SCM(playerid,VERDECLARO,"¡Felicitaciones! Registro completo.");
SCM(playerid,-1,"Has completado el resgistro, bienvenido a el servidor, disfruta tu estadia.");
SCM(playerid,-1, "Has recibido una bonificacion extra en tu cuenta por estar en nuestro comienzo.");
format(aviso,sizeof(aviso),"Cuenta creada: %s - Edad: %d - Genero: %d", NombreJugador(playerid), Jugador[playerid][Edad], Jugador[playerid][Genero]);
print(aviso);
return 1;
}

public IngresoJugador(playerid)
{
if(cache_get_row_count() == 0)
{
ShowPlayerDialog(playerid, DIALOG_INGRESO, DIALOG_STYLE_INPUT, "Ingreso", "¡Error!\n\nLa contraseña no es correcta.", "Continuar", "Cancelar");
}
else
{
Jugador[playerid][Ropa] = cache_get_row_int(0, 3);
Jugador[playerid][X] = cache_get_row_float(0, 4);
Jugador[playerid][Y] = cache_get_row_float(0, 5);
Jugador[playerid][Z] = cache_get_row_float(0, 6);
Jugador[playerid][Genero] = cache_get_row_int(0, 7);
Jugador[playerid][Vida] = cache_get_row_float(0, 8);
Jugador[playerid][Chaleco] = cache_get_row_float(0, 9);
Jugador[playerid][Muertes] = cache_get_row_int(0, 10);
Jugador[playerid][Asesinatos] = cache_get_row_int(0, 11);
Jugador[playerid][Faccion] = cache_get_row_int(0, 12);
Jugador[playerid][Rango] = cache_get_row_int(0, 13);
Jugador[playerid][Trabajo] = cache_get_row_int(0, 14);
Jugador[playerid][Dinero] = cache_get_row_int(0, 15);
Jugador[playerid][Int] = cache_get_row_int(0, 16);
Jugador[playerid][VW] = cache_get_row_int(0, 17);
Jugador[playerid][Edad] = cache_get_row_int(0, 18);
SetPVarInt(playerid, "PuedeIngresar", 1);
IngresarJugador(playerid);
}
return 1;
}
public IngresarJugador(playerid)
{
SetSpawnInfo(playerid, 0, Jugador[playerid][Ropa], Jugador[playerid][X],Jugador[playerid][Y],Jugador[playerid][Z], 0.0000, 0,0,0,0,0,0);
SpawnPlayer(playerid);
SetPlayerHealth(playerid,Jugador[playerid][Vida]);
SetPlayerArmour(playerid,Jugador[playerid][Chaleco]);
GivePlayerMoney(playerid,Jugador[playerid][Dinero]);
SetPlayerVirtualWorld(playerid,Jugador[playerid][VW]);
SetPlayerInterior(playerid,Jugador[playerid][Int]);
SetPlayerSkin(playerid,Jugador[playerid][Ropa]);
return 1;
}
public GuardarJugador(playerid)
{
new query[520],Float:jX,Float:jY,Float:jZ,Float:hp,Float:chale,pVW,pInt;
GetPlayerPos(playerid, jX, jY, jZ);
GetPlayerHealth(playerid,hp);
GetPlayerArmour(playerid,chale);
Jugador[playerid][VW] = GetPlayerVirtualWorld(playerid);
Jugador[playerid][Int] = GetPlayerInterior(playerid);
pVW = GetPlayerVirtualWorld(playerid);
pInt = GetPlayerInterior(playerid);
mysql_format(MySQL, query, sizeof(query), "UPDATE `cuentas` SET `Ropa`='%i',`X`='%f',`Y`='%f',`Z`='%f',`Genero`='%i',`Vida`='%f',`Chaleco`='%f',`Muertes`='%i',`Asesinatos`='%i' WHERE `Nombre`='%s'",
Jugador[playerid][Ropa],
jX,
jY,
jZ,
Jugador[playerid][Genero],
hp,
chale,
Jugador[playerid][Muertes],
Jugador[playerid][Asesinatos],
NombreJugador(playerid));
mysql_query(MySQL, query);
//
mysql_format(MySQL, query, sizeof(query), "UPDATE `cuentas` SET `Edad`='%i', `Faccion`='%i', `Rango`='%i', `Trabajo`='%i', `Dinero`='%i' WHERE `Nombre`='%s'",
Jugador[playerid][Edad],
Jugador[playerid][Faccion],
Jugador[playerid][Rango],
Jugador[playerid][Trabajo],
Jugador[playerid][Dinero],
NombreJugador(playerid));
mysql_query(MySQL, query);

mysql_format(MySQL, query, sizeof(query), "UPDATE `cuentas` SET `VW`='%i', `Interior`='%i' WHERE `Nombre`='%s'",
pVW,
pInt,
NombreJugador(playerid));
mysql_query(MySQL, query);

return 1;
}
public OnQueryError(errorid, error[], callback[], query[], connectionHandle)
{
	switch(errorid)
	{
		case CR_SERVER_GONE_ERROR:
		{
			printf("Conexion perdida..");
			mysql_reconnect(connectionHandle);
		}
		case ER_SYNTAX_ERROR:
		{
			printf("Error en el sintaxis de la consulta: %s",query);
		}
	}
	return 1;
}
stock MensajeFaccion(fid, color, mensaje[])
{
for(new i = 0; i < MAX_PLAYERS; i++)
{
if(Jugador[i][Faccion] == fid)
{
SCM(i,color,mensaje);
}
}
return 1;
}
