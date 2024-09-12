local QBCore = exports['qb-core']:GetCoreObject()
local NotifyType = Config.CoreSettings.Notify.Type
local TargetType = Config.CoreSettings.Target.Type
local ClothingType = Config.CoreSettings.Clothing.Type
local InvType = Config.CoreSettings.Inventory.Type
local busy, onDuty = false, false
PlayerJob = {}
local spawnedIceCreamProps = {}

if Config.DevMode then
    onDuty = true
end
-------------------------------------------< BLIP SECTION START >--------------------------------
--Blips
CreateThread(function()
    for k, v in pairs(Config.Blips) do
        if v.useblip then
            v.blip = AddBlipForCoord(v.coords.x, v.coords.y, v.coords.z)
            SetBlipSprite(v.blip, v.id)
            SetBlipDisplay(v.blip, 4)
            SetBlipScale(v.blip, v.scale)
            SetBlipColour(v.blip, v.colour)
            SetBlipAsShortRange(v.blip, true)
            BeginTextCommandSetBlipName('STRING')
            AddTextComponentString(v.title)
            EndTextCommandSetBlipName(v.blip)
        end
    end
end)
-------------------------------------------------< BLIP SECTION END >--------------------------------


--notification function
local function SendNotify(msg,type,time,title)
    if NotifyType == nil then print("Lusty94_IceCream: NotifyType Not Set in Config.CoreSettings.Notify.Type!") return end
    if not title then title = "Ice Cream" end
    if not time then time = 5000 end
    if not type then type = 'success' end
    if not msg then print("Notification Sent With No Message.") return end
    if NotifyType == 'qb' then
        QBCore.Functions.Notify(msg,type,time)
    elseif NotifyType == 'okok' then
        exports['okokNotify']:Alert(title, msg, time, type, true)
    elseif NotifyType == 'mythic' then
        exports['mythic_notify']:DoHudText(type, msg)
    elseif NotifyType == 'boii' then
        exports['boii_ui']:notify(title, msg, type, time)
    elseif NotifyType == 'ox' then
        lib.notify({ title = title, description = msg, type = type, duration = time})
    end
end



---------------------------------------------------< JOB SECTION START >----------------------------------------



RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
   QBCore.Functions.GetPlayerData(function(PlayerData)
       PlayerJob = PlayerData.job
   end)
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate')
AddEventHandler('QBCore:Client:OnJobUpdate', function(JobInfo)
   PlayerJob = JobInfo
   onDuty = PlayerJob.onduty
end)

RegisterNetEvent('QBCore:Client:SetDuty')
AddEventHandler('QBCore:Client:SetDuty', function(duty)
   onDuty = duty
end)

RegisterNetEvent("lusty94_icecream:client:ToggleDuty")
AddEventHandler("lusty94_icecream:client:ToggleDuty", function()
   TriggerServerEvent("QBCore:ToggleDuty")
end)




RegisterNetEvent('lusty94_icecream:client:changeClothes', function()
    if ClothingType == 'qb' then
        TriggerEvent('qb-clothing:client:openOutfitMenu')
    elseif ClothingType == 'illenium' then
        TriggerEvent('qb-clothing:client:openOutfitMenu') -- illenium has backwards compat built in just make sure you have followed docs for illenium    
    elseif ClothingType == 'custom' then
        -- insert your own custom code for opening outfit menu in your clothing script
    end
end)


--ingredients fridge
RegisterNetEvent("lusty94_icecream:client:IngredientsFridge", function()
    if onDuty then
        if InvType == 'qb' then
            TriggerServerEvent('lusty94_icecream:server:IngredientsFridge')
        elseif InvType == 'ox' then
            exports.ox_inventory:openInventory('shop', { type = 'IceCreamIngredients' })
        end
    else
        SendNotify(Config.Language.Notifications.Duty, 'error', 2000)
    end
end)

--snack shelf
AddEventHandler("lusty94_icecream:client:SnackShelf", function()
    if onDuty then
        if InvType == 'qb' then
            TriggerServerEvent('lusty94_icecream:server:SnackShelf')
        elseif InvType == 'ox' then
            exports.ox_inventory:openInventory('shop', { type = 'IceCreamSnacks' })
        end
    else
        SendNotify(Config.Language.Notifications.Duty, 'error', 2000)
    end
end)


--storage fridge
RegisterNetEvent("lusty94_icecream:client:StorageFridge", function()
    if onDuty then
        if InvType == 'qb' then
            TriggerServerEvent('lusty94_icecream:server:StorageFridge')
        elseif InvType == 'ox' then
            exports.ox_inventory:openInventory('stash', 'IceCreamStorageFridge')
        end
    else
        SendNotify(Config.Language.Notifications.Duty, 'error', 2000)
    end
end)


--collection tray
RegisterNetEvent("lusty94_icecream:client:OpenCollectionTray", function()
    if InvType == 'qb' then
        TriggerServerEvent('lusty94_icecream:server:CollectionTray')
    elseif InvType == 'ox' then
        exports.ox_inventory:openInventory('stash', 'IceCreamCollectionTray')
    end
end)


--products menu
RegisterNetEvent('lusty94_icecream:client:OpenProductsMenu', function()
    exports['ps-ui']:ShowImage(Config.CoreSettings.ProductMenu.URL)
end)



