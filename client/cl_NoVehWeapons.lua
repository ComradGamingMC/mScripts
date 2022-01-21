if Config.disablevehicleweapons then
    Citizen.CreateThread(function()
        while true do
        local wait = 500
            local playerped = PlayerPedId()
            if IsPedInAnyVehicle(playerped, false) then
                wait = 0
                local veh = GetVehiclePedIsUsing(playerped)
                if DoesVehicleHaveWeapons(veh) == 1 and vehicleweaponhash ~= 1422046295 then
                    vehicleweapon, vehicleweaponhash = GetCurrentPedVehicleWeapon(playerped)
                    if vehicleweapon == 1 then
                        DisableVehicleWeapon(true, vehicleweaponhash, veh, playerped)
                    end
                end
            end
            Citizen.Wait(wait)
        end
    end)
    end