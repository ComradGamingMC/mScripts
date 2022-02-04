CreateThread(function()
	while true do

		SetDiscordAppId(371450276688953376)
		SetDiscordRichPresenceAsset('mds')
		SetDiscordRichPresenceAssetText('Matts Dev Server')
		SetDiscordRichPresenceAssetSmall('discord')
		SetDiscordRichPresenceAssetSmallText('https://discord.gg/9BWKde9')

		SetDiscordRichPresenceAction(0, 'Play Now', 'fivem://connect/67.181.133.245:30120')

		Wait(60000)
	end
end)