--props
CreateThread(function()
    for k,v in pairs(Config.InteractionLocations.Props) do
        lib.requestModel(v.Model, 5000)
        iceCreamProps = CreateObject(v.Model, v.Coords.x, v.Coords.y, v.Coords.z, true, false, false)
        SetEntityHeading(iceCreamProps, v.Coords.w)
        PlaceObjectOnGroundProperly(iceCreamProps, true)
        FreezeEntityPosition(iceCreamProps, true)
        spawnedIceCreamProps[#spawnedIceCreamProps+1] = iceCreamProps
        if TargetType == 'qb' then
            exports['qb-target']:AddTargetEntity(iceCreamProps, { options = { { type = "client", event = v.Event, icon = v.Icon, label = v.Label, job = v.Job, }, }, distance = v.Distance })
        elseif TargetType == 'ox' then
            exports.ox_target:addLocalEntity(iceCreamProps, { { name = 'iceCreamProps', icon = v.Icon, label = v.Label, event = v.Event, groups = v.Job, distance = v.Distance} })
        end
    end
end)



--Smoothie Cup
RegisterNetEvent('lusty94_icecream:client:GiveSmoothieCup', function(data)
    local input = lib.inputDialog('Polar Ice Cream', {
        {type = 'number', label = 'Smoothie Cups', description = 'How many do you need?', icon = 'arrow-right'},
      })
    if input then
        TriggerServerEvent('lusty94_icecream:server:GiveSmoothieCup', tonumber(input[1]))
    end
end)

--Mug
RegisterNetEvent('lusty94_icecream:client:GiveMug', function(data)
    local input = lib.inputDialog('Polar Ice Cream', {
        {type = 'number', label = 'Mugs', description = 'How many do you need?', icon = 'arrow-right'},
      })
    if input then
        TriggerServerEvent('lusty94_icecream:server:GiveMug', tonumber(input[1]))
    end
end)

--Soft Drinks Cup
RegisterNetEvent('lusty94_icecream:client:GiveSoftDrinksCup', function(data)
    local input = lib.inputDialog('Polar Ice Cream', {
        {type = 'number', label = 'Soft Drinks Cups', description = 'How many do you need?', icon = 'arrow-right'},
      })
    if input then
        TriggerServerEvent('lusty94_icecream:server:GiveSoftDrinksCup', tonumber(input[1]))
    end
end)

--Ice Cream Cone
RegisterNetEvent('lusty94_icecream:client:GiveIceCreamCones', function(data)
    local input = lib.inputDialog('Polar Ice Cream', {
        {type = 'number', label = 'Ice Cream Cones', description = 'How many do you need?', icon = 'arrow-right'},
      })
    if input then
        TriggerServerEvent('lusty94_icecream:server:GiveIceCreamCone', tonumber(input[1]))
    end
end)


--Prepare Vanilla Smoothie
RegisterNetEvent("lusty94_icecream:client:PrepareVanillaSmoothie", function()
    if onDuty then
        QBCore.Functions.TriggerCallback('lusty94_icecream:get:VanillaSmoothie', function(HasItems)  
        if HasItems then                
                if busy then
                    SendNotify(Config.Language.Notifications.Busy, 'error', 2000)
                else
                    local success = lib.skillCheck({'easy', 'easy', 'easy', 'easy', 'easy'}, {'e'})
                    if success then
                        busy = true
                        LockInventory(true)
                        if Config.CoreSettings.Sound.UseInteractSound then
                            TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 10, Config.CoreSettings.Sound.PourSmoothies, 0.5)
                        end 
                        if lib.progressCircle({ 
                            duration = Config.CoreSettings.Timers.PrepareSmoothies, 
                            label = Config.Language.ProgressBar.PrepareSmoothie, 
                            position = 'bottom', 
                            useWhileDead = false, 
                            canCancel = true, 
                            disable = { car = true, move = true, },
                            anim = { dict = Config.Animations.PrepareSmoothies.dict, clip = Config.Animations.PrepareSmoothies.anim, flag = Config.Animations.PrepareSmoothies.flag,},
                        }) then
                            TriggerServerEvent('lusty94_icecream:server:CreateVanillaSmoothie')
                            busy = false
                            LockInventory(false)
                        else 
                            busy = false
                            LockInventory(false)
                            SendNotify(Config.Language.Notifications.Cancelled, 'error', 2000)
                        end
                    else
                        SendNotify(Config.Language.Notifications.Failed, 'error', 2000)
                    end
                end
            else
                SendNotify(Config.Language.Notifications.NoItems, 'error', 2000)
            end
        end)
    else 
        SendNotify(Config.Language.Notifications.Duty, 'error', 2000)
    end
end)


--Prepare Chocolate Smoothie
RegisterNetEvent("lusty94_icecream:client:PrepareChocolateSmoothie", function()
    if onDuty then
        QBCore.Functions.TriggerCallback('lusty94_icecream:get:ChocolateSmoothie', function(HasItems)  
            if HasItems then                
                if busy then
                    SendNotify(Config.Language.Notifications.Busy, 'error', 2000)
                else
                    local success = lib.skillCheck({'easy', 'easy', 'easy', 'easy', 'easy'}, {'e'})
                    if success then
                        busy = true
                        LockInventory(true)
                        if Config.CoreSettings.Sound.UseInteractSound then
                            TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 10, Config.CoreSettings.Sound.PourSmoothies, 0.5)
                        end 
                        if lib.progressCircle({ 
                            duration = Config.CoreSettings.Timers.PrepareSmoothies, 
                            label = Config.Language.ProgressBar.PrepareSmoothie, 
                            position = 'bottom', 
                            useWhileDead = false, 
                            canCancel = true, 
                            disable = { car = true, move = true, },
                            anim = { dict = Config.Animations.PrepareSmoothies.dict, clip = Config.Animations.PrepareSmoothies.anim, flag = Config.Animations.PrepareSmoothies.flag,},
                        }) then
                            TriggerServerEvent('lusty94_icecream:server:CreateChocolateSmoothie')
                            busy = false
                            LockInventory(false)
                        else 
                            busy = false
                            LockInventory(false)
                            SendNotify(Config.Language.Notifications.Cancelled, 'error', 2000)
                        end
                    else
                        SendNotify(Config.Language.Notifications.Failed, 'error', 2000)
                    end
                end
            else
                SendNotify(Config.Language.Notifications.NoItems, 'error', 2000)
            end
        end)
    else 
        SendNotify(Config.Language.Notifications.Duty, 'error', 2000)
    end
end)


--Prepare Strawberry Smoothie
RegisterNetEvent("lusty94_icecream:client:PrepareStrawberrySmoothie", function()
    if onDuty then
        QBCore.Functions.TriggerCallback('lusty94_icecream:get:StrawberrySmoothie', function(HasItems)  
            if HasItems then                
                if busy then
                    SendNotify(Config.Language.Notifications.Busy, 'error', 2000)
                else
                    local success = lib.skillCheck({'easy', 'easy', 'easy', 'easy', 'easy'}, {'e'})
                    if success then
                        busy = true
                        LockInventory(true)
                        if Config.CoreSettings.Sound.UseInteractSound then
                            TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 10, Config.CoreSettings.Sound.PourSmoothies, 0.5)
                        end 
                        if lib.progressCircle({ 
                            duration = Config.CoreSettings.Timers.PrepareSmoothies, 
                            label = Config.Language.ProgressBar.PrepareSmoothie, 
                            position = 'bottom', 
                            useWhileDead = false, 
                            canCancel = true, 
                            disable = { car = true, move = true, },
                            anim = { dict = Config.Animations.PrepareSmoothies.dict, clip = Config.Animations.PrepareSmoothies.anim, flag = Config.Animations.PrepareSmoothies.flag,},
                        }) then
                            TriggerServerEvent('lusty94_icecream:server:CreateStrawberrySmoothie')
                            busy = false
                            LockInventory(false)
                        else 
                            busy = false
                            LockInventory(false)
                            SendNotify(Config.Language.Notifications.Cancelled, 'error', 2000)
                        end
                    else
                        SendNotify(Config.Language.Notifications.Failed, 'error', 2000)
                    end
                end
            else
                SendNotify(Config.Language.Notifications.NoItems, 'error', 2000)
            end
        end)
    else 
        SendNotify(Config.Language.Notifications.Duty, 'error', 2000)
    end
end)


--Prepare Mint Smoothie
RegisterNetEvent("lusty94_icecream:client:PrepareMintSmoothie", function()
    if onDuty then
        QBCore.Functions.TriggerCallback('lusty94_icecream:get:MintSmoothie', function(HasItems)  
            if HasItems then                
                if busy then
                    SendNotify(Config.Language.Notifications.Busy, 'error', 2000)
                else
                    local success = lib.skillCheck({'easy', 'easy', 'easy', 'easy', 'easy'}, {'e'})
                    if success then
                        busy = true
                        LockInventory(true)
                        if Config.CoreSettings.Sound.UseInteractSound then
                            TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 10, Config.CoreSettings.Sound.PourSmoothies, 0.5)
                        end 
                        if lib.progressCircle({ 
                            duration = Config.CoreSettings.Timers.PrepareSmoothies, 
                            label = Config.Language.ProgressBar.PrepareSmoothie, 
                            position = 'bottom', 
                            useWhileDead = false, 
                            canCancel = true, 
                            disable = { car = true, move = true, },
                            anim = { dict = Config.Animations.PrepareSmoothies.dict, clip = Config.Animations.PrepareSmoothies.anim, flag = Config.Animations.PrepareSmoothies.flag,},
                        }) then
                            TriggerServerEvent('lusty94_icecream:server:CreateMintSmoothie')
                            busy = false
                            LockInventory(false)
                        else 
                            busy = false
                            LockInventory(false)
                            SendNotify(Config.Language.Notifications.Cancelled, 'error', 2000)
                        end
                    else
                        SendNotify(Config.Language.Notifications.Failed, 'error', 2000)
                    end
                end
            else
                SendNotify(Config.Language.Notifications.NoItems, 'error', 2000)
            end
        end)
    else 
        SendNotify(Config.Language.Notifications.Duty, 'error', 2000)
    end
