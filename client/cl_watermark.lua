Citizen.CreateThread(function()
	while true do  
        Wait(1)      
            SetTextColour(240, 251, 206, 177) -- Text Color
            SetTextFont(4) -- https://wiki.rage.mp/index.php?title=Fonts_and_Colors
            SetTextScale(0.45, 0.45) -- Text Size
            SetTextWrap(0.0, 1.0)
            SetTextCentre(false) -- NOT CENTED 
            SetTextDropshadow(2, 2, 0, 0, 0) 
            SetTextEdge(1, 0, 0, 0, 204)
            SetTextEntry("STRING")
            AddTextComponentString('Matts Dev Server' .. ' - ' .. 'discord.gg/9BWKde9')
            DrawText(0.830, 0.001) -- Location on Screen
            
        end
end)