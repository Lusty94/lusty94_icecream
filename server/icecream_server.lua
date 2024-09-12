local QBCore = exports['qb-core']:GetCoreObject()
local InvType = Config.CoreSettings.Inventory.Type
local NotifyType = Config.CoreSettings.Notify.Type


--notification function
local function SendNotify(src, msg, type, time, title)
    if NotifyType == nil then print("Lusty94_IceCream: NotifyType Not Set in Config.CoreSettings.Notify.Type!") return end
    if not title then title = "Ice cream" end
    if not time then time = 5000 end
    if not type then type = 'success' end
    if not msg then print("Notification Sent With No Message") return end
    if NotifyType == 'qb' then
        TriggerClientEvent('QBCore:Notify', src, msg, type, time)
    elseif NotifyType == 'okok' then
        TriggerClientEvent('okokNotify:Alert', src, title, msg, time, type, Config.CoreSettings.Notify.Sound)
    elseif NotifyType == 'mythic' then
        TriggerClientEvent('mythic_notify:client:SendAlert', src, { type = type, text = msg, style = { ['background-color'] = '#00FF00', ['color'] = '#FFFFFF' } })
    elseif NotifyType == 'boii'  then
        TriggerClientEvent('boii_ui:notify', src, title, msg, type, time)
    elseif NotifyType == 'ox' then 
        TriggerClientEvent('ox_lib:notify', src, ({ title = title, description = msg, length = time, type = type, style = 'default'}))
    end
end

--Give Smoothie Cup
RegisterNetEvent('lusty94_icecream:server:GiveSmoothieCup', function(amount)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if InvType == 'qb' then        
        if exports['qb-inventory']:AddItem(src, 'smoothiecup', amount, false, false, false) then
            TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items['smoothiecup'], 'add', amount)
        end
    elseif InvType == 'ox' then
        if exports.ox_inventory:CanCarryItem(src, "smoothiecup", amount) then
            exports.ox_inventory:AddItem(src,"smoothiecup", amount)
        else
            SendNotify(src,Config.Language.Notifications.CantCarry, 'error', 2000)
        end
    end
end)


--Give Mug
RegisterNetEvent('lusty94_icecream:server:GiveMug', function(amount)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)        
    if InvType == 'qb' then        
        if exports['qb-inventory']:AddItem(src, 'mug', amount, false, false, false) then
            TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items['mug'], 'add', amount)
        end
    elseif InvType == 'ox' then
        if exports.ox_inventory:CanCarryItem(src, "mug", amount) then
            exports.ox_inventory:AddItem(src,"mug", amount)
        else
            SendNotify(src,Config.Language.Notifications.CantCarry, 'error', 2000)
        end
    end
end)


--Give Soft Drinks Cup
RegisterNetEvent('lusty94_icecream:server:GiveSoftDrinksCup', function(amount)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if InvType == 'qb' then        
        if exports['qb-inventory']:AddItem(src, 'softdrinkscup', amount, false, false, false) then
            TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items['softdrinkscup'], 'add', amount)
        end
    elseif InvType == 'ox' then
        if exports.ox_inventory:CanCarryItem(src, "softdrinkscup", amount) then
            exports.ox_inventory:AddItem(src,"softdrinkscup", amount)
        else
            SendNotify(src,Config.Language.Notifications.CantCarry, 'error', 2000)
        end
    end
end)


--Give Ice Cream Cone
RegisterNetEvent('lusty94_icecream:server:GiveIceCreamCone', function(amount)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if InvType == 'qb' then        
        if exports['qb-inventory']:AddItem(src, 'icecreamcone', amount, false, false, false) then
            TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items['icecreamcone'], 'add', amount)
        end
    elseif InvType == 'ox' then
        if exports.ox_inventory:CanCarryItem(src, "icecreamcone", 1) then
            exports.ox_inventory:AddItem(src,"icecreamcone", amount)
        else
            SendNotify(src,Config.Language.Notifications.CantCarry, 'error', 2000)
        end
    end
end)





-------------------------------------------------< MAKE SMOOTHIES START >--------------------------------


--Vanilla Smoothie Callback
QBCore.Functions.CreateCallback('lusty94_icecream:get:VanillaSmoothie', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local cup = Player.Functions.GetItemByName("smoothiecup")
    local ingredient = Player.Functions.GetItemByName("vanilla")
    local mix = Player.Functions.GetItemByName("smoothiemix")
    if cup and ingredient and mix then
        cb(true)
    else
        cb(false)
    end
end)


--Create Vanilla Smoothie
RegisterNetEvent('lusty94_icecream:server:CreateVanillaSmoothie', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if InvType == 'qb' then
        if exports['qb-inventory']:RemoveItem(src, 'smoothiecup', 1, false, false, false) then
            TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items['smoothiecup'], 'remove', 1)
            exports['qb-inventory']:RemoveItem(src, 'vanilla', 1, false, false, false)
            TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items['vanilla'], 'remove', 1)
            exports['qb-inventory']:RemoveItem(src, 'smoothiemix', 1, false, false, false)
            TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items['smoothiemix'], 'remove', 1)
            exports['qb-inventory']:AddItem(src, 'vanillasmoothie', 1, false, false, false)
            TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items['vanillasmoothie'], 'add', 1)
        end
    elseif InvType == 'ox' then
        if exports.ox_inventory:RemoveItem(src,"smoothiecup", 1) then
            exports.ox_inventory:RemoveItem(src,"vanilla", 1)
            exports.ox_inventory:RemoveItem(src,"smoothiemix", 1)
            if exports.ox_inventory:CanCarryItem(src, "vanillasmoothie", 1) then
                exports.ox_inventory:AddItem(src,"vanillasmoothie", 1)
            else
                SendNotify(src,Config.Language.Notifications.CantCarry, 'error', 2000)
            end
        end
    end
end)





--Chocolate Smoothie Callback
QBCore.Functions.CreateCallback('lusty94_icecream:get:ChocolateSmoothie', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local cup = Player.Functions.GetItemByName("smoothiecup")
    local ingredient = Player.Functions.GetItemByName("chocolate")
    local mix = Player.Functions.GetItemByName("smoothiemix")
    if cup and ingredient and mix then
        cb(true)
    else
        cb(false)
    end
end)


--Create Chocolate Smoothie
RegisterNetEvent('lusty94_icecream:server:CreateChocolateSmoothie', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if InvType == 'qb' then
        if exports['qb-inventory']:RemoveItem(src, 'smoothiecup', 1, false, false, false) then
            TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items['smoothiecup'], 'remove', 1)
            exports['qb-inventory']:RemoveItem(src, 'chocolate', 1, false, false, false)
            TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items['chocolate'], 'remove', 1)
            exports['qb-inventory']:RemoveItem(src, 'smoothiemix', 1, false, false, false)
            TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items['smoothiemix'], 'remove', 1)
            exports['qb-inventory']:AddItem(src, 'chocolatesmoothie', 1, false, false, false)
            TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items['chocolatesmoothie'], 'add', 1)
        end
    elseif InvType == 'ox' then
        if exports.ox_inventory:RemoveItem(src,"smoothiecup", 1) then
            exports.ox_inventory:RemoveItem(src,"chocolate", 1)
            exports.ox_inventory:RemoveItem(src,"smoothiemix", 1)        
            if exports.ox_inventory:CanCarryItem(src, "chocolatesmoothie", 1) then
                exports.ox_inventory:AddItem(src,"chocolatesmoothie", 1)
            else
                SendNotify(src,Config.Language.Notifications.CantCarry, 'error', 2000)
            end
        end
    end
end)





--Strawberry Smoothie Callback
QBCore.Functions.CreateCallback('lusty94_icecream:get:StrawberrySmoothie', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local cup = Player.Functions.GetItemByName("smoothiecup")
    local ingredient = Player.Functions.GetItemByName("strawberry")
    local mix = Player.Functions.GetItemByName("smoothiemix")
    if cup and ingredient and mix then
        cb(true)
    else
        cb(false)
    end
end)