end)


--Prepare Pistachio Smoothie
RegisterNetEvent("lusty94_icecream:client:PreparePistachioSmoothie", function()
    if onDuty then
        QBCore.Functions.TriggerCallback('lusty94_icecream:get:PistachioSmoothie', function(HasItems)  
            if HasItems then                
                if busy then
                    SendNotify(Config.Language.Notifications.Busy, 'error', 2000)
                else
                    local success = lib.skillCheck({'easy', 'easy', 'easy', 'easy', 'easy'}, {'e'})
                    if success then
                        busy = true
                        LockInventory(true)
                        if Config.CoreSettings.Sound.UseInteractSound then
                            TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 10, Config.CoreSettings.Sound.PourSmoothies, 0.5)
                        end 
                        if lib.progressCircle({ 
                            duration = Config.CoreSettings.Timers.PrepareSmoothies,
                            label = Config.Language.ProgressBar.PrepareSmoothie,
                            position = 'bottom', 
                            useWhileDead = false, 
                            canCancel = true, 
                            disable = { car = true, move = true, },
                            anim = { dict = Config.Animations.PrepareSmoothies.dict, clip = Config.Animations.PrepareSmoothies.anim, flag = Config.Animations.PrepareSmoothies.flag,},
                        }) then
                            TriggerServerEvent('lusty94_icecream:server:CreatePistachioSmoothie')
                            busy = false
                            LockInventory(false)
                        else 
                            busy = false
                            LockInventory(false)
                            SendNotify(Config.Language.Notifications.Cancelled, 'error', 2000)
                        end
                    else
                        SendNotify(Config.Language.Notifications.Failed, 'error', 2000)
                    end
                end
            else
                SendNotify(Config.Language.Notifications.NoItems, 'error', 2000)
            end
        end)
    else 
        SendNotify(Config.Language.Notifications.Duty, 'error', 2000)
    end
end)


--Prepare Butter Scotch Smoothie
RegisterNetEvent("lusty94_icecream:client:PrepareButterScotchSmoothie", function()
    if onDuty then
        QBCore.Functions.TriggerCallback('lusty94_icecream:get:ButterScotchSmoothie', function(HasItems)  
            if HasItems then                
                if busy then
                    SendNotify(Config.Language.Notifications.Busy, 'error', 2000)
                else
                    local success = lib.skillCheck({'easy', 'easy', 'easy', 'easy', 'easy'}, {'e'})
                    if success then
                        busy = true
                        LockInventory(true)
                        if Config.CoreSettings.Sound.UseInteractSound then
                            TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 10, Config.CoreSettings.Sound.PourSmoothies, 0.5)
                        end 
                        if lib.progressCircle({ 
                            duration = Config.CoreSettings.Timers.PrepareSmoothies,
                            label = Config.Language.ProgressBar.PrepareSmoothie, 
                            position = 'bottom', 
                            useWhileDead = false, 
                            canCancel = true, 
                            disable = { car = true, move = true, },
                            anim = { dict = Config.Animations.PrepareSmoothies.dict, clip = Config.Animations.PrepareSmoothies.anim, flag = Config.Animations.PrepareSmoothies.flag,},
                        }) then
                            TriggerServerEvent('lusty94_icecream:server:CreateButterScotchSmoothie')
                            busy = false
                            LockInventory(false)
                        else 
                            busy = false
                            LockInventory(false)
                            SendNotify(Config.Language.Notifications.Cancelled, 'error', 2000)
                        end
                    else
                        SendNotify(Config.Language.Notifications.Failed, 'error', 2000)
                    end
                end
            else
                SendNotify(Config.Language.Notifications.NoItems, 'error', 2000)
            end
        end)
    else 
        SendNotify(Config.Language.Notifications.Duty, 'error', 2000)
    end
end)


--Prepare Salted Caramel Smoothie
RegisterNetEvent("lusty94_icecream:client:PrepareSaltedCaramelSmoothie", function()
    if onDuty then
        QBCore.Functions.TriggerCallback('lusty94_icecream:get:SaltedCaramelSmoothie', function(HasItems)  
            if HasItems then                
                if busy then
                    SendNotify(Config.Language.Notifications.Busy, 'error', 2000)
                else
                    local success = lib.skillCheck({'easy', 'easy', 'easy', 'easy', 'easy'}, {'e'})
                    if success then
                        busy = true
                        LockInventory(true)
                        if Config.CoreSettings.Sound.UseInteractSound then
                            TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 10, Config.CoreSettings.Sound.PourSmoothies, 0.5)
                        end 
                        if lib.progressCircle({ 
                            duration = Config.CoreSettings.Timers.PrepareSmoothies,
                            label = Config.Language.ProgressBar.PrepareSmoothie,
                            position = 'bottom',
                            useWhileDead = false,
                            canCancel = true,
                            disable = { car = true, move = true, },
                            anim = { dict = Config.Animations.PrepareSmoothies.dict, clip = Config.Animations.PrepareSmoothies.anim, flag = Config.Animations.PrepareSmoothies.flag,},
                        }) then
                            TriggerServerEvent('lusty94_icecream:server:CreateSaltedCaramelSmoothie')
                            busy = false
                            LockInventory(false)
                        else 
                            busy = false
                            LockInventory(false)
                            SendNotify(Config.Language.Notifications.Cancelled, 'error', 2000)
                        end
                    else
                        SendNotify(Config.Language.Notifications.Failed, 'error', 2000)
                    end
                end
            else
                SendNotify(Config.Language.Notifications.NoItems, 'error', 2000)
            end
        end)
    else 
        SendNotify(Config.Language.Notifications.Duty, 'error', 2000)
    end
end)


--Prepare Bubblegum Smoothie
RegisterNetEvent("lusty94_icecream:client:PrepareBubblegumSmoothie", function()
    if onDuty then
        QBCore.Functions.TriggerCallback('lusty94_icecream:get:BubblegumSmoothie', function(HasItems)  
            if HasItems then                
                if busy then
                    SendNotify(Config.Language.Notifications.Busy, 'error', 2000)
                else
                    local success = lib.skillCheck({'easy', 'easy', 'easy', 'easy', 'easy'}, {'e'})
                    if success then
                        busy = true
                        LockInventory(true)
                        if Config.CoreSettings.Sound.UseInteractSound then
                            TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 10, Config.CoreSettings.Sound.PourSmoothies, 0.5)
                        end 
                        if lib.progressCircle({ 
                            duration = Config.CoreSettings.Timers.PrepareSmoothies, 
                            label = Config.Language.ProgressBar.PrepareSmoothie, 
                            position = 'bottom', 
                            useWhileDead = false, 
                            canCancel = true, 
                            disable = { car = true, move = true, },
                            anim = { dict = Config.Animations.PrepareSmoothies.dict, clip = Config.Animations.PrepareSmoothies.anim, flag = Config.Animations.PrepareSmoothies.flag,},
                        }) then
                            TriggerServerEvent('lusty94_icecream:server:CreateBubblegumSmoothie')
                            busy = false
                            LockInventory(false)
                        else 
                            busy = false
                            LockInventory(false)
                            SendNotify(Config.Language.Notifications.Cancelled, 'error', 2000)
                        end
                    else
                        SendNotify(Config.Language.Notifications.Failed, 'error', 2000)
                    end
                end
            else
                SendNotify(Config.Language.Notifications.NoItems, 'error', 2000)
            end
        end)
    else 
        SendNotify(Config.Language.Notifications.Duty, 'error', 2000)
    end
