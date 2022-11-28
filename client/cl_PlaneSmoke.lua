local SmokeEnabled, SmokeR, SmokeG, SmokeB, SmokeSize = false, 0.0, 0.0, 0.0, 1.0
local PlayerSmokeSettings = {}

local offsets = {
	[GetHashKey("alpha-Z1")] = {0.0, -8.0, 0.0},
	[GetHashKey("besra")] = {0.0, -6.0, 0.0},
	[GetHashKey("cuban800")] = {0.0, -7.2, 0.5},
	[GetHashKey("dodo")] = {0.0, -7.2, 0.5},
	[GetHashKey("duster")] = {0.0, -7.2, 0.5},
	[GetHashKey("howard")] = {0.0, -7.2, 0.5},
	[GetHashKey("hydra")] = {0.0, -7.2, 0.5},
	[GetHashKey("lazer")] = {0.0, -7.2, 0.5},
	[GetHashKey("luxor")] = {0.0, -7.2, 0.5},
	[GetHashKey("luxor2")] = {0.0, -7.2, 0.5},
	[GetHashKey("mammatus")] = {0.0, -7.2, 0.5},
	[GetHashKey("microlight")] = {0.0, -7.2, 0.5},
	[GetHashKey("miljet")] = {0.0, -7.2, 0.5},
	[GetHashKey("mogul")] = {0.0, -7.2, 0.5},
	[GetHashKey("molotok")] = {0.0, -7.2, 0.5},
	[GetHashKey("nimbus")] = {0.0, -7.2, 0.5},
	[GetHashKey("nokota")] = {0.0, -7.2, 0.5},
	[GetHashKey("pyro")] = {0.0, -7.2, 0.5}

}
RegisterNetEvent('JM36-FSRP:PlaneSmokeSettingsUpdate')
AddEventHandler('JM36-FSRP:PlaneSmokeSettingsUpdate', function(Data)
	PlayerSmokeSettings = Data
end)

local function UpdatePlaneSmokeSettings(sEnabled, sR, sG, sB, sSize)
	SmokeEnabled, SmokeR, SmokeG, SmokeB, SmokeSize = sEnabled, sR, sG, sB, sSize
	TriggerServerEvent("JM36-FSRP:PlaneSmokeSettingsUpdate", {SmokeEnabled, SmokeR, SmokeG, SmokeB, SmokeSize})
end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if IsControlJustPressed(0, 20) and IsPedInAnyPlane(PlayerPedId()) then
			UpdatePlaneSmokeSettings(not SmokeEnabled, SmokeR, SmokeG, SmokeB, SmokeSize)
		end
	end
end)
local ActiveFx = {}
Citizen.CreateThread(function()
	local particleDictionary = "scr_ar_planes"
	local particleName = "scr_ar_trail_smoke"
	RequestNamedPtfxAsset(particleDictionary)
	while not HasNamedPtfxAssetLoaded(particleDictionary) do
		Citizen.Wait(0)
	end
	while true do
		Citizen.Wait(0)
		for _, player in ipairs(GetActivePlayers()) do
			local ped = GetPlayerPed(player)
			local veh = GetVehiclePedIsUsing(ped)
			local Data = PlayerSmokeSettings[GetPlayerServerId(player)]
			if Data ~= nil then
				local SmokeEnabled, SmokeR, SmokeG, SmokeB, SmokeSize = table.unpack(Data)
				if (IsPedInAnyPlane(ped) and not IsEntityDead(veh)) and SmokeEnabled then
					if not ActiveFx[veh] then
						UseParticleFxAssetNextCall(particleDictionary)
						local ox, oy, oz = 0.0, 0.0, 0.0
						ActiveFx[veh] = StartNetworkedParticleFxLoopedOnEntityBone(particleName, veh, ox, oy, oz, 0.0, 0.0, 0.0, -1, SmokeSize + 0.0, ox, oy, oz)
					elseif ActiveFx[veh] and not IsEntityDead(veh) then
						SetParticleFxLoopedScale(ActiveFx[veh], SmokeSize+0.0)
						SetParticleFxLoopedRange(ActiveFx[veh], 10000.0)
						SetParticleFxLoopedColour(ActiveFx[veh], SmokeR + 0.0, SmokeG + 0.0, SmokeB + 0.0)
					end
				else
					if ActiveFx[veh] or IsEntityDead(veh) or not veh then
						StopParticleFxLooped(ActiveFx[veh], 0)
						ActiveFx[veh] = nil
					end
				end
			end
		end
	end
end)