--Create Strawberry Smoothie
RegisterNetEvent('lusty94_icecream:server:CreateStrawberrySmoothie', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if InvType == 'qb' then
        if exports['qb-inventory']:RemoveItem(src, 'smoothiecup', 1, false, false, false) then
            TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items['smoothiecup'], 'remove', 1)
            exports['qb-inventory']:RemoveItem(src, 'strawberry', 1, false, false, false)
            TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items['strawberry'], 'remove', 1)
            exports['qb-inventory']:RemoveItem(src, 'smoothiemix', 1, false, false, false)
            TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items['smoothiemix'], 'remove', 1)
            exports['qb-inventory']:AddItem(src, 'strawberrysmoothie', 1, false, false, false)
            TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items['strawberrysmoothie'], 'add', 1)
        end
    elseif InvType == 'ox' then
        if exports.ox_inventory:RemoveItem(src,"smoothiecup", 1) then
            exports.ox_inventory:RemoveItem(src,"strawberry", 1)
            exports.ox_inventory:RemoveItem(src,"smoothiemix", 1)        
            if exports.ox_inventory:CanCarryItem(src, "strawberrysmoothie", 1) then
                exports.ox_inventory:AddItem(src,"strawberrysmoothie", 1)
            else
                SendNotify(src,Config.Language.Notifications.CantCarry, 'error', 2000)
            end
        end
    end
end)




--Mint Smoothie Callback
QBCore.Functions.CreateCallback('lusty94_icecream:get:MintSmoothie', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local cup = Player.Functions.GetItemByName("smoothiecup")
    local ingredient = Player.Functions.GetItemByName("mint")
    local mix = Player.Functions.GetItemByName("smoothiemix")
    if cup and ingredient and mix then
        cb(true)
    else
        cb(false)
    end
end)


--Create Mint Smoothie
RegisterNetEvent('lusty94_icecream:server:CreateMintSmoothie', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if InvType == 'qb' then
        if exports['qb-inventory']:RemoveItem(src, 'smoothiecup', 1, false, false, false) then
            TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items['smoothiecup'], 'remove', 1)
            exports['qb-inventory']:RemoveItem(src, 'mint', 1, false, false, false)
            TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items['mint'], 'remove', 1)
            exports['qb-inventory']:RemoveItem(src, 'smoothiemix', 1, false, false, false)
            TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items['smoothiemix'], 'remove', 1)
            exports['qb-inventory']:AddItem(src, 'mintsmoothie', 1, false, false, false)
            TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items['mintsmoothie'], 'add', 1)
        end
    elseif InvType == 'ox' then
        if exports.ox_inventory:RemoveItem(src,"smoothiecup", 1) then
            if exports.ox_inventory:CanCarryItem(src, "mintsmoothie", 1) then
                exports.ox_inventory:RemoveItem(src,"mint", 1)
                exports.ox_inventory:RemoveItem(src,"smoothiemix", 1)                
                exports.ox_inventory:AddItem(src,"mintsmoothie", 1)
            else
                SendNotify(src,Config.Language.Notifications.CantCarry, 'error', 2000)
            end
        end
    end
end)




--Pistachio Smoothie Callback
QBCore.Functions.CreateCallback('lusty94_icecream:get:PistachioSmoothie', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local cup = Player.Functions.GetItemByName("smoothiecup")
    local ingredient = Player.Functions.GetItemByName("pistachio")
    local mix = Player.Functions.GetItemByName("smoothiemix")
    if cup and ingredient and mix then
        cb(true)
    else
        cb(false)
    end
end)


--Create Pistachio Smoothie
RegisterNetEvent('lusty94_icecream:server:CreatePistachioSmoothie', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if InvType == 'qb' then
        if exports['qb-inventory']:RemoveItem(src, 'smoothiecup', 1, false, false, false) then
            TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items['smoothiecup'], 'remove', 1)
            exports['qb-inventory']:RemoveItem(src, 'pistachio', 1, false, false, false)
            TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items['pistachio'], 'remove', 1)
            exports['qb-inventory']:RemoveItem(src, 'smoothiemix', 1, false, false, false)
            TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items['smoothiemix'], 'remove', 1)
            exports['qb-inventory']:AddItem(src, 'pistachiosmoothie', 1, false, false, false)
            TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items['pistachiosmoothie'], 'add', 1)
        end
    elseif InvType == 'ox' then
        if exports.ox_inventory:RemoveItem(src,"smoothiecup", 1) then
            exports.ox_inventory:RemoveItem(src,"pistachio", 1)
            exports.ox_inventory:RemoveItem(src,"smoothiemix", 1)
            if exports.ox_inventory:CanCarryItem(src, "pistachiosmoothie", 1) then                
                exports.ox_inventory:AddItem(src,"pistachiosmoothie", 1)
            else
                SendNotify(src,Config.Language.Notifications.CantCarry, 'error', 2000)
            end
        end
    end
end)




--Butter Scotch Smoothie Callback
QBCore.Functions.CreateCallback('lusty94_icecream:get:ButterScotchSmoothie', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local cup = Player.Functions.GetItemByName("smoothiecup")
    local ingredient = Player.Functions.GetItemByName("butterscotch")
    local mix = Player.Functions.GetItemByName("smoothiemix")
    if cup and ingredient and mix then
        cb(true)
    else
        cb(false)
    end
end)


--Create Butter Scotch Smoothie
RegisterNetEvent('lusty94_icecream:server:CreateButterScotchSmoothie', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if InvType == 'qb' then
        if exports['qb-inventory']:RemoveItem(src, 'smoothiecup', 1, false, false, false) then
            TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items['smoothiecup'], 'remove', 1)
            exports['qb-inventory']:RemoveItem(src, 'butterscotch', 1, false, false, false)
            TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items['butterscotch'], 'remove', 1)
            exports['qb-inventory']:RemoveItem(src, 'smoothiemix', 1, false, false, false)
            TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items['smoothiemix'], 'remove', 1)
            exports['qb-inventory']:AddItem(src, 'butterscotchsmoothie', 1, false, false, false)
            TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items['butterscotchsmoothie'], 'add', 1)
        end
    elseif InvType == 'ox' then
        if exports.ox_inventory:RemoveItem(src,"smoothiecup", 1) then
            exports.ox_inventory:RemoveItem(src,"butterscotch", 1)
            exports.ox_inventory:RemoveItem(src,"smoothiemix", 1)                
            if exports.ox_inventory:CanCarryItem(src, "butterscotchsmoothie", 1) then
                exports.ox_inventory:AddItem(src,"butterscotchsmoothie", 1)
            else
                SendNotify(src,Config.Language.Notifications.CantCarry, 'error', 2000)
            end
        end
    end
end)




--Salted Caramel Smoothie Callback
QBCore.Functions.CreateCallback('lusty94_icecream:get:SaltedCaramelSmoothie', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local cup = Player.Functions.GetItemByName("smoothiecup")
    local ingredient = Player.Functions.GetItemByName("saltedcaramel")
    local mix = Player.Functions.GetItemByName("smoothiemix")
    if cup and ingredient and mix then
        cb(true)
    else
        cb(false)
    end
end)


--Create Salted Caramel Smoothie
RegisterNetEvent('lusty94_icecream:server:CreateSaltedCaramelSmoothie', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if InvType == 'qb' then
        if exports['qb-inventory']:RemoveItem(src, 'smoothiecup', 1, false, false, false) then
            TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items['smoothiecup'], 'remove', 1)
            exports['qb-inventory']:RemoveItem(src, 'saltedcaramel', 1, false, false, false)
            TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items['saltedcaramel'], 'remove', 1)
            exports['qb-inventory']:RemoveItem(src, 'smoothiemix', 1, false, false, false)
            TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items['smoothiemix'], 'remove', 1)
            exports['qb-inventory']:AddItem(src, 'saltedcaramelsmoothie', 1, false, false, false)
            TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items['saltedcaramelsmoothie'], 'add', 1)
        end
    elseif InvType == 'ox' then
        if exports.ox_inventory:RemoveItem(src,"smoothiecup", 1) then
            exports.ox_inventory:RemoveItem(src,"saltedcaramel", 1)
            exports.ox_inventory:RemoveItem(src,"smoothiemix", 1)
            if exports.ox_inventory:CanCarryItem(src, "saltedcaramelsmoothie", 1) then                
                exports.ox_inventory:AddItem(src,"saltedcaramelsmoothie", 1)

            else
                SendNotify(src,Config.Language.Notifications.CantCarry, 'error', 2000)
            end
        end
    end
end)




--Bubblegum Smoothie Callback
QBCore.Functions.CreateCallback('lusty94_icecream:get:BubblegumSmoothie', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local cup = Player.Functions.GetItemByName("smoothiecup")
    local ingredient = Player.Functions.GetItemByName("bubblegum")
    local mix = Player.Functions.GetItemByName("smoothiemix")
    if cup and ingredient and mix then
        cb(true)
    else
        cb(false)
    end
end)


