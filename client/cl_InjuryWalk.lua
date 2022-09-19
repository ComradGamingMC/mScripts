
local Config = {}
Config.BloodEffects = {
	'Skin_Melee_0',
	'Useful_Bits',
	'Explosion_Med',
	'BigHitByVehicle',
	'Car_Crash_Heavy',
	'HitByVehicle',
	'BigRunOverByVehicle'
}
local FireMode = {}
FireMode.Limp = -1

-- Injury loop
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)

		local PlayerPed = PlayerPedId()
		if HasEntityBeenDamagedByAnyPed(PlayerPed) then
			ClearEntityLastDamageEntity(PlayerPed)

			if not HasAnimDictLoaded('move_m@injured') then
				RequestAnimDict('move_m@injured')
				while not HasAnimDictLoaded('move_m@injured') do
					Citizen.Wait(0)
				end
			end

			-- Random blood effect
			local Effect = Config.BloodEffects[math.random(#Config.BloodEffects)]
			-- Apply random effect to ped
			ApplyPedDamagePack(PlayerPed, Effect, 0, 0)
			-- Set limp
			SetPedMovementClipset(PlayerPed, 'move_m@injured', 5.0)
			-- Add random amount of limping time
			FireMode.Limp = FireMode.Limp + math.random(100, 200)
		end

		-- While there is still limp time remaining
		if FireMode.Limp > 0 then
			-- Remove 1 tick from limp time
			FireMode.Limp = FireMode.Limp - 1
		end

		-- When there is no limp time remaining
		if FireMode.Limp == 0 then
			-- Remove walking effect
			ResetPedMovementClipset(PlayerPed, false)
			-- Reset limp timer
			FireMode.Limp = -1
		end
	end
end)
