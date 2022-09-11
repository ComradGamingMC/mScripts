-----------------------------------------------
-- Bullet Proof Tire restrict, Made by FAXES --
-----------------------------------------------

--- Config ---

showMessage = true -- Show the message? https://faxes.zone/imagebanks/45ik2.png
restrictMessage = "~r~This mod is restricted." -- Message displayed if one is found with bullet proof tires

--- Code ---

function ShowNotification(text)
    SetNotificationTextEntry("STRING")
	AddTextComponentString(text)
	DrawNotification(false, false)
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(500)
        local ped = GetPlayerPed(-1)
        local veh = GetVehiclePedIsUsing(ped)
        
        if IsPedInAnyVehicle(ped, false) then
            if not GetVehicleTyresCanBurst(veh) then
                SetVehicleTyresCanBurst(veh, true)
                if showMessage then
                    ShowNotification(restrictMessage)
                end
            end
        end
	end
end)