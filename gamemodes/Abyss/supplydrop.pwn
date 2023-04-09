#define 	FILTERSCRIPT
#include 	<a_samp>
#include    <foreach>   	// by Kar - http://forum.sa-mp.com/showthread.php?t=570868
#include    <izcmd>     	// by Yashas - http://forum.sa-mp.com/showthread.php?t=576114
#include    <mapandreas>    // by RyDeR - http://forum.sa-mp.com/showthread.php?t=273263

#define     MAX_DROPS       (50)
#define     DIST            (300.0)

// Config
#define		PLANE_TIME		(7)		// how many seconds does a plane need before flying (Default: 7)
#define     REQ_COOLDOWN    (3)     // how many minutes does someone need to wait for requesting a supply drop again (Default: 3)
#define     DROP_LIFE       (5)     // life time of a supply drop, in minutes (Default: 5)
#define     AMMO_PRICE      (750)	// price of ammo request (Default: 750)
#define     HEALTH_PRICE    (500)   // price of health kit request (Default: 500)
#define     ARMOR_PRICE     (450)   // price of body armor request (Default: 450)
#define     AMMO_AMOUNT     (150)   // how much ammo will be given with a weapon/ammo drop (Default: 150)

enum    _:E_DROPTYPE
{
	DROP_TYPE_WEAPON,
	DROP_TYPE_AMMO,
	DROP_TYPE_HEALTH,
	DROP_TYPE_ARMOR
}

enum    _:E_DROPDIALOG
{
	DIALOG_DROP_MENU,
	DIALOG_DROP_WEAPONS,
	DIALOG_DROP_CONFIRM
}

enum    E_WEPDATA
{
	weaponID,
	weaponPrice
}

enum    E_DROP
{
	// objects
	planeObj,
	boxObj,
	paraObj,
	// pickup (created after drop is done)
	dropPickup,
	// label
	Text3D: dropLabel,
	// drop data
	dropType,
	dropData,
	// timer
	dropTimer,
	// other
	requestedBy
}

new
	SupplyData[MAX_DROPS][E_DROP],
	Iterator: SupplyDrops<MAX_DROPS>;

new
	AvailableWeapons[][E_WEPDATA] = {
	    // weapon id, price
	    // you can get weapon ids from here: https://wiki.sa-mp.com/wiki/Weapons
	    {WEAPON_SHOTGUN, 300},
	    {WEAPON_SAWEDOFF, 130},
	    {WEAPON_AK47, 500},
	    {WEAPON_MINIGUN, 1000000}
	};

formatInt(intVariable, iThousandSeparator = ',', iCurrencyChar = '$')
{
    /*
		By Kar
		https://gist.github.com/Kar2k/bfb0eafb2caf71a1237b349684e091b9/8849dad7baa863afb1048f40badd103567c005a5#file-formatint-function
	*/
	static
		s_szReturn[ 32 ],
		s_szThousandSeparator[ 2 ] = { ' ', EOS },
		s_szCurrencyChar[ 2 ] = { ' ', EOS },
		s_iVariableLen,
		s_iChar,
		s_iSepPos,
		bool:s_isNegative
	;

	format( s_szReturn, sizeof( s_szReturn ), "%d", intVariable );

	if(s_szReturn[0] == '-')
		s_isNegative = true;
	else
		s_isNegative = false;

	s_iVariableLen = strlen( s_szReturn );

	if ( s_iVariableLen >= 4 && iThousandSeparator)
	{
		s_szThousandSeparator[ 0 ] = iThousandSeparator;

		s_iChar = s_iVariableLen;
		s_iSepPos = 0;

		while ( --s_iChar > _:s_isNegative )
		{
			if ( ++s_iSepPos == 3 )
			{
				strins( s_szReturn, s_szThousandSeparator, s_iChar );

				s_iSepPos = 0;
			}
		}
	}
	if(iCurrencyChar) {
		s_szCurrencyChar[ 0 ] = iCurrencyChar;
		strins( s_szReturn, s_szCurrencyChar, _:s_isNegative );
	}
	return s_szReturn;
}

