local ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterServerCallback('speed_camera:checkSpeed', function(source, cb, speed)
    local xPlayer = ESX.GetPlayerFromId(source)
    if speed > Config.SpeedLimit then
        local fineAmount = Config.FineAmount
        xPlayer.removeAccountMoney('bank', fineAmount)
        MySQL.Async.execute('INSERT INTO speed_camera_fines (player_id, amount) VALUES (@player_id, @amount)', {
            ['@player_id'] = xPlayer.identifier,
            ['@amount'] = fineAmount
        }, function(rowsChanged)
            if rowsChanged > 0 then
                cb(true)
            else
                cb(false)
            end
        end)
    else
        cb(false)
    end
end)

RegisterServerEvent('speed_camera:issueFine')
AddEventHandler('speed_camera:issueFine', function(speed)
    local source = source
    ESX.TriggerServerCallback('speed_camera:checkSpeed', source, function(success)
        if success then
            TriggerClientEvent('esx:showNotification', source, 'You have been fined $' .. Config.FineAmount .. ' for speeding.')
        end
    end, speed)
end)