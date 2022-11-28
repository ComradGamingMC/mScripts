AddEventHandler( 'chatMessage', function( source, n, msg )  

    msg = string.lower( msg )  
    if ( msg == "/r" ) then 
        CancelEvent() 
        TriggerClientEvent( 'Radio', source )
    end
end)