ConvertToMinutes(time)
{
    // http://forum.sa-mp.com/showpost.php?p=3223897&postcount=11
    new string[15];//-2000000000:00 could happen, so make the string 15 chars to avoid any errors
    format(string, sizeof(string), "%02d:%02d", time / 60, time % 60);
    return string;
}

GetWeaponModel(weaponid)
{
	switch(weaponid)
	{
		case 1: return 331;
		case 2..8: return weaponid+331;
		case 9: return 341;
		case 10..15: return weaponid+311;
		case 16..18: return weaponid+326;
		case 22..29: return weaponid+324;
		case 30,31: return weaponid+325;
		case 32: return 372;
		case 33..45: return weaponid+324;
		case 46: return 371;
	}

	return 18631;
}

ReturnDropPickupModel(id)
{
	new model = 18631;
	
	switch(SupplyData[id][dropType])
	{
		case DROP_TYPE_WEAPON: model = GetWeaponModel(SupplyData[id][dropData]);
		case DROP_TYPE_AMMO: model = 19832;
		case DROP_TYPE_HEALTH: model = 11738;
		case DROP_TYPE_ARMOR: model = 1242;
	}
	
	return model;
}

ShowDropMenu(playerid)
{
	new string[128];
	format(string, sizeof(string), "Request Weapons\t\nRequest Ammo\t{2ECC71}%s\nRequest Health Kit\t{2ECC71}%s\nRequest Body Armor\t{2ECC71}%s", formatInt(AMMO_PRICE), formatInt(HEALTH_PRICE), formatInt(ARMOR_PRICE));
	ShowPlayerDialog(playerid, DIALOG_DROP_MENU, DIALOG_STYLE_TABLIST, "Supply Drop", string, "Request", "Close");
	return 1;
}

ShowWeaponsMenu(playerid)
{
    new string[512], wname[24];
    format(string, sizeof(string), "Weapon\tPrice\n");
    
    for(new i; i < sizeof(AvailableWeapons); i++)
    {
        GetWeaponName(AvailableWeapons[i][weaponID], wname, sizeof(wname));
		format(string, sizeof(string), "%s%s\t{2ECC71}%s\n", string, wname, formatInt(AvailableWeapons[i][weaponPrice]));
    }
    
    ShowPlayerDialog(playerid, DIALOG_DROP_WEAPONS, DIALOG_STYLE_TABLIST_HEADERS, "Supply Drop » {FFFFFF}Weapons", string, "Request", "Back");
	return 1;
}

ShowConfirmDialog(playerid)
{
	if(GetPVarInt(playerid, "supply_Price") > GetPlayerMoney(playerid)) return 1;
	new string[128];
	
	switch(GetPVarInt(playerid, "supply_ReqType"))
	{
	    case DROP_TYPE_WEAPON:
		{
		    new wname[24];
		    GetWeaponName(AvailableWeapons[ GetPVarInt(playerid, "supply_WepIndex") ][weaponID], wname, sizeof(wname));
		    format(string, sizeof(string), "{FFFFFF}You're about to order a supply drop for {F1C40F}%s.\n\n{FFFFFF}Price: {2ECC71}%s", wname, formatInt(GetPVarInt(playerid, "supply_Price")));
		}
		
		case DROP_TYPE_AMMO:
		{
            format(string, sizeof(string), "{FFFFFF}You're about to order a supply drop for {F1C40F}Ammo.\n\n{FFFFFF}Price: {2ECC71}%s", formatInt(GetPVarInt(playerid, "supply_Price")));
		}

        case DROP_TYPE_HEALTH:
		{
            format(string, sizeof(string), "{FFFFFF}You're about to order a supply drop for {F1C40F}Health Kit.\n\n{FFFFFF}Price: {2ECC71}%s", formatInt(GetPVarInt(playerid, "supply_Price")));
		}

        case DROP_TYPE_ARMOR:
		{
            format(string, sizeof(string), "{FFFFFF}You're about to order a supply drop for {F1C40F}Body Armor.\n\n{FFFFFF}Price: {2ECC71}%s", formatInt(GetPVarInt(playerid, "supply_Price")));
		}
	}
	
	ShowPlayerDialog(playerid, DIALOG_DROP_CONFIRM, DIALOG_STYLE_MSGBOX, "Supply Drop » {FFFFFF}Confirmation", string, "Confirm", "Cancel");
	return 1;
}

