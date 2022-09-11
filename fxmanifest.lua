fx_version 'cerulean'
game { 'gta5' }

name 'mScripts'
author 'Mathew Loveless <mloveless7@yahoo.com> (https://github.com/ComradGamingMC/)'
description 'Custom Scripting Package For General FiveM Usage'
Version '1.5'
url 'https://github.com/ComradGamingMC/mScripts'

files{
	'**/weaponcomponents.meta',
	'**/weaponarchetypes.meta',
	'**/weaponanimations.meta',
	'**/pedpersonality.meta',
	'**/weapon_fiveseven.meta',
    '**/weapon_m700.meta',
    '**/weapon_sledgehammer.meta',
}

data_file 'WEAPONCOMPONENTSINFO_FILE' '**/weaponcomponents.meta'
data_file 'WEAPON_METADATA_FILE' '**/weaponarchetypes.meta'
data_file 'WEAPON_ANIMATIONS_FILE' '**/weaponanimations.meta'
data_file 'PED_PERSONALITY_FILE' '**/pedpersonality.meta'
data_file 'WEAPONINFO_FILE' '**/weapon_fiveseven.meta'
data_file 'WEAPONINFO_FILE' '**/weapon_m700.meta'
data_file 'WEAPONINFO_FILE' '**/weapon_sledgehammer.meta'


client_script 'cl_weaponNames.lua'


data_file 'HANDLING_FILE' 'dat/handling.meta'

files {
	'dat/*.dat',
	'dat/*.meta',
    "nui.html",
    "images/*.png"
}

ui_page "nui.html"
--Better Torch https://forum.cfx.re/t/release-bettertorch/451106
server_script "BetterTorch.Server.net.dll"
client_script "BetterTorch.Client.net.dll"

client_scripts {
	"client/rageui/RMenu.lua",
    "client/rageui/menu/RageUI.lua",
    "client/rageui/menu/Menu.lua",
    "client/rageui/menu/MenuController.lua",
    "client/rageui/components/*.lua",
    "client/rageui/menu/elements/*.lua",
    "client/rageui/menu/items/*.lua",
    "client/rageui/menu/panels/*.lua",
    "client/rageui/menu/windows/*.lua",
    'client/rageui/example.lua',
	"client/*.lua",
    "lib/enum.lua"
}


server_scripts {
    "server/*.lua"
}

shared_script 'config.lua'
dependencies {
	'mNotify'
}