--Create Bubblegum Smoothie
RegisterNetEvent('lusty94_icecream:server:CreateBubblegumSmoothie', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if InvType == 'qb' then
        if exports['qb-inventory']:RemoveItem(src, 'smoothiecup', 1, false, false, false) then
            TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items['smoothiecup'], 'remove', 1)
            exports['qb-inventory']:RemoveItem(src, 'bubblegum', 1, false, false, false)
            TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items['bubblegum'], 'remove', 1)
            exports['qb-inventory']:RemoveItem(src, 'smoothiemix', 1, false, false, false)
            TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items['smoothiemix'], 'remove', 1)
            exports['qb-inventory']:AddItem(src, 'bubblegumsmoothie', 1, false, false, false)
            TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items['bubblegumsmoothie'], 'add', 1)
        end
    elseif InvType == 'ox' then
        if exports.ox_inventory:RemoveItem(src,"smoothiecup", 1) then
            exports.ox_inventory:RemoveItem(src,"bubblegum", 1)
            exports.ox_inventory:RemoveItem(src,"smoothiemix", 1)            
            if exports.ox_inventory:CanCarryItem(src, "bubblegumsmoothie", 1) then
                exports.ox_inventory:AddItem(src,"bubblegumsmoothie", 1)
            else
                SendNotify(src,Config.Language.Notifications.CantCarry, 'error', 2000)
            end
        end
    end
end)





--Toffee Smoothie Callback
QBCore.Functions.CreateCallback('lusty94_icecream:get:ToffeeSmoothie', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local cup = Player.Functions.GetItemByName("smoothiecup")
    local ingredient = Player.Functions.GetItemByName("toffee")
    local mix = Player.Functions.GetItemByName("smoothiemix")
    if cup and ingredient and mix then
        cb(true)
    else
        cb(false)
    end
end)


--Create Toffee Smoothie
RegisterNetEvent('lusty94_icecream:server:CreateToffeeSmoothie', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if InvType == 'qb' then
        if exports['qb-inventory']:RemoveItem(src, 'smoothiecup', 1, false, false, false) then
            TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items['smoothiecup'], 'remove', 1)
            exports['qb-inventory']:RemoveItem(src, 'toffee', 1, false, false, false)
            TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items['toffee'], 'remove', 1)
            exports['qb-inventory']:RemoveItem(src, 'smoothiemix', 1, false, false, false)
            TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items['smoothiemix'], 'remove', 1)
            exports['qb-inventory']:AddItem(src, 'toffeesmoothie', 1, false, false, false)
            TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items['toffeesmoothie'], 'add', 1)
        end
    elseif InvType == 'ox' then
        if exports.ox_inventory:RemoveItem(src,"smoothiecup", 1) then
            exports.ox_inventory:RemoveItem(src,"toffee", 1)
            exports.ox_inventory:RemoveItem(src,"smoothiemix", 1)            
            if exports.ox_inventory:CanCarryItem(src, "toffeesmoothie", 1) then
                exports.ox_inventory:AddItem(src,"toffeesmoothie", 1)
            else
                SendNotify(src,Config.Language.Notifications.CantCarry, 'error', 2000)
            end
        end
    end
end)




--Cookie Dough Smoothie Callback
QBCore.Functions.CreateCallback('lusty94_icecream:get:CookieDoughSmoothie', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local cup = Player.Functions.GetItemByName("smoothiecup")
    local ingredient = Player.Functions.GetItemByName("cookiedough")
    local mix = Player.Functions.GetItemByName("smoothiemix")
    if cup and ingredient and mix then
        cb(true)
    else
        cb(false)
    end
end)


--Create Cookie Dough Smoothie
RegisterNetEvent('lusty94_icecream:server:CreateCookieDoughSmoothie', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if InvType == 'qb' then
        if exports['qb-inventory']:RemoveItem(src, 'smoothiecup', 1, false, false, false) then
            TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items['smoothiecup'], 'remove', 1)
            exports['qb-inventory']:RemoveItem(src, 'cookiedough', 1, false, false, false)
            TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items['cookiedough'], 'remove', 1)
            exports['qb-inventory']:RemoveItem(src, 'smoothiemix', 1, false, false, false)
            TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items['smoothiemix'], 'remove', 1)
            exports['qb-inventory']:AddItem(src, 'cookiedoughsmoothie', 1, false, false, false)
            TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items['cookiedoughsmoothie'], 'add', 1)
        end
    elseif InvType == 'ox' then
        if exports.ox_inventory:RemoveItem(src,"smoothiecup", 1) then
            exports.ox_inventory:RemoveItem(src,"cookiedough", 1)
            exports.ox_inventory:RemoveItem(src,"smoothiemix", 1)                
            if exports.ox_inventory:CanCarryItem(src, "cookiedoughmoothie", 1) then
                exports.ox_inventory:AddItem(src,"cookiedoughsmoothie", 1)
            else
                SendNotify(src,Config.Language.Notifications.CantCarry, 'error', 2000)
            end
        end
    end
end)


-------------------------------------------------< MAKE SMOOTHIES END >--------------------------------











-------------------------------------------------< MAKE HOT DRINKS START >--------------------------------


--Mug For Hot Drinks Callback
QBCore.Functions.CreateCallback('lusty94_icecream:get:Mug', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local mug = Player.Functions.GetItemByName("mug")
    if mug then
        cb(true)
    else
        cb(false)
    end
end)


--Create Tea
RegisterNetEvent('lusty94_icecream:server:CreateTea', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if InvType == 'qb' then
        if exports['qb-inventory']:RemoveItem(src, 'mug', 1, false, false, false) then
            TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items['mug'], 'remove', 1)
            exports['qb-inventory']:AddItem(src, 'tea', 1, false, false, false)
            TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items['tea'], 'add', 1)
        end
    elseif InvType == 'ox' then
        if exports.ox_inventory:RemoveItem(src,"mug", 1) then
            if exports.ox_inventory:CanCarryItem(src, "tea", 1) then
                exports.ox_inventory:AddItem(src,"tea", 1)
            else
                SendNotify(src,Config.Language.Notifications.CantCarry, 'error', 2000)
            end
        end
    end
end)

--Create Coffee
RegisterNetEvent('lusty94_icecream:server:CreateCoffee', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if InvType == 'qb' then
        if exports['qb-inventory']:RemoveItem(src, 'mug', 1, false, false, false) then
            TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items['mug'], 'remove', 1)
            exports['qb-inventory']:AddItem(src, 'coffee', 1, false, false, false)
            TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items['coffee'], 'add', 1)
        end
    elseif InvType == 'ox' then
        if exports.ox_inventory:RemoveItem(src,"mug", 1) then
            if exports.ox_inventory:CanCarryItem(src, "coffee", 1) then
                exports.ox_inventory:AddItem(src,"coffee", 1)
            else
                SendNotify(src,Config.Language.Notifications.CantCarry, 'error', 2000)
            end
        end
    end
end)

--Create Hot Chocolate
RegisterNetEvent('lusty94_icecream:server:CreateHotChocolate', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if InvType == 'qb' then
        if exports['qb-inventory']:RemoveItem(src, 'mug', 1, false, false, false) then
            TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items['mug'], 'remove', 1)
            exports['qb-inventory']:AddItem(src, 'hotchocolate', 1, false, false, false)
            TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items['hotchocolate'], 'add', 1)
        end
    elseif InvType == 'ox' then
        if exports.ox_inventory:RemoveItem(src,"mug", 1) then
            if exports.ox_inventory:CanCarryItem(src, "hotchocolate", 1) then
                exports.ox_inventory:AddItem(src,"hotchocolate", 1)
            else
                SendNotify(src,Config.Language.Notifications.CantCarry, 'error', 2000)
            end
        end
    end
end)


-------------------------------------------------< MAKE HOT DRINKS END >--------------------------------







-------------------------------------------------< MAKE SOFT DRINKS START >--------------------------------


--Soft Drinks Cup Callback
QBCore.Functions.CreateCallback('lusty94_icecream:get:SoftDrinksCup', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local cup = Player.Functions.GetItemByName("softdrinkscup")
    if cup then
        cb(true)
    else
        cb(false)
    end
end)


--Create Cola
RegisterNetEvent('lusty94_icecream:server:CreateCola', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if InvType == 'qb' then
        if exports['qb-inventory']:RemoveItem(src, 'softdrinkscup', 1, false, false, false) then
            TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items['softdrinkscup'], 'remove', 1)
            exports['qb-inventory']:AddItem(src, 'cola', 1, false, false, false)
            TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items['cola'], 'add', 1)
        end
    elseif InvType == 'ox' then
        if exports.ox_inventory:RemoveItem(src,"softdrinkscup", 1) then
            if exports.ox_inventory:CanCarryItem(src, "cola", 1) then
                exports.ox_inventory:AddItem(src,"cola", 1)
            else
                SendNotify(src,Config.Language.Notifications.CantCarry, 'error', 2000)
            end
        end
    end
end)

