--[[
local FireMode = {}
-- Weapons the client currently has
FireMode.Weapons = {}
-- Weapons the client currently has with flashlights on
FireMode.WeaponFlashlights = {}
-- Last weapon in use
FireMode.LastWeapon = false
-- Last weapon type in use
FireMode.LastWeaponActive = false
-- Is shooting currently disabled?
FireMode.ShootingDisable = false
-- Is the client reloading?
FireMode.Reloading = false --]]


-- When the player spawns (or respawns after death)
AddEventHandler('playerSpawned', function ()
	-- Remove all blood effects
	-- Does no seems to work 100% of the time, reason unclear.
	ClearPedBloodDamage(PlayerPedId())
	--[[ Remove all weapons stored
	FireMode.Weapons = {}
	-- Reenable shooting
	FireMode.ShootingDisable = false
	-- Enable reloading
	FireMode.Reloading = false
	-- Remove last weapon
	FireMode.LastWeapon = false
	-- Remove last weapon type
	FireMode.LastWeaponActive = false
	-- Remove all active local flashlights
	TriggerServerEvent('Weapons:Server:Toggle', false)
	FireMode.WeaponFlashlights = {} --]]
end)
