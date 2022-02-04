Citizen.CreateThread(function()
	local MaxSpeedCanFire = 45
	while true do
		Wait(35)
	    if IsPedSittingInAnyVehicle(GetPlayerPed(-1)) and
	    	GetPedInVehicleSeat(GetVehiclePedIsIn(GetPlayerPed(-1), false), -1) == GetPlayerPed(-1) and
	    	GetEntitySpeed(GetVehiclePedIsIn(GetPlayerPed(-1), false)) * 2.23 > MaxSpeedCanFire
	    	then
	    	DisablePlayerFiring(GetPlayerPed(-1), true)
	    end
  	end
end)