--Create Lemonade
RegisterNetEvent('lusty94_icecream:server:CreateLemonade', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if InvType == 'qb' then
        if exports['qb-inventory']:RemoveItem(src, 'softdrinkscup', 1, false, false, false) then
            TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items['softdrinkscup'], 'remove', 1)
            exports['qb-inventory']:AddItem(src, 'lemonade', 1, false, false, false)
            TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items['lemonade'], 'add', 1)
        end
    elseif InvType == 'ox' then
        if exports.ox_inventory:RemoveItem(src,"softdrinkscup", 1) then
            if exports.ox_inventory:CanCarryItem(src, "lemonade", 1) then
                exports.ox_inventory:AddItem(src,"lemonade", 1)
            else
                SendNotify(src,Config.Language.Notifications.CantCarry, 'error', 2000)
            end
        end
    end
end)

--Create Orange Soda
RegisterNetEvent('lusty94_icecream:server:CreateOrangeSoda', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if InvType == 'qb' then
        if exports['qb-inventory']:RemoveItem(src, 'softdrinkscup', 1, false, false, false) then
            TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items['softdrinkscup'], 'remove', 1)
            exports['qb-inventory']:AddItem(src, 'orangesoda', 1, false, false, false)
            TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items['orangesoda'], 'add', 1)
        end
    elseif InvType == 'ox' then
        if exports.ox_inventory:RemoveItem(src,"softdrinkscup", 1) then
            if exports.ox_inventory:CanCarryItem(src, "orangesoda", 1) then
                exports.ox_inventory:AddItem(src,"orangesoda", 1)
            else
                SendNotify(src,Config.Language.Notifications.CantCarry, 'error', 2000)
            end
        end
    end
end)


-------------------------------------------------< MAKE SOFT DRINKS END >--------------------------------










-------------------------------------------------< MAKE ICE CREAMS START >--------------------------------



--Vanilla IceCream Callback
QBCore.Functions.CreateCallback('lusty94_icecream:get:VanillaIceCream', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local cone = Player.Functions.GetItemByName("icecreamcone")
    local ingredient = Player.Functions.GetItemByName("vanilla")
    local mix = Player.Functions.GetItemByName("softscoopmix")
    if cone and ingredient and mix then
        cb(true)
    else
        cb(false)
    end
end)


--Create Vanilla IceCream
RegisterNetEvent('lusty94_icecream:server:CreateVanillaIceCream', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if InvType == 'qb' then
        if exports['qb-inventory']:RemoveItem(src, 'icecreamcone', 1, false, false, false) then
            TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items['icecreamcone'], 'remove', 1)
            exports['qb-inventory']:RemoveItem(src, 'vanilla', 1, false, false, false)
            TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items['vanilla'], 'remove', 1)
            exports['qb-inventory']:RemoveItem(src, 'softscoopmix', 1, false, false, false)
            TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items['softscoopmix'], 'remove', 1)
            exports['qb-inventory']:AddItem(src, 'vanillaicecream', 1, false, false, false)
            TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items['vanillaicecream'], 'add', 1)
        end
    elseif InvType == 'ox' then
        if exports.ox_inventory:RemoveItem(src,"icecreamcone", 1) then
            exports.ox_inventory:RemoveItem(src,"vanilla", 1)
            exports.ox_inventory:RemoveItem(src,"softscoopmix", 1)
            if exports.ox_inventory:CanCarryItem(src, "vanillaicecream", 1) then
                exports.ox_inventory:AddItem(src,"vanillaicecream", 1)
            else
                SendNotify(src,Config.Language.Notifications.CantCarry, 'error', 2000)
            end
        end
    end
end)


--Chocolate IceCream Callback
QBCore.Functions.CreateCallback('lusty94_icecream:get:ChocolateIceCream', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local cone = Player.Functions.GetItemByName("icecreamcone")
    local ingredient = Player.Functions.GetItemByName("chocolate")
    local mix = Player.Functions.GetItemByName("softscoopmix")
    if cone and ingredient and mix then
        cb(true)
    else
        cb(false)
    end
end)


--Create Chocolate IceCream
RegisterNetEvent('lusty94_icecream:server:CreateChocolateIceCream', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if InvType == 'qb' then
        if exports['qb-inventory']:RemoveItem(src, 'icecreamcone', 1, false, false, false) then
            TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items['icecreamcone'], 'remove', 1)
            exports['qb-inventory']:RemoveItem(src, 'chocolate', 1, false, false, false)
            TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items['chocolate'], 'remove', 1)
            exports['qb-inventory']:RemoveItem(src, 'softscoopmix', 1, false, false, false)
            TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items['softscoopmix'], 'remove', 1)
            exports['qb-inventory']:AddItem(src, 'chocolateicecream', 1, false, false, false)
            TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items['chocolateicecream'], 'add', 1)
        end
    elseif InvType == 'ox' then
        if exports.ox_inventory:RemoveItem(src,"icecreamcone", 1) then
            exports.ox_inventory:RemoveItem(src,"chocolate", 1)
            exports.ox_inventory:RemoveItem(src,"softscoopmix", 1)
            if exports.ox_inventory:CanCarryItem(src, "chocolateicecream", 1) then
                exports.ox_inventory:AddItem(src,"chocolateicecream", 1)
            else
                SendNotify(src,Config.Language.Notifications.CantCarry, 'error', 2000)
            end
        end
    end
end)


--Strawberry IceCream Callback
QBCore.Functions.CreateCallback('lusty94_icecream:get:StrawberryIceCream', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local cone = Player.Functions.GetItemByName("icecreamcone")
    local ingredient = Player.Functions.GetItemByName("strawberry")
    local mix = Player.Functions.GetItemByName("softscoopmix")
    if cone and ingredient and mix then
        cb(true)
    else
        cb(false)
    end
end)


--Create Strawberry IceCream
RegisterNetEvent('lusty94_icecream:server:CreateStrawberryIceCream', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if InvType == 'qb' then
        if exports['qb-inventory']:RemoveItem(src, 'icecreamcone', 1, false, false, false) then
            TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items['icecreamcone'], 'remove', 1)
            exports['qb-inventory']:RemoveItem(src, 'strawberry', 1, false, false, false)
            TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items['strawberry'], 'remove', 1)
            exports['qb-inventory']:RemoveItem(src, 'softscoopmix', 1, false, false, false)
            TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items['softscoopmix'], 'remove', 1)
            exports['qb-inventory']:AddItem(src, 'strawberryicecream', 1, false, false, false)
            TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items['strawberryicecream'], 'add', 1)
        end
    elseif InvType == 'ox' then
        if exports.ox_inventory:RemoveItem(src,"icecreamcone", 1) then
            exports.ox_inventory:RemoveItem(src,"strawberry", 1)
            exports.ox_inventory:RemoveItem(src,"softscoopmix", 1)
            if exports.ox_inventory:CanCarryItem(src, "strawberryicecream", 1) then
                exports.ox_inventory:AddItem(src,"strawberryicecream", 1)
            else
                SendNotify(src,Config.Language.Notifications.CantCarry, 'error', 2000)
            end
        end
    end
end)


--Mint IceCream Callback
QBCore.Functions.CreateCallback('lusty94_icecream:get:MintIceCream', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local cone = Player.Functions.GetItemByName("icecreamcone")
    local ingredient = Player.Functions.GetItemByName("mint")
    local mix = Player.Functions.GetItemByName("softscoopmix")
    if cone and ingredient and mix then
        cb(true)
    else
        cb(false)
    end
end)


--Create Mint IceCream
RegisterNetEvent('lusty94_icecream:server:CreateMintIceCream', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if InvType == 'qb' then
        if exports['qb-inventory']:RemoveItem(src, 'icecreamcone', 1, false, false, false) then
            TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items['icecreamcone'], 'remove', 1)
            exports['qb-inventory']:RemoveItem(src, 'mint', 1, false, false, false)
            TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items['mint'], 'remove', 1)
            exports['qb-inventory']:RemoveItem(src, 'softscoopmix', 1, false, false, false)
            TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items['softscoopmix'], 'remove', 1)
            exports['qb-inventory']:AddItem(src, 'minticecream', 1, false, false, false)
            TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items['minticecream'], 'add', 1)
        end
    elseif InvType == 'ox' then
        if exports.ox_inventory:RemoveItem(src,"icecreamcone", 1) then
            if exports.ox_inventory:CanCarryItem(src, "minticecream", 1) then
                exports.ox_inventory:RemoveItem(src,"mint", 1)
                exports.ox_inventory:RemoveItem(src,"softscoopmix", 1)
                exports.ox_inventory:AddItem(src,"minticecream", 1)
            else
                SendNotify(src,Config.Language.Notifications.CantCarry, 'error', 2000)
            end
        end
    end
