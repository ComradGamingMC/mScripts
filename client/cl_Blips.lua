-- https://docs.fivem.net/docs/game-references/blips/ -- Use For ID 

local blips = {
{title="City Hall", colour=75, id=89, x=-544.0, y=-204.0, z=38.0},   -- City Hall Addon
{title="Benefactor Dealership", colour=75, id=67, x=-53.91, y=68.01, z=71.96},     -- Benefactor Addon
{title="Bolingbroke Penitentiary", colour=75, id=238, x=1807.53, y=2605.59, z=45.565}, -- Sandy Prison
{title="Airfield", colour=3, id=90, x=1721.0, y=3255.0, z=41.0}, -- Sandy Shores Airfield
{title="Airfield", colour=3, id=90, x=2149.0, y=4817.0, z=41.0}, -- Grapeseed Airfield
{title="Los Santos International Airport", colour=3, id=90, x=-1031.0, y=-2727.0, z=13.0}, -- LSIA Airport
{title="Job Centre", colour=60, id=351, x=-264.58, y=-963.7, z=31.223}, -- City Job Centre

{title="Police Station", colour=29, id=60, x=428.0, y=-978.0, z=30.0}, -- Mission Row PD
{title="Police Station", colour=29, id=60, x=-438.0, y=6021.0, z=31.0}, -- Paleto Bay PD
{title="Police Station", colour=29, id=60, x=1856.0, y=3681.0, z=34.0}, -- Sandy Shores PD
{title="Police Station", colour=29, id=60, x=642.0, y=0.0, z=82.0}, -- Vinewood PD - Addon
{title="Police Station", colour=29, id=60, x=-1055.0, y=-823.0, z=19.0}, -- Vespucci PD - Addon
{title="Police Station", colour=29, id=60, x=360.624, y=-1584.47, z=29.2919}, -- Davis/Rancho PD - Addon
{title="Police Station", colour=29, id=60, x=825.987, y=-1290.03, z=28.2407}, -- La Mesa PD - Addon
{title="Police Station", colour=29, id=60, x=-560.0, y=-133.0, z=38.0}, -- Rockford Hills PD

{title="Fire Station", colour=1, id=60, x=215.786, y=-1642.49, z=29.7138}, -- Davis Fire
{title="Fire Station", colour=1, id=60, x=1202.38, y=-1460.13, z=34.7642}, -- El Buro Hights Fire
{title="Fire Station", colour=1, id=60, x=-1087.93, y=-2374.1, z=13.9451}, -- LSIA Fire
{title="Fire Station", colour=1, id=60, x=-379.942, y=6118.73, z=31.8456}, -- Paleto Fire
{title="Fire Station", colour=1, id=60, x=-635.992, y=-121.635, z=39.0138}, -- Rockford Hills Fire
{title="Fire Station", colour=1, id=60, x=1697.26, y=3585.46, z=35.5443}, -- Sandy Shore Fire
{title="Fire Station", colour=1, id=60, x=-2113.74, y=2831.58, z=32.8093}, -- Zancodo Base Fire
--[[
{title="Hospital", colour=74, id=61, x=337.238, y=-1396.28, z=32.5092},
{title="Hospital", colour=74, id=61, x=-450.586, y=-340.387, z=34.5014},
{title="Hospital", colour=74, id=61, x=1839.74, y=3672.0, z=34.2767},
{title="Hospital", colour=74, id=61, x=360.222, y=-582.222, z=28.8212},
{title="Hospital", colour=74, id=61, x=-243.463, y=6327.87, z=32.4262},
{title="Hospital", colour=74, id=61, x=-677.003, y=310.929, z=83.0841},
{title="Hospital", colour=74, id=61, x=1151.31, y=-1529.95, z=34.9904},
{title="Hospital", colour=74, id=61, x=-874.614, y=-308.375, z=39.5448}, --]]

{title="Vehicle Mechanic", colour=31, id=446, x=-356.146, y=-134.69, z=39.0097},
{title="Vehicle Mechanic", colour=31, id=446, x=723.013, y=-1088.92, z=22.1829},
{title="Vehicle Mechanic", colour=31, id=446, x=-1145.67, y=-1991.17, z=13.162},
{title="Vehicle Mechanic", colour=31, id=446, x=1174.76, y=2645.46, z=37.7545},
{title="Vehicle Mechanic", colour=31, id=446, x=112.275, y=6619.83, z=31.8154},
{title="Vehicle Mechanic", colour=31, id=446, x=-207.978, y=-1309.64, z=-31.2939},
{title="Bank", colour=2, id=431, x=-2964.76, y=482.658, z=15.7068},
{title="Bank", colour=2, id=431, x=260.232, y=205.886, z=106.284},
{title="Bank", colour=2, id=431, x=150.061, y=-1039.99, z=29.3778},
{title="Bank", colour=2, id=431, x=-1213.57, y=-328.829, z=37.7908},
{title="Bank", colour=2, id=431, x=-109.453, y=6464.05, z=31.6267},
{title="Race Track", colour=6, id=147, x=1131.91, y=101.72, z=83.023},
{title="Casino", colour=81, id=277, x=930.71, y=41.14, z=78.513},
{title="Gas Station", colour=1, id=361, x=49.4187,   y=2778.793,  z=58.043},
{title="Gas Station", colour=1, id=361, x=263.894,   y=2606.463,  z=44.983},
{title="Gas Station", colour=1, id=361, x=1039.958,  y=2671.134,  z=39.550},
{title="Gas Station", colour=1, id=361, x=1207.260,  y=2660.175,  z=37.899},
{title="Gas Station", colour=1, id=361, x=2539.685,  y=2594.192,  z=37.944},
{title="Gas Station", colour=1, id=361, x=2679.858,  y=3263.946,  z=55.240},
{title="Gas Station", colour=1, id=361, x=1687.156,  y=4929.392,  z=42.078},
{title="Gas Station", colour=1, id=361, x=1701.314,  y=6416.028,  z=32.763},
{title="Gas Station", colour=1, id=361, x=179.857,   y=6602.839,  z=31.868},
{title="Gas Station", colour=1, id=361, x=-94.4619,  y=6419.594,  z=31.489},
{title="Gas Station", colour=1, id=361, x=-2554.996, y=2334.40,  z=33.078},
{title="Gas Station", colour=1, id=361, x=-1800.375, y=803.661,  z=138.651},
{title="Gas Station", colour=1, id=361, x=-1437.622, y=-276.747,  z=46.207},
{title="Gas Station", colour=1, id=361, x=-2096.243, y=-320.286,  z=13.168},
{title="Gas Station", colour=1, id=361, x=-724.619, y=-935.1631,  z=19.213},
{title="Gas Station", colour=1, id=361, x=-526.019, y=-1211.003,  z=18.184},
{title="Gas Station", colour=1, id=361, x=-70.2148, y=-1761.792,  z=29.534},
{title="Gas Station", colour=1, id=361, x=265.648,  y=-1261.309,  z=29.292},
{title="Gas Station", colour=1, id=361, x=819.653,  y=-1028.846,  z=26.403},
{title="Gas Station", colour=1, id=361, x=1208.951, y= -1402.567, z=35.224},
{title="Gas Station", colour=1, id=361, x=1181.381, y= -330.847,  z=69.316},
{title="Gas Station", colour=1, id=361, x=620.843,  y= 269.100,  z=103.089},
{title="Gas Station", colour=1, id=361, x=2581.321, y=362.039, z=108.468},

}

Citizen.CreateThread(function()

for _, info in pairs(blips) do
info.blip = AddBlipForCoord(info.x, info.y, info.z)
SetBlipSprite(info.blip, info.id)
SetBlipDisplay(info.blip, 4)
SetBlipScale(info.blip, 0.9)
SetBlipColour(info.blip, info.colour)
SetBlipAsShortRange(info.blip, true)
BeginTextCommandSetBlipName("STRING")
AddTextComponentString(info.title)
EndTextCommandSetBlipName(info.blip)
end
end)