end)


--Prepare Toffee Smoothie
RegisterNetEvent("lusty94_icecream:client:PrepareToffeeSmoothie", function()
    if onDuty then
        QBCore.Functions.TriggerCallback('lusty94_icecream:get:ToffeeSmoothie', function(HasItems)  
            if HasItems then                
                if busy then
                    SendNotify(Config.Language.Notifications.Busy, 'error', 2000)
                else
                    local success = lib.skillCheck({'easy', 'easy', 'easy', 'easy', 'easy'}, {'e'})
                    if success then
                        busy = true
                        LockInventory(true)
                        if Config.CoreSettings.Sound.UseInteractSound then
                            TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 10, Config.CoreSettings.Sound.PourSmoothies, 0.5)
                        end 
                        if lib.progressCircle({ 
                            duration = Config.CoreSettings.Timers.PrepareSmoothies, 
                            label = Config.Language.ProgressBar.PrepareSmoothie, 
                            position = 'bottom', 
                            useWhileDead = false, 
                            canCancel = true, 
                            disable = { car = true, move = true, },
                            anim = { dict = Config.Animations.PrepareSmoothies.dict, clip = Config.Animations.PrepareSmoothies.anim, flag = Config.Animations.PrepareSmoothies.flag,},
                        }) then
                            TriggerServerEvent('lusty94_icecream:server:CreateToffeeSmoothie')
                            busy = false
                            LockInventory(false)
                        else 
                            busy = false
                            LockInventory(false)
                            SendNotify(Config.Language.Notifications.Cancelled, 'error', 2000)
                        end
                    else
                        SendNotify(Config.Language.Notifications.Failed, 'error', 2000)
                    end
                end
            else
                SendNotify(Config.Language.Notifications.NoItems, 'error', 2000)
            end
        end)
    else 
        SendNotify(Config.Language.Notifications.Duty, 'error', 2000)
    end
end)


--Prepare CookieDough Smoothie
RegisterNetEvent("lusty94_icecream:client:PrepareCookieDoughSmoothie", function()
    if onDuty then
        QBCore.Functions.TriggerCallback('lusty94_icecream:get:CookieDoughSmoothie', function(HasItems)  
            if HasItems then                
                if busy then
                    SendNotify(Config.Language.Notifications.Busy, 'error', 2000)
                else
                    local success = lib.skillCheck({'easy', 'easy', 'easy', 'easy', 'easy'}, {'e'})
                    if success then
                        busy = true
                        LockInventory(true)
                        if Config.CoreSettings.Sound.UseInteractSound then
                            TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 10, Config.CoreSettings.Sound.PourSmoothies, 0.5)
                        end 
                        if lib.progressCircle({ 
                            duration = Config.CoreSettings.Timers.PrepareSmoothies, 
                            label = Config.Language.ProgressBar.PrepareSmoothie, 
                            position = 'bottom', 
                            useWhileDead = false, 
                            canCancel = true, 
                            disable = { car = true, move = true, },
                            anim = { dict = Config.Animations.PrepareSmoothies.dict, clip = Config.Animations.PrepareSmoothies.anim, flag = Config.Animations.PrepareSmoothies.flag,},
                        }) then
                            TriggerServerEvent('lusty94_icecream:server:CreateCookieDoughSmoothie')
                            busy = false
                            LockInventory(false)
                        else 
                            busy = false
                            LockInventory(false)
                            SendNotify(Config.Language.Notifications.Cancelled, 'error', 2000)
                        end
                    else
                        SendNotify(Config.Language.Notifications.Failed, 'error', 2000)
                    end
                end
            else
                SendNotify(Config.Language.Notifications.NoItems, 'error', 2000)
            end
        end)
    else 
        SendNotify(Config.Language.Notifications.Duty, 'error', 2000)
    end
end)


--Prepare Tea
RegisterNetEvent("lusty94_icecream:client:PrepareTea", function()
    if onDuty then
        QBCore.Functions.TriggerCallback('lusty94_icecream:get:Mug', function(HasItems)  
            if HasItems then                
                if busy then
                    SendNotify(Config.Language.Notifications.Busy, 'error', 2000)
                else
                    local success = lib.skillCheck({'easy', 'easy', 'easy', 'easy', 'easy'}, {'e'})
                    if success then
                        busy = true
                        LockInventory(true)
                        if Config.CoreSettings.Sound.UseInteractSound then
                            TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 10, Config.CoreSettings.Sound.PourHotDrinks, 0.5)
                        end 
                        if lib.progressCircle({ 
                            duration = Config.CoreSettings.Timers.PrepareHotDrinks, 
                            label = Config.Language.ProgressBar.PrepareDrink, 
                            position = 'bottom', 
                            useWhileDead = false, 
                            canCancel = true, 
                            disable = { car = true, move = true, },
                            anim = { dict = Config.Animations.PrepareHotDrinks.dict, clip = Config.Animations.PrepareHotDrinks.anim, flag = Config.Animations.PrepareHotDrinks.flag,},
                        }) then
                            TriggerServerEvent('lusty94_icecream:server:CreateTea')
                            busy = false
                            LockInventory(false)
                        else 
                            busy = false
                            LockInventory(false)
                            SendNotify(Config.Language.Notifications.Cancelled, 'error', 2000)
                        end
                    else
                        SendNotify(Config.Language.Notifications.Failed, 'error', 2000)
                    end
                end
            else
                SendNotify(Config.Language.Notifications.NoItems, 'error', 2000)
            end
        end)
    else 
        SendNotify(Config.Language.Notifications.Duty, 'error', 2000)
    end
end)

--Prepare Coffee
RegisterNetEvent("lusty94_icecream:client:PrepareCoffee", function()
    if onDuty then
        QBCore.Functions.TriggerCallback('lusty94_icecream:get:Mug', function(HasItems)  
            if HasItems then                
                if busy then
                    SendNotify(Config.Language.Notifications.Busy, 'error', 2000)
                else
                    local success = lib.skillCheck({'easy', 'easy', 'easy', 'easy', 'easy'}, {'e'})
                    if success then
                        busy = true
                        LockInventory(true)
                        if Config.CoreSettings.Sound.UseInteractSound then
                            TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 10, Config.CoreSettings.Sound.PourHotDrinks, 0.5)
                        end 
                        if lib.progressCircle({ 
                            duration = Config.CoreSettings.Timers.PrepareHotDrinks, 
                            label = Config.Language.ProgressBar.PrepareDrink, 
                            position = 'bottom', 
                            useWhileDead = false, 
                            canCancel = true, 
                            disable = { car = true, move = true, },
                            anim = { dict = Config.Animations.PrepareHotDrinks.dict, clip = Config.Animations.PrepareHotDrinks.anim, flag = Config.Animations.PrepareHotDrinks.flag,},
                        }) then
                            TriggerServerEvent('lusty94_icecream:server:CreateCoffee')
                            busy = false
                            LockInventory(false)
                        else 
                            busy = false
                            LockInventory(false)
                            SendNotify(Config.Language.Notifications.Cancelled, 'error', 2000)
                        end
                    else
                        SendNotify(Config.Language.Notifications.Failed, 'error', 2000)
                    end
                end
            else
                SendNotify(Config.Language.Notifications.NoItems, 'error', 2000)
            end
        end)
    else 
        SendNotify(Config.Language.Notifications.Duty, 'error', 2000)
    end
