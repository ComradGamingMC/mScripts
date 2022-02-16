local Flashlights = {}

-- Remove flashlights of players who are no longer in server
AddEventHandler("playerDropped", function ()
    if Flashlights[source] then Flashlights[source] = nil end

    TriggerClientEvent("Weapons:Client:Return", -1, Flashlights)
end)

-- Toggle client flashlight status
RegisterServerEvent("Weapons:Server:Toggle")
AddEventHandler("Weapons:Server:Toggle", function(bool, flashlight, weapon)
    if bool then
        Flashlights[source] = {flashlight, weapon}
    else
        Flashlights[source] = nil
    end

    TriggerClientEvent("Weapons:Client:Return", -1, Flashlights)
end)