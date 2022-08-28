local config = {
    ["weapon"] = { "WEAPON_REVOLVER", "WEAPON_APPISTOL", "WEAPON_PISTOL", "WEAPON_PISTOL_MK2", "WEAPON_COMBATPISTOL", "WEAPON_PISTOL50", "WEAPON_SNSPISTOL", "WEAPON_HEAVYPISTOL", "WEAPON_VINTAGEPISTOL", "WEAPON_PUMPSHOTGUN", "WEAPON_SNSPISTOL_MK2", "WEAPON_REVOLVER_MK2" },
    ["peds"] = {
        ["mp_m_freemode_01"] = { -- Male multiplayer ped
            ["components"] = {
                [7] = { -- Component ID, "Neck" or "Teeth" category
                    [1] = 3, -- Drawable ID, can specify multiple, separated by comma and or line breaks
                    [6] = 5,
                    [8] = 2,
                    [42] = 43
                },
                [8] = { 
                    [16] = 18
                }
            }
        },
        ["mp_f_freemode_01"] = { -- Female multiplayer ped
            ["components"] = {
                [7] = { -- Component ID, "Neck" or "Teeth" category
                    [1] = 3,
                    [6] = 5,
                    [8] = 2,
                    [29] = 30,
                    [81] = 82
                }
            }
        },
    }
}

local enabled = true
local active = false
local ped = nil -- The hash of the current ped
local currentPedData = nil -- Config data for the current ped
local weapons = { }

function table_invert(t)
    local s={}
    for k,v in pairs(t) do
        s[v]=k
    end
    return s
end

-- Returns if the given weapon (hash) is in the config
function isConfigWeapon(weapon)
    return weapons[weapon] ~= nil
end

-- Adds the weapon hash to the 'weapons' table, for a given string or hash
local function loadWeapon(weapon)
    local hash = weapon
    if not tonumber(weapon) then -- If not already a hash
        hash = GetHashKey(weapon)
    end
    if not IsWeaponValid(hash) then 
        error('Invalid weapon ' .. tostring(weapon))
    end
    if isConfigWeapon(weapon) then return end -- Don't add duplicate weapons
    weapons[hash] = true
end

if type(config.weapon) == 'table' then
    for _, weapon in ipairs(config.weapon) do
        loadWeapon(weapon)
    end
else -- Backwards compatibility for old config versions where 'config.weapon' was just a string
    loadWeapon(config.weapon)
end

-- Slow loop to determine the player ped and if it is of interest to the algorithm
Citizen.CreateThread(function()
    while true do
        ped = GetPlayerPed(-1)
        local ped_hash = GetEntityModel(ped)
        local enable = false -- We updated the 'enabled' variable in the upper scope with this at the end
        -- Loop over peds in the config
        for config_ped, data in pairs(config.peds) do
        if GetHashKey(config_ped) == ped_hash then 
            enable = true -- By default, the ped will have its holsters enabled
            if data.enabled ~= nil then -- Optional 'enabled' option
            enable = data.enabled
            end
            currentPedData = data
            break
        end
        end
        active = enable
        Citizen.Wait(5000)
    end
end)

-- Faster loop to change holster textures
local last_weapon = nil -- Variable used to save the weapon from the last tick
Citizen.CreateThread(function()
    while true do
        if active and enabled then
        current_weapon = GetSelectedPedWeapon(ped)
        if current_weapon ~= last_weapon then 
            for component, holsters in pairs(currentPedData.components) do
                local holsterDrawable = GetPedDrawableVariation(ped, component) 
                local holsterTexture = GetPedTextureVariation(ped, component) 

                local emptyHolster = holsters[holsterDrawable] 
                if emptyHolster and isConfigWeapon(current_weapon) then
                    SetPedComponentVariation(ped, component, emptyHolster, holsterTexture, 0)
                    break
                end

                local filledHolster = table_invert(holsters)[holsterDrawable] 
                if filledHolster and not isConfigWeapon(current_weapon) then
                    SetPedComponentVariation(ped, component, filledHolster, holsterTexture, 0)
                    break
                end
            end
        end
        last_weapon = current_weapon
        end
        Citizen.Wait(200)
    end
end)