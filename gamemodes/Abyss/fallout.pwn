/*Версия 1.0
Суть игры - остаться на игровой площадке и не упасть вниз.
Особенности:
- Код полностью табулирован.
- Не используется сложных процессов, следовательно нагрузка минимальна.
- Не используется сторонних плагинов, что обеспечивает работоспособность на многих серверах.
================================================================================
Версия 2.0:
- Добавлена команда /autorefresh, которая позволяет включать автообновление игрового поля после окончания игры.
- Оптимизирован цикл поиска игроков. (использование foreach.inc).
- Оптимизирована очистка чата (Сток теперь в одну строчку).
- Время до старта игры уменьшено до 5 секунд.
- Немного уменьшена хардкорность: теперь в конце игры остаются 2 блока (вместо одного).
- Увеличена скорость падения блоков вниз.
- Объекты выгружаются из памяти сервера, при отключении скрипта.
- Увеличена дальность полёта блоков вниз.*/
//==============================================================================
#include <a_samp>//основа
#include <foreach>//оптимизация
//[Дефайны]
#define FILTERSCRIPT
#define COLOR_ADD 0xFF8000AA
#define COLOR_RED 0xFF0000AA
#define COLOR_HELP 0x008040AA
#define Author "DeadSmile"
//[Переменные и массивы]
new area[36];//массив для объектов
new start;
new play[MAX_PLAYERS];
new dTimer;
new areaid;
new Float:x,Float:y,Float:z;
new autorefresh;
//==============================================================================
public OnFilterScriptInit()
{
	CreatingObjects();//Подгрузка блоков
	CreateObject(18981,3384.6818848,-299.5669861,463.8099976,0.0000000,0.0000000,0.0000000); //object(concrete1mx25mx25m) (1)
	CreateObject(18981,3384.6750488,-274.5660095,463.8099976,0.0000000,0.0000000,0.0000000); //object(concrete1mx25mx25m) (2)
	CreateObject(18981,3384.6818848,-267.3160095,463.8099976,0.0000000,0.0000000,0.0000000); //object(concrete1mx25mx25m) (3)
	CreateObject(18981,3372.8469238,-255.1710052,463.8099976,0.0000000,0.0000000,270.0000000); //object(concrete1mx25mx25m) (4)
	CreateObject(18981,3348.0969238,-255.1710052,463.8099976,0.0000000,0.0000000,270.0000000); //object(concrete1mx25mx25m) (5)
	CreateObject(18981,3334.8469238,-255.1710052,463.8099976,0.0000000,0.0000000,270.0000000); //object(concrete1mx25mx25m) (6)
	CreateObject(18981,3322.9289551,-267.2500000,463.8099976,0.0000000,0.0000000,180.0000000); //object(concrete1mx25mx25m) (7)
	CreateObject(18981,3322.9289551,-292.0100098,463.8099976,0.0000000,0.0000000,179.9945068); //object(concrete1mx25mx25m) (8)
	CreateObject(18981,3322.7758789,-299.4899902,463.8099976,0.0000000,0.0000000,179.9945068); //object(concrete1mx25mx25m) (9)
	CreateObject(18981,3335.5939941,-311.5299988,463.8099976,0.0000000,0.0000000,89.9945068); //object(concrete1mx25mx25m) (10)
	CreateObject(18981,3359.8491211,-311.5299988,463.8099976,0.0000000,0.0000000,89.9945068); //object(concrete1mx25mx25m) (11)
	CreateObject(18981,3373.1020508,-311.4930115,463.8099976,0.0000000,0.0000000,89.9945068); //object(concrete1mx25mx25m) (12)
	//--------------------------------------------------------------------------
	start = 0;//по умолчанию
	autorefresh = 0;//по умолчанию
	print("[FS] fallout box загружен!");
	print("Автор скрипта - Dead Smile");
	return true;
}
public OnFilterScriptExit()
{
    DestroyObjects();
	return true;
}
public OnPlayerConnect(playerid)
{
	play[playerid] = 0;
	return true;
}

public OnPlayerDisconnect(playerid, reason)
{
	play[playerid] = 0;
	return true;
}

public OnPlayerSpawn(playerid)
{
	play[playerid] = 0;
	return true;
}

public OnPlayerDeath(playerid, killerid, reason)
{
	play[playerid] = 0;
	return true;
}

