#include <sourcemod>
#include <sdktools>

#pragma semicolon 1
#pragma newdecls required

char MapName[PLATFORM_MAX_PATH],
    MapPath[PLATFORM_MAX_PATH],
    MapPath_Radar[PLATFORM_MAX_PATH],
    MapPath_Radar_Locations[PLATFORM_MAX_PATH];

public Plugin myinfo =
{
    name = "csfire.gg old maps helper",
    author = "DRANIX",
    description = "helper plugin for old maps",
    version = "1.2",
    url = "https://csfire.gg/"
}

public void OnPluginStart()
{
    RegConsoleCmd("debugmap", Command_debugmap);
	RegConsoleCmd("sm_checkmap", Command_CheckFile);
}

public void OnMapStart() {

    //materials/panorama/images/map_icons/screenshots/1080p/de_mapname_old_csfire.png.
    //resource/overviews/de_mapname_old_csfire_radar.dds
    //resource/overviews/de_mapname_old_csfire.txt

    GetCurrentMap(MapName, sizeof(MapName));
    Format(MapPath, sizeof(MapPath), "materials/panorama/images/map_icons/screenshots/1080p/%s.png", MapName);
    Format(MapPath_Radar, sizeof(MapPath_Radar), "resource/overviews/%s_radar.dds", MapName);
    Format(MapPath_Radar_Locations, sizeof(MapPath_Radar_Locations), "resource/overviews/%s.txt", MapName);

    AddFileToDownloadsTable(MapPath);
    //AddFileToDownloadsTable(MapPath_Radar);
    //AddFileToDownloadsTable(MapPath_Radar_Locations);

    AddFileToDownloadsTable("resource/overviews/de_inferno_old_csfire.txt");
    AddFileToDownloadsTable("resource/overviews/de_inferno_old_csfire_radar.dds");
    //PrecacheGeneric(sFile, true);
}

public Action Command_debugmap(int client, int args)
{
    PrintToChatAll("\x06Radar \x08%s\x01, \x06Locations \x08%s", MapPath_Radar, MapPath_Radar_Locations);
    return Plugin_Handled;
}

public Action Command_CheckFile(int client, int args)
{
	char sReply1[256], sReply2[256], sReply3[256];
	
    if(!FileExists(MapPath))
		Format(sReply1, sizeof(sReply1), "Could not found file %s", MapPath);
		
	else
		Format(sReply1, sizeof(sReply1), "Found file %s", MapPath);
		
	if(!FileExists(MapPath_Radar))
		Format(sReply2, sizeof(sReply2), "Could not found file %s", MapPath_Radar);
		
	else
		Format(sReply2, sizeof(sReply2), "Found file %s", MapPath_Radar);
		
	if(!FileExists(MapPath_Radar_Locations))
		Format(sReply1, sizeof(sReply1), "Could not found file %s", MapPath_Radar_Locations);
		
	else
		Format(sReply1, sizeof(sReply1), "Found file %s", MapPath_Radar_Locations);
		
	ReplyToCommand(client, "\x4[SM]\x01 %s\n\x4[SM]\x01 %s\n\x4[SM]\x01 %s", sReply1, sReply2, sReply3);
	return Plugin_Handled;
}
