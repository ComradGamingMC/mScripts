	--/twt Command
	RegisterCommand('twt', function(source, args, user)
        TriggerClientEvent('chatMessage', -1, "^0^*[^4Twitter^0] (^5@" .. GetPlayerName(source) .. "^0)^r", {30, 144, 255}, table.concat(args, " "))
        end, false) 