public OnPlayerCommandText(playerid, cmdtext[])
{
	if (strcmp("/faltp", cmdtext, true, 9) == 0)
	{
		if(IsPlayerAdmin(playerid))
		{
			SetPlayerPos(playerid,3353,-282,453.8);
		}
		return true;
	}
	if (strcmp("/startf", cmdtext, true, 7) == 0 && IsPlayerAdmin(playerid))
	{
		if(start == 0)
		{
			start = 1;
			SetTimer("TeleportAll",10000,false);
			CC();
			SendClientMessageToAll(COLOR_ADD,"Внимание! На сервере запущена игра Fallout Box!");
			SendClientMessageToAll(COLOR_ADD,"Через 10 секунд все игроки будут телепортированы на игровое поле!");
		}
		else SendClientMessage(playerid,COLOR_RED,"Игра уже идёт!");
		return true;
	}
	if (strcmp("/stopf", cmdtext, true, 7) == 0 && IsPlayerAdmin(playerid))
	{
		if(start == 1)
		{
			start = 0;
			CC();
			KillT();
			SendClientMessageToAll(COLOR_ADD,"Игра остановлена!");
		}
		else SendClientMessage(playerid,COLOR_RED,"Не начата!");
		return true;
	}
	if (strcmp("/refreshf", cmdtext, true, 9) == 0)
	{
		if(IsPlayerAdmin(playerid))
		{
			start = 0;
			DestroyObjects();
			SetTimer("CreatingObjects",2000,false);
			SendClientMessage(playerid,-1,"Обновлено!");
			print("Площадка обновлена!");
		}
		return true;
	}
	if (strcmp("/refreshf", cmdtext, true, 9) == 0)
	{
		if(IsPlayerAdmin(playerid))
		{
			start = 0;
			DestroyObjects();
			SetTimer("CreatingObjects",3000,false);

		}
		return true;
	}
	if (strcmp("/exitf", cmdtext, true, 6) == 0)
	{
		if(play[playerid] == 1)
		{
			play[playerid] = 0;
			SpawnPlayer(playerid);
			SendClientMessage(playerid,COLOR_ADD,"Вы покинули игру!");
		}
		else SendClientMessage(playerid,COLOR_RED,"Вы не принимаете участие в игре!");
		return true;
	}
	if (strcmp("/helpf", cmdtext, true, 6) == 0)
	{
		if(IsPlayerAdmin(playerid))
		{
			SendClientMessage(playerid,COLOR_HELP,"/startf - начать игру.");
			SendClientMessage(playerid,COLOR_HELP,"/stopf - остановить игру.");
			SendClientMessage(playerid,COLOR_HELP,"/refreshf - обновить игровое поле.");
			SendClientMessage(playerid,COLOR_HELP,"/faltp - телепортироваться на игровое поле.");
			SendClientMessage(playerid,COLOR_HELP,"/autorefresh - автообновление игрового поля(вкл/выкл).");
		}
		else SendClientMessage(playerid,COLOR_RED,"Вы не администратор");
		return true;
	}
	if (strcmp("/autorefresh", cmdtext, true, 12) == 0)
	{
		if(IsPlayerAdmin(playerid))
		{
			if(autorefresh == 0)
			{
			    autorefresh = 1;
			    SendClientMessage(playerid,-1,"Автообновление игрового поля включено!");
			}
		    else if(autorefresh == 1)
			{
				autorefresh = 0;
			    SendClientMessage(playerid,-1,"Автообновление игрового поля выключено!");
			}
		}
		else SendClientMessage(playerid,COLOR_RED,"Вы не администратор");
		return true;
	}
	return false;
}
stock DestroyObjects()//удаление блоков
{
	DestroyObject(area[1]);
	DestroyObject(area[2]);
	DestroyObject(area[3]);
	DestroyObject(area[4]);
	DestroyObject(area[5]);
	DestroyObject(area[6]);
	DestroyObject(area[7]);
	DestroyObject(area[8]);
	DestroyObject(area[9]);
	DestroyObject(area[10]);
	DestroyObject(area[11]);
	DestroyObject(area[12]);
	DestroyObject(area[13]);
	DestroyObject(area[14]);
	DestroyObject(area[15]);
	DestroyObject(area[16]);
	DestroyObject(area[17]);
	DestroyObject(area[18]);
	DestroyObject(area[19]);
	DestroyObject(area[20]);
	DestroyObject(area[21]);
	DestroyObject(area[22]);
	DestroyObject(area[23]);
	DestroyObject(area[24]);
	DestroyObject(area[25]);
	DestroyObject(area[26]);
	DestroyObject(area[27]);
	DestroyObject(area[28]);
	DestroyObject(area[29]);
	DestroyObject(area[30]);
	DestroyObject(area[31]);
	DestroyObject(area[32]);
	DestroyObject(area[33]);
	DestroyObject(area[34]);
	DestroyObject(area[35]);
}
forward CreatingObjects();
public CreatingObjects()
{
	area[0] = CreateObject(19377,3327.6789551,-307.0350037,451.2239990,0.0000000,90.0000000,0.0000000); //object(wall025)(1)
	area[1] = CreateObject(19377,3338.1850586,-307.0320129,451.2239990,0.0000000,90.0000000,0.0000000); //object(wall025)(2)
	area[2] = CreateObject(19377,3348.4409180,-307.0350037,451.2239990,0.0000000,90.0000000,0.0000000); //object(wall025)(3)
	area[3] = CreateObject(19377,3358.9470215,-307.0320129,451.2239990,0.0000000,90.0000000,0.0000000); //object(wall025)(4)
	area[4] = CreateObject(19377,3369.4528809,-307.0289917,451.2239990,0.0000000,90.0000000,0.0000000); //object(wall025)(5)
	area[5] = CreateObject(19377,3379.9580078,-307.0260010,451.2239990,0.0000000,90.0000000,0.0000000); //object(wall025)(6)
	area[6] = CreateObject(19377,3379.9760742,-297.5220032,451.2239990,0.0000000,90.0000000,0.0000000); //object(wall025)(7)
	area[7] = CreateObject(19377,3369.7260742,-297.5079956,451.2239990,0.0000000,90.0000000,0.0000000); //object(wall025)(8)
	area[8] = CreateObject(19377,3359.2260742,-297.4939880,451.2239990,0.0000000,90.0000000,0.0000000); //object(wall025)(9)
	area[9] = CreateObject(19377,3348.7260742,-297.4790039,451.2239990,0.0000000,90.0000000,0.0000000); //object(wall025)(10)
	area[10] = CreateObject(19377,3338.2260742,-297.4639893,451.2239990,0.0000000,90.0000000,0.0000000); //object(wall025)(11)
	area[11] = CreateObject(19377,3327.7260742,-297.4500122,451.2239990,0.0000000,90.0000000,0.0000000); //object(wall025)(12)
	area[12] = CreateObject(19377,3327.7351074,-287.9490051,451.2239990,0.0000000,90.0000000,0.0000000); //object(wall025)(13)
	area[13] = CreateObject(19377,3337.9838867,-287.9620056,451.2239990,0.0000000,90.0000000,0.0000000); //object(wall025)(14)
	area[14] = CreateObject(19377,3348.4838867,-287.9760132,451.2239990,0.0000000,90.0000000,0.0000000); //object(wall025)(15)
	area[15] = CreateObject(19377,3358.9838867,-287.9899902,451.2239990,0.0000000,90.0000000,0.0000000); //object(wall025)(16)
	area[16] = CreateObject(19377,3369.4838867,-288.0029907,451.2239990,0.0000000,90.0000000,0.0000000); //object(wall025)(17)
	area[17] = CreateObject(19377,3379.9838867,-288.0169983,451.2239990,0.0000000,90.0000000,0.0000000); //object(wall025)(18)
	area[18] = CreateObject(19377,3379.9870605,-278.5109863,451.2239990,0.0000000,90.0000000,0.0000000); //object(wall025)(19)
	area[19] = CreateObject(19377,3369.4799805,-278.5130005,451.2239990,0.0000000,90.0000000,0.0000000); //object(wall025)(21)
	area[20] = CreateObject(19377,3359.2241211,-278.5090027,451.2239990,0.0000000,90.0000000,0.0000000); //object(wall025)(22)
	area[21] = CreateObject(19377,3348.7180176,-278.5140076,451.2239990,0.0000000,90.0000000,0.0000000); //object(wall025)(23)
	area[22] = CreateObject(19377,3338.2119141,-278.5159912,451.2239990,0.0000000,90.0000000,0.0000000); //object(wall025)(24)
	area[23] = CreateObject(19377,3327.7060547,-278.5150146,451.2239990,0.0000000,90.0000000,0.0000000); //object(wall025)(25)
	area[24] = CreateObject(19377,3380.0048828,-269.0069885,451.2239990,0.0000000,90.0000000,0.0000000); //object(wall025)(26)
	area[25] = CreateObject(19377,3369.7490234,-269.0029907,451.2239990,0.0000000,90.0000000,0.0000000); //object(wall025)(27)
	area[26] = CreateObject(19377,3359.2429199,-269.0050049,451.2239990,0.0000000,90.0000000,0.0000000); //object(wall025)(28)
	area[27] = CreateObject(19377,3348.7360840,-269.0069885,451.2239990,0.0000000,90.0000000,0.0000000); //object(wall025)(29)
	area[28] = CreateObject(19377,3338.2290039,-269.0100098,451.2239990,0.0000000,90.0000000,0.0000000); //object(wall025)(30)
	area[29] = CreateObject(19377,3327.7229004,-269.0119934,451.2239990,0.0000000,90.0000000,0.0000000); //object(wall025)(31)
	area[30] = CreateObject(19377,3380.0229492,-259.5029907,451.2239990,0.0000000,90.0000000,0.0000000); //object(wall025)(32)
	area[31] = CreateObject(19377,3369.5161133,-259.5060120,451.2239990,0.0000000,90.0000000,0.0000000); //object(wall025)(33)
	area[32] = CreateObject(19377,3359.0100098,-259.5079956,451.2239990,0.0000000,90.0000000,0.0000000); //object(wall025)(34)
	area[33] = CreateObject(19377,3348.5039062,-259.5100098,451.2239990,0.0000000,90.0000000,0.0000000); //object(wall025)(35)
	area[34] = CreateObject(19377,3337.9980469,-259.5119934,451.2239990,0.0000000,90.0000000,0.0000000); //object(wall025)(36)
	area[35] = CreateObject(19377,3327.7419434,-259.5079956,451.2239990,0.0000000,90.0000000,0.0000000); //object(wall025)(37)
}
forward TeleportAll(playerid);
public TeleportAll(playerid)
{
	foreach (new i : Player)//оптимизированный цикл (foreach.inc)
	{
		RemovePlayerFromVehicle(i);
		SetPlayerPos(i,3353.0+random(2),-282.0+random(2),453.99);
		play[i] = 1;
	}
	CC();
	SendClientMessageToAll(COLOR_ADD,"Занимайте свои позиции, старт игры через 5 секунд!");
	SendClientMessageToAll(COLOR_ADD,"Для выхода из игры введите /exitf");
	SetTimer("StartGame",5000,false);
}
forward StartGame(playerid);
public StartGame(playerid)
{
	dTimer = SetTimer("DestroyArea",6000,true);
	SetTimer("KillT",204000,false);
	SendClientMessageToAll(COLOR_ADD,"Игра начата!");
	print("Игра началась!");
}
forward DestroyArea();
public DestroyArea()
{
	areaid = random(35);
	GetObjectPos(area[areaid],x,y,z);
	if(IsValidObject(area[areaid]))
	{
		CreateExplosion( x,y,z, 12, 3.1 );
		printf("Выбрана ячейка номер %d", areaid);
		SetTimer("moveblock",900,false);
	}
	else DestroyArea();
}
forward moveblock();
public moveblock()
{
	MoveObject(area[areaid],x,y,z-40,10.0);
	SetTimer("delblock",4000,false);
}
forward delblock();
public delblock(){DestroyObject(area[areaid]);}
forward KillT();
public KillT()
{
    if(autorefresh == 1)
	{
		DestroyObjects();
		SetTimer("CreatingObjects",3000,false);
		start = 0;
		KillTimer(dTimer);
		print("Игра окончена.");
		CC();
		SendClientMessageToAll(COLOR_ADD,"Игра окончена!");
		SendClientMessageToAll(COLOR_ADD,"Для выхода из игры введите /exitf");
		print("Игровое поле автоматически обновлено!");
	}
	else if(autorefresh == 0)
	{
		start = 0;
		KillTimer(dTimer);
		print("Игра окончена.");
		CC();
		SendClientMessageToAll(COLOR_ADD,"Игра окончена!");
		SendClientMessageToAll(COLOR_ADD,"Для выхода из игры введите /exitf");
	}
}

stock CC() {for(new k=0;k<14;k++) {SendClientMessageToAll(COLOR_ADD," ");}}