end)


--Pistachio IceCream Callback
QBCore.Functions.CreateCallback('lusty94_icecream:get:PistachioIceCream', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local cone = Player.Functions.GetItemByName("icecreamcone")
    local ingredient = Player.Functions.GetItemByName("pistachio")
    local mix = Player.Functions.GetItemByName("softscoopmix")
    if cone and ingredient and mix then
        cb(true)
    else
        cb(false)
    end
end)


--Create Pistachio IceCream
RegisterNetEvent('lusty94_icecream:server:CreatePistachioIceCream', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if InvType == 'qb' then
        if exports['qb-inventory']:RemoveItem(src, 'icecreamcone', 1, false, false, false) then
            TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items['icecreamcone'], 'remove', 1)
            exports['qb-inventory']:RemoveItem(src, 'pistachio', 1, false, false, false)
            TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items['pistachio'], 'remove', 1)
            exports['qb-inventory']:RemoveItem(src, 'softscoopmix', 1, false, false, false)
            TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items['softscoopmix'], 'remove', 1)
            exports['qb-inventory']:AddItem(src, 'pistachioicecream', 1, false, false, false)
            TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items['pistachioicecream'], 'add', 1)
        end
    elseif InvType == 'ox' then
        if exports.ox_inventory:RemoveItem(src,"icecreamcone", 1) then
            exports.ox_inventory:RemoveItem(src,"pistachio", 1)
            exports.ox_inventory:RemoveItem(src,"softscoopmix", 1)
            if exports.ox_inventory:CanCarryItem(src, "pistachioicecream", 1) then
                exports.ox_inventory:AddItem(src,"pistachioicecream", 1)
            else
                SendNotify(src,Config.Language.Notifications.CantCarry, 'error', 2000)
            end
        end
    end
end)


--ButterScotch IceCream Callback
QBCore.Functions.CreateCallback('lusty94_icecream:get:ButterScotchIceCream', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local cone = Player.Functions.GetItemByName("icecreamcone")
    local ingredient = Player.Functions.GetItemByName("butterscotch")
    local mix = Player.Functions.GetItemByName("softscoopmix")
    if cone and ingredient and mix then
        cb(true)
    else
        cb(false)
    end
end)


--Create ButterScotch IceCream
RegisterNetEvent('lusty94_icecream:server:CreateButterScotchIceCream', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if InvType == 'qb' then
        if exports['qb-inventory']:RemoveItem(src, 'icecreamcone', 1, false, false, false) then
            TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items['icecreamcone'], 'remove', 1)
            exports['qb-inventory']:RemoveItem(src, 'butterscotch', 1, false, false, false)
            TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items['butterscotch'], 'remove', 1)
            exports['qb-inventory']:RemoveItem(src, 'softscoopmix', 1, false, false, false)
            TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items['softscoopmix'], 'remove', 1)
            exports['qb-inventory']:AddItem(src, 'butterscotchicecream', 1, false, false, false)
            TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items['butterscotchicecream'], 'add', 1)
        end
    elseif InvType == 'ox' then
        if exports.ox_inventory:RemoveItem(src,"icecreamcone", 1) then
            exports.ox_inventory:RemoveItem(src,"butterscotch", 1)
            exports.ox_inventory:RemoveItem(src,"softscoopmix", 1)
            if exports.ox_inventory:CanCarryItem(src, "butterscotchicecream", 1) then
                exports.ox_inventory:AddItem(src,"butterscotchicecream", 1)
            else
                SendNotify(src,Config.Language.Notifications.CantCarry, 'error', 2000)
            end
        end
    end
end)


--SaltedCaramel IceCream Callback
QBCore.Functions.CreateCallback('lusty94_icecream:get:SaltedCaramelIceCream', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local cone = Player.Functions.GetItemByName("icecreamcone")
    local ingredient = Player.Functions.GetItemByName("saltedcaramel")
    local mix = Player.Functions.GetItemByName("softscoopmix")
    if cone and ingredient and mix then
        cb(true)
    else
        cb(false)
    end
end)


--Create SaltedCaramel IceCream
RegisterNetEvent('lusty94_icecream:server:CreateSaltedCaramelIceCream', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if InvType == 'qb' then
        if exports['qb-inventory']:RemoveItem(src, 'icecreamcone', 1, false, false, false) then
            TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items['icecreamcone'], 'remove', 1)
            exports['qb-inventory']:RemoveItem(src, 'saltedcaramel', 1, false, false, false)
            TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items['saltedcaramel'], 'remove', 1)
            exports['qb-inventory']:RemoveItem(src, 'softscoopmix', 1, false, false, false)
            TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items['softscoopmix'], 'remove', 1)
            exports['qb-inventory']:AddItem(src, 'saltedcaramelicecream', 1, false, false, false)
            TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items['saltedcaramelicecream'], 'add', 1)
        end
    elseif InvType == 'ox' then
        if exports.ox_inventory:RemoveItem(src,"icecreamcone", 1) then
            exports.ox_inventory:RemoveItem(src,"saltedcaramel", 1)
            exports.ox_inventory:RemoveItem(src,"softscoopmix", 1)
            if exports.ox_inventory:CanCarryItem(src, "saltedcaramelicecream", 1) then
                exports.ox_inventory:AddItem(src,"saltedcaramelicecream", 1)
            else
                SendNotify(src,Config.Language.Notifications.CantCarry, 'error', 2000)
            end
        end
    end
end)


--Bubblegum IceCream Callback
QBCore.Functions.CreateCallback('lusty94_icecream:get:BubblegumIceCream', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local cone = Player.Functions.GetItemByName("icecreamcone")
    local ingredient = Player.Functions.GetItemByName("bubblegum")
    local mix = Player.Functions.GetItemByName("softscoopmix")
    if cone and ingredient and mix then
        cb(true)
    else
        cb(false)
    end
end)


--Create Bubblegum IceCream
RegisterNetEvent('lusty94_icecream:server:CreateBubblegumIceCream', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if InvType == 'qb' then
        if exports['qb-inventory']:RemoveItem(src, 'icecreamcone', 1, false, false, false) then
            TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items['icecreamcone'], 'remove', 1)
            exports['qb-inventory']:RemoveItem(src, 'bubblegum', 1, false, false, false)
            TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items['bubblegum'], 'remove', 1)
            exports['qb-inventory']:RemoveItem(src, 'softscoopmix', 1, false, false, false)
            TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items['softscoopmix'], 'remove', 1)
            exports['qb-inventory']:AddItem(src, 'bubblegumicecream', 1, false, false, false)
            TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items['bubblegumicecream'], 'add', 1)
        end
    elseif InvType == 'ox' then
        if exports.ox_inventory:RemoveItem(src,"icecreamcone", 1) then
            exports.ox_inventory:RemoveItem(src,"bubblegum", 1)
            exports.ox_inventory:RemoveItem(src,"softscoopmix", 1)
            if exports.ox_inventory:CanCarryItem(src, "bubblegumicecream", 1) then
                exports.ox_inventory:AddItem(src,"bubblegumicecream", 1)
            else
                SendNotify(src,Config.Language.Notifications.CantCarry, 'error', 2000)
            end
        end
    end
end)


--Toffee IceCream Callback
QBCore.Functions.CreateCallback('lusty94_icecream:get:ToffeeIceCream', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local cone = Player.Functions.GetItemByName("icecreamcone")
    local ingredient = Player.Functions.GetItemByName("toffee")
    local mix = Player.Functions.GetItemByName("softscoopmix")
    if cone and ingredient and mix then
        cb(true)
    else
        cb(false)
    end
end)


--Create Toffee IceCream
RegisterNetEvent('lusty94_icecream:server:CreateToffeeIceCream', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if InvType == 'qb' then
        if exports['qb-inventory']:RemoveItem(src, 'icecreamcone', 1, false, false, false) then
            TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items['icecreamcone'], 'remove', 1)
            exports['qb-inventory']:RemoveItem(src, 'toffee', 1, false, false, false)
            TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items['toffee'], 'remove', 1)
            exports['qb-inventory']:RemoveItem(src, 'softscoopmix', 1, false, false, false)
            TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items['softscoopmix'], 'remove', 1)
            exports['qb-inventory']:AddItem(src, 'toffeeicecream', 1, false, false, false)
            TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items['toffeeicecream'], 'add', 1)
        end
    elseif InvType == 'ox' then
        if exports.ox_inventory:RemoveItem(src,"icecreamcone", 1) then
            exports.ox_inventory:RemoveItem(src,"toffee", 1)
            exports.ox_inventory:RemoveItem(src,"softscoopmix", 1)
            if exports.ox_inventory:CanCarryItem(src, "toffeeicecream", 1) then
                exports.ox_inventory:AddItem(src,"toffeeicecream", 1)
            else
                SendNotify(src,Config.Language.Notifications.CantCarry, 'error', 2000)
            end
        end
    end
