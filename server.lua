-- Register the command to spawn a vehicle
RegisterCommand('spawnvehicle', function(source, args, rawCommand)
    -- Ensure the player is authenticated to execute this command
    local playerName = GetPlayerName(source)

    -- Check if the player has provided a vehicle model as an argument
    if args[1] == nil then
        -- If no vehicle model is provided, send an error message to the player
        TriggerClientEvent('chat:addMessage', source, {
            color = {255, 0, 0},
            args = {'Server', 'Usage: /spawnvehicle [vehicle_model]'}
        })
        return
    end

    -- Get the vehicle model provided by the player
    local vehicleModel = args[1]

    -- Spawn the vehicle for the player
    TriggerClientEvent('spawnVehicle', source, vehicleModel)
end, false)
