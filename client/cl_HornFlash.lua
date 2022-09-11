
--- Config ---
--RestrictEmer = false -- Only allow the feature for emergency vehicles.
lightMultiplier = 5.0 -- This is not capped, highly recommended to go above 12.0!

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
		local ped = GetPlayerPed(-1)
        if IsPedInAnyVehicle(ped, false) then
			local veh = GetVehiclePedIsUsing(ped)
            if GetPedInVehicleSeat(veh, -1) == ped then
             --   if RestrictEmer then
                    if GetVehicleClass(veh) == 18 then
                        if IsDisabledControlJustPressed(0, 86) then
                            SetVehicleLights(veh, 2)
                            SetVehicleLightMultiplier(veh, lightMultiplier)
                        elseif IsDisabledControlJustReleased(0, 86) then
                            SetVehicleLights(veh, 0)
                            SetVehicleLightMultiplier(veh, 1.0)
                      --  end
                    end
                else
                    if IsDisabledControlJustPressed(0, 86) then
                        SetVehicleLights(veh, 2)
                        SetVehicleLightMultiplier(veh, lightMultiplier)
                    elseif IsDisabledControlJustReleased(0, 86) then
                        SetVehicleLights(veh, 0)
                        SetVehicleLightMultiplier(veh, 1.0)
                    end
                end
            end
        end
	end
end)