end)


--CookieDough IceCream Callback
QBCore.Functions.CreateCallback('lusty94_icecream:get:CookieDoughIceCream', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local cone = Player.Functions.GetItemByName("icecreamcone")
    local ingredient = Player.Functions.GetItemByName("cookiedough")
    local mix = Player.Functions.GetItemByName("softscoopmix")
    if cone and ingredient and mix then
        cb(true)
    else
        cb(false)
    end
end)


--Create CookieDough IceCream
RegisterNetEvent('lusty94_icecream:server:CreateCookieDoughIceCream', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if InvType == 'qb' then
        if exports['qb-inventory']:RemoveItem(src, 'icecreamcone', 1, false, false, false) then
            TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items['icecreamcone'], 'remove', 1)
            exports['qb-inventory']:RemoveItem(src, 'cookiedough', 1, false, false, false)
            TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items['cookiedough'], 'remove', 1)
            exports['qb-inventory']:RemoveItem(src, 'softscoopmix', 1, false, false, false)
            TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items['softscoopmix'], 'remove', 1)
            exports['qb-inventory']:AddItem(src, 'cookiedoughicecream', 1, false, false, false)
            TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items['cookiedoughicecream'], 'add', 1)
        end
    elseif InvType == 'ox' then
        if exports.ox_inventory:RemoveItem(src,"icecreamcone", 1) then
            exports.ox_inventory:RemoveItem(src,"cookiedough", 1)
            exports.ox_inventory:RemoveItem(src,"softscoopmix", 1)
            if exports.ox_inventory:CanCarryItem(src, "cookiedoughicecream", 1) then
                exports.ox_inventory:AddItem(src,"cookiedoughicecream", 1)
            else
                SendNotify(src,Config.Language.Notifications.CantCarry, 'error', 2000)
            end
        end
    end
end)




-------------------------------------------------< MAKE ICE CREAMS END >--------------------------------




