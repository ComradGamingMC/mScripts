local AntiWheelie = false


if AntiWheelie == true then
Citizen.CreateThread(function()
    while true do
      Wait(1)
  
      local ped = PlayerPedId()
      local veh = GetVehiclePedIsUsing(ped)
  
      if veh ~= 0 then
        if GetVehicleClass(veh) == 4 then 

          if GetPedInVehicleSeat(veh, -1) == ped then
            SetVehicleWheelieState(veh, 1)
          end
        end
      end
    end
  end)
end

