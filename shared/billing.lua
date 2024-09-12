local QBCore = exports['qb-core']:GetCoreObject()


------------------------PAYMENT SECTION-------------------------------


RegisterServerEvent("lusty94_icecream:server:bill:player")
AddEventHandler("lusty94_icecream:server:bill:player", function(playerId, amount)
        local biller = QBCore.Functions.GetPlayer(source)
        local billed = QBCore.Functions.GetPlayer(tonumber(playerId))
        local amount = tonumber(amount)
        if biller.PlayerData.job.name == Config.CoreSettings.Job.Name then
            if billed ~= nil then
                if biller.PlayerData.citizenid ~= billed.PlayerData.citizenid then
                    if amount and amount > 0 then
                        -- edit the database table names below to suit your phone system.
                        exports.oxmysql:insert('INSERT INTO phone_invoices (citizenid, amount, society, sender, sendercitizenid) VALUES (@citizenid, @amount, @society, @sender, @sendercitizenid)', {
                            ['@citizenid'] = billed.PlayerData.citizenid,
                            ['@amount'] = amount,
                            ['@society'] = biller.PlayerData.job.name,
                            ['@sender'] = biller.PlayerData.charinfo.firstname,
                            ['@sendercitizenid'] = biller.PlayerData.citizenid
                        })
                        TriggerClientEvent('qb-phone:RefreshPhone', billed.PlayerData.source) -- change this to suit your phone event
                        TriggerClientEvent('QBCore:Notify', source, 'Invoice Successfully Sent', 'success')
                        exports['qb-management']:AddMoney(Config.CoreSettings.Job.Name, amount) -- add amount of sale to societ fund for job defined in config, society name needs to be in database tables also
                        --exports['qb-banking']:AddMoney( Config.CoreSettings.Job.Name,  amount,  'Ice Cream Shop' ) -- uncomment this snippet if using the latest version of qb-core that removes the need for qb-management and uses qb-banking instead
                        TriggerClientEvent('QBCore:Notify', billed.PlayerData.source, 'New Invoice Received From Polar Ice!')
                    else
                        TriggerClientEvent('QBCore:Notify', source, 'Must Be A Valid Amount Above 0!', 'error')
                    end
                else
                    TriggerClientEvent('QBCore:Notify', source, 'You Cannot Bill Yourself!', 'error')
                end
            else
                TriggerClientEvent('QBCore:Notify', source, 'Player Not Online!', 'error')
            end
        else
            TriggerClientEvent('QBCore:Notify', source, 'No Access!', 'error')
        end
end)