public OnFilterScriptInit()
{
    for(new i; i < MAX_DROPS; i++)
    {
        SupplyData[i][planeObj] = SupplyData[i][boxObj] = SupplyData[i][paraObj] = SupplyData[i][dropPickup] = SupplyData[i][dropTimer] = SupplyData[i][requestedBy] = -1;
        SupplyData[i][dropLabel] = Text3D: -1;
    }
    
	return 1;
}

public OnFilterScriptExit()
{
	foreach(new i : SupplyDrops)
	{
		if(IsValidObject(SupplyData[i][planeObj])) DestroyObject(SupplyData[i][planeObj]);
		if(IsValidObject(SupplyData[i][boxObj])) DestroyObject(SupplyData[i][boxObj]);
		if(IsValidObject(SupplyData[i][paraObj])) DestroyObject(SupplyData[i][paraObj]);
		
		if(SupplyData[i][dropPickup] != -1) DestroyPickup(SupplyData[i][dropPickup]);
		if(SupplyData[i][dropTimer] != -1) KillTimer(SupplyData[i][dropTimer]);
		if(SupplyData[i][dropLabel] != Text3D: -1) Delete3DTextLabel(SupplyData[i][dropLabel]);
	}
	
	return 1;
}

public OnPlayerDisconnect(playerid, reason)
{
	foreach(new i : SupplyDrops) if(SupplyData[i][requestedBy] == playerid) SupplyData[i][requestedBy] = -1;
	return 1;
}

public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	switch(dialogid)
	{
	    case DIALOG_DROP_MENU:
	    {
	        if(!response) return 1;
	        SetPVarInt(playerid, "supply_ReqType", listitem);
	        
	        if(listitem == 0) {
				ShowWeaponsMenu(playerid);
			}else{
			    new price;
			    switch(listitem)
			    {
			        case DROP_TYPE_AMMO: price = AMMO_PRICE;
			        case DROP_TYPE_HEALTH: price = HEALTH_PRICE;
			        case DROP_TYPE_ARMOR: price = ARMOR_PRICE;
			    }
			    
			    if(price > GetPlayerMoney(playerid))
			    {
			        SendClientMessage(playerid, 0xE74C3CFF, "ERROR: {FFFFFF}You can't afford this request.");
			        return ShowDropMenu(playerid);
			    }
			    
			    SetPVarInt(playerid, "supply_Price", price);
			    ShowConfirmDialog(playerid);
			}
			
	        return 1;
	    }
	    
	    case DIALOG_DROP_WEAPONS:
	    {
	        if(!response) return ShowDropMenu(playerid);
	        new price = AvailableWeapons[listitem][weaponPrice];
	        if(price > GetPlayerMoney(playerid))
	        {
	            SendClientMessage(playerid, 0xE74C3CFF, "ERROR: {FFFFFF}You can't afford this weapon.");
	            return ShowWeaponsMenu(playerid);
	        }
	        
			SetPVarInt(playerid, "supply_WepIndex", listitem);
			SetPVarInt(playerid, "supply_Price", price);
			ShowConfirmDialog(playerid);
	        return 1;
	    }
	    
	    case DIALOG_DROP_CONFIRM:
	    {
	        if(!response) return ShowDropMenu(playerid);
	        new price = GetPVarInt(playerid, "supply_Price");
	        if(price > GetPlayerMoney(playerid)) return SendClientMessage(playerid, 0xE74C3CFF, "ERROR: {FFFFFF}You can't afford this drop.");
	        new cooldown = GetPVarInt(playerid, "supply_Cooldown");
			if(cooldown > gettime())
			{
			    new string[72];
				format(string, sizeof(string), "ERROR: {FFFFFF}Please wait %s more to request a supply drop again.", ConvertToMinutes(cooldown - gettime()));
				return SendClientMessage(playerid, 0xE74C3CFF, string);
			}
			
	        new id = Iter_Free(SupplyDrops);
			if(id == -1) return SendClientMessage(playerid, 0xE74C3CFF, "ERROR: {FFFFFF}You can't request a supply drop right now.");
			GivePlayerMoney(playerid, -price);
			
			new Float: x, Float: y, Float: z;
			GetPlayerPos(playerid, x, y, z);
		 	GetPointZPos(x, y, z);

			SupplyData[id][requestedBy] = playerid;
			SupplyData[id][dropType] = GetPVarInt(playerid, "supply_ReqType");
			SupplyData[id][dropData] = AvailableWeapons[ GetPVarInt(playerid, "supply_WepIndex") ][weaponID];
			SupplyData[id][dropTimer] = SetTimerEx("FlyPlane", PLANE_TIME * 1000, false, "ifffi", id, x, y, z, random(360));
			Iter_Add(SupplyDrops, id);
            
			SendClientMessage(playerid, 0x3498DBFF, "PILOT: {FFFFFF}Request received.");
			SetPVarInt(playerid, "supply_Cooldown", gettime() + REQ_COOLDOWN * 60);
	        return 1;
	    }
	}
	
	return 0;
}

