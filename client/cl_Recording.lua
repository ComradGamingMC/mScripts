
local recording = false
RegisterCommand('record', function(source, args, RawCommands)
	if not recording then	
		TriggerEvent('record:start')
		recording = true
	elseif recording then
		TriggerEvent('record:stop')
		recording = false
	end
end, false)


RegisterNetEvent("record:start")
AddEventHandler("record:start", function()
	if IsRecording() then
		exports['mNotify']:DoLongHudText('error', "Your already recording!")
	else 
		StartRecording(1)
		exports['mNotify']:DoLongHudText('success', "Started recording!")
	end
end)

RegisterNetEvent("record:stop")
AddEventHandler("record:stop", function()
	if IsRecording() then
		StopRecordingAndSaveClip()
		exports['mNotify']:DoLongHudText('success', "Saved")
	else 
		exports['mNotify']:DoLongHudText('error', "Your not recording!")
	end
end)


RegisterCommand('rockstareditor', function(source, args, RawCommands)
	NetworkSessionEnd(true, true) --End the current session (required if you want R* editor to work)
ActivateRockstarEditor()
while IsPauseMenuActive() do 
	Citizen.Wait(0)
	DoScreenFadeIn(1)
	NetworkSessionHost(-1, 255, false) --Attempts reconnection to the session after exiting the editor
end
end,false)

TriggerEvent('chat:addSuggestion', '/record', 'Record Something for Rockstar Editor to Edit later.')
