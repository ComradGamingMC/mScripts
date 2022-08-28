local shuffling = false
local ped = PlayerPedId()

RegisterCommand('shuff', function()
    if IsPedInAnyVehicle(ped) then
        local veh = GetVehiclePedIsIn(ped)
        local seat = 0
        if GetPedInVehicleSeat(veh, -1) == ped then
			seat=-1
		end
        shuffling = true
        TaskShuffleToNextVehicleSeat(ped, veh)
        while GetPedInVehicleSeat(veh, seat) == ped do
            Citizen.Wait(10)
        end
        shuffling = false
    end
end)

Citizen.CreateThread(function()
    SetPedConfigFlag(ped, 184, true)
    while true do
		local ped = PlayerPedId()
        if IsPedInAnyVehicle(ped) then
            local veh = GetVehiclePedIsIn(ped)
            if GetIsTaskActive(ped, 165) and not shuffling then
                local seat=0
                if GetPedInVehicleSeat(veh, -1) == ped then
                    seat=-1
                end
                SetPedIntoVehicle(ped, GetVehiclePedIsIn(ped), seat)
            end
        end
        Citizen.Wait(0)
    end
end)