public OnObjectMoved(objectid)
{
	switch(GetObjectModel(objectid))
	{
	    case 1681:
	    {
	        // it's a plane, validate it & remove
	        foreach(new i : SupplyDrops)
	        {
	            if(SupplyData[i][planeObj] == objectid)
	            {
	                DestroyObject(SupplyData[i][planeObj]);
	                SupplyData[i][planeObj] = -1;
	                break;
	            }
	        }
	    }
	    
		case 2975:
		{
	        // it's a supply drop, validate it, create pickup then remove
	        foreach(new i : SupplyDrops)
	        {
	            if(SupplyData[i][boxObj] == objectid)
	            {
	                new Float: x, Float: y, Float: z, string[48];
	                switch(SupplyData[i][dropType])
	                {
	                    case DROP_TYPE_WEAPON:
	                    {
	                        new weap_name[24];
	                        GetWeaponName(SupplyData[i][dropData], weap_name, sizeof(weap_name));
	                        format(string, sizeof(string), "Supply Drop\n\n{FFFFFF}%s", weap_name);
	                    }
	                    
	                    case DROP_TYPE_AMMO: format(string, sizeof(string), "Supply Drop\n\n{FFFFFF}Ammo");
	                    case DROP_TYPE_HEALTH: format(string, sizeof(string), "Supply Drop\n\n{FFFFFF}Health");
	                    case DROP_TYPE_ARMOR: format(string, sizeof(string), "Supply Drop\n\n{FFFFFF}Body Armor");
	                }
	                
	                GetObjectPos(objectid, x, y, z);
	                SupplyData[i][dropPickup] = CreatePickup(ReturnDropPickupModel(i), 1, x, y, z + 0.85);
	                SupplyData[i][dropLabel] = Create3DTextLabel(string, 0xF1C40FFF, x, y, z + 1.65, 10.0, 0, 1);
	                
	                DestroyObject(SupplyData[i][paraObj]);
	                DestroyObject(SupplyData[i][boxObj]);
	                SupplyData[i][boxObj] = SupplyData[i][paraObj] = -1;
	                SupplyData[i][dropTimer] = SetTimerEx("RemoveDrop", DROP_LIFE * 60000, false, "i", i);
	                
	                if(IsPlayerConnected(SupplyData[i][requestedBy])) SendClientMessage(SupplyData[i][requestedBy], 0x3498DBFF, "SUPPLY DROP: {FFFFFF}Drop complete.");
	                break;
	            }
	        }
        }
    }
    
    return 1;
}