Citizen.CreateThread(function()
	TriggerEvent('chat:addSuggestion', '/smokecolor', 'Changes the color of your plane smoke!', {
	{ name="color", help="Sets a specific color. Supported: red, blue, yellow, purple, cyan, green, pink, black, white." }
})
end)
Citizen.CreateThread(function()
	TriggerEvent('chat:addSuggestion', '/smokesize', 'Changes the size of your plane smoke!', {
	{ name="size", help="Sets a specific size. Example: 5.0 (Values must have have .0)" }
})
end)

function msg(text)
	TriggerEvent("chatMessage", "[INFS]", { 158, 123, 202}, text)
end
RegisterCommand("smokecolor", function(source, args, raw)
	local ped = PlayerPedId()
	local veh = GetVehiclePedIsUsing(ped)
	if offsets[GetEntityModel(veh)] then
		if string.lower(args[1]) == "red" then
			msg("^1Smoke color set to red!")
			UpdatePlaneSmokeSettings(SmokeEnabled, 255.0, 0.0, 0.0, SmokeSize)
		elseif string.lower(args[1]) == "blue" then
			msg("^4Smoke color set to blue!")
			UpdatePlaneSmokeSettings(SmokeEnabled, 0.0, 0.0, 255.0, SmokeSize)
		elseif string.lower(args[1]) == "green" then
			msg("^2Smoke color set to green!")
			UpdatePlaneSmokeSettings(SmokeEnabled, 0.0, 255.0, 0.0, SmokeSize)
		elseif string.lower(args[1]) == "purple" then
			msg("Smoke color set to purple!")
			UpdatePlaneSmokeSettings(SmokeEnabled, 128.0, 0.0, 128.0, SmokeSize)
		elseif string.lower(args[1]) == "cyan" then
			msg("^5Smoke color set to cyan!")
			UpdatePlaneSmokeSettings(SmokeEnabled, 0.0, 100.0, 255.0, SmokeSize)
		elseif string.lower(args[1]) == "black" then
			msg("^0Smoke color set to black!")
			UpdatePlaneSmokeSettings(SmokeEnabled, 0.0, 0.0, 0.0, SmokeSize)
		elseif string.lower(args[1]) == "pink" then
			msg("^6Smoke color set to pink!")
			UpdatePlaneSmokeSettings(SmokeEnabled, 68.0, 0.0, 255.0, SmokeSize)
		elseif string.lower(args[1]) == "yellow" then
			msg("^3Smoke color set to yellow!")
			UpdatePlaneSmokeSettings(SmokeEnabled, 102.0, 255.0, 0.0, SmokeSize)
		elseif string.lower(args[1]) == "orange" then
			msg("Smoke color set to orange!")
			UpdatePlaneSmokeSettings(SmokeEnabled, 255.0, 165.0, 0.0, SmokeSize)
		elseif string.lower(args[1]) == "white" then
			msg("^7Smoke color set to white!")
			UpdatePlaneSmokeSettings(SmokeEnabled, 255.0, 255.0, 255.0, SmokeSize)
		else
			msg("Smoke color set to custom rgb code!")
			UpdatePlaneSmokeSettings(SmokeEnabled, tonumber(args[1]) + 0.0, tonumber(args[2]) + 0.0, tonumber(args[3]) + 0.0, SmokeSize)
		end
	end
end)
RegisterCommand("smokesize", function(source, args, raw)
	local SmokeSize = tonumber(args[1]) + 0.0
	if SmokeSize > 5.0 then SmokeSize = 5.0 elseif SmokeSize <= 0.0 then SmokeSize = 0.1 end
	UpdatePlaneSmokeSettings(SmokeEnabled, SmokeR, SmokeG, SmokeB, SmokeSize)
end)
UpdatePlaneSmokeSettings(SmokeEnabled, SmokeR, SmokeG, SmokeB, SmokeSize)