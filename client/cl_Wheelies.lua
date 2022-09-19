local Wheelie = true


if Wheelie == true then
local function DrawLabelText(x, y, size, text)
    SetTextFont(4)
    SetTextCentre(0)
    SetTextProportional(1)
    SetTextScale(0.0, size)
    SetTextColour(255, 255, 255, 200)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(2, 0, 0, 0, 204)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x, y)
  end 
  local function GetVehicleWheelieState(vehicle)
    return Citizen.InvokeNative(GetHashKey("GET_VEHICLE_WHEELIE_STATE") & 0xFFFFFFFF, vehicle)
  end
  local function SetVehicleWheelieState(vehicle, state)
    return Citizen.InvokeNative(GetHashKey("SET_VEHICLE_WHEELIE_STATE") & 0xFFFFFFFF, vehicle, state)
  end
  
  local wheeliemodes = {
    [0] = "Tuner Disabled",
    [1] = "Muscle Car Mode",
    [2] = "Launch Mode",
    [3] = "Drag Car Mode"
  }
  
  Citizen.CreateThread(function()
    local mode = 0
    while true do
      Wait(1)
      local veh = GetVehiclePedIsIn(PlayerPedId(), false)
      if veh ~= 0 then
        local state = GetVehicleWheelieState(veh)
        local modetext = wheeliemodes[mode] or "Error 404: System Failure"
       -- DrawLabelText(0.87, 0.03, 0.45, "~c~Tuner Chip: ~p~" .. modetext .. "~c~ (" .. mode .. ")") -- Under Watermark
        DrawLabelText(0.16, 0.82,0.35, "~c~Tuner Chip: ~p~" .. modetext .. "~c~ (" .. mode .. ")") -- Under AutoPilot Text
        if mode == 2 or mode == 3 then
          if mode == 3 or (IsControlPressed(0, 76) and IsControlPressed(0, 71)) then -- space + w
            SetVehicleWheelieState(veh, 129)
          end
          -- some non-muscle vehicle can have not enough engine power to do wheelie
          -- so probably you will need to add torque/power multiplier
          if state == 129 and GetVehicleClass(veh) ~= 4 then
            SetVehicleEngineTorqueMultiplier(veh, 0.9)
          end
        elseif mode == 0 then
          SetVehicleWheelieState(veh, 1)
        end
        if IsControlPressed(0, 19) then -- LALT
          if IsControlJustPressed(0, 174) then -- Left Arrow
            mode = (mode - 1 < 0) and 3 or mode - 1
          end
          if IsControlJustPressed(0, 175) then -- Right Arrow
            mode = (mode + 1 > 3) and 0 or mode + 1
          end
        end
      end
    end
  end)
end