if Config.UseJimConsumables then
    local foodTable = {
        ["vanillaicecream"]             = { emote = "icecream1", canRun = false, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(30,50), }},
        ["chocolateicecream"]           = { emote = "icecream2", canRun = false, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(30,50), }},
        ["strawberryicecream"]          = { emote = "icecream3", canRun = false, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(30,50), }},
        ["minticecream"]                = { emote = "icecream4", canRun = false, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(30,50), }},
        ["pistachioicecream"]           = { emote = "icecream5", canRun = false, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(30,50), }},
        ["butterscotchicecream"]        = { emote = "icecream6", canRun = false, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(30,50), }},
        ["saltedcaramelicecream"]       = { emote = "icecream7", canRun = false, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(30,50), }},
        ["bubblegumicecream"]           = { emote = "icecream8", canRun = false, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(30,50), }},
        ["toffeeicecream"]              = { emote = "icecream9", canRun = false, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(30,50), }},
        ["cookiedoughicecream"]         = { emote = "icecream10", canRun = false, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(30,50), }},
        ["vanillasmoothie"]             = { emote = "smoothie1", canRun = false, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "drink", stats = { thirst = math.random(30,50), }},
        ["chocolatesmoothie"]           = { emote = "smoothie2", canRun = false, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "drink", stats = { thirst = math.random(30,50), }},
        ["strawberrysmoothie"]          = { emote = "smoothie3", canRun = false, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "drink", stats = { thirst = math.random(30,50), }},
        ["mintsmoothie"]                = { emote = "smoothie4", canRun = false, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "drink", stats = { thirst = math.random(30,50), }},
        ["pistachiosmoothie"]           = { emote = "smoothie5", canRun = false, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "drink", stats = { thirst = math.random(30,50), }},
        ["butterscotchsmoothie"]        = { emote = "smoothie6", canRun = false, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "drink", stats = { thirst = math.random(30,50), }},
        ["saltedcaramelsmoothie"]       = { emote = "smoothie7", canRun = false, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "drink", stats = { thirst = math.random(30,50), }},
        ["bubblegumsmoothie"]           = { emote = "smoothie8", canRun = false, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "drink", stats = { thirst = math.random(30,50), }},
        ["toffeesmoothie"]              = { emote = "smoothie9", canRun = false, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "drink", stats = { thirst = math.random(30,50), }},
        ["cookiedoughsmoothie"]         = { emote = "smoothie10", canRun = false, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "drink", stats = { thirst = math.random(30,50), }},
        ["vanillacupcake"]              = { emote = "cupcake1", canRun = false, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(30,50), }},
        ["chocolatecupcake"]            = { emote = "cupcake2", canRun = false, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(30,50), }},
        ["chocolatebar"]                = { emote = "chocbar", canRun = false, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(30,50), }},
        ["jamdoughnut"]                 = { emote = "doughnut1", canRun = false, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(30,50), }},
        ["sugardoughnut"]               = { emote = "doughnut2", canRun = false, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(30,50), }},
        ["custarddoughnut"]             = { emote = "doughnut3", canRun = false, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(30,50), }},
        ["chocolatedoughnut"]           = { emote = "doughnut4", canRun = false, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(30,50), }},
        ["tea"]                         = { emote = "drink1", canRun = false, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "drink", stats = { thirst = math.random(30,50), }},
        ["cofee"]                       = { emote = "drink2", canRun = false, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "drink", stats = { thirst = math.random(30,50), }},
        ["hotchocolate"]                = { emote = "drink3", canRun = false, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "drink", stats = { thirst = math.random(30,50), }},
        ["cola"]                        = { emote = "drink4", canRun = false, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "drink", stats = { thirst = math.random(30,50), }},
        ["lemonade"]                    = { emote = "drink5", canRun = false, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "drink", stats = { thirst = math.random(30,50), }},
        ["orangesoda"]                  = { emote = "drink6", canRun = false, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "drink", stats = { thirst = math.random(30,50), }},
    }
    local emoteTable = {
        ["icecream1"] = {"mp_player_inteat@burger",                     "mp_player_int_eat_burger",     "Vanilla Ice Cream",            AnimationOptions = { Prop = "bzzz_icecream_cherry",             PropBone = 18905, PropPlacement = {0.14, 0.03, 0.01, 85.0, 70.0, -203.0}, EmoteMoving = true, EmoteLoop = true, }},
        ["icecream2"] = {"mp_player_inteat@burger",                     "mp_player_int_eat_burger",     "Chocolate Ice Cream",          AnimationOptions = { Prop = "bzzz_icecream_chocolate",          PropBone = 18905, PropPlacement = {0.14, 0.03, 0.01, 85.0, 70.0, -203.0}, EmoteMoving = true, EmoteLoop = true, }},
        ["icecream3"] = {"mp_player_inteat@burger",                     "mp_player_int_eat_burger",     "Strawberry Ice Cream",         AnimationOptions = { Prop = "bzzz_icecream_cherry",             PropBone = 18905, PropPlacement = {0.14, 0.03, 0.01, 85.0, 70.0, -203.0}, EmoteMoving = true, EmoteLoop = true, }},
        ["icecream4"] = {"mp_player_inteat@burger",                     "mp_player_int_eat_burger",     "Mint Ice Cream",               AnimationOptions = { Prop = "bzzz_icecream_cherry",             PropBone = 18905, PropPlacement = {0.14, 0.03, 0.01, 85.0, 70.0, -203.0}, EmoteMoving = true, EmoteLoop = true, }},
        ["icecream5"] = {"mp_player_inteat@burger",                     "mp_player_int_eat_burger",     "Pistachio Ice Cream",          AnimationOptions = { Prop = "bzzz_icecream_chocolate",          PropBone = 18905, PropPlacement = {0.14, 0.03, 0.01, 85.0, 70.0, -203.0}, EmoteMoving = true, EmoteLoop = true, }},
        ["icecream6"] = {"mp_player_inteat@burger",                     "mp_player_int_eat_burger",     "Butterscotch Ice Cream",       AnimationOptions = { Prop = "bzzz_icecream_lemon",              PropBone = 18905, PropPlacement = {0.14, 0.03, 0.01, 85.0, 70.0, -203.0}, EmoteMoving = true, EmoteLoop = true, }},
        ["icecream7"] = {"mp_player_inteat@burger",                     "mp_player_int_eat_burger",     "Salted Caramel Ice Cream",     AnimationOptions = { Prop = "bzzz_icecream_cherry",             PropBone = 18905, PropPlacement = {0.14, 0.03, 0.01, 85.0, 70.0, -203.0}, EmoteMoving = true, EmoteLoop = true, }},
        ["icecream8"] = {"mp_player_inteat@burger",                     "mp_player_int_eat_burger",     "Bubblegum Ice Cream",          AnimationOptions = { Prop = "bzzz_icecream_lemon",              PropBone = 18905, PropPlacement = {0.14, 0.03, 0.01, 85.0, 70.0, -203.0}, EmoteMoving = true, EmoteLoop = true, }},
        ["icecream9"] = {"mp_player_inteat@burger",                     "mp_player_int_eat_burger",     "Toffee Ice Cream",             AnimationOptions = { Prop = "bzzz_icecream_cherry",             PropBone = 18905, PropPlacement = {0.14, 0.03, 0.01, 85.0, 70.0, -203.0}, EmoteMoving = true, EmoteLoop = true, }},
        ["icecream10"] = {"mp_player_inteat@burger",                    "mp_player_int_eat_burger",     "Cookie Dough Ice Cream",       AnimationOptions = { Prop = "bzzz_icecream_chocolate",          PropBone = 18905, PropPlacement = {0.14, 0.03, 0.01, 85.0, 70.0, -203.0}, EmoteMoving = true, EmoteLoop = true, }},
        ["smoothie1"] = {"mp_player_intdrink",                          "loop_bottle",                  "Vanilla Smoothie",             AnimationOptions = { Prop = "beanmachine_cup3",                 PropBone = 18905, PropPlacement = {0.0, -0.11, 0.07, -118.0, -121.0, 37.0}, EmoteMoving = true, EmoteLoop = true, }},
        ["smoothie2"] = {"mp_player_intdrink",                          "loop_bottle",                  "Chocolate Smoothie",           AnimationOptions = { Prop = "beanmachine_cup3",                 PropBone = 18905, PropPlacement = {0.0, -0.11, 0.07, -118.0, -121.0, 37.0}, EmoteMoving = true, EmoteLoop = true, }},
        ["smoothie3"] = {"mp_player_intdrink",                          "loop_bottle",                  "Strawberry Smoothie",          AnimationOptions = { Prop = "beanmachine_cup3",                 PropBone = 18905, PropPlacement = {0.0, -0.11, 0.07, -118.0, -121.0, 37.0}, EmoteMoving = true, EmoteLoop = true, }},
        ["smoothie4"] = {"mp_player_intdrink",                          "loop_bottle",                  "Mint Smoothie",                AnimationOptions = { Prop = "beanmachine_cup3",                 PropBone = 18905, PropPlacement = {0.0, -0.11, 0.07, -118.0, -121.0, 37.0}, EmoteMoving = true, EmoteLoop = true, }},
        ["smoothie5"] = {"mp_player_intdrink",                          "loop_bottle",                  "Pistachio Smoothie",           AnimationOptions = { Prop = "beanmachine_cup3",                 PropBone = 18905, PropPlacement = {0.0, -0.11, 0.07, -118.0, -121.0, 37.0}, EmoteMoving = true, EmoteLoop = true, }},
        ["smoothie6"] = {"mp_player_intdrink",                          "loop_bottle",                  "Butterscotch Smoothie",        AnimationOptions = { Prop = "beanmachine_cup3",                 PropBone = 18905, PropPlacement = {0.0, -0.11, 0.07, -118.0, -121.0, 37.0}, EmoteMoving = true, EmoteLoop = true, }},
        ["smoothie7"] = {"mp_player_intdrink",                          "loop_bottle",                  "Salted Caramel Smoothie",      AnimationOptions = { Prop = "beanmachine_cup3",                 PropBone = 18905, PropPlacement = {0.0, -0.11, 0.07, -118.0, -121.0, 37.0}, EmoteMoving = true, EmoteLoop = true, }},
        ["smoothie8"] = {"mp_player_intdrink",                          "loop_bottle",                  "Bubblegum Smoothie",           AnimationOptions = { Prop = "beanmachine_cup3",                 PropBone = 18905, PropPlacement = {0.0, -0.11, 0.07, -118.0, -121.0, 37.0}, EmoteMoving = true, EmoteLoop = true, }},
        ["smoothie9"] = {"mp_player_intdrink",                          "loop_bottle",                  "Toffee Smoothie",              AnimationOptions = { Prop = "beanmachine_cup3",                 PropBone = 18905, PropPlacement = {0.0, -0.11, 0.07, -118.0, -121.0, 37.0}, EmoteMoving = true, EmoteLoop = true, }},
        ["smoothie10"] = {"mp_player_intdrink",                         "loop_bottle",                  "Cookie Dough Smoothie",        AnimationOptions = { Prop = "beanmachine_cup3",                 PropBone = 18905, PropPlacement = {0.0, -0.11, 0.07, -118.0, -121.0, 37.0}, EmoteMoving = true, EmoteLoop = true, }},
        ["cupcake1"] = {"mp_player_inteat@burger",                      "mp_player_int_eat_burger",     "Vanilla Cupcake",              AnimationOptions = { Prop = "pata_christmasfood6",              PropBone = 60309, PropPlacement = {0.0100, 0.0200, -0.0100, -170.1788, 87.6716, 30.0540}, EmoteMoving = true, EmoteLoop = true, }},
        ["cupcake2"] = {"mp_player_inteat@burger",                      "mp_player_int_eat_burger",     "Chocolate Cupcake",            AnimationOptions = { Prop = "pata_christmasfood6",              PropBone = 60309, PropPlacement = {0.0100, 0.0200, -0.0100, -170.1788, 87.6716, 30.0540}, EmoteMoving = true, EmoteLoop = true, }},
        ["chocbar"] = {"mp_player_inteat@burger",                       "mp_player_int_eat_burger",     "Chocolate Bar",                AnimationOptions = { Prop = "prop_choc_ego",                    PropBone = 60309, PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0}, EmoteMoving = true, EmoteLoop = true, }},
        ["doughnut1"] = {"mp_player_inteat@burger",                     "mp_player_int_eat_burger",     "Jam Dougnut",                  AnimationOptions = { Prop = "prop_amb_donut",                   PropBone = 18905, PropPlacement = {0.13, 0.05, 0.02, -50.0, 16.0, 60.0}, EmoteMoving = true, EmoteLoop = true, }},
        ["doughnut2"] = {"mp_player_inteat@burger",                     "mp_player_int_eat_burger",     "Sugar Dougnut",                AnimationOptions = { Prop = "prop_amb_donut",                   PropBone = 18905, PropPlacement = {0.13, 0.05, 0.02, -50.0, 16.0, 60.0}, EmoteMoving = true, EmoteLoop = true, }},
        ["doughnut3"] = {"mp_player_inteat@burger",                     "mp_player_int_eat_burger",     "Custard Dougnut",              AnimationOptions = { Prop = "prop_amb_donut",                   PropBone = 18905, PropPlacement = {0.13, 0.05, 0.02, -50.0, 16.0, 60.0}, EmoteMoving = true, EmoteLoop = true, }},
        ["doughnut4"] = {"mp_player_inteat@burger",                     "mp_player_int_eat_burger",     "Chocolate Dougnut",            AnimationOptions = { Prop = "bzzz_foodpack_donut002",           PropBone = 60309, PropPlacement = {0.0000, -0.0300, -0.0100, 10.0000, 0.0000, -1.0000}, EmoteMoving = true, EmoteLoop = true, }},
        ["drink1"] = {"amb@world_human_drinking@coffee@male@idle_a",    "idle_c",                       "Tea",                          AnimationOptions = { Prop = "p_amb_coffeecup_01",               PropBone = 28422, PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0}, EmoteMoving = true, EmoteLoop = true, }},
        ["drink2"] = {"amb@world_human_drinking@coffee@male@idle_a",    "idle_c",                       "Coffee",                       AnimationOptions = { Prop = "p_amb_coffeecup_01",               PropBone = 28422, PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0}, EmoteMoving = true, EmoteLoop = true, }},
        ["drink3"] = {"amb@world_human_drinking@coffee@male@idle_a",    "idle_c",                       "Hot Chocolate",                AnimationOptions = { Prop = "p_amb_coffeecup_01",               PropBone = 28422, PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0}, EmoteMoving = true, EmoteLoop = true, }},
        ["drink4"] = {"smo@milkshake_idle",                             "milkshake_idle_clip",          "Cola",                         AnimationOptions = { Prop = "prop_rpemotes_soda04",             PropBone = 28422, PropPlacement = {0.0470, 0.0040, -0.0600, -88.0263, -25.0367, -27.3898}, EmoteMoving = true, EmoteLoop = true, }},
        ["drink5"] = {"smo@milkshake_idle",                             "milkshake_idle_clip",          "Lemonade",                     AnimationOptions = { Prop = "prop_rpemotes_soda04",             PropBone = 28422, PropPlacement = {0.0470, 0.0040, -0.0600, -88.0263, -25.0367, -27.3898}, EmoteMoving = true, EmoteLoop = true, }},
        ["drink6"] = {"smo@milkshake_idle",                             "milkshake_idle_clip",          "Orange Soda",                  AnimationOptions = { Prop = "prop_rpemotes_soda04",             PropBone = 28422, PropPlacement = {0.0470, 0.0040, -0.0600, -88.0263, -25.0367, -27.3898}, EmoteMoving = true, EmoteLoop = true, }},
    }
    for k, v in pairs(foodTable) do TriggerEvent("jim-consumables:server:syncAddItem", k, v) end
    for k, v in pairs(emoteTable) do TriggerEvent("jim-consumables:server:syncAddEmote", k, v) end
