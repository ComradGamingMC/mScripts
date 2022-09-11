

Citizen.CreateThread(function()
	local resetSpeedOnEnter = true
	local enabled = false
	while true do
		Citizen.Wait(10)
		local playerPed = GetPlayerPed(-1)
		local vehicle = GetVehiclePedIsIn(playerPed, false)

		-- This should only happen on vehicle first entry to disable any old values
		if GetPedInVehicleSeat(vehicle, -1) == playerPed and IsPedInAnyVehicle(playerPed, false) then
			if resetSpeedOnEnter then
				maxSpeed = GetVehicleHandlingFloat(vehicle,"CHandlingData","fInitialDriveMaxFlatVel")
				SetEntityMaxSpeed(vehicle, maxSpeed)
				resetSpeedOnEnter = false
				enabled = false
			end
			if IsControlJustReleased(1, 29) and GetLastInputMethod(2) then
				if not enabled then
					cruise = GetEntitySpeed(vehicle)
					SetEntityMaxSpeed(vehicle, cruise)
					cruise = math.floor(cruise * 2.236936 + 0.5)
					showHelpNotification('~c~[~r~AutoPilot~c~]~w~ Cruise Control Enabled', cruise)
					enabled = true
				else
					showHelpNotification('~c~[~r~AutoPilot~c~]~w~ Cruise Control Disabled')
					maxSpeed = GetVehicleHandlingFloat(vehicle,"CHandlingData","fInitialDriveMaxFlatVel")
					SetEntityMaxSpeed(vehicle, maxSpeed)
					enabled = false
				end
			end
		else
			resetSpeedOnEnter = true
		end
	end
end)

function showHelpNotification(text)
	BeginTextCommandDisplayHelp("STRING")
	AddTextComponentSubstringPlayerName(text)
	EndTextCommandDisplayHelp(0, 0, 1, -1)
end