end)

--Prepare HotChocolate
RegisterNetEvent("lusty94_icecream:client:PrepareHotChocolate", function()
    if onDuty then
        QBCore.Functions.TriggerCallback('lusty94_icecream:get:Mug', function(HasItems)  
            if HasItems then                
                if busy then
                    SendNotify(Config.Language.Notifications.Busy, 'error', 2000)
                else
                    local success = lib.skillCheck({'easy', 'easy', 'easy', 'easy', 'easy'}, {'e'})
                    if success then
                        busy = true
                        LockInventory(true)
                        if Config.CoreSettings.Sound.UseInteractSound then
                            TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 10, Config.CoreSettings.Sound.PourHotDrinks, 0.5)
                        end 
                        if lib.progressCircle({ 
                            duration = Config.CoreSettings.Timers.PrepareHotDrinks, 
                            label = Config.Language.ProgressBar.PrepareDrink, 
                            position = 'bottom', 
                            useWhileDead = false, 
                            canCancel = true, 
                            disable = { car = true, move = true, },
                            anim = { dict = Config.Animations.PrepareHotDrinks.dict, clip = Config.Animations.PrepareHotDrinks.anim, flag = Config.Animations.PrepareHotDrinks.flag,},
                        }) then
                            TriggerServerEvent('lusty94_icecream:server:CreateHotChocolate')
                            busy = false
                            LockInventory(false)
                        else 
                            busy = false
                            LockInventory(false)
                            SendNotify(Config.Language.Notifications.Cancelled, 'error', 2000)
                        end
                    else
                        SendNotify(Config.Language.Notifications.Failed, 'error', 2000)
                    end
                end
            else
                SendNotify(Config.Language.Notifications.NoItems, 'error', 2000)
            end
        end)
    else 
        SendNotify(Config.Language.Notifications.Duty, 'error', 2000)
    end
end)


--Prepare Cola
RegisterNetEvent("lusty94_icecream:client:PrepareCola", function()
    if onDuty then
        QBCore.Functions.TriggerCallback('lusty94_icecream:get:SoftDrinksCup', function(HasItems)  
            if HasItems then                
                if busy then
                    SendNotify(Config.Language.Notifications.Busy, 'error', 2000)
                else
                    local success = lib.skillCheck({'easy', 'easy', 'easy', 'easy', 'easy'}, {'e'})
                    if success then
                        busy = true
                        LockInventory(true)
                        if Config.CoreSettings.Sound.UseInteractSound then
                            TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 10, Config.CoreSettings.Sound.PourSoftDrinks, 0.5)
                        end 
                        if lib.progressCircle({ 
                            duration = Config.CoreSettings.Timers.PrepareSoftDrinks, 
                            label = Config.Language.ProgressBar.PrepareDrink, 
                            position = 'bottom', 
                            useWhileDead = false, 
                            canCancel = true, 
                            disable = { car = true, move = true, },
                            anim = { dict = Config.Animations.PrepareSoftDrinks.dict, clip = Config.Animations.PrepareSoftDrinks.anim, flag = Config.Animations.PrepareSoftDrinks.flag,},
                        }) then
                            TriggerServerEvent('lusty94_icecream:server:CreateCola')
                            busy = false
                            LockInventory(false)
                        else 
                            busy = false
                            LockInventory(false)
                            SendNotify(Config.Language.Notifications.Cancelled, 'error', 2000)
                        end
                    else
                        SendNotify(Config.Language.Notifications.Failed, 'error', 2000)
                    end
                end
            else
                SendNotify(Config.Language.Notifications.NoItems, 'error', 2000)
            end
        end)
    else 
        SendNotify(Config.Language.Notifications.Duty, 'error', 2000)
    end
end)

--Prepare Lemonade
RegisterNetEvent("lusty94_icecream:client:PrepareLemonade", function()
    if onDuty then
        QBCore.Functions.TriggerCallback('lusty94_icecream:get:SoftDrinksCup', function(HasItems)  
            if HasItems then                
                if busy then
                    SendNotify(Config.Language.Notifications.Busy, 'error', 2000)
                else
                    local success = lib.skillCheck({'easy', 'easy', 'easy', 'easy', 'easy'}, {'e'})
                    if success then
                        busy = true
                        LockInventory(true)
                        if Config.CoreSettings.Sound.UseInteractSound then
                            TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 10, Config.CoreSettings.Sound.PourSoftDrinks, 0.5)
                        end 
                        if lib.progressCircle({ 
                            duration = Config.CoreSettings.Timers.PrepareSoftDrinks, 
                            label = Config.Language.ProgressBar.PrepareDrink, 
                            position = 'bottom', 
                            useWhileDead = false, 
                            canCancel = true, 
                            disable = { car = true, move = true, },
                            anim = { dict = Config.Animations.PrepareSoftDrinks.dict, clip = Config.Animations.PrepareSoftDrinks.anim, flag = Config.Animations.PrepareSoftDrinks.flag,},
                        }) then
                            TriggerServerEvent('lusty94_icecream:server:CreateLemonade')
                            busy = false
                            LockInventory(false)
                        else 
                            busy = false
                            LockInventory(false)
                            SendNotify(Config.Language.Notifications.Cancelled, 'error', 2000)
                        end
                    else
                        SendNotify(Config.Language.Notifications.Failed, 'error', 2000)
                    end
                end
            else
                SendNotify(Config.Language.Notifications.NoItems, 'error', 2000)
            end
        end)
    else 
        SendNotify(Config.Language.Notifications.Duty, 'error', 2000)
    end
end)

--Prepare Orange Soda
RegisterNetEvent("lusty94_icecream:client:PrepareOrangeSoda", function()
    if onDuty then
        QBCore.Functions.TriggerCallback('lusty94_icecream:get:SoftDrinksCup', function(HasItems)  
            if HasItems then                
                if busy then
                    SendNotify(Config.Language.Notifications.Busy, 'error', 2000)
                else
                    local success = lib.skillCheck({'easy', 'easy', 'easy', 'easy', 'easy'}, {'e'})
                    if success then
                        busy = true
                        LockInventory(true)
                        if Config.CoreSettings.Sound.UseInteractSound then
                            TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 10, Config.CoreSettings.Sound.PourSoftDrinks, 0.5)
                        end 
                        if lib.progressCircle({ 
                            duration = Config.CoreSettings.Timers.PrepareSoftDrinks,
                            label = Config.Language.ProgressBar.PrepareDrink,
                            position = 'bottom',
                            useWhileDead = false,
                            canCancel = true,
                            disable = { car = true, move = true, },
                            anim = { dict = Config.Animations.PrepareSoftDrinks.dict, clip = Config.Animations.PrepareSoftDrinks.anim, flag = Config.Animations.PrepareSoftDrinks.flag,},
                        }) then
                            TriggerServerEvent('lusty94_icecream:server:CreateOrangeSoda')
                            busy = false
                            LockInventory(false)
                        else 
                            busy = false
                            LockInventory(false)
                            SendNotify(Config.Language.Notifications.Cancelled, 'error', 2000)
                        end
                    else
                        SendNotify(Config.Language.Notifications.Failed, 'error', 2000)
                    end
                end
            else
                SendNotify(Config.Language.Notifications.NoItems, 'error', 2000)
            end
        end)
    else 
        SendNotify(Config.Language.Notifications.Duty, 'error', 2000)
    end
