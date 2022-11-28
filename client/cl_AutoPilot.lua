local supportedcars = {
    'raiden',
    'TESLAXAMBULANCE',
    'deluxo',
    'rrevo9'
}
local autopilot = false

function supported(Vehicle)
    for k,v in pairs(supportedcars) do
        if GetEntityModel(Vehicle) == GetHashKey(v) then
            return true
        end
    end
    return false
end

local lastcoords = ""
local speed = 0
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        local Vehicle = GetVehiclePedIsUsing(PlayerPedId()) 
        if supported(Vehicle) then
            if GetPedInVehicleSeat(Vehicle, -1) == PlayerPedId() then
                if autopilot == true then
                    local coords = Citizen.InvokeNative(0xFA7C7F0AADF25D09, GetFirstBlipInfoId(8), Citizen.ResultAsVector())
                    if (coords.x == 0 and coords.y == 0 and coords.z == 0) == false and lastcoords ~= coords then
                        lastcoords = coords
                        TaskVehicleDriveToCoord(PlayerPedId(), Vehicle,coords.x,coords.y,coords.z, 400.0, 0,GetEntityModel(Vehicle),786603, 10.0, true)
                        SetPedKeepTask(PlayerPedId(), true)
                        speed = GetEntitySpeed(Vehicle) * 2.236936 + 0.5
                        if speed < 50.0 then
                            speed = 50
                        end
                    elseif lastcoords == coords then
                        SetEntityMaxSpeed(Vehicle, speed/2.236936 + 0.5)
                    end
                    if GetDistanceBetweenCoords(coords, GetEntityCoords(PlayerPedId()), false) <= 25.0 then
                        ClearPedTasks(PlayerPedId())
                        ClearPedSecondaryTask(PlayerPedId())
                        TriggerEvent("pNotify:SendNotification",{text = "Destination reached!",type = "success",timeout = (5000),layout = "centerLeft",queue = "global",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
                    end
                    if IsControlJustPressed(0, 79) then
                        autopilot = "stop"
                        ClearPedTasks(PlayerPedId())
                        ClearPedSecondaryTask(PlayerPedId())
                    end
                    if IsControlJustPressed(0, 173) then
                        if speed >= 6 then
                            local Slower = speed-10
                            speed = Slower
                            SetEntityMaxSpeed(Vehicle, speed/2.236936 + 0.5)
                        end
                    elseif IsControlJustPressed(0, 27) then
                        if speed <= 200 then
                            local Faster = speed+10
                            speed = Faster
                            SetEntityMaxSpeed(Vehicle, speed/2.236936 + 0.5)
                        end
                    end
                    drawTxt(0.660,1.355, 1.0,1.0,0.35, "~w~PRESS UP/DOWN ARROW FOR SPEED", 255, 0, 0, 255)
                    drawTxt(0.660,1.330, 1.0,1.0,0.35, "~w~Speed: ~y~"..speed.."~w~ MPH", 255, 0, 0, 255)
                    drawTxt(0.660,1.375, 1.0,1.0,0.35, "~g~AUTOPILOT", 255, 0, 0, 255)
                elseif autopilot == "stop" then
                    autopilot = false
                    ClearPedTasks(PlayerPedId())
                    ClearPedSecondaryTask(PlayerPedId())
                    SetEntityMaxSpeed(Vehicle, 99999/2.236936 + 0.5)
                elseif autopilot == false then
                    drawTxt(0.660,1.295, 1.0,1.0,0.35, "~w~PRESS C FOR ~r~AUTOPILOT", 255, 0, 0, 255)
                    if IsControlJustPressed(0, 79) then
                        autopilot = true
                        lastcoords = ""
                        speed = 0
                    end
                end
            end
        end
    end
end)

function drawTxt(x,y ,width,height,scale, text, r,g,b,a)
    SetTextFont(4)
    SetTextProportional(0)
    SetTextScale(scale, scale)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(2, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x - width/2, y - height/2 + 0.005)
end