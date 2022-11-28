RegisterCommand('dv', function()
    local playerPed = PlayerPedId()

    local vehicle = GetVehiclePedIsIn(playerPed, false)
    
    DeleteEntity(vehicle)
end, false)