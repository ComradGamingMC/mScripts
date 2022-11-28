Citizen.CreateThread(function()
	while true do
		local ped = PlayerPedId()
		if IsPedInAnyVehicle(ped) and IsControlJustPressed(2, 75) then
			local veh = GetVehiclePedIsIn(ped)
			local wasEngineRunning = GetIsVehicleEngineRunning(veh)
			if wasEngineRunning then
				while GetIsVehicleEngineRunning(veh) do
					Citizen.Wait(100)
				end
				SetVehicleEngineOn(veh, true, true, true)
			end
		end
		Citizen.Wait(10)
	end
end)