end)


--Prepare Vanilla IceCream
RegisterNetEvent("lusty94_icecream:client:PrepareVanillaIceCream", function()
    if onDuty then
        QBCore.Functions.TriggerCallback('lusty94_icecream:get:VanillaIceCream', function(HasItems)  
            if HasItems then                
                if busy then
                    SendNotify(Config.Language.Notifications.Busy, 'error', 2000)
                else
                    local success = lib.skillCheck({'easy', 'easy', 'easy', 'easy', 'easy'}, {'e'})
                    if success then
                        busy = true
                        LockInventory(true)
                        if Config.CoreSettings.Sound.UseInteractSound then
                            TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 10, Config.CoreSettings.Sound.ServeIceCream, 0.5)
                        end 
                        if lib.progressCircle({ 
                            duration = Config.CoreSettings.Timers.PrepareIceCream, 
                            label = Config.Language.ProgressBar.PrepareIceCream, 
                            position = 'bottom', 
                            useWhileDead = false, 
                            canCancel = true, 
                            disable = { car = true, move = true, },
                            anim = { dict = Config.Animations.PrepareIceCream.dict, clip = Config.Animations.PrepareIceCream.anim, flag = Config.Animations.PrepareIceCream.flag,},
                        }) then
                            TriggerServerEvent('lusty94_icecream:server:CreateVanillaIceCream')
                            busy = false
                            LockInventory(false)
                        else 
                            busy = false
                            LockInventory(false)
                            SendNotify(Config.Language.Notifications.Cancelled, 'error', 2000)
                        end
                    else
                        SendNotify(Config.Language.Notifications.Failed, 'error', 2000)
                    end
                end
            else
                SendNotify(Config.Language.Notifications.NoItems, 'error', 2000)
            end
        end)
    else 
        SendNotify(Config.Language.Notifications.Duty, 'error', 2000)
    end
end)

--Prepare Chocolate IceCream
RegisterNetEvent("lusty94_icecream:client:PrepareChocolateIceCream", function()
    if onDuty then
        QBCore.Functions.TriggerCallback('lusty94_icecream:get:ChocolateIceCream', function(HasItems)  
            if HasItems then                
                if busy then
                    SendNotify(Config.Language.Notifications.Busy, 'error', 2000)
                else
                    local success = lib.skillCheck({'easy', 'easy', 'easy', 'easy', 'easy'}, {'e'})
                    if success then
                        busy = true
                        LockInventory(true)
                        if Config.CoreSettings.Sound.UseInteractSound then
                            TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 10, Config.CoreSettings.Sound.ServeIceCream, 0.5)
                        end 
                        if lib.progressCircle({ 
                            duration = Config.CoreSettings.Timers.PrepareIceCream, 
                            label = Config.Language.ProgressBar.PrepareIceCream, 
                            position = 'bottom', 
                            useWhileDead = false, 
                            canCancel = true, 
                            disable = { car = true, move = true, },
                            anim = { dict = Config.Animations.PrepareIceCream.dict, clip = Config.Animations.PrepareIceCream.anim, flag = Config.Animations.PrepareIceCream.flag,},
                        }) then
                            TriggerServerEvent('lusty94_icecream:server:CreateChocolateIceCream')
                            busy = false
                            LockInventory(false)
                        else 
                            busy = false
                            LockInventory(false)
                            SendNotify(Config.Language.Notifications.Cancelled, 'error', 2000)
                        end
                    else
                        SendNotify(Config.Language.Notifications.Failed, 'error', 2000)
                    end
                end
            else
                SendNotify(Config.Language.Notifications.NoItems, 'error', 2000)
            end
        end)
    else 
        SendNotify(Config.Language.Notifications.Duty, 'error', 2000)
    end
end)


--Prepare Strawberry IceCream
RegisterNetEvent("lusty94_icecream:client:PrepareStrawberryIceCream", function()
    if onDuty then
        QBCore.Functions.TriggerCallback('lusty94_icecream:get:StrawberryIceCream', function(HasItems)  
            if HasItems then                
                if busy then
                    SendNotify(Config.Language.Notifications.Busy, 'error', 2000)
                else
                    local success = lib.skillCheck({'easy', 'easy', 'easy', 'easy', 'easy'}, {'e'})
                    if success then
                        busy = true
                        LockInventory(true)
                        if Config.CoreSettings.Sound.UseInteractSound then
                            TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 10, Config.CoreSettings.Sound.ServeIceCream, 0.5)
                        end 
                        if lib.progressCircle({ 
                            duration = Config.CoreSettings.Timers.PrepareIceCream, 
                            label = Config.Language.ProgressBar.PrepareIceCream, 
                            position = 'bottom', 
                            useWhileDead = false, 
                            canCancel = true, 
                            disable = { car = true, move = true, },
                            anim = { dict = Config.Animations.PrepareIceCream.dict, clip = Config.Animations.PrepareIceCream.anim, flag = Config.Animations.PrepareIceCream.flag,},
                        }) then
                            TriggerServerEvent('lusty94_icecream:server:CreateStrawberryIceCream')
                            busy = false
                            LockInventory(false)
                        else 
                            busy = false
                            LockInventory(false)
                            SendNotify(Config.Language.Notifications.Cancelled, 'error', 2000)
                        end
                    else
                        SendNotify(Config.Language.Notifications.Failed, 'error', 2000)
                    end
                end
            else
                SendNotify(Config.Language.Notifications.NoItems, 'error', 2000)
            end
        end)
    else 
        SendNotify(Config.Language.Notifications.Duty, 'error', 2000)
    end
end)

--Prepare Mint IceCream
RegisterNetEvent("lusty94_icecream:client:PrepareMintIceCream", function()
    if onDuty then
        QBCore.Functions.TriggerCallback('lusty94_icecream:get:MintIceCream', function(HasItems)  
            if HasItems then                
                if busy then
                    SendNotify(Config.Language.Notifications.Busy, 'error', 2000)
                else
                    local success = lib.skillCheck({'easy', 'easy', 'easy', 'easy', 'easy'}, {'e'})
                    if success then
                        busy = true
                        LockInventory(true)
                        if Config.CoreSettings.Sound.UseInteractSound then
                            TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 10, Config.CoreSettings.Sound.ServeIceCream, 0.5)
                        end 
                        if lib.progressCircle({
                            duration = Config.CoreSettings.Timers.PrepareIceCream, 
                            label = Config.Language.ProgressBar.PrepareIceCream, 
                            position = 'bottom', 
                            useWhileDead = false, 
                            canCancel = true, 
                            disable = { car = true, move = true, },
                            anim = { dict = Config.Animations.PrepareIceCream.dict, clip = Config.Animations.PrepareIceCream.anim, flag = Config.Animations.PrepareIceCream.flag,},
                        }) then
                            TriggerServerEvent('lusty94_icecream:server:CreateMintIceCream')
                            busy = false
                            LockInventory(false)
                        else 
                            busy = false
                            LockInventory(false)
                            SendNotify(Config.Language.Notifications.Cancelled, 'error', 2000)
                        end
                    else
                        SendNotify(Config.Language.Notifications.Failed, 'error', 2000)
                    end
                end
            else
                SendNotify(Config.Language.Notifications.NoItems, 'error', 2000)
            end
        end)
    else 
        SendNotify(Config.Language.Notifications.Duty, 'error', 2000)
    end