public OnPlayerPickUpPickup(playerid, pickupid)
{
	foreach(new i : SupplyDrops)
	{
	    if(pickupid == SupplyData[i][dropPickup])
	    {
	        switch(SupplyData[i][dropType])
	        {
	            case DROP_TYPE_WEAPON: GivePlayerWeapon(playerid, SupplyData[i][dropData], AMMO_AMOUNT);
	            
                case DROP_TYPE_AMMO:
				{
					new weapon, ammo;
			        for(new x = 2; x <= 7; x++)
			        {
			            GetPlayerWeaponData(playerid, x, weapon, ammo);
			            SetPlayerAmmo(playerid, weapon, ammo + AMMO_AMOUNT);
			        }
				}
				
				case DROP_TYPE_HEALTH: SetPlayerHealth(playerid, 100.0);
				case DROP_TYPE_ARMOR: SetPlayerArmour(playerid, 100.0);
	        }
	        
	        DestroyPickup(SupplyData[i][dropPickup]);
			Delete3DTextLabel(SupplyData[i][dropLabel]);
			KillTimer(SupplyData[i][dropTimer]);
			
			SupplyData[i][dropPickup] = SupplyData[i][requestedBy] = SupplyData[i][dropTimer] = -1;
			SupplyData[i][dropLabel] = Text3D: -1;
			
	        new next;
			Iter_SafeRemove(SupplyDrops, i, next);
	        break;
	    }
	}
	
	return 1;
}

forward FlyPlane(id, Float: x, Float: y, Float: z, angle);
public FlyPlane(id, Float: x, Float: y, Float: z, angle)
{
    SupplyData[id][planeObj] = CreateObject(1681, x + (DIST * -floatsin(-angle, degrees)), y + (DIST * -floatcos(-angle, degrees)), z + 75.0, 0.0, 0.0, angle);
    new time = MoveObject(SupplyData[id][planeObj], x + (DIST * floatsin(-angle, degrees)), y + (DIST * floatcos(-angle, degrees)), z + 75.0, 60.0);
    
	SupplyData[id][dropTimer] = SetTimerEx("MakeDrop", floatround(time / 2.5), false, "ifff", id, x, y, z);
	
	if(IsPlayerConnected(SupplyData[id][requestedBy])) SendClientMessage(SupplyData[id][requestedBy], 0x3498DBFF, "PILOT: {FFFFFF}I'm getting close.");
	return 1;
}

forward MakeDrop(id, Float: x, Float: y, Float: z);
public MakeDrop(id, Float: x, Float: y, Float: z)
{
	new Float: plx, Float: ply, Float: plz;
	GetObjectPos(SupplyData[id][planeObj], plx, ply, plz);
	
	SupplyData[id][boxObj] = CreateObject(2975, plx, ply, plz - 15.0, 0.0, 0.0, 0.0);
	SupplyData[id][paraObj] = CreateObject(18849, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0);
 	SetObjectMaterial(SupplyData[id][paraObj], 2, 19478, "signsurf", "sign", 0xFFFFFFFF);
	AttachObjectToObject(SupplyData[id][paraObj], SupplyData[id][boxObj], 0.0, -0.05, 7.5, 0.0, 0.0, 0.0);
	MoveObject(SupplyData[id][boxObj], x, y, z, 8.0);

	if(IsPlayerConnected(SupplyData[id][requestedBy])) SendClientMessage(SupplyData[id][requestedBy], 0x3498DBFF, "PILOT: {FFFFFF}Supplies dropped.");
	return 1;
}

forward RemoveDrop(id);
public RemoveDrop(id)
{
    DestroyPickup(SupplyData[id][dropPickup]);
	Delete3DTextLabel(SupplyData[id][dropLabel]);

	SupplyData[id][dropPickup] = SupplyData[id][requestedBy] = SupplyData[id][dropTimer] = -1;
	SupplyData[id][dropLabel] = Text3D: -1;

	Iter_Remove(SupplyDrops, id);
	return 1;
}

CMD:drop(playerid, params[])
{
	if(IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, 0xE74C3CFF, "ERROR: {FFFFFF}You can't use this command in a vehicle.");
	new cooldown = GetPVarInt(playerid, "supply_Cooldown");
	if(cooldown > gettime())
	{
	    new string[72];
		format(string, sizeof(string), "ERROR: {FFFFFF}Please wait %s more to request a supply drop again.", ConvertToMinutes(cooldown - gettime()));
		return SendClientMessage(playerid, 0xE74C3CFF, string);
	}
	
	ShowDropMenu(playerid);
	return 1;
}
