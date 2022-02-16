

CreateThread(function()
	while true do
		local player = GetPlayerPed(-1)

		SetDiscordAppId(667314714791116810)
		SetDiscordRichPresenceAsset('dev2')
		SetDiscordRichPresenceAssetText('Matts Dev Server')
		SetDiscordRichPresenceAssetSmall('discord2')
		SetDiscordRichPresenceAssetSmallText('https://discord.gg/9BWKde9')

		SetDiscordRichPresenceAction(0, 'Play Now', 'fivem://connect/67.181.133.245:30120')
		SetDiscordRichPresenceAction(1, 'Join The Discord', 'https://discord.gg/9BWKde9')
		

		Wait(60000)
	end
end)
