Citizen.CreateThread(function() -- No Local Sirens
    while true do
        DistantCopCarSirens(false)
        Citizen.Wait(400)
    end
end)


Citizen.CreateThread(function() -- No Player Wanted
    while true do
        Citizen.Wait(0)
        if GetPlayerWantedLevel(PlayerId()) ~= 0 then
            SetPlayerWantedLevel(PlayerId(), 0, false)
            SetPlayerWantedLevelNow(PlayerId(), false)
        end
    end
end)

Citizen.CreateThread(function()
	for i = 1, 12 do
		Citizen.InvokeNative(0xDC0F817884CDD856, i, false)
	end
end)

Citizen.CreateThread(function() -- Remove Random Cops

    SetCreateRandomCops(false) 
    SetCreateRandomCopsNotOnScenarios(false) 
    SetCreateRandomCopsOnScenarios(false) 

    while true do
        RemoveAllPickupsOfType(0xF9AFB48F) 
        RemoveAllPickupsOfType(-546236071) 
        Citizen.Wait(1)
    end
end)

Citizen.CreateThread(function() -- No Vehicle Rewards
	while true do
		Citizen.Wait(10)
		DisablePlayerVehicleRewards(PlayerId())
	end
end)


Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)

		RemoveAllPickupsOfType(GetHashKey('PICKUP_WEAPON_CARBINERIFLE'))
		RemoveAllPickupsOfType(GetHashKey('PICKUP_WEAPON_PISTOL'))
		RemoveAllPickupsOfType(GetHashKey('PICKUP_WEAPON_PUMPSHOTGUN'))
	end
end)