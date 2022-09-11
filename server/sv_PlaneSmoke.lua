local PlayerSmokeSettings = {}

RegisterServerEvent('JM36-FSRP:PlaneSmokeSettingsUpdate')
AddEventHandler('JM36-FSRP:PlaneSmokeSettingsUpdate', function(Data)
	local src = source
	PlayerSmokeSettings[src] = Data
	TriggerClientEvent('JM36-FSRP:PlaneSmokeSettingsUpdate', -1, PlayerSmokeSettings)
end)

AddEventHandler('playerDropped', function(reason)
	local src = tonumber(source)
	PlayerSmokeSettings[src] = nil
	TriggerClientEvent('JM36-FSRP:PlaneSmokeSettingsUpdate', -1, PlayerSmokeSettings)
end)

