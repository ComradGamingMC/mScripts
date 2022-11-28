if EnableChatCommand == true then
	Citizen.CreateThread(function()

        TriggerEvent('chat:addSuggestion', '/ad', 'Send an ad in game', {
            { name="Message", help="Custom Advertisement Message"}
        })

        TriggerEvent('chat:addSuggestion', '/twt', 'Send a Twitter in game.', {
            { name="Message", help="You're Twitter Message."}
        })
        TriggerEvent('chat:addSuggestion', '/me', 'Send a 3D Message over your body.', {
            { name="Message", help="Your action message"}
        })
        TriggerEvent('chat:addSuggestion', '/car', 'Spawn in a vehicle of your choice (Admin Only)', {
            { name="Message", help="Vehicle Name"}
        })
        TriggerEvent('chat:addSuggestion', '/carry', 'Carry a Person over your shoulder.', {
            { name="Message", help="ERROR: No Message needed"}
        })
        TriggerEvent('chat:addSuggestion', '/carryu', 'Drag Your a person away from a area.', {
            { name="Message", help="ERROR: No Message needed"}
        })
        TriggerEvent('chat:addSuggestion', '/record', 'Allows you record stuff for rockstar editor.', {
            { name="Message", help="ERROR: No Message needed"}
        })
        TriggerEvent('chat:addSuggestion', '/shuff', 'Allows your to move between the front seats', {
            { name="Message", help="ERROR: NO Message Needed"}
        })
        TriggerEvent('chat:addSuggestion', '/cam', 'Allows your to use a movie camera', {
            { name="Message", help="ERROR: NO Message Needed"}
        })
        TriggerEvent('chat:addSuggestion', '/mic', 'Allows you to hold a mic for someone else (Use FingerPoint)', {
            { name="Message", help="ERROR: NO Message Needed"}
        })
        TriggerEvent('chat:addSuggestion', '/mic2', 'Allows you to hold a mic for yourself.', {
            { name="Message", help="ERROR: NO Message Needed"}
        })
        TriggerEvent('chat:addSuggestion', '/bmic', 'Allows a person to hold a Boom Mic to get audio overhead.', {
            { name="Message", help="ERROR: NO Message Needed"}
        })
        TriggerEvent('chat:addSuggestion', '/th', 'Allows you to take a person hostage', {
            { name="Message", help="ERROR: NO Message Needed"}
        })

    end)
end