end





---------------------------< QB-INVENTORY SHOPS / STASHES >----------------------------------------
--ingredients shop
RegisterNetEvent('lusty94_icecream:server:IngredientsFridge', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local iceCreamIngredients = {
        {name = "softscoopmix",   price = 0, amount = 100000, info = {}, type = "item", slot = 1,},
        {name = "smoothiemix",    price = 0, amount = 100000, info = {}, type = "item", slot = 2,},
        {name = "vanilla",        price = 0, amount = 100000, info = {}, type = "item", slot = 3,},
        {name = "chocolate",      price = 0, amount = 100000, info = {}, type = "item", slot = 4,},
        {name = "strawberry",     price = 0, amount = 100000, info = {}, type = "item", slot = 5,},
        {name = "mint",           price = 0, amount = 100000, info = {}, type = "item", slot = 6,},
        {name = "pistachio",      price = 0, amount = 100000, info = {}, type = "item", slot = 7,},
        {name = "butterscotch",   price = 0, amount = 100000, info = {}, type = "item", slot = 8,},
        {name = "saltedcaramel",  price = 0, amount = 100000, info = {}, type = "item", slot = 9,},
        {name = "bubblegum",      price = 0, amount = 100000, info = {}, type = "item", slot = 10,},
        {name = "toffee",        price = 0, amount = 100000, info = {}, type = "item", slot = 11,},
        {name = "cookiedough",   price = 0, amount = 100000, info = {}, type = "item", slot = 12,},
    }
    exports['qb-inventory']:CreateShop({
        name = 'iceCreamIngredients',
        label = 'Ice Cream Ingredients',
        slots = 12,
        items = iceCreamIngredients
    })
    if Player then
        exports['qb-inventory']:OpenShop(source, 'iceCreamIngredients')
    end
end)

--snacks shop
RegisterNetEvent('lusty94_icecream:server:SnackShelf', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local iceCreamSnacks = {
        {name = "vanillacupcake",     price = 0, amount = 100000, info = {}, type = "item", slot = 1,},
        {name = "chocolatecupcake",   price = 0, amount = 100000, info = {}, type = "item", slot = 2,},
        {name = "chocolatebar",       price = 0, amount = 100000, info = {}, type = "item", slot = 3,},
        {name = "jamdoughnut",        price = 0, amount = 100000, info = {}, type = "item", slot = 4,},
        {name = "sugardoughnut",      price = 0, amount = 100000, info = {}, type = "item", slot = 5,},
        {name = "custarddoughnut",    price = 0, amount = 100000, info = {}, type = "item", slot = 6,},
        {name = "chocolatedoughnut",  price = 0, amount = 100000, info = {}, type = "item", slot = 7,},
    }
    exports['qb-inventory']:CreateShop({
        name = 'iceCreamSnacks',
        label = 'Ice Cream Snacks',
        slots = 7,
        items = iceCreamSnacks
    })
    if Player then
        exports['qb-inventory']:OpenShop(source, 'iceCreamSnacks')
    end
end)

--storage fridge
RegisterNetEvent('lusty94_icecream:server:StorageFridge', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local stashName = 'Ice Cream Storage Fridge'
    local stashInfo = {
        weight = 100000000,
        slots = 64,
    }
    if Player then
        exports['qb-inventory']:OpenInventory(src, stashName, {
            maxweight = stashInfo.weight,
            slots = stashInfo.slots,
        })
    end
end)

--collection tray
RegisterNetEvent('lusty94_icecream:server:CollectionTray', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local stashName = 'Ice Cream Collection Tray'
    local stashInfo = {
        weight = 1000000,
        slots = 6,
    }
    if Player then
        exports['qb-inventory']:OpenInventory(src, stashName, {
            maxweight = stashInfo.weight,
            slots = stashInfo.slots,
        })
    end
end)


---------------------------< OX_INVENTORY SHOPS / STASHES >----------------------------------------


--ingredients shop
function IceCreamIngredients()
    exports.ox_inventory:RegisterShop('IceCreamIngredients', {
        name = 'Ice Cream Ingredients',
        inventory = {
            { name = 'softscoopmix', price = 0 },
            { name = 'smoothiemix', price = 0 },
            { name = 'vanilla', price = 0 },
            { name = 'chocolate', price = 0 },
            { name = 'strawberry', price = 0 },
            { name = 'mint', price = 0 },
            { name = 'pistachio', price = 0 },
            { name = 'butterscotch', price = 0 },
            { name = 'saltedcaramel', price = 0 },
            { name = 'bubblegum', price = 0 },
            { name = 'toffee', price = 0 },
            { name = 'cookiedough', price = 0 },
        },
        groups = {
            icecream = 0
        },
    })    
end

--snacks shop
function IceCreamSnacks()
    exports.ox_inventory:RegisterShop('IceCreamSnacks', {
        name = 'Ice Cream Snack Shelf',
        inventory = {
            { name = 'vanillacupcake', price = 0 },
            { name = 'chocolatecupcake', price = 0 },
            { name = 'chocolatebar', price = 0 },
            { name = 'jamdoughnut', price = 0 },
            { name = 'sugardoughnut', price = 0 },
            { name = 'custarddoughnut', price = 0 },
            { name = 'chocolatedoughnut', price = 0 },
        },
        groups = {
            icecream = 0
        },
    })
end

--collection tray
function IceCreamCollectionTray()
    local collectionTray = {
        id = 'IceCreamCollectionTray',
        label = 'Ice Cream Collection Tray',
        slots = 6,
        weight = 10000000,
        owner = false,
    }
    exports.ox_inventory:RegisterStash(collectionTray.id, collectionTray.label, collectionTray.slots, collectionTray.weight, collectionTray.owner, collectionTray.jobs)
end
--weapon storage
function IceCreamStorageFridge()
    local storage = {
        id = 'IceCreamStorageFridge',
        label = 'Ice Cream Storage Fridge',
        slots = 64,
        weight = 10000000,
        owner = true,
        jobs = {["icecream"] = 0},
    }
    exports.ox_inventory:RegisterStash(storage.id, storage.label, storage.slots, storage.weight, storage.owner, storage.jobs)
end


-- dont touch this is for ox stashes and shops
AddEventHandler('onResourceStart', function(resourceName)
    if (GetCurrentResourceName() == resourceName) then
        if InvType == 'ox' then
            print('^5--<^3!^5>-- ^7| Lusty94_IceCream |^5 ^5--<^3!^5>--^7')
            print('^5--<^3!^5>-- ^7| Inventory Type is set to ox |^5 ^5--<^3!^5>--^7')
            print('^5--<^3!^5>-- ^7| Registering shops and stashes automatically |^5 ^5--<^3!^5>--^7')
            IceCreamIngredients()
            IceCreamSnacks()
            IceCreamCollectionTray()
            IceCreamStorageFridge()
            print('^5--<^3!^5>-- ^7| Shops and stashes registered successfully |^5 ^5--<^3!^5>--^7')
        end
    end
end)



local function CheckVersion()
	PerformHttpRequest('https://raw.githubusercontent.com/Lusty94/UpdatedVersions/main/IceCream/version.txt', function(err, newestVersion, headers)
		local currentVersion = GetResourceMetadata(GetCurrentResourceName(), 'version')
		if not newestVersion then print("Currently unable to run a version check.") return end
		local advice = "^1You are currently running an outdated version^7, ^1please update^7"
		if newestVersion:gsub("%s+", "") == currentVersion:gsub("%s+", "") then advice = '^6You are running the latest version.^7'
		else print("^3Version Check^7: ^5Current^7: "..currentVersion.." ^5Latest^7: "..newestVersion.." "..advice) end
	end)
end
CheckVersion()