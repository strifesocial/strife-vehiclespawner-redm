-- Register the event handler to spawn the vehicle
RegisterNetEvent('spawnVehicle')

-- Add a handler function to spawn the vehicle
AddEventHandler('spawnVehicle', function(vehicleModel)
    -- Request the model to be loaded
    RequestModel(vehicleModel)
    while not HasModelLoaded(vehicleModel) do
        Wait(500)
    end

    -- Get the player's position and heading
    local playerPed = PlayerPedId()
    local playerPos = GetEntityCoords(playerPed)
    local heading = GetEntityHeading(playerPed)

    -- Create the vehicle at the player's position and heading
    local vehicle = CreateVehicle(vehicleModel, playerPos.x, playerPos.y, playerPos.z, heading, true, false)
    SetEntityAsMissionEntity(vehicle, true, true)

    -- Set the vehicle as the player's current vehicle
    TaskWarpPedIntoVehicle(playerPed, vehicle, -1)
end)
