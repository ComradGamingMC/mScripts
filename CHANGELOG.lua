## 1.7

    * Added Files:
     * AntiWheelie - Does what you think. Stops u from Wheeling (Must be enabled)
     * Healing - Allows players allowed to goto different locations and get healed for free.
     * Hud Location - THis adds The Location You are at, Direction of Travel & Time and Postal if enabled
     * Disable Vehicle Radios - Makes it so players can use vehicle radios, Sense they all turn them off anyways.
     * Reset World - Got a Modder? Use /reset to remove all current vehicles and props on the map. WIll reset everything like u restarted it.
     * Admin Delete Vehicle - Allows people with group.admin perms to remove all vehicles without people in them. Different from reset world.
     * Real Weapon Damage, Change Weapon Damage Multipler in WeaponDamage.lua (Marked what weapons are LEO Weapons)
     * Added Repair Locations, You can add more in cl_vehicleRepairSpots.lua 
     * AFKKick TImer, Will auto kick someone for being AFK after x seconds, CHange in cl_AFKKick.lua change kick message in sv_AFKKick.lua
     * Ragdoll when shot, Will cause players to ragdoll when being shot by someone {WIP}
        
    * Removed Files: 
        * Binoculars Scripts- THis was removed due to it being broken, Will return in later update when i get it working 100% right
        * Dancing Scrupt - This was removed because i have noticed its not a used much thing and can be replaced by DPEmotes.
    * Changed Files:
        * Hands Up File is now runs faster, and recoded to reduce any lagg. 
        * Changed BetterAI so they wont shoot you.
        * Cleaned up Crouching script removed unused code.
        * Cleaned up/ Added to Discord.lua More professional look.
        * Recoded / Fixed Injury Walk now when a player is damaged their walk will change.
## 1.6 

    Added - 3DDO - This is the same as 3dme just command changed for what some players may be use to.
    Added - Piggyback Scripting, Players can now type /piggyback or /pb and piggyback off other players
    Added - Sync, This is vSync so this syncs weather and adds weather commands, Will be adding nmore commands for weather soon.
    Added - VehAutoPilot - When you press C it will auto drive select vehicles to a waypoint, Vehicles can be added in cl_AutoPilot.lua 
    Added - NpcPlateChange - Auto Changes plates on all vehicles
    Added - Cruise Control  Allows you to enable a max speed limit for the vehicle you are currently driving.
    Update - Added Second AntiCop Method for Weapons from Police Vehicles
    Added - InteriorLights, Allows lights to be turned on and off w/ key. Default Key "L"
    Added - Reporting System. Allows players to report Other players for things via ID. Can be seen in-game and in discord logs.
    Added - /dv, Yes i know, Should of been added forever again. But i did it now lol. 
    Added - Plane Smoke, THis allows players to turn on chem trails for planes while flying and doing stunts.
    Removed - Car Command. This is kinda pointless because you can spawn through vMenu and control it better
    Added - Hiding in Trash Cans. This new feature will allows players to Hide inside Trash Cans around the city
    Added - Horn Light Flashing. When Honking the horn in a Vehicle will cash the headlights to flash
    Added - Anti Popping Tires. Prevents people from having unpopable tires even if its a saved vehicle.
    Added - BetterAI - This should help Local AI, Not just hate players and will not make them freakout when shots are fired as much.

## 1.5 

   UPDATED cl_SeatShuffle.lua - Complete Recode. No Longer has old Code, 3x Less code doing same Actions (REPLACE FILE)
   ADDED - VehRunning.lua - Makes it so when a player gets out Vehicle does not turn off | Maybe Will add Shutoff Key? Unsure. (ADD FILE)
   ADDED - WeaponHolsters - Adds Holster Animations for EUP Holsters, More can always be added by yourself if you have custom ones. (ADDFILE)
   Removed - No Local Sirens (remove File)
   Removed - NoNPCWanted (remove File)
   Removed - NoNPCDrops (remove File)
   Added - AntiCop - This is everything for local cops, NoNPCwanted & NoNPCDrops & cl_NoLocalSirens Where combined into here (ADD FILE)
   Added - HudClean - Cleans up the hud, Removes things like Vehicle name, Vehicle Class ext.
   Change - Enabled HUD (Can Be changed in WeaponMods line 332 remove the --)
   Change - Cleaned up cl_Blips and removed alot of the spacing and added Mission Row PD to blips.

