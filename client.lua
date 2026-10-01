local ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1000)
        local playerPed = PlayerPedId()
        local playerCoords = GetEntityCoords(playerPed)
        local playerSpeed = GetEntitySpeed(playerPed) * 2.236936 -- Convert to mph
        
        for _, camera in ipairs(Config.CameraLocations) do
            local distance = #(vector3(camera.x, camera.y, camera.z) - playerCoords)
            if distance < camera.radius and playerSpeed > Config.SpeedLimit then
                TriggerServerEvent('speed_camera:issueFine', playerSpeed)
            end
        end
    end
end)