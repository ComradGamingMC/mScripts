Citizen.CreateThread(function()
    while true do
        HideHudComponentThisFrame(1) -- Wanted Stars, This is just incase players glitch out the system.
        HideHudComponentThisFrame(6) --Hides Vehicle Name, As Player gets in.
        HideHudComponentThisFrame(7) --Hides name of Area.
        HideHudComponentThisFrame(8) --Hides What Class the Vehicle is.
        HideHudComponentThisFrame(9) --Hides Street names as your driving
        HideHudComponentThisFrame(20) -- Hides Stats of Weapon When in Wheel.
        Citizen.Wait(1)
    end
end)
