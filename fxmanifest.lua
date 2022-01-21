fx_version 'cerulean'
game { 'gta5' }
author 'Mathew Loveless <mloveless7@yahoo.com>'
description 'Custom Scripting Package For General FiveM Usage'
Version '1.0.0'


files {
	'dat/*.dat',
	'dat/*.meta'
}
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
	"client/*.lua"
}


server_scripts {
    "server/*.lua"
}

shared_script 'config.lua'
dependencies {
	'mNotify'
}