end)


--Prepare Pistachio IceCream
RegisterNetEvent("lusty94_icecream:client:PreparePistachioIceCream", function()
    if onDuty then
        QBCore.Functions.TriggerCallback('lusty94_icecream:get:PistachioIceCream', function(HasItems)  
            if HasItems then                
                if busy then
                    SendNotify(Config.Language.Notifications.Busy, 'error', 2000)
                else
                    local success = lib.skillCheck({'easy', 'easy', 'easy', 'easy', 'easy'}, {'e'})
                    if success then
                        busy = true
                        LockInventory(true)
                        if Config.CoreSettings.Sound.UseInteractSound then
                            TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 10, Config.CoreSettings.Sound.ServeIceCream, 0.5)
                        end 
                        if lib.progressCircle({ 
                            duration = Config.CoreSettings.Timers.PrepareIceCream, 
                            label = Config.Language.ProgressBar.PrepareIceCream, 
                            position = 'bottom', 
                            useWhileDead = false, 
                            canCancel = true, 
                            disable = { car = true, move = true, },
                            anim = { dict = Config.Animations.PrepareIceCream.dict, clip = Config.Animations.PrepareIceCream.anim, flag = Config.Animations.PrepareIceCream.flag,},
                        }) then
                            TriggerServerEvent('lusty94_icecream:server:CreatePistachioIceCream')
                            busy = false
                            LockInventory(false)
                        else 
                            busy = false
                            LockInventory(false)
                            SendNotify(Config.Language.Notifications.Cancelled, 'error', 2000)
                        end
                    else
                        SendNotify(Config.Language.Notifications.Failed, 'error', 2000)
                    end
                end
            else
                SendNotify(Config.Language.Notifications.NoItems, 'error', 2000)
            end
        end)
    else 
        SendNotify(Config.Language.Notifications.Duty, 'error', 2000)
    end
end)

--Prepare ButterScotch IceCream
RegisterNetEvent("lusty94_icecream:client:PrepareButterScotchIceCream", function()
    if onDuty then
        QBCore.Functions.TriggerCallback('lusty94_icecream:get:ButterScotchIceCream', function(HasItems)  
            if HasItems then                
                if busy then
                    SendNotify(Config.Language.Notifications.Busy, 'error', 2000)
                else
                    local success = lib.skillCheck({'easy', 'easy', 'easy', 'easy', 'easy'}, {'e'})
                    if success then
                        busy = true
                        LockInventory(true)
                        if Config.CoreSettings.Sound.UseInteractSound then
                            TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 10, Config.CoreSettings.Sound.ServeIceCream, 0.5)
                        end 
                        if lib.progressCircle({ 
                            duration = Config.CoreSettings.Timers.PrepareIceCream, 
                            label = Config.Language.ProgressBar.PrepareIceCream, 
                            position = 'bottom', 
                            useWhileDead = false, 
                            canCancel = true, 
                            disable = { car = true, move = true, },
                            anim = { dict = Config.Animations.PrepareIceCream.dict, clip = Config.Animations.PrepareIceCream.anim, flag = Config.Animations.PrepareIceCream.flag,},
                        }) then
                            TriggerServerEvent('lusty94_icecream:server:CreateButterScotchIceCream')
                            busy = false
                            LockInventory(false)
                        else 
                            busy = false
                            LockInventory(false)
                            SendNotify(Config.Language.Notifications.Cancelled, 'error', 2000)
                        end
                    else
                        SendNotify(Config.Language.Notifications.Failed, 'error', 2000)
                    end
                end
            else
                SendNotify(Config.Language.Notifications.NoItems, 'error', 2000)
            end
        end)
    else 
        SendNotify(Config.Language.Notifications.Duty, 'error', 2000)
    end
end)


--Prepare SaltedCaramel IceCream
RegisterNetEvent("lusty94_icecream:client:PrepareSaltedCaramelIceCream", function()
    if onDuty then
        QBCore.Functions.TriggerCallback('lusty94_icecream:get:SaltedCaramelIceCream', function(HasItems)  
            if HasItems then                
                if busy then
                    SendNotify(Config.Language.Notifications.Busy, 'error', 2000)
                else
                    local success = lib.skillCheck({'easy', 'easy', 'easy', 'easy', 'easy'}, {'e'})
                    if success then
                        busy = true
                        LockInventory(true)
                        if Config.CoreSettings.Sound.UseInteractSound then
                            TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 10, Config.CoreSettings.Sound.ServeIceCream, 0.5)
                        end 
                        if lib.progressCircle({ 
                            duration = Config.CoreSettings.Timers.PrepareIceCream, 
                            label = Config.Language.ProgressBar.PrepareIceCream, 
                            position = 'bottom', 
                            useWhileDead = false, 
                            canCancel = true, 
                            disable = { car = true, }, 
                            anim = { dict = Config.Animations.PrepareIceCream.dict, clip = Config.Animations.PrepareIceCream.anim, flag = Config.Animations.PrepareIceCream.flag,},
                        }) then
                            TriggerServerEvent('lusty94_icecream:server:CreateSaltedCaramelIceCream')
                            busy = false
                            LockInventory(false)
                        else 
                            busy = false
                            LockInventory(false)
                            SendNotify(Config.Language.Notifications.Cancelled, 'error', 2000)
                        end
                    else
                        SendNotify(Config.Language.Notifications.Failed, 'error', 2000)
                    end
                end
            else
                SendNotify(Config.Language.Notifications.NoItems, 'error', 2000)
            end
        end)
    else 
        SendNotify(Config.Language.Notifications.Duty, 'error', 2000)
    end
end)

--Prepare Bubblegum IceCream
RegisterNetEvent("lusty94_icecream:client:PrepareBubblegumIceCream", function()
    if onDuty then
        QBCore.Functions.TriggerCallback('lusty94_icecream:get:BubblegumIceCream', function(HasItems)  
            if HasItems then                
                if busy then
                    SendNotify(Config.Language.Notifications.Busy, 'error', 2000)
                else
                    local success = lib.skillCheck({'easy', 'easy', 'easy', 'easy', 'easy'}, {'e'})
                    if success then
                        busy = true
                        LockInventory(true)
                        if Config.CoreSettings.Sound.UseInteractSound then
                            TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 10, Config.CoreSettings.Sound.ServeIceCream, 0.5)
                        end 
                        if lib.progressCircle({ 
                            duration = Config.CoreSettings.Timers.PrepareIceCream, 
                            label = Config.Language.ProgressBar.PrepareIceCream, 
                            position = 'bottom', 
                            useWhileDead = false, 
                            canCancel = true, 
                            disable = { car = true, move = true, }, 
                            anim = { dict = Config.Animations.PrepareIceCream.dict, clip = Config.Animations.PrepareIceCream.anim, flag = Config.Animations.PrepareIceCream.flag,},
                        }) then
                            TriggerServerEvent('lusty94_icecream:server:CreateBubblegumIceCream')
                            busy = false
                            LockInventory(false)
                        else 
                            busy = false
                            LockInventory(false)
                            SendNotify(Config.Language.Notifications.Cancelled, 'error', 2000)
                        end
                    else
                        SendNotify(Config.Language.Notifications.Failed, 'error', 2000)
                    end
                end
            else
                SendNotify(Config.Language.Notifications.NoItems, 'error', 2000)
            end
        end)
    else 
        SendNotify(Config.Language.Notifications.Duty, 'error', 2000)
    end
