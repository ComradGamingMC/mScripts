local AdStyle = 3
	--/ad Command
	RegisterCommand('ad', function(source, args, user)
			if AdStyle == 1 then
				TriggerClientEvent('chatMessage', -1, "^0^*[^1Advertisement^0] " .. GetPlayerName(source), {255,215,0}, table.concat(args, " ")) --ADVERT WITH USERNAME
			elseif AdStyle == 2 then
				TriggerClientEvent('chatMessage', -1, "^0^*[^1Advertisement^0] (^1@" .. GetPlayerName(source) .. "^0)^r", {255,215,0}, table.concat(args, " ")) --ADVERT WITH TWITTER STYLE USERNAME HANDLE
			elseif AdStyle == 3 then
				TriggerClientEvent('chatMessage', -1, "^0^*[^1Advertisement^0]^r", {255,215,0}, table.concat(args, " ")) --ADVERT WITH NO USERS IDENTIFIER
			end
	end, false)