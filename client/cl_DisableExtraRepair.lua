local localPlayerPed = GetPlayerPed(-1)
local vehicle = GetVehiclePedIsIn(localPlayerPed)

Citizen.CreateThread(function()
    while true do 
            Citizen.Wait(1)
        SetVehicleAutoRepairDisabled(vehicle, true)
    end 
end) 