local appid = '667314714791116810' 
local image1 = 'gtarp'
local image2 = 'dev'
local discord = 'https://discord.gg/9BWKde9'
local IP = '67.181.133.245:30120'
local name = GetPlayerName(PlayerId())
local id = GetPlayerServerId(PlayerId())


local onlinePlayers = GetNumberOfPlayers()

function SetRP()
  local name = GetPlayerName(PlayerId())
  local id = GetPlayerServerId(PlayerId())

  SetDiscordAppId(appid)
  SetDiscordRichPresenceAsset(image1)
  SetDiscordRichPresenceAssetSmall(image2)
  SetDiscordRichPresenceAssetSmallText(IP)
end

Citizen.CreateThread(function()
  while true do
    SetRP()
    SetDiscordRichPresenceAssetText("Player ID: " ..id.."")
    SetRichPresence("Name: " ..name.. " | Current Players: " ..onlinePlayers.. "")
    SetDiscordRichPresenceAction(0, "Join The Discord!", discord)
    SetDiscordRichPresenceAction(1, "Connect To FiveM!", "fivem://connect/" ..IP.. "")
      Wait(500)
  end

end)