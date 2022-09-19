local Healing = true

local Blips = {{
    -- Central Los Santos Medical Center
    x = 338.85,
    y = -1394.56,
    z = 31.55,
},{
    -- Mount Zonah Medical Center
    x = -449.67,
    y = -340.83,
    z = 33.55,
}, {
    -- Pillbox Hill Medical Center
    x = 356.70,
    y = -595.00,
    z = 27.85,
}, {
    -- Sandy Shores Medical Center
    x = 1839.32,
    y = 3673.26,
    z = 33.30,
}, {
    -- Paleto Bay Care Center
    x = -247.48,
    y = 6332.39,
    z = 31.50,
}, {
    -- Franklins Storage Room
    x = -17.1,
    y = -1430.3,
    z = 30.1,
}}


-- Notification above map
function DisplayNotification(text)
    SetNotificationTextEntry('STRING')
    AddTextComponentString(text)
    DrawNotification(false, false)
end

-- Help text top left of screen
function DisplayHelpText(text, state)
    SetTextComponentFormat("STRING")
    AddTextComponentString(text)
    DisplayHelpTextFromStringLabel(0, state, 0, -1)
end
if Healing == true then
-- Create healing pads blips
Citizen.CreateThread(function()
    for _, item in pairs(Blips) do
        item.blip = AddBlipForCoord(item.x, item.y, item.z)
        -- refer to this for the blips ids and colors https://docs.fivem.net/docs/game-references/blips/
        SetBlipSprite(item.blip, 489)
        SetBlipColour(item.blip, 35)
        SetBlipDisplay(item.blip, 4)
        SetBlipAsShortRange(item.blip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString("Hospital")
        EndTextCommandSetBlipName(item.blip)
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        ped = PlayerPedId()
        for _, item in pairs(Blips) do
            -- Get distance from healing pad
            distance = #(GetEntityCoords(ped) - vector3(item.x, item.y, item.z))
            if distance <= 15.0 then
                -- 23 is the marker type, refer to this if you want to change it https://docs.fivem.net/docs/game-references/markers/
                -- 248, 138, 138 are the RGB values that determines the color of the blip
                DrawMarker(23, item.x, item.y, item.z, 0, 0, 0, 0, 0, 0, 1.75, 1.75, 1.0, 248, 138, 138, 128)
                if distance <= 2.0 then
                    DisplayHelpText("Press ~INPUT_VEH_HORN~ to get treated by hospital staff", 0)
                    -- Default key is E (38). Refer to this if you want to change it https://docs.fivem.net/docs/game-references/controls/
                    if (IsControlJustPressed(1, 38)) then
                        if (GetEntityHealth(ped) < 300) then                          
                            SetEntityHealth(ped, 200)
                            ClearPedBloodDamage(PlayerPedId())
                                DisplayNotification("~g~You have been succesfully treated.")
                            end
                        end
                    end
                end
            end
        end
end)
end

