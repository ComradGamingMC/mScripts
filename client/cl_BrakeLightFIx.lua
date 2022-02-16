local brakeLightSpeedThresh = 0.25

Citizen.CreateThread(function()
	while true do
        Citizen.Wait(0)
        
        local player = GetPlayerPed(-1)
        local vehicle = GetVehiclePedIsIn(player, false)
        if (vehicle ~= nil) and (GetEntitySpeed(vehicle) <= brakeLightSpeedThresh) then
            SetVehicleBrakeLights(vehicle, true)
        end
	end
end)