end)

--Prepare Toffee IceCream
RegisterNetEvent("lusty94_icecream:client:PrepareToffeeIceCream", function()
    if onDuty then
        QBCore.Functions.TriggerCallback('lusty94_icecream:get:ToffeeIceCream', function(HasItems)  
            if HasItems then                
                if busy then
                    SendNotify(Config.Language.Notifications.Busy, 'error', 2000)
                else
                    local success = lib.skillCheck({'easy', 'easy', 'easy', 'easy', 'easy'}, {'e'})
                    if success then
                        busy = true
                        LockInventory(true)
                        if Config.CoreSettings.Sound.UseInteractSound then
                            TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 10, Config.CoreSettings.Sound.ServeIceCream, 0.5)
                        end 
                        if lib.progressCircle({ 
                            duration = Config.CoreSettings.Timers.PrepareIceCream, 
                            label = Config.Language.ProgressBar.PrepareIceCream, 
                            position = 'bottom', 
                            useWhileDead = false, 
                            canCancel = true, 
                            disable = { car = true, move = true, },
                            anim = { dict = Config.Animations.PrepareIceCream.dict, clip = Config.Animations.PrepareIceCream.anim, flag = Config.Animations.PrepareIceCream.flag,},
                        }) then
                            TriggerServerEvent('lusty94_icecream:server:CreateToffeeIceCream')
                            busy = false
                            LockInventory(false)
                        else 
                            busy = false
                            LockInventory(false)
                            SendNotify(Config.Language.Notifications.Cancelled, 'error', 2000)
                        end
                    else
                        SendNotify(Config.Language.Notifications.Failed, 'error', 2000)
                    end
                end
            else
                SendNotify(Config.Language.Notifications.NoItems, 'error', 2000)
            end
        end)
    else 
        SendNotify(Config.Language.Notifications.Duty, 'error', 2000)
    end
end)

--Prepare CookieDough IceCream
RegisterNetEvent("lusty94_icecream:client:PrepareCookieDoughIceCream", function()
    if onDuty then
        QBCore.Functions.TriggerCallback('lusty94_icecream:get:CookieDoughIceCream', function(HasItems)  
            if HasItems then                
                if busy then
                    SendNotify(Config.Language.Notifications.Busy, 'error', 2000)
                else
                    local success = lib.skillCheck({'easy', 'easy', 'easy', 'easy', 'easy'}, {'e'})
                    if success then
                        busy = true
                        LockInventory(true)
                        if Config.CoreSettings.Sound.UseInteractSound then
                            TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 10, Config.CoreSettings.Sound.ServeIceCream, 0.5)
                        end 
                        if lib.progressCircle({ 
                            duration = Config.CoreSettings.Timers.PrepareIceCream, 
                            label = Config.Language.ProgressBar.PrepareIceCream, 
                            position = 'bottom', 
                            useWhileDead = false, 
                            canCancel = true, 
                            disable = { car = true, move = true, },
                            anim = { dict = Config.Animations.PrepareIceCream.dict, clip = Config.Animations.PrepareIceCream.anim, flag = Config.Animations.PrepareIceCream.flag,},
                        }) then
                            TriggerServerEvent('lusty94_icecream:server:CreateCookieDoughIceCream')
                            busy = false
                            LockInventory(false)
                        else 
                            busy = false
                            LockInventory(false)
                            SendNotify(Config.Language.Notifications.Cancelled, 'error', 2000)
                        end
                    else
                        SendNotify(Config.Language.Notifications.Failed, 'error', 2000)
                    end
                end
            else
                SendNotify(Config.Language.Notifications.NoItems, 'error', 2000)
            end
        end)
    else 
        SendNotify(Config.Language.Notifications.Duty, 'error', 2000)
    end
end)




RegisterNetEvent("lusty94_icecream:client:bill")
AddEventHandler("lusty94_icecream:bill", function()
    if onDuty then
        local bill = lib.inputDialog('Register', {
            {type = 'input',    label = 'Citizen ID', description = 'Players Citizen ID',       icon = 'hashtag'},
            {type = 'number',   label = 'Bill Price', description = 'The Bills Total Price',    icon = 'dollar-sign'}
        })
        if bill ~= nil then
            if bill[1] == nil or bill[2] == nil then
                return
            end
            TriggerServerEvent('lusty94_icecream:server:bill:player', bill[1], bill[2])
        end
    else
        SendNotify(Config.Language.Notifications.Duty, 'error', 2000)
    end
end)


-- function to lock inventory to prevent exploits
function LockInventory(toggle) -- big up to jim for how to do this
	if toggle then
        LocalPlayer.state:set("inv_busy", true, true) -- used by qb, ps and ox
        --this is the old method below
        --[[         
        if InvType == 'qb' then
            this is for the old method if using old qb and ox
            TriggerEvent('inventory:client:busy:status', true) TriggerEvent('canUseInventoryAndHotbar:toggle', false)
        elseif InvType == 'ox' then
            LocalPlayer.state:set("inv_busy", true, true)
        end        
        ]]
    else 
        LocalPlayer.state:set("inv_busy", false, true) -- used by qb, ps and ox
        --this is the old method below
        --[[        
        if InvType == 'qb' then
            this is for the old method if using old qb and ox
         TriggerEvent('inventory:client:busy:status', false) TriggerEvent('canUseInventoryAndHotbar:toggle', true)
        elseif InvType == 'ox' then
            LocalPlayer.state:set("inv_busy", false, true)
        end        
        ]]
    end
end


--function to display item images
function ItemImage(img)
	if InvType == 'ox' then
		return 'nui://ox_inventory/web/images/'.. img.. '.png'
	elseif InvType == 'qb' then
		return 'nui://qb-inventory/html/images/'.. QBCore.Shared.Items[img].image
	end
end



--dont touch
AddEventHandler('onResourceStop', function(resource)
	if resource == GetCurrentResourceName() then
        busy = false
        LockInventory(false)
        for _, v in pairs(spawnedIceCreamProps) do SetEntityAsMissionEntity(v, false, true) DeleteObject(v) end
        for k,v in pairs(Config.InteractionLocations.Props) do if TargetType == 'qb' then exports['qb-target']:RemoveTargetEntity(iceCreamProps, 'iceCreamProps') elseif TargetType == 'ox' then exports.ox_target:removeLocalEntity(iceCreamProps, 'iceCreamProps') end end
        for k, v in pairs(Config.InteractionLocations.JobAreas) do if TargetType == 'qb' then exports['qb-target']:RemoveZone(v.Name) elseif TargetType == 'ox' then exports.ox_target:removeZone(v.Name) end end
        print('^5--<^3!^5>-- ^7| Lusty94 |^5 ^5--<^3!^5>--^7 Ice Cream V2.0.0 Stopped Successfully ^5--<^3!^5>--^7')
    end
end)