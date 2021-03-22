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

}