## 1.0.4 (suggested replace)
    Removed - All Weapon Models removed and moved to mWeapons (Coming Soon)
    FIXED - Code that was not working and or went missing. 

## 1.0.3 
    ADDED - cl_InjuryWalk - Makes it so when a player is damage they walk with the injuried walk.
    ADDED - cl_WeaponMods - Makes it so when you turn on the Flashlight, It stays on Until turned off [E]
    ADDED - Death Reset - Resets the player PED After deather so there not blood on them after they respawn
    UPDATE - Discord.lua Added a Join Discord Button. 
    ADDED - Take Hostage - Allows people to take someone hostage and hold them at gun point.
    ADDED - AntiVehRoll - Stops people after rolling a veh from just rolling them back over.
    UPDATED - NoNPCDrop - Changed the script update the code to make it faster.
    ADDED - Handling.meta - Minor changes to all vehicles nothing major. 
    ADDED - Break Light FIx - Makes it so Brakes light auto come on when the vehicle is not moving.
    ADDED - Custom Weapon - New Custom Addon Weapons that can be spawned via WEAPON_{NMAE} - FIVESEVEN
    ADDED - NPCAI - This small script adds workers into Shops, Like clothing, 24/7, and, Banks ext.
    UPDATED - NoNPCWanted Optimised the Code, To make it run Fast & Less Taxing on Servers. 
    UPDATED - NoVehWeapons - Updated Code & more effective & runs faster
    UPDATED cl_PauseMenu - Removed some lines of code, While i learn more about this, (Can Disble by adding .dis after the .lua)
    ADDED - TakeHostage - Added a thake Hostage Script to allow players to take someone hostage
    UPDATED - TrunkHide - Last one was coded for ESX, New one is Coded for Standalone. Working on recode for old code.
    ADDED - WeapoonMods - Adds Multi Features like Disabling Weapon Reticle, Added Presistant Weapon Flashlight, Firing Mode (Semi, 3 Round Burst, FUll Auto)
    ADDED - WeaponNames - For Custom Weapons it gives the there set name for in-game 
    ADDED - HTML Folder, FOr Firing Modes 

## 1.0.2 
    ADDED - cl_NoLocalSirens.lua - Removes Local/Ambent Sirens in the back ground.
    ADDED - cl_Binoculars.lua Allows you to use Bonculars to view things from a far [Numpad 4]
    CHANGES - Removed Current Weapons to find new and better Models
    ADDED - CHANGELOG.lua - Your viewing it right now...... Still got questions what this is. 
    ADDED - cl_XMAS.lua - This is a XMAS Scripts to make it snow (Must be enabled) but also allows to pickup snowballs.
    ADDED - cl_StaminaFix.lua - Fixed Stamina so it dont run out so fast rn.
    ADDED - cl_KnockedOut.lua - Knocked out script, So you can be "Knocked out" but not dead.
    ADDED - cl_DriveBySpeed.lua - Allows you to limit the max speed for shooting out of the vehicle.
    ADDED - cl_TrunkHide - Simple Script to hide in the trunks of vehicles.
    ADDED - cl_WeaponOnBack - Puts Larger weapons on back.
    ADDED - cl_PauseMenu - Allows you to change things on the oause menu.
    ADDED - New Custom Weapon NOTE: There are Multiple taser you can chose between ESX/QBCore User can use all, Just have to add the Taser meta
    ADDED - cl_Main - This legit just holds threads for adding chat commands.
    ADDED - sv_AdvertisementCMD - Allows your to send a Advertisement for a company for anything in-general 
    ADDED - sv_TwtCmd - Allows players to use Twitter in chat instead of like on a Phone.
    ADDED - cl_PauseMenu - This is still a work in progress but the basic functions are there and usable.
    REPLACEED - Removed/Replaced the Knightstick.lua and Fistfight.lua with WeaponDamage.lua this will hold more weapon buff/debuffs later on down the road. 
    ADDED - TrunkHide.lua this allows players to hide within a trunk of a vehicle.
    ADDED - New Weapon Models all located in the Stream Folder

## 1.0.1 
    Bug Fix - Fixed cl_NoVehWeapon not working 

 ## 1.0.0 
    Basic Release - First Release added everything to the Script

    