local QBCore = exports['qb-core']:GetCoreObject()
local ShopType = Config.CoreSettings.Shop.Type
local InvType = Config.CoreSettings.Inventory.Type
local TargetType = Config.CoreSettings.Target.Type



-------------------------------------------< BLIP SECTION START >--------------------------------
--Blips
CreateThread(function()
    for k, v in pairs(Config.Blips) do
        if v.useblip then
            v.blip = AddBlipForCoord(v['coords'].x, v['coords'].y, v['coords'].z)
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






---------------------------------------------------< JOB SECTION START >----------------------------------------
local onDuty = false
PlayerJob = {}


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
---------------------------------------------------< JOB SECTION END >----------------------------------------








---------------------------------------------------< FRIDGES SECTION START >----------------------------------------

--Ingredients Fridge
RegisterNetEvent("lusty94_icecream:client:IngredientsFridge", function()
    if onDuty then
        if ShopType == 'qb' then
            TriggerServerEvent("inventory:server:OpenInventory", "shop", "Ingredients", Config.InteractionLocations.Ingredients.Items)
        elseif ShopType == 'jim' then
            TriggerServerEvent("jim-shops:ShopOpen", "shop", "Ingredients", Config.InteractionLocations.Ingredients.Items)
        elseif ShopType == 'ox' then
            print('ShopType is set to "ox" make sure you have added the required snippet from the readme file to ox_inventory/data/shops.lua as the target option is now disabled and the event controlled by ox_inventory')
        end
    else
        if Config.CoreSettings.Notify.Type == 'qb' then
            QBCore.Functions.Notify(Config.Language.Notifications.DutyName, "error", Config.CoreSettings.Notify.Length.Error)
        elseif Config.CoreSettings.Notify.Type == 'okok' then
            exports['okokNotify']:Alert(Config.Language.Notifications.DutyLabel,Config.Language.Notifications.DutyName, Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound) 
        elseif Config.CoreSettings.Notify.Type == 'mythic' then
            exports['mythic_notify']:DoHudText('error', Config.Language.Notifications.DutyName)
        elseif Config.CoreSettings.Notify.Type == 'boii' then
            exports['boii_ui']:notify(Config.Language.Notifications.DutyLabel, Config.Language.Notifications.DutyName, 'error', Config.CoreSettings.Notify.Length.Error)
        elseif Config.CoreSettings.Notify.Type == 'ox' then
            lib.notify({ title = Config.Language.Notifications.DutyLabel, description = Config.Language.Notifications.DutyName, type = 'error', duration = Config.CoreSettings.Notify.Length.Error})
        end
    end
end)

--Storage Fridge
RegisterNetEvent("lusty94_icecream:client:StorageFridge", function()
    if onDuty then
        if InvType == 'qb' then
            TriggerEvent("inventory:client:SetCurrentStash", "PolarIceFridge")
            TriggerServerEvent("inventory:server:OpenInventory", "stash", "PolarIceFridge", {
            maxweight = Config.InteractionLocations.Fridge.StashSize,
            slots = Config.InteractionLocations.Fridge.StashSlots, })
        elseif InvType == 'ox' then
            print('InvType is set to "ox" make sure you have added the required snippet from the readme file to ox_inventory/data/stashes.lua as the target option is now disabled and the event controlled by ox_inventory')
        end
    else
        if Config.CoreSettings.Notify.Type == 'qb' then
            QBCore.Functions.Notify(Config.Language.Notifications.DutyName, "error", Config.CoreSettings.Notify.Length.Error)
        elseif Config.CoreSettings.Notify.Type == 'okok' then
            exports['okokNotify']:Alert(Config.Language.Notifications.DutyLabel,Config.Language.Notifications.DutyName, Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound) 
        elseif Config.CoreSettings.Notify.Type == 'mythic' then
            exports['mythic_notify']:DoHudText('error', Config.Language.Notifications.DutyName)
        elseif Config.CoreSettings.Notify.Type == 'boii' then
            exports['boii_ui']:notify(Config.Language.Notifications.DutyLabel, Config.Language.Notifications.DutyName, 'error', Config.CoreSettings.Notify.Length.Error)
        elseif Config.CoreSettings.Notify.Type == 'ox' then
            lib.notify({ title = Config.Language.Notifications.DutyLabel, description = Config.Language.Notifications.DutyName, type = 'error', duration = Config.CoreSettings.Notify.Length.Error})
        end
    end
end)
---------------------------------------------------< FRIDGES SECTION END >----------------------------------------






---------------------------------------------------< SNACK SHELF SECTION START >----------------------------------------

AddEventHandler("lusty94_icecream:client:SnackShelf", function()
    if ShopType == 'qb' then
        TriggerServerEvent("inventory:server:OpenInventory", "shop", "SnackShelf", Config.InteractionLocations.SnackShelf.Items)
    elseif ShopType == 'jim' then
        TriggerServerEvent("jim-shops:ShopOpen", "shop", "SnackShelf", Config.InteractionLocations.SnackShelf.Items)
    elseif ShopType == 'ox' then
        print('ShopType is set to "ox" make sure you have added the required snippet from the readme file to ox_inventory/data/shops.lua as the target option is now disabled and the event controlled by ox_inventory')
    end
end)


---------------------------------------------------< SNACK SHELF SECTION END >----------------------------------------






---------------------------------------------------< COLLECTION TRAY SECTION START >----------------------------------------

RegisterNetEvent("lusty94_icecream:client:OpenCollectionTray", function()
    if InvType == 'qb' then
        TriggerEvent("inventory:client:SetCurrentStash", "collectiontray")
        TriggerServerEvent("inventory:server:OpenInventory", "stash", "collectiontray", {
        maxweight = Config.InteractionLocations.CollectionTray.StashSize,
        slots = Config.InteractionLocations.CollectionTray.StashSlots, })
    elseif InvType == 'ox' then
        print('InvType is set to "ox" make sure you have added the required snippet from the readme file to ox_inventory/data/stashes.lua as the target option is now disabled and the event controlled by ox_inventory')
    end
end)

---------------------------------------------------< COLLECTION TRAY SECTION END >----------------------------------------






-------------------------------------------------< PRODUCTS MENU START >--------------------------------

RegisterNetEvent('lusty94_icecream:client:OpenProductsMenu', function()
    exports['ps-ui']:ShowImage(Config.InteractionLocations.Job.ProductMenu.URL)
end)

-------------------------------------------------< PRODUCTS MENU END >--------------------------------






-------------------------------------------------< CREATE PROPS START >--------------------------------

CreateThread(function()
    RequestModel(`xm_prop_x17_computer_01`)
    while not HasModelLoaded(`xm_prop_x17_computer_01`) do 
        Wait(1)
    end
    RequestModel(`v_res_fridgemoda`)
    while not HasModelLoaded(`v_res_fridgemoda`) do 
        Wait(1)
    end
    Computer = CreateObject(`xm_prop_x17_computer_01`, 271.21, 126.39, 104.37, false, false, false)
    Fridge = CreateObject(`v_res_fridgemoda`, 276.6, 132.4, 103.44, false, false, false)
    SetEntityHeading(Computer,163.04)
    SetEntityHeading(Fridge,160.28)
    FreezeEntityPosition(Computer, true)
    FreezeEntityPosition(Fridge, true)
end)

-------------------------------------------------< CREATE PROPS END >--------------------------------








---------------------------------------------------< INPUT AMOUNTS FOR CUPS AND CONES START >-------------------------------------- 


--Smoothie Cup
RegisterNetEvent('lusty94_icecream:client:GiveSmoothieCup', function(data)
    if onDuty then 
        local dialog = exports['qb-input']:ShowInput({
            header = "How Many Do You Want?",
            submitText = "Confirm",
            inputs = {
                {
                    text = "Amount", -- text you want to be displayed as a place holder
                    name = "amount", -- name of the input should be unique otherwise it might override
                    type = "number", -- type of the input - number will not allow non-number characters in the field so only accepts 0-9
                    isRequired = true, -- Optional [accepted values: true | false] but will submit the form if no value is inputted
                }
            },
        })
        if dialog then
            TriggerServerEvent('lusty94_icecream:server:GiveSmoothieCup', tonumber(dialog["amount"]))
        end
    else
        if Config.CoreSettings.Notify.Type == 'qb' then
            QBCore.Functions.Notify(Config.Language.Notifications.DutyName, "error", Config.CoreSettings.Notify.Length.Error)
        elseif Config.CoreSettings.Notify.Type == 'okok' then
            exports['okokNotify']:Alert(Config.Language.Notifications.DutyLabel,Config.Language.Notifications.DutyName, Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound) 
        elseif Config.CoreSettings.Notify.Type == 'mythic' then
            exports['mythic_notify']:DoHudText('error', Config.Language.Notifications.DutyName)
        elseif Config.CoreSettings.Notify.Type == 'boii' then
            exports['boii_ui']:notify(Config.Language.Notifications.DutyLabel, Config.Language.Notifications.DutyName, 'error', Config.CoreSettings.Notify.Length.Error)
        elseif Config.CoreSettings.Notify.Type == 'ox' then
            lib.notify({ title = Config.Language.Notifications.DutyLabel, description = Config.Language.Notifications.DutyName, type = 'error', duration = Config.CoreSettings.Notify.Length.Error})
        end
    end
end, false)

--Mug
RegisterNetEvent('lusty94_icecream:client:GiveMug', function(data)
    if onDuty then 
        local dialog = exports['qb-input']:ShowInput({
            header = "How Many Do You Want?",
            submitText = "Confirm",
            inputs = {
                {
                    text = "Amount", -- text you want to be displayed as a place holder
                    name = "amount", -- name of the input should be unique otherwise it might override
                    type = "number", -- type of the input - number will not allow non-number characters in the field so only accepts 0-9
                    isRequired = true, -- Optional [accepted values: true | false] but will submit the form if no value is inputted
                }
            },
        })
        if dialog then
            TriggerServerEvent('lusty94_icecream:server:GiveMug', tonumber(dialog["amount"]))
        end
    else
        if Config.CoreSettings.Notify.Type == 'qb' then
            QBCore.Functions.Notify(Config.Language.Notifications.DutyName, "error", Config.CoreSettings.Notify.Length.Error)
        elseif Config.CoreSettings.Notify.Type == 'okok' then
            exports['okokNotify']:Alert(Config.Language.Notifications.DutyLabel,Config.Language.Notifications.DutyName, Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound) 
        elseif Config.CoreSettings.Notify.Type == 'mythic' then
            exports['mythic_notify']:DoHudText('error', Config.Language.Notifications.DutyName)
        elseif Config.CoreSettings.Notify.Type == 'boii' then
            exports['boii_ui']:notify(Config.Language.Notifications.DutyLabel, Config.Language.Notifications.DutyName, 'error', Config.CoreSettings.Notify.Length.Error)
        elseif Config.CoreSettings.Notify.Type == 'ox' then
            lib.notify({ title = Config.Language.Notifications.DutyLabel, description = Config.Language.Notifications.DutyName, type = 'error', duration = Config.CoreSettings.Notify.Length.Error})
        end
    end
end, false)

--Soft Drinks Cup
RegisterNetEvent('lusty94_icecream:client:GiveSoftDrinksCup', function(data)
    if onDuty then 
        local dialog = exports['qb-input']:ShowInput({
            header = "How Many Do You Want?",
            submitText = "Confirm",
            inputs = {
                {
                    text = "Amount", -- text you want to be displayed as a place holder
                    name = "amount", -- name of the input should be unique otherwise it might override
                    type = "number", -- type of the input - number will not allow non-number characters in the field so only accepts 0-9
                    isRequired = true, -- Optional [accepted values: true | false] but will submit the form if no value is inputted
                }
            },
        })
        if dialog then
            TriggerServerEvent('lusty94_icecream:server:GiveSoftDrinksCup', tonumber(dialog["amount"]))
        end
    else
        if Config.CoreSettings.Notify.Type == 'qb' then
            QBCore.Functions.Notify(Config.Language.Notifications.DutyName, "error", Config.CoreSettings.Notify.Length.Error)
        elseif Config.CoreSettings.Notify.Type == 'okok' then
            exports['okokNotify']:Alert(Config.Language.Notifications.DutyLabel,Config.Language.Notifications.DutyName, Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound) 
        elseif Config.CoreSettings.Notify.Type == 'mythic' then
            exports['mythic_notify']:DoHudText('error', Config.Language.Notifications.DutyName)
        elseif Config.CoreSettings.Notify.Type == 'boii' then
            exports['boii_ui']:notify(Config.Language.Notifications.DutyLabel, Config.Language.Notifications.DutyName, 'error', Config.CoreSettings.Notify.Length.Error)
        elseif Config.CoreSettings.Notify.Type == 'ox' then
            lib.notify({ title = Config.Language.Notifications.DutyLabel, description = Config.Language.Notifications.DutyName, type = 'error', duration = Config.CoreSettings.Notify.Length.Error})
        end
    end
end, false)

--Ice Cream Cone
RegisterNetEvent('lusty94_icecream:client:GiveIceCreamCones', function(data)
    if onDuty then 
        local dialog = exports['qb-input']:ShowInput({
            header = "How Many Do You Want?",
            submitText = "Confirm",
            inputs = {
                {
                    text = "Amount", -- text you want to be displayed as a place holder
                    name = "amount", -- name of the input should be unique otherwise it might override
                    type = "number", -- type of the input - number will not allow non-number characters in the field so only accepts 0-9
                    isRequired = true, -- Optional [accepted values: true | false] but will submit the form if no value is inputted
                }
            },
        })
        if dialog then
            TriggerServerEvent('lusty94_icecream:server:GiveIceCreamCones', tonumber(dialog["amount"]))
        end
    else
        if Config.CoreSettings.Notify.Type == 'qb' then
            QBCore.Functions.Notify(Config.Language.Notifications.DutyName, "error", Config.CoreSettings.Notify.Length.Error)
        elseif Config.CoreSettings.Notify.Type == 'okok' then
            exports['okokNotify']:Alert(Config.Language.Notifications.DutyLabel,Config.Language.Notifications.DutyName, Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound) 
        elseif Config.CoreSettings.Notify.Type == 'mythic' then
            exports['mythic_notify']:DoHudText('error', Config.Language.Notifications.DutyName)
        elseif Config.CoreSettings.Notify.Type == 'boii' then
            exports['boii_ui']:notify(Config.Language.Notifications.DutyLabel, Config.Language.Notifications.DutyName, 'error', Config.CoreSettings.Notify.Length.Error)
        elseif Config.CoreSettings.Notify.Type == 'ox' then
            lib.notify({ title = Config.Language.Notifications.DutyLabel, description = Config.Language.Notifications.DutyName, type = 'error', duration = Config.CoreSettings.Notify.Length.Error})
        end
    end
end, false)

---------------------------------------------------< INPUT AMOUNTS FOR CUPS AND CONES END >-------------------------------------- 











-------------------------------------------------< MAKE SMOOTHIES START >--------------------------------

--Prepare Vanilla Smoothie
RegisterNetEvent("lusty94_icecream:client:PrepareVanillaSmoothie", function()
    if onDuty then
        QBCore.Functions.TriggerCallback('lusty94_icecream:get:VanillaSmoothie', function(HasItems)  
            if HasItems then
                if Config.CoreSettings.Sound.UseInteractSound then
                    TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 10, Config.CoreSettings.Sound.PourSmoothies, 0.5)
                end
                QBCore.Functions.Progressbar("prepare_vanillasmoothie", Config.Language.VanillaSmoothie.ProgressBarName, Config.CoreSettings.ProgressBar.Times.PrepareSmoothies, false, false, {
                    disableMovement = true,
                    disableCarMovement = true,
                    disableMouse = false,
                    disableCombat = true,
                }, {
                    animDict = "amb@prop_human_parking_meter@female@base",
                    anim = "base_female",
                    flags = 41,
                }, {}, {}, function()
                    ClearPedTasks(PlayerPedId())
                    TriggerServerEvent('lusty94_icecream:server:CreateVanillaSmoothie')
                        if Config.CoreSettings.Notify.Type == 'qb' then
                            QBCore.Functions.Notify(Config.Language.VanillaSmoothie.NotifyName, "success", Config.CoreSettings.Notify.Length.Success)
                        elseif Config.CoreSettings.Notify.Type == 'okok' then
                            exports['okokNotify']:Alert(Config.Language.VanillaSmoothie.NotifyLabel, Config.Language.VanillaSmoothie.NotifyName, Config.CoreSettings.Notify.Length.Success, 'success', Config.CoreSettings.Notify.Sound)
                        elseif Config.CoreSettings.Notify.Type == 'mythic' then
                            exports['mythic_notify']:DoHudText('success', Config.Language.VanillaSmoothie.NotifyName)
                        elseif Config.CoreSettings.Notify.Type == 'boii' then
                            exports['boii_ui']:notify(Config.Language.VanillaSmoothie.NotifyLabel, Config.Language.VanillaSmoothie.NotifyName, 'success', Config.CoreSettings.Notify.Length.Success)
                        elseif Config.CoreSettings.Notify.Type == 'ox' then
                            lib.notify({ title = Config.Language.VanillaSmoothie.NotifyLabel, description = Config.Language.VanillaSmoothie.NotifyName, type = 'success', duration = Config.CoreSettings.Notify.Length.Success})
                        end
                end, function()
                    ClearPedTasks(PlayerPedId())
                    if Config.CoreSettings.Notify.Type == 'qb' then
                        QBCore.Functions.Notify(Config.Language.Notifications.CancelledName, "error", Config.CoreSettings.Notify.Length.Error)
                    elseif Config.CoreSettings.Notify.Type == 'okok' then
                        exports['okokNotify']:Alert(Config.Language.Notifications.CancelledLabel,Config.Language.Notifications.CancelledName, Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound)
                    elseif Config.CoreSettings.Notify.Type == 'mythic' then
                        exports['mythic_notify']:DoHudText('error', Config.Language.Notifications.CancelledName) 
                    elseif Config.CoreSettings.Notify.Type == 'boii' then
                        exports['boii_ui']:notify(Config.Language.Notifications.CancelledLabel, Config.Language.Notifications.CancelledName, 'error', Config.CoreSettings.Notify.Length.Error)
                    elseif Config.CoreSettings.Notify.Type == 'ox' then
                        lib.notify({ title = Config.Language.Notifications.CancelledLabel, description = Config.Language.Notifications.CancelledName, type = 'error', duration = Config.CoreSettings.Notify.Length.Error})
                    end
                end)
                else
                    ClearPedTasks(PlayerPedId())
                    if Config.CoreSettings.Notify.Type == 'qb' then
                        QBCore.Functions.Notify(Config.Language.Notifications.MissingItemsName, "error", Config.CoreSettings.Notify.Length.Error)
                    elseif Config.CoreSettings.Notify.Type == 'okok' then
                        exports['okokNotify']:Alert(Config.Language.Notifications.MissingItemsLabel,Config.Language.Notifications.MissingItemsName, Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound) 
                    elseif Config.CoreSettings.Notify.Type == 'mythic' then
                        exports['mythic_notify']:DoHudText('error', Config.Language.Notifications.MissingItemsName)
                    elseif Config.CoreSettings.Notify.Type == 'boii' then
                        exports['boii_ui']:notify(Config.Language.Notifications.MissingItemsLabel, Config.Language.Notifications.MissingItemsName, 'error', Config.CoreSettings.Notify.Length.Error)
                    elseif Config.CoreSettings.Notify.Type == 'ox' then
                        lib.notify({ title = Config.Language.Notifications.MissingItemsLabel, description = Config.Language.Notifications.MissingItemsName, type = 'error', duration = Config.CoreSettings.Notify.Length.Error})
                    end
                end
            end)
    else 
        if Config.CoreSettings.Notify.Type == 'qb' then
            QBCore.Functions.Notify(Config.Language.Notifications.DutyName, "error", Config.CoreSettings.Notify.Length.Error)
        elseif Config.CoreSettings.Notify.Type == 'okok' then
            exports['okokNotify']:Alert(Config.Language.Notifications.DutyLabel,Config.Language.Notifications.DutyName, Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound) 
        elseif Config.CoreSettings.Notify.Type == 'mythic' then
            exports['mythic_notify']:DoHudText('error', Config.Language.Notifications.DutyName)
        elseif Config.CoreSettings.Notify.Type == 'boii' then
            exports['boii_ui']:notify(Config.Language.Notifications.DutyLabel, Config.Language.Notifications.DutyName, 'error', Config.CoreSettings.Notify.Length.Error)
        elseif Config.CoreSettings.Notify.Type == 'ox' then
            lib.notify({ title = Config.Language.Notifications.DutyLabel, description = Config.Language.Notifications.DutyName, type = 'error', duration = Config.CoreSettings.Notify.Length.Error})
        end
    end
end)


--Prepare Chocolate Smoothie
RegisterNetEvent("lusty94_icecream:client:PrepareChocolateSmoothie", function()
    if onDuty then
        QBCore.Functions.TriggerCallback('lusty94_icecream:get:ChocolateSmoothie', function(HasItems)  
            if HasItems then
                if Config.CoreSettings.Sound.UseInteractSound then
                    TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 10, Config.CoreSettings.Sound.PourSmoothies, 0.5)
                end
                QBCore.Functions.Progressbar("prepare_Chocolatesmoothie", Config.Language.ChocolateSmoothie.ProgressBarName, Config.CoreSettings.ProgressBar.Times.PrepareSmoothies, false, false, {
                    disableMovement = true,
                    disableCarMovement = true,
                    disableMouse = false,
                    disableCombat = true,
                }, {
                    animDict = "amb@prop_human_parking_meter@female@base",
                    anim = "base_female",
                    flags = 41,
                }, {}, {}, function()
                    ClearPedTasks(PlayerPedId())
                    TriggerServerEvent('lusty94_icecream:server:CreateChocolateSmoothie')
                        if Config.CoreSettings.Notify.Type == 'qb' then
                            QBCore.Functions.Notify(Config.Language.ChocolateSmoothie.NotifyName, "success", Config.CoreSettings.Notify.Length.Success)
                        elseif Config.CoreSettings.Notify.Type == 'okok' then
                            exports['okokNotify']:Alert(Config.Language.ChocolateSmoothie.NotifyLabel, Config.Language.ChocolateSmoothie.NotifyName, Config.CoreSettings.Notify.Length.Success, 'success', Config.CoreSettings.Notify.Sound)
                        elseif Config.CoreSettings.Notify.Type == 'mythic' then
                            exports['mythic_notify']:DoHudText('success', Config.Language.ChocolateSmoothie.NotifyName)
                        elseif Config.CoreSettings.Notify.Type == 'boii' then
                            exports['boii_ui']:notify(Config.Language.ChocolateSmoothie.NotifyLabel, Config.Language.ChocolateSmoothie.NotifyName, 'success', Config.CoreSettings.Notify.Length.Success)
                        elseif Config.CoreSettings.Notify.Type == 'ox' then
                            lib.notify({ title = Config.Language.ChocolateSmoothie.NotifyLabel, description = Config.Language.ChocolateSmoothie.NotifyName, type = 'success', duration = Config.CoreSettings.Notify.Length.Success})
                        end
                end, function()
                    ClearPedTasks(PlayerPedId())
                    if Config.CoreSettings.Notify.Type == 'qb' then
                        QBCore.Functions.Notify(Config.Language.Notifications.CancelledName, "error", Config.CoreSettings.Notify.Length.Error)
                    elseif Config.CoreSettings.Notify.Type == 'okok' then
                        exports['okokNotify']:Alert(Config.Language.Notifications.CancelledLabel,Config.Language.Notifications.CancelledName, Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound)
                    elseif Config.CoreSettings.Notify.Type == 'mythic' then
                        exports['mythic_notify']:DoHudText('error', Config.Language.Notifications.CancelledName) 
                    elseif Config.CoreSettings.Notify.Type == 'boii' then
                        exports['boii_ui']:notify(Config.Language.Notifications.CancelledLabel, Config.Language.Notifications.CancelledName, 'error', Config.CoreSettings.Notify.Length.Error)
                    elseif Config.CoreSettings.Notify.Type == 'ox' then
                        lib.notify({ title = Config.Language.Notifications.CancelledLabel, description = Config.Language.Notifications.CancelledName, type = 'error', duration = Config.CoreSettings.Notify.Length.Error})
                    end
                end)
                else
                    ClearPedTasks(PlayerPedId())
                    if Config.CoreSettings.Notify.Type == 'qb' then
                        QBCore.Functions.Notify(Config.Language.Notifications.MissingItemsName, "error", Config.CoreSettings.Notify.Length.Error)
                    elseif Config.CoreSettings.Notify.Type == 'okok' then
                        exports['okokNotify']:Alert(Config.Language.Notifications.MissingItemsLabel,Config.Language.Notifications.MissingItemsName, Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound) 
                    elseif Config.CoreSettings.Notify.Type == 'mythic' then
                        exports['mythic_notify']:DoHudText('error', Config.Language.Notifications.MissingItemsName)
                    elseif Config.CoreSettings.Notify.Type == 'boii' then
                        exports['boii_ui']:notify(Config.Language.Notifications.MissingItemsLabel, Config.Language.Notifications.MissingItemsName, 'error', Config.CoreSettings.Notify.Length.Error)
                    elseif Config.CoreSettings.Notify.Type == 'ox' then
                        lib.notify({ title = Config.Language.Notifications.MissingItemsLabel, description = Config.Language.Notifications.MissingItemsName, type = 'error', duration = Config.CoreSettings.Notify.Length.Error})
                    end
                end
            end)
    else 
        if Config.CoreSettings.Notify.Type == 'qb' then
            QBCore.Functions.Notify(Config.Language.Notifications.DutyName, "error", Config.CoreSettings.Notify.Length.Error)
        elseif Config.CoreSettings.Notify.Type == 'okok' then
            exports['okokNotify']:Alert(Config.Language.Notifications.DutyLabel,Config.Language.Notifications.DutyName, Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound) 
        elseif Config.CoreSettings.Notify.Type == 'mythic' then
            exports['mythic_notify']:DoHudText('error', Config.Language.Notifications.DutyName)
        elseif Config.CoreSettings.Notify.Type == 'boii' then
            exports['boii_ui']:notify(Config.Language.Notifications.DutyLabel, Config.Language.Notifications.DutyName, 'error', Config.CoreSettings.Notify.Length.Error)
        elseif Config.CoreSettings.Notify.Type == 'ox' then
            lib.notify({ title = Config.Language.Notifications.DutyLabel, description = Config.Language.Notifications.DutyName, type = 'error', duration = Config.CoreSettings.Notify.Length.Error})
        end
    end
end)


--Prepare Strawberry Smoothie
RegisterNetEvent("lusty94_icecream:client:PrepareStrawberrySmoothie", function()
    if onDuty then
        QBCore.Functions.TriggerCallback('lusty94_icecream:get:StrawberrySmoothie', function(HasItems)  
            if HasItems then
                if Config.CoreSettings.Sound.UseInteractSound then
                    TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 10, Config.CoreSettings.Sound.PourSmoothies, 0.5)
                end
                QBCore.Functions.Progressbar("prepare_Strawberrysmoothie", Config.Language.StrawberrySmoothie.ProgressBarName, Config.CoreSettings.ProgressBar.Times.PrepareSmoothies, false, false, {
                    disableMovement = true,
                    disableCarMovement = true,
                    disableMouse = false,
                    disableCombat = true,
                }, {
                    animDict = "amb@prop_human_parking_meter@female@base",
                    anim = "base_female",
                    flags = 41,
                }, {}, {}, function()
                    ClearPedTasks(PlayerPedId())
                    TriggerServerEvent('lusty94_icecream:server:CreateStrawberrySmoothie')
                        if Config.CoreSettings.Notify.Type == 'qb' then
                            QBCore.Functions.Notify(Config.Language.StrawberrySmoothie.NotifyName, "success", Config.CoreSettings.Notify.Length.Success)
                        elseif Config.CoreSettings.Notify.Type == 'okok' then
                            exports['okokNotify']:Alert(Config.Language.StrawberrySmoothie.NotifyLabel, Config.Language.StrawberrySmoothie.NotifyName, Config.CoreSettings.Notify.Length.Success, 'success', Config.CoreSettings.Notify.Sound)
                        elseif Config.CoreSettings.Notify.Type == 'mythic' then
                            exports['mythic_notify']:DoHudText('success', Config.Language.StrawberrySmoothie.NotifyName)
                        elseif Config.CoreSettings.Notify.Type == 'boii' then
                            exports['boii_ui']:notify(Config.Language.StrawberrySmoothie.NotifyLabel, Config.Language.StrawberrySmoothie.NotifyName, 'success', Config.CoreSettings.Notify.Length.Success)
                        elseif Config.CoreSettings.Notify.Type == 'ox' then
                            lib.notify({ title = Config.Language.StrawberrySmoothie.NotifyLabel, description = Config.Language.StrawberrySmoothie.NotifyName, type = 'success', duration = Config.CoreSettings.Notify.Length.Success})
                        end
                end, function()
                    ClearPedTasks(PlayerPedId())
                    if Config.CoreSettings.Notify.Type == 'qb' then
                        QBCore.Functions.Notify(Config.Language.Notifications.CancelledName, "error", Config.CoreSettings.Notify.Length.Error)
                    elseif Config.CoreSettings.Notify.Type == 'okok' then
                        exports['okokNotify']:Alert(Config.Language.Notifications.CancelledLabel,Config.Language.Notifications.CancelledName, Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound)
                    elseif Config.CoreSettings.Notify.Type == 'mythic' then
                        exports['mythic_notify']:DoHudText('error', Config.Language.Notifications.CancelledName) 
                    elseif Config.CoreSettings.Notify.Type == 'boii' then
                        exports['boii_ui']:notify(Config.Language.Notifications.CancelledLabel, Config.Language.Notifications.CancelledName, 'error', Config.CoreSettings.Notify.Length.Error)
                    elseif Config.CoreSettings.Notify.Type == 'ox' then
                        lib.notify({ title = Config.Language.Notifications.CancelledLabel, description = Config.Language.Notifications.CancelledName, type = 'error', duration = Config.CoreSettings.Notify.Length.Error})
                    end
                end)
                else
                    ClearPedTasks(PlayerPedId())
                    if Config.CoreSettings.Notify.Type == 'qb' then
                        QBCore.Functions.Notify(Config.Language.Notifications.MissingItemsName, "error", Config.CoreSettings.Notify.Length.Error)
                    elseif Config.CoreSettings.Notify.Type == 'okok' then
                        exports['okokNotify']:Alert(Config.Language.Notifications.MissingItemsLabel,Config.Language.Notifications.MissingItemsName, Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound) 
                    elseif Config.CoreSettings.Notify.Type == 'mythic' then
                        exports['mythic_notify']:DoHudText('error', Config.Language.Notifications.MissingItemsName)
                    elseif Config.CoreSettings.Notify.Type == 'boii' then
                        exports['boii_ui']:notify(Config.Language.Notifications.MissingItemsLabel, Config.Language.Notifications.MissingItemsName, 'error', Config.CoreSettings.Notify.Length.Error)
                    elseif Config.CoreSettings.Notify.Type == 'ox' then
                        lib.notify({ title = Config.Language.Notifications.MissingItemsLabel, description = Config.Language.Notifications.MissingItemsName, type = 'error', duration = Config.CoreSettings.Notify.Length.Error})
                    end
                end
            end)
    else 
        if Config.CoreSettings.Notify.Type == 'qb' then
            QBCore.Functions.Notify(Config.Language.Notifications.DutyName, "error", Config.CoreSettings.Notify.Length.Error)
        elseif Config.CoreSettings.Notify.Type == 'okok' then
            exports['okokNotify']:Alert(Config.Language.Notifications.DutyLabel,Config.Language.Notifications.DutyName, Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound) 
        elseif Config.CoreSettings.Notify.Type == 'mythic' then
            exports['mythic_notify']:DoHudText('error', Config.Language.Notifications.DutyName)
        elseif Config.CoreSettings.Notify.Type == 'boii' then
            exports['boii_ui']:notify(Config.Language.Notifications.DutyLabel, Config.Language.Notifications.DutyName, 'error', Config.CoreSettings.Notify.Length.Error)
        elseif Config.CoreSettings.Notify.Type == 'ox' then
            lib.notify({ title = Config.Language.Notifications.DutyLabel, description = Config.Language.Notifications.DutyName, type = 'error', duration = Config.CoreSettings.Notify.Length.Error})
        end
    end
end)


--Prepare Mint Smoothie
RegisterNetEvent("lusty94_icecream:client:PrepareMintSmoothie", function()
    if onDuty then
        QBCore.Functions.TriggerCallback('lusty94_icecream:get:MintSmoothie', function(HasItems)  
            if HasItems then
                if Config.CoreSettings.Sound.UseInteractSound then
                    TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 10, Config.CoreSettings.Sound.PourSmoothies, 0.5)
                end
                QBCore.Functions.Progressbar("prepare_Mintsmoothie", Config.Language.MintSmoothie.ProgressBarName, Config.CoreSettings.ProgressBar.Times.PrepareSmoothies, false, false, {
                    disableMovement = true,
                    disableCarMovement = true,
                    disableMouse = false,
                    disableCombat = true,
                }, {
                    animDict = "amb@prop_human_parking_meter@female@base",
                    anim = "base_female",
                    flags = 41,
                }, {}, {}, function()
                    ClearPedTasks(PlayerPedId())
                    TriggerServerEvent('lusty94_icecream:server:CreateMintSmoothie')
                        if Config.CoreSettings.Notify.Type == 'qb' then
                            QBCore.Functions.Notify(Config.Language.MintSmoothie.NotifyName, "success", Config.CoreSettings.Notify.Length.Success)
                        elseif Config.CoreSettings.Notify.Type == 'okok' then
                            exports['okokNotify']:Alert(Config.Language.MintSmoothie.NotifyLabel, Config.Language.MintSmoothie.NotifyName, Config.CoreSettings.Notify.Length.Success, 'success', Config.CoreSettings.Notify.Sound)
                        elseif Config.CoreSettings.Notify.Type == 'mythic' then
                            exports['mythic_notify']:DoHudText('success', Config.Language.MintSmoothie.NotifyName)
                        elseif Config.CoreSettings.Notify.Type == 'boii' then
                            exports['boii_ui']:notify(Config.Language.MintSmoothie.NotifyLabel, Config.Language.MintSmoothie.NotifyName, 'success', Config.CoreSettings.Notify.Length.Success)
                        elseif Config.CoreSettings.Notify.Type == 'ox' then
                            lib.notify({ title = Config.Language.MintSmoothie.NotifyLabel, description = Config.Language.MintSmoothie.NotifyName, type = 'success', duration = Config.CoreSettings.Notify.Length.Success})
                        end
                end, function()
                    ClearPedTasks(PlayerPedId())
                    if Config.CoreSettings.Notify.Type == 'qb' then
                        QBCore.Functions.Notify(Config.Language.Notifications.CancelledName, "error", Config.CoreSettings.Notify.Length.Error)
                    elseif Config.CoreSettings.Notify.Type == 'okok' then
                        exports['okokNotify']:Alert(Config.Language.Notifications.CancelledLabel,Config.Language.Notifications.CancelledName, Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound)
                    elseif Config.CoreSettings.Notify.Type == 'mythic' then
                        exports['mythic_notify']:DoHudText('error', Config.Language.Notifications.CancelledName) 
                    elseif Config.CoreSettings.Notify.Type == 'boii' then
                        exports['boii_ui']:notify(Config.Language.Notifications.CancelledLabel, Config.Language.Notifications.CancelledName, 'error', Config.CoreSettings.Notify.Length.Error)
                    elseif Config.CoreSettings.Notify.Type == 'ox' then
                        lib.notify({ title = Config.Language.Notifications.CancelledLabel, description = Config.Language.Notifications.CancelledName, type = 'error', duration = Config.CoreSettings.Notify.Length.Error})
                    end
                end)
                else
                    ClearPedTasks(PlayerPedId())
                    if Config.CoreSettings.Notify.Type == 'qb' then
                        QBCore.Functions.Notify(Config.Language.Notifications.MissingItemsName, "error", Config.CoreSettings.Notify.Length.Error)
                    elseif Config.CoreSettings.Notify.Type == 'okok' then
                        exports['okokNotify']:Alert(Config.Language.Notifications.MissingItemsLabel,Config.Language.Notifications.MissingItemsName, Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound) 
                    elseif Config.CoreSettings.Notify.Type == 'mythic' then
                        exports['mythic_notify']:DoHudText('error', Config.Language.Notifications.MissingItemsName)
                    elseif Config.CoreSettings.Notify.Type == 'boii' then
                        exports['boii_ui']:notify(Config.Language.Notifications.MissingItemsLabel, Config.Language.Notifications.MissingItemsName, 'error', Config.CoreSettings.Notify.Length.Error)
                    elseif Config.CoreSettings.Notify.Type == 'ox' then
                        lib.notify({ title = Config.Language.Notifications.MissingItemsLabel, description = Config.Language.Notifications.MissingItemsName, type = 'error', duration = Config.CoreSettings.Notify.Length.Error})
                    end
                end
            end)
    else 
        if Config.CoreSettings.Notify.Type == 'qb' then
            QBCore.Functions.Notify(Config.Language.Notifications.DutyName, "error", Config.CoreSettings.Notify.Length.Error)
        elseif Config.CoreSettings.Notify.Type == 'okok' then
            exports['okokNotify']:Alert(Config.Language.Notifications.DutyLabel,Config.Language.Notifications.DutyName, Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound) 
        elseif Config.CoreSettings.Notify.Type == 'mythic' then
            exports['mythic_notify']:DoHudText('error', Config.Language.Notifications.DutyName)
        elseif Config.CoreSettings.Notify.Type == 'boii' then
            exports['boii_ui']:notify(Config.Language.Notifications.DutyLabel, Config.Language.Notifications.DutyName, 'error', Config.CoreSettings.Notify.Length.Error)
        elseif Config.CoreSettings.Notify.Type == 'ox' then
            lib.notify({ title = Config.Language.Notifications.DutyLabel, description = Config.Language.Notifications.DutyName, type = 'error', duration = Config.CoreSettings.Notify.Length.Error})
        end
    end
end)


--Prepare Pistachio Smoothie
RegisterNetEvent("lusty94_icecream:client:PreparePistachioSmoothie", function()
    if onDuty then
        QBCore.Functions.TriggerCallback('lusty94_icecream:get:PistachioSmoothie', function(HasItems)  
            if HasItems then
                if Config.CoreSettings.Sound.UseInteractSound then
                    TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 10, Config.CoreSettings.Sound.PourSmoothies, 0.5)
                end
                QBCore.Functions.Progressbar("prepare_Pistachiosmoothie", Config.Language.PistachioSmoothie.ProgressBarName, Config.CoreSettings.ProgressBar.Times.PrepareSmoothies, false, false, {
                    disableMovement = true,
                    disableCarMovement = true,
                    disableMouse = false,
                    disableCombat = true,
                }, {
                    animDict = "amb@prop_human_parking_meter@female@base",
                    anim = "base_female",
                    flags = 41,
                }, {}, {}, function()
                    ClearPedTasks(PlayerPedId())
                    TriggerServerEvent('lusty94_icecream:server:CreatePistachioSmoothie')
                        if Config.CoreSettings.Notify.Type == 'qb' then
                            QBCore.Functions.Notify(Config.Language.PistachioSmoothie.NotifyName, "success", Config.CoreSettings.Notify.Length.Success)
                        elseif Config.CoreSettings.Notify.Type == 'okok' then
                            exports['okokNotify']:Alert(Config.Language.PistachioSmoothie.NotifyLabel, Config.Language.PistachioSmoothie.NotifyName, Config.CoreSettings.Notify.Length.Success, 'success', Config.CoreSettings.Notify.Sound)
                        elseif Config.CoreSettings.Notify.Type == 'mythic' then
                            exports['mythic_notify']:DoHudText('success', Config.Language.PistachioSmoothie.NotifyName)
                        elseif Config.CoreSettings.Notify.Type == 'boii' then
                            exports['boii_ui']:notify(Config.Language.PistachioSmoothie.NotifyLabel, Config.Language.PistachioSmoothie.NotifyName, 'success', Config.CoreSettings.Notify.Length.Success)
                        elseif Config.CoreSettings.Notify.Type == 'ox' then
                            lib.notify({ title = Config.Language.PistachioSmoothie.NotifyLabel, description = Config.Language.PistachioSmoothie.NotifyName, type = 'success', duration = Config.CoreSettings.Notify.Length.Success})
                        end
                end, function()
                    ClearPedTasks(PlayerPedId())
                    if Config.CoreSettings.Notify.Type == 'qb' then
                        QBCore.Functions.Notify(Config.Language.Notifications.CancelledName, "error", Config.CoreSettings.Notify.Length.Error)
                    elseif Config.CoreSettings.Notify.Type == 'okok' then
                        exports['okokNotify']:Alert(Config.Language.Notifications.CancelledLabel,Config.Language.Notifications.CancelledName, Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound)
                    elseif Config.CoreSettings.Notify.Type == 'mythic' then
                        exports['mythic_notify']:DoHudText('error', Config.Language.Notifications.CancelledName) 
                    elseif Config.CoreSettings.Notify.Type == 'boii' then
                        exports['boii_ui']:notify(Config.Language.Notifications.CancelledLabel, Config.Language.Notifications.CancelledName, 'error', Config.CoreSettings.Notify.Length.Error)
                    elseif Config.CoreSettings.Notify.Type == 'ox' then
                        lib.notify({ title = Config.Language.Notifications.CancelledLabel, description = Config.Language.Notifications.CancelledName, type = 'error', duration = Config.CoreSettings.Notify.Length.Error})
                    end
                end)
                else
                    ClearPedTasks(PlayerPedId())
                    if Config.CoreSettings.Notify.Type == 'qb' then
                        QBCore.Functions.Notify(Config.Language.Notifications.MissingItemsName, "error", Config.CoreSettings.Notify.Length.Error)
                    elseif Config.CoreSettings.Notify.Type == 'okok' then
                        exports['okokNotify']:Alert(Config.Language.Notifications.MissingItemsLabel,Config.Language.Notifications.MissingItemsName, Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound) 
                    elseif Config.CoreSettings.Notify.Type == 'mythic' then
                        exports['mythic_notify']:DoHudText('error', Config.Language.Notifications.MissingItemsName)
                    elseif Config.CoreSettings.Notify.Type == 'boii' then
                        exports['boii_ui']:notify(Config.Language.Notifications.MissingItemsLabel, Config.Language.Notifications.MissingItemsName, 'error', Config.CoreSettings.Notify.Length.Error)
                    elseif Config.CoreSettings.Notify.Type == 'ox' then
                        lib.notify({ title = Config.Language.Notifications.MissingItemsLabel, description = Config.Language.Notifications.MissingItemsName, type = 'error', duration = Config.CoreSettings.Notify.Length.Error})
                    end
                end
            end)
    else 
        if Config.CoreSettings.Notify.Type == 'qb' then
            QBCore.Functions.Notify(Config.Language.Notifications.DutyName, "error", Config.CoreSettings.Notify.Length.Error)
        elseif Config.CoreSettings.Notify.Type == 'okok' then
            exports['okokNotify']:Alert(Config.Language.Notifications.DutyLabel,Config.Language.Notifications.DutyName, Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound) 
        elseif Config.CoreSettings.Notify.Type == 'mythic' then
            exports['mythic_notify']:DoHudText('error', Config.Language.Notifications.DutyName)
        elseif Config.CoreSettings.Notify.Type == 'boii' then
            exports['boii_ui']:notify(Config.Language.Notifications.DutyLabel, Config.Language.Notifications.DutyName, 'error', Config.CoreSettings.Notify.Length.Error)
        elseif Config.CoreSettings.Notify.Type == 'ox' then
            lib.notify({ title = Config.Language.Notifications.DutyLabel, description = Config.Language.Notifications.DutyName, type = 'error', duration = Config.CoreSettings.Notify.Length.Error})
        end
    end
end)


--Prepare Butter Scotch Smoothie
RegisterNetEvent("lusty94_icecream:client:PrepareButterScotchSmoothie", function()
    if onDuty then
        QBCore.Functions.TriggerCallback('lusty94_icecream:get:ButterScotchSmoothie', function(HasItems)  
            if HasItems then
                if Config.CoreSettings.Sound.UseInteractSound then
                    TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 10, Config.CoreSettings.Sound.PourSmoothies, 0.5)
                end
                QBCore.Functions.Progressbar("prepare_ButterScotchsmoothie", Config.Language.ButterScotchSmoothie.ProgressBarName, Config.CoreSettings.ProgressBar.Times.PrepareSmoothies, false, false, {
                    disableMovement = true,
                    disableCarMovement = true,
                    disableMouse = false,
                    disableCombat = true,
                }, {
                    animDict = "amb@prop_human_parking_meter@female@base",
                    anim = "base_female",
                    flags = 41,
                }, {}, {}, function()
                    ClearPedTasks(PlayerPedId())
                    TriggerServerEvent('lusty94_icecream:server:CreateButterScotchSmoothie')
                        if Config.CoreSettings.Notify.Type == 'qb' then
                            QBCore.Functions.Notify(Config.Language.ButterScotchSmoothie.NotifyName, "success", Config.CoreSettings.Notify.Length.Success)
                        elseif Config.CoreSettings.Notify.Type == 'okok' then
                            exports['okokNotify']:Alert(Config.Language.ButterScotchSmoothie.NotifyLabel, Config.Language.ButterScotchSmoothie.NotifyName, Config.CoreSettings.Notify.Length.Success, 'success', Config.CoreSettings.Notify.Sound)
                        elseif Config.CoreSettings.Notify.Type == 'mythic' then
                            exports['mythic_notify']:DoHudText('success', Config.Language.ButterScotchSmoothie.NotifyName)
                        elseif Config.CoreSettings.Notify.Type == 'boii' then
                            exports['boii_ui']:notify(Config.Language.ButterScotchSmoothie.NotifyLabel, Config.Language.ButterScotchSmoothie.NotifyName, 'success', Config.CoreSettings.Notify.Length.Success)
                        elseif Config.CoreSettings.Notify.Type == 'ox' then
                            lib.notify({ title = Config.Language.ButterScotchSmoothie.NotifyLabel, description = Config.Language.ButterScotchSmoothie.NotifyName, type = 'success', duration = Config.CoreSettings.Notify.Length.Success})
                        end
                end, function()
                    ClearPedTasks(PlayerPedId())
                    if Config.CoreSettings.Notify.Type == 'qb' then
                        QBCore.Functions.Notify(Config.Language.Notifications.CancelledName, "error", Config.CoreSettings.Notify.Length.Error)
                    elseif Config.CoreSettings.Notify.Type == 'okok' then
                        exports['okokNotify']:Alert(Config.Language.Notifications.CancelledLabel,Config.Language.Notifications.CancelledName, Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound)
                    elseif Config.CoreSettings.Notify.Type == 'mythic' then
                        exports['mythic_notify']:DoHudText('error', Config.Language.Notifications.CancelledName) 
                    elseif Config.CoreSettings.Notify.Type == 'boii' then
                        exports['boii_ui']:notify(Config.Language.Notifications.CancelledLabel, Config.Language.Notifications.CancelledName, 'error', Config.CoreSettings.Notify.Length.Error)
                    elseif Config.CoreSettings.Notify.Type == 'ox' then
                        lib.notify({ title = Config.Language.Notifications.CancelledLabel, description = Config.Language.Notifications.CancelledName, type = 'error', duration = Config.CoreSettings.Notify.Length.Error})
                    end
                end)
                else
                    ClearPedTasks(PlayerPedId())
                    if Config.CoreSettings.Notify.Type == 'qb' then
                        QBCore.Functions.Notify(Config.Language.Notifications.MissingItemsName, "error", Config.CoreSettings.Notify.Length.Error)
                    elseif Config.CoreSettings.Notify.Type == 'okok' then
                        exports['okokNotify']:Alert(Config.Language.Notifications.MissingItemsLabel,Config.Language.Notifications.MissingItemsName, Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound) 
                    elseif Config.CoreSettings.Notify.Type == 'mythic' then
                        exports['mythic_notify']:DoHudText('error', Config.Language.Notifications.MissingItemsName)
                    elseif Config.CoreSettings.Notify.Type == 'boii' then
                        exports['boii_ui']:notify(Config.Language.Notifications.MissingItemsLabel, Config.Language.Notifications.MissingItemsName, 'error', Config.CoreSettings.Notify.Length.Error)
                    elseif Config.CoreSettings.Notify.Type == 'ox' then
                        lib.notify({ title = Config.Language.Notifications.MissingItemsLabel, description = Config.Language.Notifications.MissingItemsName, type = 'error', duration = Config.CoreSettings.Notify.Length.Error})
                    end
                end
            end)
    else 
        if Config.CoreSettings.Notify.Type == 'qb' then
            QBCore.Functions.Notify(Config.Language.Notifications.DutyName, "error", Config.CoreSettings.Notify.Length.Error)
        elseif Config.CoreSettings.Notify.Type == 'okok' then
            exports['okokNotify']:Alert(Config.Language.Notifications.DutyLabel,Config.Language.Notifications.DutyName, Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound) 
        elseif Config.CoreSettings.Notify.Type == 'mythic' then
            exports['mythic_notify']:DoHudText('error', Config.Language.Notifications.DutyName)
        elseif Config.CoreSettings.Notify.Type == 'boii' then
            exports['boii_ui']:notify(Config.Language.Notifications.DutyLabel, Config.Language.Notifications.DutyName, 'error', Config.CoreSettings.Notify.Length.Error)
        elseif Config.CoreSettings.Notify.Type == 'ox' then
            lib.notify({ title = Config.Language.Notifications.DutyLabel, description = Config.Language.Notifications.DutyName, type = 'error', duration = Config.CoreSettings.Notify.Length.Error})
        end
    end
end)


--Prepare Salted Caramel Smoothie
RegisterNetEvent("lusty94_icecream:client:PrepareSaltedCaramelSmoothie", function()
    if onDuty then
        QBCore.Functions.TriggerCallback('lusty94_icecream:get:SaltedCaramelSmoothie', function(HasItems)  
            if HasItems then
                if Config.CoreSettings.Sound.UseInteractSound then
                    TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 10, Config.CoreSettings.Sound.PourSmoothies, 0.5)
                end
                QBCore.Functions.Progressbar("prepare_SaltedCaramelsmoothie", Config.Language.SaltedCaramelSmoothie.ProgressBarName, Config.CoreSettings.ProgressBar.Times.PrepareSmoothies, false, false, {
                    disableMovement = true,
                    disableCarMovement = true,
                    disableMouse = false,
                    disableCombat = true,
                }, {
                    animDict = "amb@prop_human_parking_meter@female@base",
                    anim = "base_female",
                    flags = 41,
                }, {}, {}, function()
                    ClearPedTasks(PlayerPedId())
                    TriggerServerEvent('lusty94_icecream:server:CreateSaltedCaramelSmoothie')
                        if Config.CoreSettings.Notify.Type == 'qb' then
                            QBCore.Functions.Notify(Config.Language.SaltedCaramelSmoothie.NotifyName, "success", Config.CoreSettings.Notify.Length.Success)
                        elseif Config.CoreSettings.Notify.Type == 'okok' then
                            exports['okokNotify']:Alert(Config.Language.SaltedCaramelSmoothie.NotifyLabel, Config.Language.SaltedCaramelSmoothie.NotifyName, Config.CoreSettings.Notify.Length.Success, 'success', Config.CoreSettings.Notify.Sound)
                        elseif Config.CoreSettings.Notify.Type == 'mythic' then
                            exports['mythic_notify']:DoHudText('success', Config.Language.SaltedCaramelSmoothie.NotifyName)
                        elseif Config.CoreSettings.Notify.Type == 'boii' then
                            exports['boii_ui']:notify(Config.Language.SaltedCaramelSmoothie.NotifyLabel, Config.Language.SaltedCaramelSmoothie.NotifyName, 'success', Config.CoreSettings.Notify.Length.Success)
                        elseif Config.CoreSettings.Notify.Type == 'ox' then
                            lib.notify({ title = Config.Language.SaltedCaramelSmoothie.NotifyLabel, description = Config.Language.SaltedCaramelSmoothie.NotifyName, type = 'success', duration = Config.CoreSettings.Notify.Length.Success})
                        end
                end, function()
                    ClearPedTasks(PlayerPedId())
                    if Config.CoreSettings.Notify.Type == 'qb' then
                        QBCore.Functions.Notify(Config.Language.Notifications.CancelledName, "error", Config.CoreSettings.Notify.Length.Error)
                    elseif Config.CoreSettings.Notify.Type == 'okok' then
                        exports['okokNotify']:Alert(Config.Language.Notifications.CancelledLabel,Config.Language.Notifications.CancelledName, Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound)
                    elseif Config.CoreSettings.Notify.Type == 'mythic' then
                        exports['mythic_notify']:DoHudText('error', Config.Language.Notifications.CancelledName) 
                    elseif Config.CoreSettings.Notify.Type == 'boii' then
                        exports['boii_ui']:notify(Config.Language.Notifications.CancelledLabel, Config.Language.Notifications.CancelledName, 'error', Config.CoreSettings.Notify.Length.Error)
                    elseif Config.CoreSettings.Notify.Type == 'ox' then
                        lib.notify({ title = Config.Language.Notifications.CancelledLabel, description = Config.Language.Notifications.CancelledName, type = 'error', duration = Config.CoreSettings.Notify.Length.Error})
                    end
                end)
                else
                    ClearPedTasks(PlayerPedId())
                    if Config.CoreSettings.Notify.Type == 'qb' then
                        QBCore.Functions.Notify(Config.Language.Notifications.MissingItemsName, "error", Config.CoreSettings.Notify.Length.Error)
                    elseif Config.CoreSettings.Notify.Type == 'okok' then
                        exports['okokNotify']:Alert(Config.Language.Notifications.MissingItemsLabel,Config.Language.Notifications.MissingItemsName, Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound) 
                    elseif Config.CoreSettings.Notify.Type == 'mythic' then
                        exports['mythic_notify']:DoHudText('error', Config.Language.Notifications.MissingItemsName)
                    elseif Config.CoreSettings.Notify.Type == 'boii' then
                        exports['boii_ui']:notify(Config.Language.Notifications.MissingItemsLabel, Config.Language.Notifications.MissingItemsName, 'error', Config.CoreSettings.Notify.Length.Error)
                    elseif Config.CoreSettings.Notify.Type == 'ox' then
                        lib.notify({ title = Config.Language.Notifications.MissingItemsLabel, description = Config.Language.Notifications.MissingItemsName, type = 'error', duration = Config.CoreSettings.Notify.Length.Error})
                    end
                end
            end)
    else 
        if Config.CoreSettings.Notify.Type == 'qb' then
            QBCore.Functions.Notify(Config.Language.Notifications.DutyName, "error", Config.CoreSettings.Notify.Length.Error)
        elseif Config.CoreSettings.Notify.Type == 'okok' then
            exports['okokNotify']:Alert(Config.Language.Notifications.DutyLabel,Config.Language.Notifications.DutyName, Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound) 
        elseif Config.CoreSettings.Notify.Type == 'mythic' then
            exports['mythic_notify']:DoHudText('error', Config.Language.Notifications.DutyName)
        elseif Config.CoreSettings.Notify.Type == 'boii' then
            exports['boii_ui']:notify(Config.Language.Notifications.DutyLabel, Config.Language.Notifications.DutyName, 'error', Config.CoreSettings.Notify.Length.Error)
        elseif Config.CoreSettings.Notify.Type == 'ox' then
            lib.notify({ title = Config.Language.Notifications.DutyLabel, description = Config.Language.Notifications.DutyName, type = 'error', duration = Config.CoreSettings.Notify.Length.Error})
        end
    end
end)


--Prepare Bubblegum Smoothie
RegisterNetEvent("lusty94_icecream:client:PrepareBubblegumSmoothie", function()
    if onDuty then
        QBCore.Functions.TriggerCallback('lusty94_icecream:get:BubblegumSmoothie', function(HasItems)  
            if HasItems then
                if Config.CoreSettings.Sound.UseInteractSound then
                    TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 10, Config.CoreSettings.Sound.PourSmoothies, 0.5)
                end
                QBCore.Functions.Progressbar("prepare_Bubblegumsmoothie", Config.Language.BubblegumSmoothie.ProgressBarName, Config.CoreSettings.ProgressBar.Times.PrepareSmoothies, false, false, {
                    disableMovement = true,
                    disableCarMovement = true,
                    disableMouse = false,
                    disableCombat = true,
                }, {
                    animDict = "amb@prop_human_parking_meter@female@base",
                    anim = "base_female",
                    flags = 41,
                }, {}, {}, function()
                    ClearPedTasks(PlayerPedId())
                    TriggerServerEvent('lusty94_icecream:server:CreateBubblegumSmoothie')
                        if Config.CoreSettings.Notify.Type == 'qb' then
                            QBCore.Functions.Notify(Config.Language.BubblegumSmoothie.NotifyName, "success", Config.CoreSettings.Notify.Length.Success)
                        elseif Config.CoreSettings.Notify.Type == 'okok' then
                            exports['okokNotify']:Alert(Config.Language.BubblegumSmoothie.NotifyLabel, Config.Language.BubblegumSmoothie.NotifyName, Config.CoreSettings.Notify.Length.Success, 'success', Config.CoreSettings.Notify.Sound)
                        elseif Config.CoreSettings.Notify.Type == 'mythic' then
                            exports['mythic_notify']:DoHudText('success', Config.Language.BubblegumSmoothie.NotifyName)
                        elseif Config.CoreSettings.Notify.Type == 'boii' then
                            exports['boii_ui']:notify(Config.Language.BubblegumSmoothie.NotifyLabel, Config.Language.BubblegumSmoothie.NotifyName, 'success', Config.CoreSettings.Notify.Length.Success)
                        elseif Config.CoreSettings.Notify.Type == 'ox' then
                            lib.notify({ title = Config.Language.BubblegumSmoothie.NotifyLabel, description = Config.Language.BubblegumSmoothie.NotifyName, type = 'success', duration = Config.CoreSettings.Notify.Length.Success})
                        end
                end, function()
                    ClearPedTasks(PlayerPedId())
                    if Config.CoreSettings.Notify.Type == 'qb' then
                        QBCore.Functions.Notify(Config.Language.Notifications.CancelledName, "error", Config.CoreSettings.Notify.Length.Error)
                    elseif Config.CoreSettings.Notify.Type == 'okok' then
                        exports['okokNotify']:Alert(Config.Language.Notifications.CancelledLabel,Config.Language.Notifications.CancelledName, Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound)
                    elseif Config.CoreSettings.Notify.Type == 'mythic' then
                        exports['mythic_notify']:DoHudText('error', Config.Language.Notifications.CancelledName) 
                    elseif Config.CoreSettings.Notify.Type == 'boii' then
                        exports['boii_ui']:notify(Config.Language.Notifications.CancelledLabel, Config.Language.Notifications.CancelledName, 'error', Config.CoreSettings.Notify.Length.Error)
                    elseif Config.CoreSettings.Notify.Type == 'ox' then
                        lib.notify({ title = Config.Language.Notifications.CancelledLabel, description = Config.Language.Notifications.CancelledName, type = 'error', duration = Config.CoreSettings.Notify.Length.Error})
                    end
                end)
                else
                    ClearPedTasks(PlayerPedId())
                    if Config.CoreSettings.Notify.Type == 'qb' then
                        QBCore.Functions.Notify(Config.Language.Notifications.MissingItemsName, "error", Config.CoreSettings.Notify.Length.Error)
                    elseif Config.CoreSettings.Notify.Type == 'okok' then
                        exports['okokNotify']:Alert(Config.Language.Notifications.MissingItemsLabel,Config.Language.Notifications.MissingItemsName, Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound) 
                    elseif Config.CoreSettings.Notify.Type == 'mythic' then
                        exports['mythic_notify']:DoHudText('error', Config.Language.Notifications.MissingItemsName)
                    elseif Config.CoreSettings.Notify.Type == 'boii' then
                        exports['boii_ui']:notify(Config.Language.Notifications.MissingItemsLabel, Config.Language.Notifications.MissingItemsName, 'error', Config.CoreSettings.Notify.Length.Error)
                    elseif Config.CoreSettings.Notify.Type == 'ox' then
                        lib.notify({ title = Config.Language.Notifications.MissingItemsLabel, description = Config.Language.Notifications.MissingItemsName, type = 'error', duration = Config.CoreSettings.Notify.Length.Error})
                    end
                end
            end)
    else 
        if Config.CoreSettings.Notify.Type == 'qb' then
            QBCore.Functions.Notify(Config.Language.Notifications.DutyName, "error", Config.CoreSettings.Notify.Length.Error)
        elseif Config.CoreSettings.Notify.Type == 'okok' then
            exports['okokNotify']:Alert(Config.Language.Notifications.DutyLabel,Config.Language.Notifications.DutyName, Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound) 
        elseif Config.CoreSettings.Notify.Type == 'mythic' then
            exports['mythic_notify']:DoHudText('error', Config.Language.Notifications.DutyName)
        elseif Config.CoreSettings.Notify.Type == 'boii' then
            exports['boii_ui']:notify(Config.Language.Notifications.DutyLabel, Config.Language.Notifications.DutyName, 'error', Config.CoreSettings.Notify.Length.Error)
        elseif Config.CoreSettings.Notify.Type == 'ox' then
            lib.notify({ title = Config.Language.Notifications.DutyLabel, description = Config.Language.Notifications.DutyName, type = 'error', duration = Config.CoreSettings.Notify.Length.Error})
        end
    end
end)


--Prepare Toffee Smoothie
RegisterNetEvent("lusty94_icecream:client:PrepareToffeeSmoothie", function()
    if onDuty then
        QBCore.Functions.TriggerCallback('lusty94_icecream:get:ToffeeSmoothie', function(HasItems)  
            if HasItems then
                if Config.CoreSettings.Sound.UseInteractSound then
                    TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 10, Config.CoreSettings.Sound.PourSmoothies, 0.5)
                end
                QBCore.Functions.Progressbar("prepare_Toffeesmoothie", Config.Language.ToffeeSmoothie.ProgressBarName, Config.CoreSettings.ProgressBar.Times.PrepareSmoothies, false, false, {
                    disableMovement = true,
                    disableCarMovement = true,
                    disableMouse = false,
                    disableCombat = true,
                }, {
                    animDict = "amb@prop_human_parking_meter@female@base",
                    anim = "base_female",
                    flags = 41,
                }, {}, {}, function()
                    ClearPedTasks(PlayerPedId())
                    TriggerServerEvent('lusty94_icecream:server:CreateToffeeSmoothie')
                        if Config.CoreSettings.Notify.Type == 'qb' then
                            QBCore.Functions.Notify(Config.Language.ToffeeSmoothie.NotifyName, "success", Config.CoreSettings.Notify.Length.Success)
                        elseif Config.CoreSettings.Notify.Type == 'okok' then
                            exports['okokNotify']:Alert(Config.Language.ToffeeSmoothie.NotifyLabel, Config.Language.ToffeeSmoothie.NotifyName, Config.CoreSettings.Notify.Length.Success, 'success', Config.CoreSettings.Notify.Sound)
                        elseif Config.CoreSettings.Notify.Type == 'mythic' then
                            exports['mythic_notify']:DoHudText('success', Config.Language.ToffeeSmoothie.NotifyName)
                        elseif Config.CoreSettings.Notify.Type == 'boii' then
                            exports['boii_ui']:notify(Config.Language.ToffeeSmoothie.NotifyLabel, Config.Language.ToffeeSmoothie.NotifyName, 'success', Config.CoreSettings.Notify.Length.Success)
                        elseif Config.CoreSettings.Notify.Type == 'ox' then
                            lib.notify({ title = Config.Language.ToffeeSmoothie.NotifyLabel, description = Config.Language.ToffeeSmoothie.NotifyName, type = 'success', duration = Config.CoreSettings.Notify.Length.Success})
                        end
                end, function()
                    ClearPedTasks(PlayerPedId())
                    if Config.CoreSettings.Notify.Type == 'qb' then
                        QBCore.Functions.Notify(Config.Language.Notifications.CancelledName, "error", Config.CoreSettings.Notify.Length.Error)
                    elseif Config.CoreSettings.Notify.Type == 'okok' then
                        exports['okokNotify']:Alert(Config.Language.Notifications.CancelledLabel,Config.Language.Notifications.CancelledName, Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound)
                    elseif Config.CoreSettings.Notify.Type == 'mythic' then
                        exports['mythic_notify']:DoHudText('error', Config.Language.Notifications.CancelledName) 
                    elseif Config.CoreSettings.Notify.Type == 'boii' then
                        exports['boii_ui']:notify(Config.Language.Notifications.CancelledLabel, Config.Language.Notifications.CancelledName, 'error', Config.CoreSettings.Notify.Length.Error)
                    elseif Config.CoreSettings.Notify.Type == 'ox' then
                        lib.notify({ title = Config.Language.Notifications.CancelledLabel, description = Config.Language.Notifications.CancelledName, type = 'error', duration = Config.CoreSettings.Notify.Length.Error})
                    end
                end)
                else
                    ClearPedTasks(PlayerPedId())
                    if Config.CoreSettings.Notify.Type == 'qb' then
                        QBCore.Functions.Notify(Config.Language.Notifications.MissingItemsName, "error", Config.CoreSettings.Notify.Length.Error)
                    elseif Config.CoreSettings.Notify.Type == 'okok' then
                        exports['okokNotify']:Alert(Config.Language.Notifications.MissingItemsLabel,Config.Language.Notifications.MissingItemsName, Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound) 
                    elseif Config.CoreSettings.Notify.Type == 'mythic' then
                        exports['mythic_notify']:DoHudText('error', Config.Language.Notifications.MissingItemsName)
                    elseif Config.CoreSettings.Notify.Type == 'boii' then
                        exports['boii_ui']:notify(Config.Language.Notifications.MissingItemsLabel, Config.Language.Notifications.MissingItemsName, 'error', Config.CoreSettings.Notify.Length.Error)
                    elseif Config.CoreSettings.Notify.Type == 'ox' then
                        lib.notify({ title = Config.Language.Notifications.MissingItemsLabel, description = Config.Language.Notifications.MissingItemsName, type = 'error', duration = Config.CoreSettings.Notify.Length.Error})
                    end
                end
            end)
    else 
        if Config.CoreSettings.Notify.Type == 'qb' then
            QBCore.Functions.Notify(Config.Language.Notifications.DutyName, "error", Config.CoreSettings.Notify.Length.Error)
        elseif Config.CoreSettings.Notify.Type == 'okok' then
            exports['okokNotify']:Alert(Config.Language.Notifications.DutyLabel,Config.Language.Notifications.DutyName, Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound) 
        elseif Config.CoreSettings.Notify.Type == 'mythic' then
            exports['mythic_notify']:DoHudText('error', Config.Language.Notifications.DutyName)
        elseif Config.CoreSettings.Notify.Type == 'boii' then
            exports['boii_ui']:notify(Config.Language.Notifications.DutyLabel, Config.Language.Notifications.DutyName, 'error', Config.CoreSettings.Notify.Length.Error)
        elseif Config.CoreSettings.Notify.Type == 'ox' then
            lib.notify({ title = Config.Language.Notifications.DutyLabel, description = Config.Language.Notifications.DutyName, type = 'error', duration = Config.CoreSettings.Notify.Length.Error})
        end
    end
end)


--Prepare CookieDough Smoothie
RegisterNetEvent("lusty94_icecream:client:PrepareCookieDoughSmoothie", function()
    if onDuty then
        QBCore.Functions.TriggerCallback('lusty94_icecream:get:CookieDoughSmoothie', function(HasItems)  
            if HasItems then
                if Config.CoreSettings.Sound.UseInteractSound then
                    TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 10, Config.CoreSettings.Sound.PourSmoothies, 0.5)
                end
                QBCore.Functions.Progressbar("prepare_CookieDoughsmoothie", Config.Language.CookieDoughSmoothie.ProgressBarName, Config.CoreSettings.ProgressBar.Times.PrepareSmoothies, false, false, {
                    disableMovement = true,
                    disableCarMovement = true,
                    disableMouse = false,
                    disableCombat = true,
                }, {
                    animDict = "amb@prop_human_parking_meter@female@base",
                    anim = "base_female",
                    flags = 41,
                }, {}, {}, function()
                    ClearPedTasks(PlayerPedId())
                    TriggerServerEvent('lusty94_icecream:server:CreateCookieDoughSmoothie')
                        if Config.CoreSettings.Notify.Type == 'qb' then
                            QBCore.Functions.Notify(Config.Language.CookieDoughSmoothie.NotifyName, "success", Config.CoreSettings.Notify.Length.Success)
                        elseif Config.CoreSettings.Notify.Type == 'okok' then
                            exports['okokNotify']:Alert(Config.Language.CookieDoughSmoothie.NotifyLabel, Config.Language.CookieDoughSmoothie.NotifyName, Config.CoreSettings.Notify.Length.Success, 'success', Config.CoreSettings.Notify.Sound)
                        elseif Config.CoreSettings.Notify.Type == 'mythic' then
                            exports['mythic_notify']:DoHudText('success', Config.Language.CookieDoughSmoothie.NotifyName)
                        elseif Config.CoreSettings.Notify.Type == 'boii' then
                            exports['boii_ui']:notify(Config.Language.CookieDoughSmoothie.NotifyLabel, Config.Language.CookieDoughSmoothie.NotifyName, 'success', Config.CoreSettings.Notify.Length.Success)
                        elseif Config.CoreSettings.Notify.Type == 'ox' then
                            lib.notify({ title = Config.Language.CookieDoughSmoothie.NotifyLabel, description = Config.Language.CookieDoughSmoothie.NotifyName, type = 'success', duration = Config.CoreSettings.Notify.Length.Success})
                        end
                end, function()
                    ClearPedTasks(PlayerPedId())
                    if Config.CoreSettings.Notify.Type == 'qb' then
                        QBCore.Functions.Notify(Config.Language.Notifications.CancelledName, "error", Config.CoreSettings.Notify.Length.Error)
                    elseif Config.CoreSettings.Notify.Type == 'okok' then
                        exports['okokNotify']:Alert(Config.Language.Notifications.CancelledLabel,Config.Language.Notifications.CancelledName, Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound)
                    elseif Config.CoreSettings.Notify.Type == 'mythic' then
                        exports['mythic_notify']:DoHudText('error', Config.Language.Notifications.CancelledName) 
                    elseif Config.CoreSettings.Notify.Type == 'boii' then
                        exports['boii_ui']:notify(Config.Language.Notifications.CancelledLabel, Config.Language.Notifications.CancelledName, 'error', Config.CoreSettings.Notify.Length.Error)
                    elseif Config.CoreSettings.Notify.Type == 'ox' then
                        lib.notify({ title = Config.Language.Notifications.CancelledLabel, description = Config.Language.Notifications.CancelledName, type = 'error', duration = Config.CoreSettings.Notify.Length.Error})
                    end
                end)
                else
                    ClearPedTasks(PlayerPedId())
                    if Config.CoreSettings.Notify.Type == 'qb' then
                        QBCore.Functions.Notify(Config.Language.Notifications.MissingItemsName, "error", Config.CoreSettings.Notify.Length.Error)
                    elseif Config.CoreSettings.Notify.Type == 'okok' then
                        exports['okokNotify']:Alert(Config.Language.Notifications.MissingItemsLabel,Config.Language.Notifications.MissingItemsName, Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound) 
                    elseif Config.CoreSettings.Notify.Type == 'mythic' then
                        exports['mythic_notify']:DoHudText('error', Config.Language.Notifications.MissingItemsName)
                    elseif Config.CoreSettings.Notify.Type == 'boii' then
                        exports['boii_ui']:notify(Config.Language.Notifications.MissingItemsLabel, Config.Language.Notifications.MissingItemsName, 'error', Config.CoreSettings.Notify.Length.Error)
                    elseif Config.CoreSettings.Notify.Type == 'ox' then
                        lib.notify({ title = Config.Language.Notifications.MissingItemsLabel, description = Config.Language.Notifications.MissingItemsName, type = 'error', duration = Config.CoreSettings.Notify.Length.Error})
                    end
                end
            end)
    else 
        if Config.CoreSettings.Notify.Type == 'qb' then
            QBCore.Functions.Notify(Config.Language.Notifications.DutyName, "error", Config.CoreSettings.Notify.Length.Error)
        elseif Config.CoreSettings.Notify.Type == 'okok' then
            exports['okokNotify']:Alert(Config.Language.Notifications.DutyLabel,Config.Language.Notifications.DutyName, Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound) 
        elseif Config.CoreSettings.Notify.Type == 'mythic' then
            exports['mythic_notify']:DoHudText('error', Config.Language.Notifications.DutyName)
        elseif Config.CoreSettings.Notify.Type == 'boii' then
            exports['boii_ui']:notify(Config.Language.Notifications.DutyLabel, Config.Language.Notifications.DutyName, 'error', Config.CoreSettings.Notify.Length.Error)
        elseif Config.CoreSettings.Notify.Type == 'ox' then
            lib.notify({ title = Config.Language.Notifications.DutyLabel, description = Config.Language.Notifications.DutyName, type = 'error', duration = Config.CoreSettings.Notify.Length.Error})
        end
    end
end)



-------------------------------------------------< MAKE SMOOTHIES END >--------------------------------







-------------------------------------------------< MAKE HOT DRINKS START >--------------------------------


--Prepare Tea
RegisterNetEvent("lusty94_icecream:client:PrepareTea", function()
    if onDuty then
        QBCore.Functions.TriggerCallback('lusty94_icecream:get:Mug', function(HasItems)  
            if HasItems then
                if Config.CoreSettings.Sound.UseInteractSound then
                    TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 10, Config.CoreSettings.Sound.PourHotDrinks, 0.5)
                end
                QBCore.Functions.Progressbar("prepare_Tea", Config.Language.Tea.ProgressBarName, Config.CoreSettings.ProgressBar.Times.PrepareSmoothies, false, false, {
                    disableMovement = true,
                    disableCarMovement = true,
                    disableMouse = false,
                    disableCombat = true,
                }, {
                    animDict = "amb@prop_human_parking_meter@female@base",
                    anim = "base_female",
                    flags = 41,
                }, {}, {}, function()
                    ClearPedTasks(PlayerPedId())
                    TriggerServerEvent('lusty94_icecream:server:CreateTea')
                        if Config.CoreSettings.Notify.Type == 'qb' then
                            QBCore.Functions.Notify(Config.Language.Tea.NotifyName, "success", Config.CoreSettings.Notify.Length.Success)
                        elseif Config.CoreSettings.Notify.Type == 'okok' then
                            exports['okokNotify']:Alert(Config.Language.Tea.NotifyLabel, Config.Language.Tea.NotifyName, Config.CoreSettings.Notify.Length.Success, 'success', Config.CoreSettings.Notify.Sound)
                        elseif Config.CoreSettings.Notify.Type == 'mythic' then
                            exports['mythic_notify']:DoHudText('success', Config.Language.Tea.NotifyName)
                        elseif Config.CoreSettings.Notify.Type == 'boii' then
                            exports['boii_ui']:notify(Config.Language.Tea.NotifyLabel, Config.Language.Tea.NotifyName, 'success', Config.CoreSettings.Notify.Length.Success)
                        elseif Config.CoreSettings.Notify.Type == 'ox' then
                            lib.notify({ title = Config.Language.Tea.NotifyLabel, description = Config.Language.Tea.NotifyName, type = 'success', duration = Config.CoreSettings.Notify.Length.Success})
                        end
                end, function()
                    ClearPedTasks(PlayerPedId())
                    if Config.CoreSettings.Notify.Type == 'qb' then
                        QBCore.Functions.Notify(Config.Language.Notifications.CancelledName, "error", Config.CoreSettings.Notify.Length.Error)
                    elseif Config.CoreSettings.Notify.Type == 'okok' then
                        exports['okokNotify']:Alert(Config.Language.Notifications.CancelledLabel,Config.Language.Notifications.CancelledName, Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound)
                    elseif Config.CoreSettings.Notify.Type == 'mythic' then
                        exports['mythic_notify']:DoHudText('error', Config.Language.Notifications.CancelledName) 
                    elseif Config.CoreSettings.Notify.Type == 'boii' then
                        exports['boii_ui']:notify(Config.Language.Notifications.CancelledLabel, Config.Language.Notifications.CancelledName, 'error', Config.CoreSettings.Notify.Length.Error)
                    elseif Config.CoreSettings.Notify.Type == 'ox' then
                        lib.notify({ title = Config.Language.Notifications.CancelledLabel, description = Config.Language.Notifications.CancelledName, type = 'error', duration = Config.CoreSettings.Notify.Length.Error})
                    end
                end)
                else
                    ClearPedTasks(PlayerPedId())
                    if Config.CoreSettings.Notify.Type == 'qb' then
                        QBCore.Functions.Notify(Config.Language.Notifications.MissingItemsName, "error", Config.CoreSettings.Notify.Length.Error)
                    elseif Config.CoreSettings.Notify.Type == 'okok' then
                        exports['okokNotify']:Alert(Config.Language.Notifications.MissingItemsLabel,Config.Language.Notifications.MissingItemsName, Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound) 
                    elseif Config.CoreSettings.Notify.Type == 'mythic' then
                        exports['mythic_notify']:DoHudText('error', Config.Language.Notifications.MissingItemsName)
                    elseif Config.CoreSettings.Notify.Type == 'boii' then
                        exports['boii_ui']:notify(Config.Language.Notifications.MissingItemsLabel, Config.Language.Notifications.MissingItemsName, 'error', Config.CoreSettings.Notify.Length.Error)
                    elseif Config.CoreSettings.Notify.Type == 'ox' then
                        lib.notify({ title = Config.Language.Notifications.MissingItemsLabel, description = Config.Language.Notifications.MissingItemsName, type = 'error', duration = Config.CoreSettings.Notify.Length.Error})
                    end
                end
            end)
    else 
        if Config.CoreSettings.Notify.Type == 'qb' then
            QBCore.Functions.Notify(Config.Language.Notifications.DutyName, "error", Config.CoreSettings.Notify.Length.Error)
        elseif Config.CoreSettings.Notify.Type == 'okok' then
            exports['okokNotify']:Alert(Config.Language.Notifications.DutyLabel,Config.Language.Notifications.DutyName, Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound) 
        elseif Config.CoreSettings.Notify.Type == 'mythic' then
            exports['mythic_notify']:DoHudText('error', Config.Language.Notifications.DutyName)
        elseif Config.CoreSettings.Notify.Type == 'boii' then
            exports['boii_ui']:notify(Config.Language.Notifications.DutyLabel, Config.Language.Notifications.DutyName, 'error', Config.CoreSettings.Notify.Length.Error)
        elseif Config.CoreSettings.Notify.Type == 'ox' then
            lib.notify({ title = Config.Language.Notifications.DutyLabel, description = Config.Language.Notifications.DutyName, type = 'error', duration = Config.CoreSettings.Notify.Length.Error})
        end
    end
end)

--Prepare Coffee
RegisterNetEvent("lusty94_icecream:client:PrepareCoffee", function()
    if onDuty then
        QBCore.Functions.TriggerCallback('lusty94_icecream:get:Mug', function(HasItems)  
            if HasItems then
                if Config.CoreSettings.Sound.UseInteractSound then
                    TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 10, Config.CoreSettings.Sound.PourHotDrinks, 0.5)
                end
                QBCore.Functions.Progressbar("prepare_Coffee", Config.Language.Coffee.ProgressBarName, Config.CoreSettings.ProgressBar.Times.PrepareSmoothies, false, false, {
                    disableMovement = true,
                    disableCarMovement = true,
                    disableMouse = false,
                    disableCombat = true,
                }, {
                    animDict = "amb@prop_human_parking_meter@female@base",
                    anim = "base_female",
                    flags = 41,
                }, {}, {}, function()
                    ClearPedTasks(PlayerPedId())
                    TriggerServerEvent('lusty94_icecream:server:CreateCoffee')
                        if Config.CoreSettings.Notify.Type == 'qb' then
                            QBCore.Functions.Notify(Config.Language.Coffee.NotifyName, "success", Config.CoreSettings.Notify.Length.Success)
                        elseif Config.CoreSettings.Notify.Type == 'okok' then
                            exports['okokNotify']:Alert(Config.Language.Coffee.NotifyLabel, Config.Language.Coffee.NotifyName, Config.CoreSettings.Notify.Length.Success, 'success', Config.CoreSettings.Notify.Sound)
                        elseif Config.CoreSettings.Notify.Type == 'mythic' then
                            exports['mythic_notify']:DoHudText('success', Config.Language.Coffee.NotifyName)
                        elseif Config.CoreSettings.Notify.Type == 'boii' then
                            exports['boii_ui']:notify(Config.Language.Coffee.NotifyLabel, Config.Language.Coffee.NotifyName, 'success', Config.CoreSettings.Notify.Length.Success)
                        elseif Config.CoreSettings.Notify.Type == 'ox' then
                            lib.notify({ title = Config.Language.Coffee.NotifyLabel, description = Config.Language.Coffee.NotifyName, type = 'success', duration = Config.CoreSettings.Notify.Length.Success})
                        end
                end, function()
                    ClearPedTasks(PlayerPedId())
                    if Config.CoreSettings.Notify.Type == 'qb' then
                        QBCore.Functions.Notify(Config.Language.Notifications.CancelledName, "error", Config.CoreSettings.Notify.Length.Error)
                    elseif Config.CoreSettings.Notify.Type == 'okok' then
                        exports['okokNotify']:Alert(Config.Language.Notifications.CancelledLabel,Config.Language.Notifications.CancelledName, Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound)
                    elseif Config.CoreSettings.Notify.Type == 'mythic' then
                        exports['mythic_notify']:DoHudText('error', Config.Language.Notifications.CancelledName) 
                    elseif Config.CoreSettings.Notify.Type == 'boii' then
                        exports['boii_ui']:notify(Config.Language.Notifications.CancelledLabel, Config.Language.Notifications.CancelledName, 'error', Config.CoreSettings.Notify.Length.Error)
                    elseif Config.CoreSettings.Notify.Type == 'ox' then
                        lib.notify({ title = Config.Language.Notifications.CancelledLabel, description = Config.Language.Notifications.CancelledName, type = 'error', duration = Config.CoreSettings.Notify.Length.Error})
                    end
                end)
                else
                    ClearPedTasks(PlayerPedId())
                    if Config.CoreSettings.Notify.Type == 'qb' then
                        QBCore.Functions.Notify(Config.Language.Notifications.MissingItemsName, "error", Config.CoreSettings.Notify.Length.Error)
                    elseif Config.CoreSettings.Notify.Type == 'okok' then
                        exports['okokNotify']:Alert(Config.Language.Notifications.MissingItemsLabel,Config.Language.Notifications.MissingItemsName, Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound) 
                    elseif Config.CoreSettings.Notify.Type == 'mythic' then
                        exports['mythic_notify']:DoHudText('error', Config.Language.Notifications.MissingItemsName)
                    elseif Config.CoreSettings.Notify.Type == 'boii' then
                        exports['boii_ui']:notify(Config.Language.Notifications.MissingItemsLabel, Config.Language.Notifications.MissingItemsName, 'error', Config.CoreSettings.Notify.Length.Error)
                    elseif Config.CoreSettings.Notify.Type == 'ox' then
                        lib.notify({ title = Config.Language.Notifications.MissingItemsLabel, description = Config.Language.Notifications.MissingItemsName, type = 'error', duration = Config.CoreSettings.Notify.Length.Error})
                    end
                end
            end)
    else 
        if Config.CoreSettings.Notify.Type == 'qb' then
            QBCore.Functions.Notify(Config.Language.Notifications.DutyName, "error", Config.CoreSettings.Notify.Length.Error)
        elseif Config.CoreSettings.Notify.Type == 'okok' then
            exports['okokNotify']:Alert(Config.Language.Notifications.DutyLabel,Config.Language.Notifications.DutyName, Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound) 
        elseif Config.CoreSettings.Notify.Type == 'mythic' then
            exports['mythic_notify']:DoHudText('error', Config.Language.Notifications.DutyName)
        elseif Config.CoreSettings.Notify.Type == 'boii' then
            exports['boii_ui']:notify(Config.Language.Notifications.DutyLabel, Config.Language.Notifications.DutyName, 'error', Config.CoreSettings.Notify.Length.Error)
        elseif Config.CoreSettings.Notify.Type == 'ox' then
            lib.notify({ title = Config.Language.Notifications.DutyLabel, description = Config.Language.Notifications.DutyName, type = 'error', duration = Config.CoreSettings.Notify.Length.Error})
        end
    end
end)

--Prepare HotChocolate
RegisterNetEvent("lusty94_icecream:client:PrepareHotChocolate", function()
    if onDuty then
        QBCore.Functions.TriggerCallback('lusty94_icecream:get:Mug', function(HasItems)  
            if HasItems then
                if Config.CoreSettings.Sound.UseInteractSound then
                    TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 10, Config.CoreSettings.Sound.PourHotDrinks, 0.5)
                end
                QBCore.Functions.Progressbar("prepare_HotChocolate", Config.Language.HotChocolate.ProgressBarName, Config.CoreSettings.ProgressBar.Times.PrepareSmoothies, false, false, {
                    disableMovement = true,
                    disableCarMovement = true,
                    disableMouse = false,
                    disableCombat = true,
                }, {
                    animDict = "amb@prop_human_parking_meter@female@base",
                    anim = "base_female",
                    flags = 41,
                }, {}, {}, function()
                    ClearPedTasks(PlayerPedId())
                    TriggerServerEvent('lusty94_icecream:server:CreateHotChocolate')
                        if Config.CoreSettings.Notify.Type == 'qb' then
                            QBCore.Functions.Notify(Config.Language.HotChocolate.NotifyName, "success", Config.CoreSettings.Notify.Length.Success)
                        elseif Config.CoreSettings.Notify.Type == 'okok' then
                            exports['okokNotify']:Alert(Config.Language.HotChocolate.NotifyLabel, Config.Language.HotChocolate.NotifyName, Config.CoreSettings.Notify.Length.Success, 'success', Config.CoreSettings.Notify.Sound)
                        elseif Config.CoreSettings.Notify.Type == 'mythic' then
                            exports['mythic_notify']:DoHudText('success', Config.Language.HotChocolate.NotifyName)
                        elseif Config.CoreSettings.Notify.Type == 'boii' then
                            exports['boii_ui']:notify(Config.Language.HotChocolate.NotifyLabel, Config.Language.HotChocolate.NotifyName, 'success', Config.CoreSettings.Notify.Length.Success)
                        elseif Config.CoreSettings.Notify.Type == 'ox' then
                            lib.notify({ title = Config.Language.HotChocolate.NotifyLabel, description = Config.Language.HotChocolate.NotifyName, type = 'success', duration = Config.CoreSettings.Notify.Length.Success})
                        end
                end, function()
                    ClearPedTasks(PlayerPedId())
                    if Config.CoreSettings.Notify.Type == 'qb' then
                        QBCore.Functions.Notify(Config.Language.Notifications.CancelledName, "error", Config.CoreSettings.Notify.Length.Error)
                    elseif Config.CoreSettings.Notify.Type == 'okok' then
                        exports['okokNotify']:Alert(Config.Language.Notifications.CancelledLabel,Config.Language.Notifications.CancelledName, Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound)
                    elseif Config.CoreSettings.Notify.Type == 'mythic' then
                        exports['mythic_notify']:DoHudText('error', Config.Language.Notifications.CancelledName) 
                    elseif Config.CoreSettings.Notify.Type == 'boii' then
                        exports['boii_ui']:notify(Config.Language.Notifications.CancelledLabel, Config.Language.Notifications.CancelledName, 'error', Config.CoreSettings.Notify.Length.Error)
                    elseif Config.CoreSettings.Notify.Type == 'ox' then
                        lib.notify({ title = Config.Language.Notifications.CancelledLabel, description = Config.Language.Notifications.CancelledName, type = 'error', duration = Config.CoreSettings.Notify.Length.Error})
                    end
                end)
                else
                    ClearPedTasks(PlayerPedId())
                    if Config.CoreSettings.Notify.Type == 'qb' then
                        QBCore.Functions.Notify(Config.Language.Notifications.MissingItemsName, "error", Config.CoreSettings.Notify.Length.Error)
                    elseif Config.CoreSettings.Notify.Type == 'okok' then
                        exports['okokNotify']:Alert(Config.Language.Notifications.MissingItemsLabel,Config.Language.Notifications.MissingItemsName, Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound) 
                    elseif Config.CoreSettings.Notify.Type == 'mythic' then
                        exports['mythic_notify']:DoHudText('error', Config.Language.Notifications.MissingItemsName)
                    elseif Config.CoreSettings.Notify.Type == 'boii' then
                        exports['boii_ui']:notify(Config.Language.Notifications.MissingItemsLabel, Config.Language.Notifications.MissingItemsName, 'error', Config.CoreSettings.Notify.Length.Error)
                    elseif Config.CoreSettings.Notify.Type == 'ox' then
                        lib.notify({ title = Config.Language.Notifications.MissingItemsLabel, description = Config.Language.Notifications.MissingItemsName, type = 'error', duration = Config.CoreSettings.Notify.Length.Error})
                    end
                end
            end)
    else 
        if Config.CoreSettings.Notify.Type == 'qb' then
            QBCore.Functions.Notify(Config.Language.Notifications.DutyName, "error", Config.CoreSettings.Notify.Length.Error)
        elseif Config.CoreSettings.Notify.Type == 'okok' then
            exports['okokNotify']:Alert(Config.Language.Notifications.DutyLabel,Config.Language.Notifications.DutyName, Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound) 
        elseif Config.CoreSettings.Notify.Type == 'mythic' then
            exports['mythic_notify']:DoHudText('error', Config.Language.Notifications.DutyName)
        elseif Config.CoreSettings.Notify.Type == 'boii' then
            exports['boii_ui']:notify(Config.Language.Notifications.DutyLabel, Config.Language.Notifications.DutyName, 'error', Config.CoreSettings.Notify.Length.Error)
        elseif Config.CoreSettings.Notify.Type == 'ox' then
            lib.notify({ title = Config.Language.Notifications.DutyLabel, description = Config.Language.Notifications.DutyName, type = 'error', duration = Config.CoreSettings.Notify.Length.Error})
        end
    end
end)

-------------------------------------------------< MAKE HOT DRINKS END >--------------------------------






-------------------------------------------------< MAKE SOFT DRINKS START >--------------------------------


--Prepare Cola
RegisterNetEvent("lusty94_icecream:client:PrepareCola", function()
    if onDuty then
        QBCore.Functions.TriggerCallback('lusty94_icecream:get:SoftDrinksCup', function(HasItems)  
            if HasItems then
                if Config.CoreSettings.Sound.UseInteractSound then
                    TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 10, Config.CoreSettings.Sound.PourSoftDrinks, 0.5)
                end
                QBCore.Functions.Progressbar("prepare_Cola", Config.Language.Cola.ProgressBarName, Config.CoreSettings.ProgressBar.Times.PrepareSmoothies, false, false, {
                    disableMovement = true,
                    disableCarMovement = true,
                    disableMouse = false,
                    disableCombat = true,
                }, {
                    animDict = "amb@prop_human_parking_meter@female@base",
                    anim = "base_female",
                    flags = 41,
                }, {}, {}, function()
                    ClearPedTasks(PlayerPedId())
                    TriggerServerEvent('lusty94_icecream:server:CreateCola')
                        if Config.CoreSettings.Notify.Type == 'qb' then
                            QBCore.Functions.Notify(Config.Language.Cola.NotifyName, "success", Config.CoreSettings.Notify.Length.Success)
                        elseif Config.CoreSettings.Notify.Type == 'okok' then
                            exports['okokNotify']:Alert(Config.Language.Cola.NotifyLabel, Config.Language.Cola.NotifyName, Config.CoreSettings.Notify.Length.Success, 'success', Config.CoreSettings.Notify.Sound)
                        elseif Config.CoreSettings.Notify.Type == 'mythic' then
                            exports['mythic_notify']:DoHudText('success', Config.Language.Cola.NotifyName)
                        elseif Config.CoreSettings.Notify.Type == 'boii' then
                            exports['boii_ui']:notify(Config.Language.Cola.NotifyLabel, Config.Language.Cola.NotifyName, 'success', Config.CoreSettings.Notify.Length.Success)
                        elseif Config.CoreSettings.Notify.Type == 'ox' then
                            lib.notify({ title = Config.Language.Cola.NotifyLabel, description = Config.Language.Cola.NotifyName, type = 'success', duration = Config.CoreSettings.Notify.Length.Success})
                        end
                end, function()
                    ClearPedTasks(PlayerPedId())
                    if Config.CoreSettings.Notify.Type == 'qb' then
                        QBCore.Functions.Notify(Config.Language.Notifications.CancelledName, "error", Config.CoreSettings.Notify.Length.Error)
                    elseif Config.CoreSettings.Notify.Type == 'okok' then
                        exports['okokNotify']:Alert(Config.Language.Notifications.CancelledLabel,Config.Language.Notifications.CancelledName, Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound)
                    elseif Config.CoreSettings.Notify.Type == 'mythic' then
                        exports['mythic_notify']:DoHudText('error', Config.Language.Notifications.CancelledName) 
                    elseif Config.CoreSettings.Notify.Type == 'boii' then
                        exports['boii_ui']:notify(Config.Language.Notifications.CancelledLabel, Config.Language.Notifications.CancelledName, 'error', Config.CoreSettings.Notify.Length.Error)
                    elseif Config.CoreSettings.Notify.Type == 'ox' then
                        lib.notify({ title = Config.Language.Notifications.CancelledLabel, description = Config.Language.Notifications.CancelledName, type = 'error', duration = Config.CoreSettings.Notify.Length.Error})
                    end
                end)
                else
                    ClearPedTasks(PlayerPedId())
                    if Config.CoreSettings.Notify.Type == 'qb' then
                        QBCore.Functions.Notify(Config.Language.Notifications.MissingItemsName, "error", Config.CoreSettings.Notify.Length.Error)
                    elseif Config.CoreSettings.Notify.Type == 'okok' then
                        exports['okokNotify']:Alert(Config.Language.Notifications.MissingItemsLabel,Config.Language.Notifications.MissingItemsName, Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound) 
                    elseif Config.CoreSettings.Notify.Type == 'mythic' then
                        exports['mythic_notify']:DoHudText('error', Config.Language.Notifications.MissingItemsName)
                    elseif Config.CoreSettings.Notify.Type == 'boii' then
                        exports['boii_ui']:notify(Config.Language.Notifications.MissingItemsLabel, Config.Language.Notifications.MissingItemsName, 'error', Config.CoreSettings.Notify.Length.Error)
                    elseif Config.CoreSettings.Notify.Type == 'ox' then
                        lib.notify({ title = Config.Language.Notifications.MissingItemsLabel, description = Config.Language.Notifications.MissingItemsName, type = 'error', duration = Config.CoreSettings.Notify.Length.Error})
                    end
                end
            end)
    else 
        if Config.CoreSettings.Notify.Type == 'qb' then
            QBCore.Functions.Notify(Config.Language.Notifications.DutyName, "error", Config.CoreSettings.Notify.Length.Error)
        elseif Config.CoreSettings.Notify.Type == 'okok' then
            exports['okokNotify']:Alert(Config.Language.Notifications.DutyLabel,Config.Language.Notifications.DutyName, Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound) 
        elseif Config.CoreSettings.Notify.Type == 'mythic' then
            exports['mythic_notify']:DoHudText('error', Config.Language.Notifications.DutyName)
        elseif Config.CoreSettings.Notify.Type == 'boii' then
            exports['boii_ui']:notify(Config.Language.Notifications.DutyLabel, Config.Language.Notifications.DutyName, 'error', Config.CoreSettings.Notify.Length.Error)
        elseif Config.CoreSettings.Notify.Type == 'ox' then
            lib.notify({ title = Config.Language.Notifications.DutyLabel, description = Config.Language.Notifications.DutyName, type = 'error', duration = Config.CoreSettings.Notify.Length.Error})
        end
    end
end)

--Prepare Lemonade
RegisterNetEvent("lusty94_icecream:client:PrepareLemonade", function()
    if onDuty then
        QBCore.Functions.TriggerCallback('lusty94_icecream:get:SoftDrinksCup', function(HasItems)  
            if HasItems then
                if Config.CoreSettings.Sound.UseInteractSound then
                    TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 10, Config.CoreSettings.Sound.PourSoftDrinks, 0.5)
                end
                QBCore.Functions.Progressbar("prepare_Lemonade", Config.Language.Lemonade.ProgressBarName, Config.CoreSettings.ProgressBar.Times.PrepareSmoothies, false, false, {
                    disableMovement = true,
                    disableCarMovement = true,
                    disableMouse = false,
                    disableCombat = true,
                }, {
                    animDict = "amb@prop_human_parking_meter@female@base",
                    anim = "base_female",
                    flags = 41,
                }, {}, {}, function()
                    ClearPedTasks(PlayerPedId())
                    TriggerServerEvent('lusty94_icecream:server:CreateLemonade')
                        if Config.CoreSettings.Notify.Type == 'qb' then
                            QBCore.Functions.Notify(Config.Language.Lemonade.NotifyName, "success", Config.CoreSettings.Notify.Length.Success)
                        elseif Config.CoreSettings.Notify.Type == 'okok' then
                            exports['okokNotify']:Alert(Config.Language.Lemonade.NotifyLabel, Config.Language.Lemonade.NotifyName, Config.CoreSettings.Notify.Length.Success, 'success', Config.CoreSettings.Notify.Sound)
                        elseif Config.CoreSettings.Notify.Type == 'mythic' then
                            exports['mythic_notify']:DoHudText('success', Config.Language.Lemonade.NotifyName)
                        elseif Config.CoreSettings.Notify.Type == 'boii' then
                            exports['boii_ui']:notify(Config.Language.Lemonade.NotifyLabel, Config.Language.Lemonade.NotifyName, 'success', Config.CoreSettings.Notify.Length.Success)
                        elseif Config.CoreSettings.Notify.Type == 'ox' then
                            lib.notify({ title = Config.Language.Lemonade.NotifyLabel, description = Config.Language.Lemonade.NotifyName, type = 'success', duration = Config.CoreSettings.Notify.Length.Success})
                        end
                end, function()
                    ClearPedTasks(PlayerPedId())
                    if Config.CoreSettings.Notify.Type == 'qb' then
                        QBCore.Functions.Notify(Config.Language.Notifications.CancelledName, "error", Config.CoreSettings.Notify.Length.Error)
                    elseif Config.CoreSettings.Notify.Type == 'okok' then
                        exports['okokNotify']:Alert(Config.Language.Notifications.CancelledLabel,Config.Language.Notifications.CancelledName, Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound)
                    elseif Config.CoreSettings.Notify.Type == 'mythic' then
                        exports['mythic_notify']:DoHudText('error', Config.Language.Notifications.CancelledName) 
                    elseif Config.CoreSettings.Notify.Type == 'boii' then
                        exports['boii_ui']:notify(Config.Language.Notifications.CancelledLabel, Config.Language.Notifications.CancelledName, 'error', Config.CoreSettings.Notify.Length.Error)
                    elseif Config.CoreSettings.Notify.Type == 'ox' then
                        lib.notify({ title = Config.Language.Notifications.CancelledLabel, description = Config.Language.Notifications.CancelledName, type = 'error', duration = Config.CoreSettings.Notify.Length.Error})
                    end
                end)
                else
                    ClearPedTasks(PlayerPedId())
                    if Config.CoreSettings.Notify.Type == 'qb' then
                        QBCore.Functions.Notify(Config.Language.Notifications.MissingItemsName, "error", Config.CoreSettings.Notify.Length.Error)
                    elseif Config.CoreSettings.Notify.Type == 'okok' then
                        exports['okokNotify']:Alert(Config.Language.Notifications.MissingItemsLabel,Config.Language.Notifications.MissingItemsName, Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound) 
                    elseif Config.CoreSettings.Notify.Type == 'mythic' then
                        exports['mythic_notify']:DoHudText('error', Config.Language.Notifications.MissingItemsName)
                    elseif Config.CoreSettings.Notify.Type == 'boii' then
                        exports['boii_ui']:notify(Config.Language.Notifications.MissingItemsLabel, Config.Language.Notifications.MissingItemsName, 'error', Config.CoreSettings.Notify.Length.Error)
                    elseif Config.CoreSettings.Notify.Type == 'ox' then
                        lib.notify({ title = Config.Language.Notifications.MissingItemsLabel, description = Config.Language.Notifications.MissingItemsName, type = 'error', duration = Config.CoreSettings.Notify.Length.Error})
                    end
                end
            end)
    else 
        if Config.CoreSettings.Notify.Type == 'qb' then
            QBCore.Functions.Notify(Config.Language.Notifications.DutyName, "error", Config.CoreSettings.Notify.Length.Error)
        elseif Config.CoreSettings.Notify.Type == 'okok' then
            exports['okokNotify']:Alert(Config.Language.Notifications.DutyLabel,Config.Language.Notifications.DutyName, Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound) 
        elseif Config.CoreSettings.Notify.Type == 'mythic' then
            exports['mythic_notify']:DoHudText('error', Config.Language.Notifications.DutyName)
        elseif Config.CoreSettings.Notify.Type == 'boii' then
            exports['boii_ui']:notify(Config.Language.Notifications.DutyLabel, Config.Language.Notifications.DutyName, 'error', Config.CoreSettings.Notify.Length.Error)
        elseif Config.CoreSettings.Notify.Type == 'ox' then
            lib.notify({ title = Config.Language.Notifications.DutyLabel, description = Config.Language.Notifications.DutyName, type = 'error', duration = Config.CoreSettings.Notify.Length.Error})
        end
    end
end)

--Prepare Orange Soda
RegisterNetEvent("lusty94_icecream:client:PrepareOrangeSoda", function()
    if onDuty then
        QBCore.Functions.TriggerCallback('lusty94_icecream:get:SoftDrinksCup', function(HasItems)  
            if HasItems then
                if Config.CoreSettings.Sound.UseInteractSound then
                    TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 10, Config.CoreSettings.Sound.PourSoftDrinks, 0.5)
                end
                QBCore.Functions.Progressbar("prepare_OrangeSoda", Config.Language.OrangeSoda.ProgressBarName, Config.CoreSettings.ProgressBar.Times.PrepareSmoothies, false, false, {
                    disableMovement = true,
                    disableCarMovement = true,
                    disableMouse = false,
                    disableCombat = true,
                }, {
                    animDict = "amb@prop_human_parking_meter@female@base",
                    anim = "base_female",
                    flags = 41,
                }, {}, {}, function()
                    ClearPedTasks(PlayerPedId())
                    TriggerServerEvent('lusty94_icecream:server:CreateOrangeSoda')
                        if Config.CoreSettings.Notify.Type == 'qb' then
                            QBCore.Functions.Notify(Config.Language.OrangeSoda.NotifyName, "success", Config.CoreSettings.Notify.Length.Success)
                        elseif Config.CoreSettings.Notify.Type == 'okok' then
                            exports['okokNotify']:Alert(Config.Language.OrangeSoda.NotifyLabel, Config.Language.OrangeSoda.NotifyName, Config.CoreSettings.Notify.Length.Success, 'success', Config.CoreSettings.Notify.Sound)
                        elseif Config.CoreSettings.Notify.Type == 'mythic' then
                            exports['mythic_notify']:DoHudText('success', Config.Language.OrangeSoda.NotifyName)
                        elseif Config.CoreSettings.Notify.Type == 'boii' then
                            exports['boii_ui']:notify(Config.Language.OrangeSoda.NotifyLabel, Config.Language.OrangeSoda.NotifyName, 'success', Config.CoreSettings.Notify.Length.Success)
                        elseif Config.CoreSettings.Notify.Type == 'ox' then
                            lib.notify({ title = Config.Language.OrangeSoda.NotifyLabel, description = Config.Language.OrangeSoda.NotifyName, type = 'success', duration = Config.CoreSettings.Notify.Length.Success})
                        end
                end, function()
                    ClearPedTasks(PlayerPedId())
                    if Config.CoreSettings.Notify.Type == 'qb' then
                        QBCore.Functions.Notify(Config.Language.Notifications.CancelledName, "error", Config.CoreSettings.Notify.Length.Error)
                    elseif Config.CoreSettings.Notify.Type == 'okok' then
                        exports['okokNotify']:Alert(Config.Language.Notifications.CancelledLabel,Config.Language.Notifications.CancelledName, Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound)
                    elseif Config.CoreSettings.Notify.Type == 'mythic' then
                        exports['mythic_notify']:DoHudText('error', Config.Language.Notifications.CancelledName) 
                    elseif Config.CoreSettings.Notify.Type == 'boii' then
                        exports['boii_ui']:notify(Config.Language.Notifications.CancelledLabel, Config.Language.Notifications.CancelledName, 'error', Config.CoreSettings.Notify.Length.Error)
                    elseif Config.CoreSettings.Notify.Type == 'ox' then
                        lib.notify({ title = Config.Language.Notifications.CancelledLabel, description = Config.Language.Notifications.CancelledName, type = 'error', duration = Config.CoreSettings.Notify.Length.Error})
                    end
                end)
                else
                    ClearPedTasks(PlayerPedId())
                    if Config.CoreSettings.Notify.Type == 'qb' then
                        QBCore.Functions.Notify(Config.Language.Notifications.MissingItemsName, "error", Config.CoreSettings.Notify.Length.Error)
                    elseif Config.CoreSettings.Notify.Type == 'okok' then
                        exports['okokNotify']:Alert(Config.Language.Notifications.MissingItemsLabel,Config.Language.Notifications.MissingItemsName, Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound) 
                    elseif Config.CoreSettings.Notify.Type == 'mythic' then
                        exports['mythic_notify']:DoHudText('error', Config.Language.Notifications.MissingItemsName)
                    elseif Config.CoreSettings.Notify.Type == 'boii' then
                        exports['boii_ui']:notify(Config.Language.Notifications.MissingItemsLabel, Config.Language.Notifications.MissingItemsName, 'error', Config.CoreSettings.Notify.Length.Error)
                    elseif Config.CoreSettings.Notify.Type == 'ox' then
                        lib.notify({ title = Config.Language.Notifications.MissingItemsLabel, description = Config.Language.Notifications.MissingItemsName, type = 'error', duration = Config.CoreSettings.Notify.Length.Error})
                    end
                end
            end)
    else 
        if Config.CoreSettings.Notify.Type == 'qb' then
            QBCore.Functions.Notify(Config.Language.Notifications.DutyName, "error", Config.CoreSettings.Notify.Length.Error)
        elseif Config.CoreSettings.Notify.Type == 'okok' then
            exports['okokNotify']:Alert(Config.Language.Notifications.DutyLabel,Config.Language.Notifications.DutyName, Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound) 
        elseif Config.CoreSettings.Notify.Type == 'mythic' then
            exports['mythic_notify']:DoHudText('error', Config.Language.Notifications.DutyName)
        elseif Config.CoreSettings.Notify.Type == 'boii' then
            exports['boii_ui']:notify(Config.Language.Notifications.DutyLabel, Config.Language.Notifications.DutyName, 'error', Config.CoreSettings.Notify.Length.Error)
        elseif Config.CoreSettings.Notify.Type == 'ox' then
            lib.notify({ title = Config.Language.Notifications.DutyLabel, description = Config.Language.Notifications.DutyName, type = 'error', duration = Config.CoreSettings.Notify.Length.Error})
        end
    end
end)

-------------------------------------------------< MAKE HOT DRINKS END >--------------------------------






-------------------------------------------------< MAKE ICE CREAMS START >--------------------------------

--Prepare Vanilla IceCream
RegisterNetEvent("lusty94_icecream:client:PrepareVanillaIceCream", function()
    if onDuty then
        QBCore.Functions.TriggerCallback('lusty94_icecream:get:VanillaIceCream', function(HasItems)  
            if HasItems then
                if Config.CoreSettings.Sound.UseInteractSound then
                    TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 10, Config.CoreSettings.Sound.ServeIceCream, 0.5)
                end
                QBCore.Functions.Progressbar("prepare_vanillaIceCream", Config.Language.VanillaIceCream.ProgressBarName, Config.CoreSettings.ProgressBar.Times.PrepareIceCream, false, false, {
                    disableMovement = true,
                    disableCarMovement = true,
                    disableMouse = false,
                    disableCombat = true,
                }, {
                    animDict = "amb@prop_human_parking_meter@female@base",
                    anim = "base_female",
                    flags = 41,
                }, {}, {}, function()
                    ClearPedTasks(PlayerPedId())
                    TriggerServerEvent('lusty94_icecream:server:CreateVanillaIceCream')
                        if Config.CoreSettings.Notify.Type == 'qb' then
                            QBCore.Functions.Notify(Config.Language.VanillaIceCream.NotifyName, "success", Config.CoreSettings.Notify.Length.Success)
                        elseif Config.CoreSettings.Notify.Type == 'okok' then
                            exports['okokNotify']:Alert(Config.Language.VanillaIceCream.NotifyLabel, Config.Language.VanillaIceCream.NotifyName, Config.CoreSettings.Notify.Length.Success, 'success', Config.CoreSettings.Notify.Sound)
                        elseif Config.CoreSettings.Notify.Type == 'mythic' then
                            exports['mythic_notify']:DoHudText('success', Config.Language.VanillaIceCream.NotifyName)
                        elseif Config.CoreSettings.Notify.Type == 'boii' then
                            exports['boii_ui']:notify(Config.Language.VanillaIceCream.NotifyLabel, Config.Language.VanillaIceCream.NotifyName, 'success', Config.CoreSettings.Notify.Length.Success)
                        elseif Config.CoreSettings.Notify.Type == 'ox' then
                            lib.notify({ title = Config.Language.VanillaIceCream.NotifyLabel, description = Config.Language.VanillaIceCream.NotifyName, type = 'success', duration = Config.CoreSettings.Notify.Length.Success})
                        end
                end, function()
                    ClearPedTasks(PlayerPedId())
                    if Config.CoreSettings.Notify.Type == 'qb' then
                        QBCore.Functions.Notify(Config.Language.Notifications.CancelledName, "error", Config.CoreSettings.Notify.Length.Error)
                    elseif Config.CoreSettings.Notify.Type == 'okok' then
                        exports['okokNotify']:Alert(Config.Language.Notifications.CancelledLabel,Config.Language.Notifications.CancelledName, Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound)
                    elseif Config.CoreSettings.Notify.Type == 'mythic' then
                        exports['mythic_notify']:DoHudText('error', Config.Language.Notifications.CancelledName) 
                    elseif Config.CoreSettings.Notify.Type == 'boii' then
                        exports['boii_ui']:notify(Config.Language.Notifications.CancelledLabel, Config.Language.Notifications.CancelledName, 'error', Config.CoreSettings.Notify.Length.Error)
                    elseif Config.CoreSettings.Notify.Type == 'ox' then
                        lib.notify({ title = Config.Language.Notifications.CancelledLabel, description = Config.Language.Notifications.CancelledName, type = 'error', duration = Config.CoreSettings.Notify.Length.Error})
                    end
                end)
                else
                    ClearPedTasks(PlayerPedId())
                    if Config.CoreSettings.Notify.Type == 'qb' then
                        QBCore.Functions.Notify(Config.Language.Notifications.MissingItemsName, "error", Config.CoreSettings.Notify.Length.Error)
                    elseif Config.CoreSettings.Notify.Type == 'okok' then
                        exports['okokNotify']:Alert(Config.Language.Notifications.MissingItemsLabel,Config.Language.Notifications.MissingItemsName, Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound) 
                    elseif Config.CoreSettings.Notify.Type == 'mythic' then
                        exports['mythic_notify']:DoHudText('error', Config.Language.Notifications.MissingItemsName)
                    elseif Config.CoreSettings.Notify.Type == 'boii' then
                        exports['boii_ui']:notify(Config.Language.Notifications.MissingItemsLabel, Config.Language.Notifications.MissingItemsName, 'error', Config.CoreSettings.Notify.Length.Error)
                    elseif Config.CoreSettings.Notify.Type == 'ox' then
                        lib.notify({ title = Config.Language.Notifications.MissingItemsLabel, description = Config.Language.Notifications.MissingItemsName, type = 'error', duration = Config.CoreSettings.Notify.Length.Error})
                    end
                end
            end)
    else 
        if Config.CoreSettings.Notify.Type == 'qb' then
            QBCore.Functions.Notify(Config.Language.Notifications.DutyName, "error", Config.CoreSettings.Notify.Length.Error)
        elseif Config.CoreSettings.Notify.Type == 'okok' then
            exports['okokNotify']:Alert(Config.Language.Notifications.DutyLabel,Config.Language.Notifications.DutyName, Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound) 
        elseif Config.CoreSettings.Notify.Type == 'mythic' then
            exports['mythic_notify']:DoHudText('error', Config.Language.Notifications.DutyName)
        elseif Config.CoreSettings.Notify.Type == 'boii' then
            exports['boii_ui']:notify(Config.Language.Notifications.DutyLabel, Config.Language.Notifications.DutyName, 'error', Config.CoreSettings.Notify.Length.Error)
        elseif Config.CoreSettings.Notify.Type == 'ox' then
            lib.notify({ title = Config.Language.Notifications.DutyLabel, description = Config.Language.Notifications.DutyName, type = 'error', duration = Config.CoreSettings.Notify.Length.Error})
        end
    end
end)

--Prepare Chocolate IceCream
RegisterNetEvent("lusty94_icecream:client:PrepareChocolateIceCream", function()
    if onDuty then
        QBCore.Functions.TriggerCallback('lusty94_icecream:get:ChocolateIceCream', function(HasItems)  
            if HasItems then
                if Config.CoreSettings.Sound.UseInteractSound then
                    TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 10, Config.CoreSettings.Sound.ServeIceCream, 0.5)
                end
                QBCore.Functions.Progressbar("prepare_ChocolateIceCream", Config.Language.ChocolateIceCream.ProgressBarName, Config.CoreSettings.ProgressBar.Times.PrepareIceCream, false, false, {
                    disableMovement = true,
                    disableCarMovement = true,
                    disableMouse = false,
                    disableCombat = true,
                }, {
                    animDict = "amb@prop_human_parking_meter@female@base",
                    anim = "base_female",
                    flags = 41,
                }, {}, {}, function()
                    ClearPedTasks(PlayerPedId())
                    TriggerServerEvent('lusty94_icecream:server:CreateChocolateIceCream')
                        if Config.CoreSettings.Notify.Type == 'qb' then
                            QBCore.Functions.Notify(Config.Language.ChocolateIceCream.NotifyName, "success", Config.CoreSettings.Notify.Length.Success)
                        elseif Config.CoreSettings.Notify.Type == 'okok' then
                            exports['okokNotify']:Alert(Config.Language.ChocolateIceCream.NotifyLabel, Config.Language.ChocolateIceCream.NotifyName, Config.CoreSettings.Notify.Length.Success, 'success', Config.CoreSettings.Notify.Sound)
                        elseif Config.CoreSettings.Notify.Type == 'mythic' then
                            exports['mythic_notify']:DoHudText('success', Config.Language.ChocolateIceCream.NotifyName)
                        elseif Config.CoreSettings.Notify.Type == 'boii' then
                            exports['boii_ui']:notify(Config.Language.ChocolateIceCream.NotifyLabel, Config.Language.ChocolateIceCream.NotifyName, 'success', Config.CoreSettings.Notify.Length.Success)
                        elseif Config.CoreSettings.Notify.Type == 'ox' then
                            lib.notify({ title = Config.Language.ChocolateIceCream.NotifyLabel, description = Config.Language.ChocolateIceCream.NotifyName, type = 'success', duration = Config.CoreSettings.Notify.Length.Success})
                        end
                end, function()
                    ClearPedTasks(PlayerPedId())
                    if Config.CoreSettings.Notify.Type == 'qb' then
                        QBCore.Functions.Notify(Config.Language.Notifications.CancelledName, "error", Config.CoreSettings.Notify.Length.Error)
                    elseif Config.CoreSettings.Notify.Type == 'okok' then
                        exports['okokNotify']:Alert(Config.Language.Notifications.CancelledLabel,Config.Language.Notifications.CancelledName, Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound)
                    elseif Config.CoreSettings.Notify.Type == 'mythic' then
                        exports['mythic_notify']:DoHudText('error', Config.Language.Notifications.CancelledName) 
                    elseif Config.CoreSettings.Notify.Type == 'boii' then
                        exports['boii_ui']:notify(Config.Language.Notifications.CancelledLabel, Config.Language.Notifications.CancelledName, 'error', Config.CoreSettings.Notify.Length.Error)
                    elseif Config.CoreSettings.Notify.Type == 'ox' then
                        lib.notify({ title = Config.Language.Notifications.CancelledLabel, description = Config.Language.Notifications.CancelledName, type = 'error', duration = Config.CoreSettings.Notify.Length.Error})
                    end
                end)
                else
                    ClearPedTasks(PlayerPedId())
                    if Config.CoreSettings.Notify.Type == 'qb' then
                        QBCore.Functions.Notify(Config.Language.Notifications.MissingItemsName, "error", Config.CoreSettings.Notify.Length.Error)
                    elseif Config.CoreSettings.Notify.Type == 'okok' then
                        exports['okokNotify']:Alert(Config.Language.Notifications.MissingItemsLabel,Config.Language.Notifications.MissingItemsName, Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound) 
                    elseif Config.CoreSettings.Notify.Type == 'mythic' then
                        exports['mythic_notify']:DoHudText('error', Config.Language.Notifications.MissingItemsName)
                    elseif Config.CoreSettings.Notify.Type == 'boii' then
                        exports['boii_ui']:notify(Config.Language.Notifications.MissingItemsLabel, Config.Language.Notifications.MissingItemsName, 'error', Config.CoreSettings.Notify.Length.Error)
                    elseif Config.CoreSettings.Notify.Type == 'ox' then
                        lib.notify({ title = Config.Language.Notifications.MissingItemsLabel, description = Config.Language.Notifications.MissingItemsName, type = 'error', duration = Config.CoreSettings.Notify.Length.Error})
                    end
                end
            end)
    else 
        if Config.CoreSettings.Notify.Type == 'qb' then
            QBCore.Functions.Notify(Config.Language.Notifications.DutyName, "error", Config.CoreSettings.Notify.Length.Error)
        elseif Config.CoreSettings.Notify.Type == 'okok' then
            exports['okokNotify']:Alert(Config.Language.Notifications.DutyLabel,Config.Language.Notifications.DutyName, Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound) 
        elseif Config.CoreSettings.Notify.Type == 'mythic' then
            exports['mythic_notify']:DoHudText('error', Config.Language.Notifications.DutyName)
        elseif Config.CoreSettings.Notify.Type == 'boii' then
            exports['boii_ui']:notify(Config.Language.Notifications.DutyLabel, Config.Language.Notifications.DutyName, 'error', Config.CoreSettings.Notify.Length.Error)
        elseif Config.CoreSettings.Notify.Type == 'ox' then
            lib.notify({ title = Config.Language.Notifications.DutyLabel, description = Config.Language.Notifications.DutyName, type = 'error', duration = Config.CoreSettings.Notify.Length.Error})
        end
    end
end)


--Prepare Strawberry IceCream
RegisterNetEvent("lusty94_icecream:client:PrepareStrawberryIceCream", function()
    if onDuty then
        QBCore.Functions.TriggerCallback('lusty94_icecream:get:StrawberryIceCream', function(HasItems)  
            if HasItems then
                if Config.CoreSettings.Sound.UseInteractSound then
                    TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 10, Config.CoreSettings.Sound.ServeIceCream, 0.5)
                end
                QBCore.Functions.Progressbar("prepare_StrawberryIceCream", Config.Language.StrawberryIceCream.ProgressBarName, Config.CoreSettings.ProgressBar.Times.PrepareIceCream, false, false, {
                    disableMovement = true,
                    disableCarMovement = true,
                    disableMouse = false,
                    disableCombat = true,
                }, {
                    animDict = "amb@prop_human_parking_meter@female@base",
                    anim = "base_female",
                    flags = 41,
                }, {}, {}, function()
                    ClearPedTasks(PlayerPedId())
                    TriggerServerEvent('lusty94_icecream:server:CreateStrawberryIceCream')
                        if Config.CoreSettings.Notify.Type == 'qb' then
                            QBCore.Functions.Notify(Config.Language.StrawberryIceCream.NotifyName, "success", Config.CoreSettings.Notify.Length.Success)
                        elseif Config.CoreSettings.Notify.Type == 'okok' then
                            exports['okokNotify']:Alert(Config.Language.StrawberryIceCream.NotifyLabel, Config.Language.StrawberryIceCream.NotifyName, Config.CoreSettings.Notify.Length.Success, 'success', Config.CoreSettings.Notify.Sound)
                        elseif Config.CoreSettings.Notify.Type == 'mythic' then
                            exports['mythic_notify']:DoHudText('success', Config.Language.StrawberryIceCream.NotifyName)
                        elseif Config.CoreSettings.Notify.Type == 'boii' then
                            exports['boii_ui']:notify(Config.Language.StrawberryIceCream.NotifyLabel, Config.Language.StrawberryIceCream.NotifyName, 'success', Config.CoreSettings.Notify.Length.Success)
                        elseif Config.CoreSettings.Notify.Type == 'ox' then
                            lib.notify({ title = Config.Language.StrawberryIceCream.NotifyLabel, description = Config.Language.StrawberryIceCream.NotifyName, type = 'success', duration = Config.CoreSettings.Notify.Length.Success})
                        end
                end, function()
                    ClearPedTasks(PlayerPedId())
                    if Config.CoreSettings.Notify.Type == 'qb' then
                        QBCore.Functions.Notify(Config.Language.Notifications.CancelledName, "error", Config.CoreSettings.Notify.Length.Error)
                    elseif Config.CoreSettings.Notify.Type == 'okok' then
                        exports['okokNotify']:Alert(Config.Language.Notifications.CancelledLabel,Config.Language.Notifications.CancelledName, Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound)
                    elseif Config.CoreSettings.Notify.Type == 'mythic' then
                        exports['mythic_notify']:DoHudText('error', Config.Language.Notifications.CancelledName) 
                    elseif Config.CoreSettings.Notify.Type == 'boii' then
                        exports['boii_ui']:notify(Config.Language.Notifications.CancelledLabel, Config.Language.Notifications.CancelledName, 'error', Config.CoreSettings.Notify.Length.Error)
                    elseif Config.CoreSettings.Notify.Type == 'ox' then
                        lib.notify({ title = Config.Language.Notifications.CancelledLabel, description = Config.Language.Notifications.CancelledName, type = 'error', duration = Config.CoreSettings.Notify.Length.Error})
                    end
                end)
                else
                    ClearPedTasks(PlayerPedId())
                    if Config.CoreSettings.Notify.Type == 'qb' then
                        QBCore.Functions.Notify(Config.Language.Notifications.MissingItemsName, "error", Config.CoreSettings.Notify.Length.Error)
                    elseif Config.CoreSettings.Notify.Type == 'okok' then
                        exports['okokNotify']:Alert(Config.Language.Notifications.MissingItemsLabel,Config.Language.Notifications.MissingItemsName, Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound) 
                    elseif Config.CoreSettings.Notify.Type == 'mythic' then
                        exports['mythic_notify']:DoHudText('error', Config.Language.Notifications.MissingItemsName)
                    elseif Config.CoreSettings.Notify.Type == 'boii' then
                        exports['boii_ui']:notify(Config.Language.Notifications.MissingItemsLabel, Config.Language.Notifications.MissingItemsName, 'error', Config.CoreSettings.Notify.Length.Error)
                    elseif Config.CoreSettings.Notify.Type == 'ox' then
                        lib.notify({ title = Config.Language.Notifications.MissingItemsLabel, description = Config.Language.Notifications.MissingItemsName, type = 'error', duration = Config.CoreSettings.Notify.Length.Error})
                    end
                end
            end)
    else 
        if Config.CoreSettings.Notify.Type == 'qb' then
            QBCore.Functions.Notify(Config.Language.Notifications.DutyName, "error", Config.CoreSettings.Notify.Length.Error)
        elseif Config.CoreSettings.Notify.Type == 'okok' then
            exports['okokNotify']:Alert(Config.Language.Notifications.DutyLabel,Config.Language.Notifications.DutyName, Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound) 
        elseif Config.CoreSettings.Notify.Type == 'mythic' then
            exports['mythic_notify']:DoHudText('error', Config.Language.Notifications.DutyName)
        elseif Config.CoreSettings.Notify.Type == 'boii' then
            exports['boii_ui']:notify(Config.Language.Notifications.DutyLabel, Config.Language.Notifications.DutyName, 'error', Config.CoreSettings.Notify.Length.Error)
        elseif Config.CoreSettings.Notify.Type == 'ox' then
            lib.notify({ title = Config.Language.Notifications.DutyLabel, description = Config.Language.Notifications.DutyName, type = 'error', duration = Config.CoreSettings.Notify.Length.Error})
        end
    end
end)

--Prepare Mint IceCream
RegisterNetEvent("lusty94_icecream:client:PrepareMintIceCream", function()
    if onDuty then
        QBCore.Functions.TriggerCallback('lusty94_icecream:get:MintIceCream', function(HasItems)  
            if HasItems then
                if Config.CoreSettings.Sound.UseInteractSound then
                    TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 10, Config.CoreSettings.Sound.ServeIceCream, 0.5)
                end
                QBCore.Functions.Progressbar("prepare_MintIceCream", Config.Language.MintIceCream.ProgressBarName, Config.CoreSettings.ProgressBar.Times.PrepareIceCream, false, false, {
                    disableMovement = true,
                    disableCarMovement = true,
                    disableMouse = false,
                    disableCombat = true,
                }, {
                    animDict = "amb@prop_human_parking_meter@female@base",
                    anim = "base_female",
                    flags = 41,
                }, {}, {}, function()
                    ClearPedTasks(PlayerPedId())
                    TriggerServerEvent('lusty94_icecream:server:CreateMintIceCream')
                        if Config.CoreSettings.Notify.Type == 'qb' then
                            QBCore.Functions.Notify(Config.Language.MintIceCream.NotifyName, "success", Config.CoreSettings.Notify.Length.Success)
                        elseif Config.CoreSettings.Notify.Type == 'okok' then
                            exports['okokNotify']:Alert(Config.Language.MintIceCream.NotifyLabel, Config.Language.MintIceCream.NotifyName, Config.CoreSettings.Notify.Length.Success, 'success', Config.CoreSettings.Notify.Sound)
                        elseif Config.CoreSettings.Notify.Type == 'mythic' then
                            exports['mythic_notify']:DoHudText('success', Config.Language.MintIceCream.NotifyName)
                        elseif Config.CoreSettings.Notify.Type == 'boii' then
                            exports['boii_ui']:notify(Config.Language.MintIceCream.NotifyLabel, Config.Language.MintIceCream.NotifyName, 'success', Config.CoreSettings.Notify.Length.Success)
                        elseif Config.CoreSettings.Notify.Type == 'ox' then
                            lib.notify({ title = Config.Language.MintIceCream.NotifyLabel, description = Config.Language.MintIceCream.NotifyName, type = 'success', duration = Config.CoreSettings.Notify.Length.Success})
                        end
                end, function()
                    ClearPedTasks(PlayerPedId())
                    if Config.CoreSettings.Notify.Type == 'qb' then
                        QBCore.Functions.Notify(Config.Language.Notifications.CancelledName, "error", Config.CoreSettings.Notify.Length.Error)
                    elseif Config.CoreSettings.Notify.Type == 'okok' then
                        exports['okokNotify']:Alert(Config.Language.Notifications.CancelledLabel,Config.Language.Notifications.CancelledName, Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound)
                    elseif Config.CoreSettings.Notify.Type == 'mythic' then
                        exports['mythic_notify']:DoHudText('error', Config.Language.Notifications.CancelledName) 
                    elseif Config.CoreSettings.Notify.Type == 'boii' then
                        exports['boii_ui']:notify(Config.Language.Notifications.CancelledLabel, Config.Language.Notifications.CancelledName, 'error', Config.CoreSettings.Notify.Length.Error)
                    elseif Config.CoreSettings.Notify.Type == 'ox' then
                        lib.notify({ title = Config.Language.Notifications.CancelledLabel, description = Config.Language.Notifications.CancelledName, type = 'error', duration = Config.CoreSettings.Notify.Length.Error})
                    end
                end)
                else
                    ClearPedTasks(PlayerPedId())
                    if Config.CoreSettings.Notify.Type == 'qb' then
                        QBCore.Functions.Notify(Config.Language.Notifications.MissingItemsName, "error", Config.CoreSettings.Notify.Length.Error)
                    elseif Config.CoreSettings.Notify.Type == 'okok' then
                        exports['okokNotify']:Alert(Config.Language.Notifications.MissingItemsLabel,Config.Language.Notifications.MissingItemsName, Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound) 
                    elseif Config.CoreSettings.Notify.Type == 'mythic' then
                        exports['mythic_notify']:DoHudText('error', Config.Language.Notifications.MissingItemsName)
                    elseif Config.CoreSettings.Notify.Type == 'boii' then
                        exports['boii_ui']:notify(Config.Language.Notifications.MissingItemsLabel, Config.Language.Notifications.MissingItemsName, 'error', Config.CoreSettings.Notify.Length.Error)
                    elseif Config.CoreSettings.Notify.Type == 'ox' then
                        lib.notify({ title = Config.Language.Notifications.MissingItemsLabel, description = Config.Language.Notifications.MissingItemsName, type = 'error', duration = Config.CoreSettings.Notify.Length.Error})
                    end
                end
            end)
    else 
        if Config.CoreSettings.Notify.Type == 'qb' then
            QBCore.Functions.Notify(Config.Language.Notifications.DutyName, "error", Config.CoreSettings.Notify.Length.Error)
        elseif Config.CoreSettings.Notify.Type == 'okok' then
            exports['okokNotify']:Alert(Config.Language.Notifications.DutyLabel,Config.Language.Notifications.DutyName, Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound) 
        elseif Config.CoreSettings.Notify.Type == 'mythic' then
            exports['mythic_notify']:DoHudText('error', Config.Language.Notifications.DutyName)
        elseif Config.CoreSettings.Notify.Type == 'boii' then
            exports['boii_ui']:notify(Config.Language.Notifications.DutyLabel, Config.Language.Notifications.DutyName, 'error', Config.CoreSettings.Notify.Length.Error)
        elseif Config.CoreSettings.Notify.Type == 'ox' then
            lib.notify({ title = Config.Language.Notifications.DutyLabel, description = Config.Language.Notifications.DutyName, type = 'error', duration = Config.CoreSettings.Notify.Length.Error})
        end
    end
end)


--Prepare Pistachio IceCream
RegisterNetEvent("lusty94_icecream:client:PreparePistachioIceCream", function()
    if onDuty then
        QBCore.Functions.TriggerCallback('lusty94_icecream:get:PistachioIceCream', function(HasItems)  
            if HasItems then
                if Config.CoreSettings.Sound.UseInteractSound then
                    TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 10, Config.CoreSettings.Sound.ServeIceCream, 0.5)
                end
                QBCore.Functions.Progressbar("prepare_PistachioIceCream", Config.Language.PistachioIceCream.ProgressBarName, Config.CoreSettings.ProgressBar.Times.PrepareIceCream, false, false, {
                    disableMovement = true,
                    disableCarMovement = true,
                    disableMouse = false,
                    disableCombat = true,
                }, {
                    animDict = "amb@prop_human_parking_meter@female@base",
                    anim = "base_female",
                    flags = 41,
                }, {}, {}, function()
                    ClearPedTasks(PlayerPedId())
                    TriggerServerEvent('lusty94_icecream:server:CreatePistachioIceCream')
                        if Config.CoreSettings.Notify.Type == 'qb' then
                            QBCore.Functions.Notify(Config.Language.PistachioIceCream.NotifyName, "success", Config.CoreSettings.Notify.Length.Success)
                        elseif Config.CoreSettings.Notify.Type == 'okok' then
                            exports['okokNotify']:Alert(Config.Language.PistachioIceCream.NotifyLabel, Config.Language.PistachioIceCream.NotifyName, Config.CoreSettings.Notify.Length.Success, 'success', Config.CoreSettings.Notify.Sound)
                        elseif Config.CoreSettings.Notify.Type == 'mythic' then
                            exports['mythic_notify']:DoHudText('success', Config.Language.PistachioIceCream.NotifyName)
                        elseif Config.CoreSettings.Notify.Type == 'boii' then
                            exports['boii_ui']:notify(Config.Language.PistachioIceCream.NotifyLabel, Config.Language.PistachioIceCream.NotifyName, 'success', Config.CoreSettings.Notify.Length.Success)
                        elseif Config.CoreSettings.Notify.Type == 'ox' then
                            lib.notify({ title = Config.Language.PistachioIceCream.NotifyLabel, description = Config.Language.PistachioIceCream.NotifyName, type = 'success', duration = Config.CoreSettings.Notify.Length.Success})
                        end
                end, function()
                    ClearPedTasks(PlayerPedId())
                    if Config.CoreSettings.Notify.Type == 'qb' then
                        QBCore.Functions.Notify(Config.Language.Notifications.CancelledName, "error", Config.CoreSettings.Notify.Length.Error)
                    elseif Config.CoreSettings.Notify.Type == 'okok' then
                        exports['okokNotify']:Alert(Config.Language.Notifications.CancelledLabel,Config.Language.Notifications.CancelledName, Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound)
                    elseif Config.CoreSettings.Notify.Type == 'mythic' then
                        exports['mythic_notify']:DoHudText('error', Config.Language.Notifications.CancelledName) 
                    elseif Config.CoreSettings.Notify.Type == 'boii' then
                        exports['boii_ui']:notify(Config.Language.Notifications.CancelledLabel, Config.Language.Notifications.CancelledName, 'error', Config.CoreSettings.Notify.Length.Error)
                    elseif Config.CoreSettings.Notify.Type == 'ox' then
                        lib.notify({ title = Config.Language.Notifications.CancelledLabel, description = Config.Language.Notifications.CancelledName, type = 'error', duration = Config.CoreSettings.Notify.Length.Error})
                    end
                end)
                else
                    ClearPedTasks(PlayerPedId())
                    if Config.CoreSettings.Notify.Type == 'qb' then
                        QBCore.Functions.Notify(Config.Language.Notifications.MissingItemsName, "error", Config.CoreSettings.Notify.Length.Error)
                    elseif Config.CoreSettings.Notify.Type == 'okok' then
                        exports['okokNotify']:Alert(Config.Language.Notifications.MissingItemsLabel,Config.Language.Notifications.MissingItemsName, Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound) 
                    elseif Config.CoreSettings.Notify.Type == 'mythic' then
                        exports['mythic_notify']:DoHudText('error', Config.Language.Notifications.MissingItemsName)
                    elseif Config.CoreSettings.Notify.Type == 'boii' then
                        exports['boii_ui']:notify(Config.Language.Notifications.MissingItemsLabel, Config.Language.Notifications.MissingItemsName, 'error', Config.CoreSettings.Notify.Length.Error)
                    elseif Config.CoreSettings.Notify.Type == 'ox' then
                        lib.notify({ title = Config.Language.Notifications.MissingItemsLabel, description = Config.Language.Notifications.MissingItemsName, type = 'error', duration = Config.CoreSettings.Notify.Length.Error})
                    end
                end
            end)
    else 
        if Config.CoreSettings.Notify.Type == 'qb' then
            QBCore.Functions.Notify(Config.Language.Notifications.DutyName, "error", Config.CoreSettings.Notify.Length.Error)
        elseif Config.CoreSettings.Notify.Type == 'okok' then
            exports['okokNotify']:Alert(Config.Language.Notifications.DutyLabel,Config.Language.Notifications.DutyName, Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound) 
        elseif Config.CoreSettings.Notify.Type == 'mythic' then
            exports['mythic_notify']:DoHudText('error', Config.Language.Notifications.DutyName)
        elseif Config.CoreSettings.Notify.Type == 'boii' then
            exports['boii_ui']:notify(Config.Language.Notifications.DutyLabel, Config.Language.Notifications.DutyName, 'error', Config.CoreSettings.Notify.Length.Error)
        elseif Config.CoreSettings.Notify.Type == 'ox' then
            lib.notify({ title = Config.Language.Notifications.DutyLabel, description = Config.Language.Notifications.DutyName, type = 'error', duration = Config.CoreSettings.Notify.Length.Error})
        end
    end
end)

--Prepare ButterScotch IceCream
RegisterNetEvent("lusty94_icecream:client:PrepareButterScotchIceCream", function()
    if onDuty then
        QBCore.Functions.TriggerCallback('lusty94_icecream:get:ButterScotchIceCream', function(HasItems)  
            if HasItems then
                if Config.CoreSettings.Sound.UseInteractSound then
                    TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 10, Config.CoreSettings.Sound.ServeIceCream, 0.5)
                end
                QBCore.Functions.Progressbar("prepare_ButterScotchIceCream", Config.Language.ButterScotchIceCream.ProgressBarName, Config.CoreSettings.ProgressBar.Times.PrepareIceCream, false, false, {
                    disableMovement = true,
                    disableCarMovement = true,
                    disableMouse = false,
                    disableCombat = true,
                }, {
                    animDict = "amb@prop_human_parking_meter@female@base",
                    anim = "base_female",
                    flags = 41,
                }, {}, {}, function()
                    ClearPedTasks(PlayerPedId())
                    TriggerServerEvent('lusty94_icecream:server:CreateButterScotchIceCream')
                        if Config.CoreSettings.Notify.Type == 'qb' then
                            QBCore.Functions.Notify(Config.Language.ButterScotchIceCream.NotifyName, "success", Config.CoreSettings.Notify.Length.Success)
                        elseif Config.CoreSettings.Notify.Type == 'okok' then
                            exports['okokNotify']:Alert(Config.Language.ButterScotchIceCream.NotifyLabel, Config.Language.ButterScotchIceCream.NotifyName, Config.CoreSettings.Notify.Length.Success, 'success', Config.CoreSettings.Notify.Sound)
                        elseif Config.CoreSettings.Notify.Type == 'mythic' then
                            exports['mythic_notify']:DoHudText('success', Config.Language.ButterScotchIceCream.NotifyName)
                        elseif Config.CoreSettings.Notify.Type == 'boii' then
                            exports['boii_ui']:notify(Config.Language.ButterScotchIceCream.NotifyLabel, Config.Language.ButterScotchIceCream.NotifyName, 'success', Config.CoreSettings.Notify.Length.Success)
                        elseif Config.CoreSettings.Notify.Type == 'ox' then
                            lib.notify({ title = Config.Language.ButterScotchIceCream.NotifyLabel, description = Config.Language.ButterScotchIceCream.NotifyName, type = 'success', duration = Config.CoreSettings.Notify.Length.Success})
                        end
                end, function()
                    ClearPedTasks(PlayerPedId())
                    if Config.CoreSettings.Notify.Type == 'qb' then
                        QBCore.Functions.Notify(Config.Language.Notifications.CancelledName, "error", Config.CoreSettings.Notify.Length.Error)
                    elseif Config.CoreSettings.Notify.Type == 'okok' then
                        exports['okokNotify']:Alert(Config.Language.Notifications.CancelledLabel,Config.Language.Notifications.CancelledName, Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound)
                    elseif Config.CoreSettings.Notify.Type == 'mythic' then
                        exports['mythic_notify']:DoHudText('error', Config.Language.Notifications.CancelledName) 
                    elseif Config.CoreSettings.Notify.Type == 'boii' then
                        exports['boii_ui']:notify(Config.Language.Notifications.CancelledLabel, Config.Language.Notifications.CancelledName, 'error', Config.CoreSettings.Notify.Length.Error)
                    elseif Config.CoreSettings.Notify.Type == 'ox' then
                        lib.notify({ title = Config.Language.Notifications.CancelledLabel, description = Config.Language.Notifications.CancelledName, type = 'error', duration = Config.CoreSettings.Notify.Length.Error})
                    end
                end)
                else
                    ClearPedTasks(PlayerPedId())
                    if Config.CoreSettings.Notify.Type == 'qb' then
                        QBCore.Functions.Notify(Config.Language.Notifications.MissingItemsName, "error", Config.CoreSettings.Notify.Length.Error)
                    elseif Config.CoreSettings.Notify.Type == 'okok' then
                        exports['okokNotify']:Alert(Config.Language.Notifications.MissingItemsLabel,Config.Language.Notifications.MissingItemsName, Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound) 
                    elseif Config.CoreSettings.Notify.Type == 'mythic' then
                        exports['mythic_notify']:DoHudText('error', Config.Language.Notifications.MissingItemsName)
                    elseif Config.CoreSettings.Notify.Type == 'boii' then
                        exports['boii_ui']:notify(Config.Language.Notifications.MissingItemsLabel, Config.Language.Notifications.MissingItemsName, 'error', Config.CoreSettings.Notify.Length.Error)
                    elseif Config.CoreSettings.Notify.Type == 'ox' then
                        lib.notify({ title = Config.Language.Notifications.MissingItemsLabel, description = Config.Language.Notifications.MissingItemsName, type = 'error', duration = Config.CoreSettings.Notify.Length.Error})
                    end
                end
            end)
    else 
        if Config.CoreSettings.Notify.Type == 'qb' then
            QBCore.Functions.Notify(Config.Language.Notifications.DutyName, "error", Config.CoreSettings.Notify.Length.Error)
        elseif Config.CoreSettings.Notify.Type == 'okok' then
            exports['okokNotify']:Alert(Config.Language.Notifications.DutyLabel,Config.Language.Notifications.DutyName, Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound) 
        elseif Config.CoreSettings.Notify.Type == 'mythic' then
            exports['mythic_notify']:DoHudText('error', Config.Language.Notifications.DutyName)
        elseif Config.CoreSettings.Notify.Type == 'boii' then
            exports['boii_ui']:notify(Config.Language.Notifications.DutyLabel, Config.Language.Notifications.DutyName, 'error', Config.CoreSettings.Notify.Length.Error)
        elseif Config.CoreSettings.Notify.Type == 'ox' then
            lib.notify({ title = Config.Language.Notifications.DutyLabel, description = Config.Language.Notifications.DutyName, type = 'error', duration = Config.CoreSettings.Notify.Length.Error})
        end
    end
end)


--Prepare SaltedCaramel IceCream
RegisterNetEvent("lusty94_icecream:client:PrepareSaltedCaramelIceCream", function()
    if onDuty then
        QBCore.Functions.TriggerCallback('lusty94_icecream:get:SaltedCaramelIceCream', function(HasItems)  
            if HasItems then
                if Config.CoreSettings.Sound.UseInteractSound then
                    TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 10, Config.CoreSettings.Sound.ServeIceCream, 0.5)
                end
                QBCore.Functions.Progressbar("prepare_SaltedCaramelIceCream", Config.Language.SaltedCaramelIceCream.ProgressBarName, Config.CoreSettings.ProgressBar.Times.PrepareIceCream, false, false, {
                    disableMovement = true,
                    disableCarMovement = true,
                    disableMouse = false,
                    disableCombat = true,
                }, {
                    animDict = "amb@prop_human_parking_meter@female@base",
                    anim = "base_female",
                    flags = 41,
                }, {}, {}, function()
                    ClearPedTasks(PlayerPedId())
                    TriggerServerEvent('lusty94_icecream:server:CreateSaltedCaramelIceCream')
                        if Config.CoreSettings.Notify.Type == 'qb' then
                            QBCore.Functions.Notify(Config.Language.SaltedCaramelIceCream.NotifyName, "success", Config.CoreSettings.Notify.Length.Success)
                        elseif Config.CoreSettings.Notify.Type == 'okok' then
                            exports['okokNotify']:Alert(Config.Language.SaltedCaramelIceCream.NotifyLabel, Config.Language.SaltedCaramelIceCream.NotifyName, Config.CoreSettings.Notify.Length.Success, 'success', Config.CoreSettings.Notify.Sound)
                        elseif Config.CoreSettings.Notify.Type == 'mythic' then
                            exports['mythic_notify']:DoHudText('success', Config.Language.SaltedCaramelIceCream.NotifyName)
                        elseif Config.CoreSettings.Notify.Type == 'boii' then
                            exports['boii_ui']:notify(Config.Language.SaltedCaramelIceCream.NotifyLabel, Config.Language.SaltedCaramelIceCream.NotifyName, 'success', Config.CoreSettings.Notify.Length.Success)
                        elseif Config.CoreSettings.Notify.Type == 'ox' then
                            lib.notify({ title = Config.Language.SaltedCaramelIceCream.NotifyLabel, description = Config.Language.SaltedCaramelIceCream.NotifyName, type = 'success', duration = Config.CoreSettings.Notify.Length.Success})
                        end
                end, function()
                    ClearPedTasks(PlayerPedId())
                    if Config.CoreSettings.Notify.Type == 'qb' then
                        QBCore.Functions.Notify(Config.Language.Notifications.CancelledName, "error", Config.CoreSettings.Notify.Length.Error)
                    elseif Config.CoreSettings.Notify.Type == 'okok' then
                        exports['okokNotify']:Alert(Config.Language.Notifications.CancelledLabel,Config.Language.Notifications.CancelledName, Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound)
                    elseif Config.CoreSettings.Notify.Type == 'mythic' then
                        exports['mythic_notify']:DoHudText('error', Config.Language.Notifications.CancelledName) 
                    elseif Config.CoreSettings.Notify.Type == 'boii' then
                        exports['boii_ui']:notify(Config.Language.Notifications.CancelledLabel, Config.Language.Notifications.CancelledName, 'error', Config.CoreSettings.Notify.Length.Error)
                    elseif Config.CoreSettings.Notify.Type == 'ox' then
                        lib.notify({ title = Config.Language.Notifications.CancelledLabel, description = Config.Language.Notifications.CancelledName, type = 'error', duration = Config.CoreSettings.Notify.Length.Error})
                    end
                end)
                else
                    ClearPedTasks(PlayerPedId())
                    if Config.CoreSettings.Notify.Type == 'qb' then
                        QBCore.Functions.Notify(Config.Language.Notifications.MissingItemsName, "error", Config.CoreSettings.Notify.Length.Error)
                    elseif Config.CoreSettings.Notify.Type == 'okok' then
                        exports['okokNotify']:Alert(Config.Language.Notifications.MissingItemsLabel,Config.Language.Notifications.MissingItemsName, Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound) 
                    elseif Config.CoreSettings.Notify.Type == 'mythic' then
                        exports['mythic_notify']:DoHudText('error', Config.Language.Notifications.MissingItemsName)
                    elseif Config.CoreSettings.Notify.Type == 'boii' then
                        exports['boii_ui']:notify(Config.Language.Notifications.MissingItemsLabel, Config.Language.Notifications.MissingItemsName, 'error', Config.CoreSettings.Notify.Length.Error)
                    elseif Config.CoreSettings.Notify.Type == 'ox' then
                        lib.notify({ title = Config.Language.Notifications.MissingItemsLabel, description = Config.Language.Notifications.MissingItemsName, type = 'error', duration = Config.CoreSettings.Notify.Length.Error})
                    end
                end
            end)
    else 
        if Config.CoreSettings.Notify.Type == 'qb' then
            QBCore.Functions.Notify(Config.Language.Notifications.DutyName, "error", Config.CoreSettings.Notify.Length.Error)
        elseif Config.CoreSettings.Notify.Type == 'okok' then
            exports['okokNotify']:Alert(Config.Language.Notifications.DutyLabel,Config.Language.Notifications.DutyName, Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound) 
        elseif Config.CoreSettings.Notify.Type == 'mythic' then
            exports['mythic_notify']:DoHudText('error', Config.Language.Notifications.DutyName)
        elseif Config.CoreSettings.Notify.Type == 'boii' then
            exports['boii_ui']:notify(Config.Language.Notifications.DutyLabel, Config.Language.Notifications.DutyName, 'error', Config.CoreSettings.Notify.Length.Error)
        elseif Config.CoreSettings.Notify.Type == 'ox' then
            lib.notify({ title = Config.Language.Notifications.DutyLabel, description = Config.Language.Notifications.DutyName, type = 'error', duration = Config.CoreSettings.Notify.Length.Error})
        end
    end
end)

--Prepare Bubblegum IceCream
RegisterNetEvent("lusty94_icecream:client:PrepareBubblegumIceCream", function()
    if onDuty then
        QBCore.Functions.TriggerCallback('lusty94_icecream:get:BubblegumIceCream', function(HasItems)  
            if HasItems then
                if Config.CoreSettings.Sound.UseInteractSound then
                    TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 10, Config.CoreSettings.Sound.ServeIceCream, 0.5)
                end
                QBCore.Functions.Progressbar("prepare_BubblegumIceCream", Config.Language.BubblegumIceCream.ProgressBarName, Config.CoreSettings.ProgressBar.Times.PrepareIceCream, false, false, {
                    disableMovement = true,
                    disableCarMovement = true,
                    disableMouse = false,
                    disableCombat = true,
                }, {
                    animDict = "amb@prop_human_parking_meter@female@base",
                    anim = "base_female",
                    flags = 41,
                }, {}, {}, function()
                    ClearPedTasks(PlayerPedId())
                    TriggerServerEvent('lusty94_icecream:server:CreateBubblegumIceCream')
                        if Config.CoreSettings.Notify.Type == 'qb' then
                            QBCore.Functions.Notify(Config.Language.BubblegumIceCream.NotifyName, "success", Config.CoreSettings.Notify.Length.Success)
                        elseif Config.CoreSettings.Notify.Type == 'okok' then
                            exports['okokNotify']:Alert(Config.Language.BubblegumIceCream.NotifyLabel, Config.Language.BubblegumIceCream.NotifyName, Config.CoreSettings.Notify.Length.Success, 'success', Config.CoreSettings.Notify.Sound)
                        elseif Config.CoreSettings.Notify.Type == 'mythic' then
                            exports['mythic_notify']:DoHudText('success', Config.Language.BubblegumIceCream.NotifyName)
                        elseif Config.CoreSettings.Notify.Type == 'boii' then
                            exports['boii_ui']:notify(Config.Language.BubblegumIceCream.NotifyLabel, Config.Language.BubblegumIceCream.NotifyName, 'success', Config.CoreSettings.Notify.Length.Success)
                        elseif Config.CoreSettings.Notify.Type == 'ox' then
                            lib.notify({ title = Config.Language.BubblegumIceCream.NotifyLabel, description = Config.Language.BubblegumIceCream.NotifyName, type = 'success', duration = Config.CoreSettings.Notify.Length.Success})
                        end
                end, function()
                    ClearPedTasks(PlayerPedId())
                    if Config.CoreSettings.Notify.Type == 'qb' then
                        QBCore.Functions.Notify(Config.Language.Notifications.CancelledName, "error", Config.CoreSettings.Notify.Length.Error)
                    elseif Config.CoreSettings.Notify.Type == 'okok' then
                        exports['okokNotify']:Alert(Config.Language.Notifications.CancelledLabel,Config.Language.Notifications.CancelledName, Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound)
                    elseif Config.CoreSettings.Notify.Type == 'mythic' then
                        exports['mythic_notify']:DoHudText('error', Config.Language.Notifications.CancelledName) 
                    elseif Config.CoreSettings.Notify.Type == 'boii' then
                        exports['boii_ui']:notify(Config.Language.Notifications.CancelledLabel, Config.Language.Notifications.CancelledName, 'error', Config.CoreSettings.Notify.Length.Error)
                    elseif Config.CoreSettings.Notify.Type == 'ox' then
                        lib.notify({ title = Config.Language.Notifications.CancelledLabel, description = Config.Language.Notifications.CancelledName, type = 'error', duration = Config.CoreSettings.Notify.Length.Error})
                    end
                end)
                else
                    ClearPedTasks(PlayerPedId())
                    if Config.CoreSettings.Notify.Type == 'qb' then
                        QBCore.Functions.Notify(Config.Language.Notifications.MissingItemsName, "error", Config.CoreSettings.Notify.Length.Error)
                    elseif Config.CoreSettings.Notify.Type == 'okok' then
                        exports['okokNotify']:Alert(Config.Language.Notifications.MissingItemsLabel,Config.Language.Notifications.MissingItemsName, Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound) 
                    elseif Config.CoreSettings.Notify.Type == 'mythic' then
                        exports['mythic_notify']:DoHudText('error', Config.Language.Notifications.MissingItemsName)
                    elseif Config.CoreSettings.Notify.Type == 'boii' then
                        exports['boii_ui']:notify(Config.Language.Notifications.MissingItemsLabel, Config.Language.Notifications.MissingItemsName, 'error', Config.CoreSettings.Notify.Length.Error)
                    elseif Config.CoreSettings.Notify.Type == 'ox' then
                        lib.notify({ title = Config.Language.Notifications.MissingItemsLabel, description = Config.Language.Notifications.MissingItemsName, type = 'error', duration = Config.CoreSettings.Notify.Length.Error})
                    end
                end
            end)
    else 
        if Config.CoreSettings.Notify.Type == 'qb' then
            QBCore.Functions.Notify(Config.Language.Notifications.DutyName, "error", Config.CoreSettings.Notify.Length.Error)
        elseif Config.CoreSettings.Notify.Type == 'okok' then
            exports['okokNotify']:Alert(Config.Language.Notifications.DutyLabel,Config.Language.Notifications.DutyName, Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound) 
        elseif Config.CoreSettings.Notify.Type == 'mythic' then
            exports['mythic_notify']:DoHudText('error', Config.Language.Notifications.DutyName)
        elseif Config.CoreSettings.Notify.Type == 'boii' then
            exports['boii_ui']:notify(Config.Language.Notifications.DutyLabel, Config.Language.Notifications.DutyName, 'error', Config.CoreSettings.Notify.Length.Error)
        elseif Config.CoreSettings.Notify.Type == 'ox' then
            lib.notify({ title = Config.Language.Notifications.DutyLabel, description = Config.Language.Notifications.DutyName, type = 'error', duration = Config.CoreSettings.Notify.Length.Error})
        end
    end
end)

--Prepare Toffee IceCream
RegisterNetEvent("lusty94_icecream:client:PrepareToffeeIceCream", function()
    if onDuty then
        QBCore.Functions.TriggerCallback('lusty94_icecream:get:ToffeeIceCream', function(HasItems)  
            if HasItems then
                if Config.CoreSettings.Sound.UseInteractSound then
                    TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 10, Config.CoreSettings.Sound.ServeIceCream, 0.5)
                end
                QBCore.Functions.Progressbar("prepare_ToffeeIceCream", Config.Language.ToffeeIceCream.ProgressBarName, Config.CoreSettings.ProgressBar.Times.PrepareIceCream, false, false, {
                    disableMovement = true,
                    disableCarMovement = true,
                    disableMouse = false,
                    disableCombat = true,
                }, {
                    animDict = "amb@prop_human_parking_meter@female@base",
                    anim = "base_female",
                    flags = 41,
                }, {}, {}, function()
                    ClearPedTasks(PlayerPedId())
                    TriggerServerEvent('lusty94_icecream:server:CreateToffeeIceCream')
                        if Config.CoreSettings.Notify.Type == 'qb' then
                            QBCore.Functions.Notify(Config.Language.ToffeeIceCream.NotifyName, "success", Config.CoreSettings.Notify.Length.Success)
                        elseif Config.CoreSettings.Notify.Type == 'okok' then
                            exports['okokNotify']:Alert(Config.Language.ToffeeIceCream.NotifyLabel, Config.Language.ToffeeIceCream.NotifyName, Config.CoreSettings.Notify.Length.Success, 'success', Config.CoreSettings.Notify.Sound)
                        elseif Config.CoreSettings.Notify.Type == 'mythic' then
                            exports['mythic_notify']:DoHudText('success', Config.Language.ToffeeIceCream.NotifyName)
                        elseif Config.CoreSettings.Notify.Type == 'boii' then
                            exports['boii_ui']:notify(Config.Language.ToffeeIceCream.NotifyLabel, Config.Language.ToffeeIceCream.NotifyName, 'success', Config.CoreSettings.Notify.Length.Success)
                        elseif Config.CoreSettings.Notify.Type == 'ox' then
                            lib.notify({ title = Config.Language.ToffeeIceCream.NotifyLabel, description = Config.Language.ToffeeIceCream.NotifyName, type = 'success', duration = Config.CoreSettings.Notify.Length.Success})
                        end
                end, function()
                    ClearPedTasks(PlayerPedId())
                    if Config.CoreSettings.Notify.Type == 'qb' then
                        QBCore.Functions.Notify(Config.Language.Notifications.CancelledName, "error", Config.CoreSettings.Notify.Length.Error)
                    elseif Config.CoreSettings.Notify.Type == 'okok' then
                        exports['okokNotify']:Alert(Config.Language.Notifications.CancelledLabel,Config.Language.Notifications.CancelledName, Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound)
                    elseif Config.CoreSettings.Notify.Type == 'mythic' then
                        exports['mythic_notify']:DoHudText('error', Config.Language.Notifications.CancelledName) 
                    elseif Config.CoreSettings.Notify.Type == 'boii' then
                        exports['boii_ui']:notify(Config.Language.Notifications.CancelledLabel, Config.Language.Notifications.CancelledName, 'error', Config.CoreSettings.Notify.Length.Error)
                    elseif Config.CoreSettings.Notify.Type == 'ox' then
                        lib.notify({ title = Config.Language.Notifications.CancelledLabel, description = Config.Language.Notifications.CancelledName, type = 'error', duration = Config.CoreSettings.Notify.Length.Error})
                    end
                end)
                else
                    ClearPedTasks(PlayerPedId())
                    if Config.CoreSettings.Notify.Type == 'qb' then
                        QBCore.Functions.Notify(Config.Language.Notifications.MissingItemsName, "error", Config.CoreSettings.Notify.Length.Error)
                    elseif Config.CoreSettings.Notify.Type == 'okok' then
                        exports['okokNotify']:Alert(Config.Language.Notifications.MissingItemsLabel,Config.Language.Notifications.MissingItemsName, Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound) 
                    elseif Config.CoreSettings.Notify.Type == 'mythic' then
                        exports['mythic_notify']:DoHudText('error', Config.Language.Notifications.MissingItemsName)
                    elseif Config.CoreSettings.Notify.Type == 'boii' then
                        exports['boii_ui']:notify(Config.Language.Notifications.MissingItemsLabel, Config.Language.Notifications.MissingItemsName, 'error', Config.CoreSettings.Notify.Length.Error)
                    elseif Config.CoreSettings.Notify.Type == 'ox' then
                        lib.notify({ title = Config.Language.Notifications.MissingItemsLabel, description = Config.Language.Notifications.MissingItemsName, type = 'error', duration = Config.CoreSettings.Notify.Length.Error})
                    end
                end
            end)
    else 
        if Config.CoreSettings.Notify.Type == 'qb' then
            QBCore.Functions.Notify(Config.Language.Notifications.DutyName, "error", Config.CoreSettings.Notify.Length.Error)
        elseif Config.CoreSettings.Notify.Type == 'okok' then
            exports['okokNotify']:Alert(Config.Language.Notifications.DutyLabel,Config.Language.Notifications.DutyName, Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound) 
        elseif Config.CoreSettings.Notify.Type == 'mythic' then
            exports['mythic_notify']:DoHudText('error', Config.Language.Notifications.DutyName)
        elseif Config.CoreSettings.Notify.Type == 'boii' then
            exports['boii_ui']:notify(Config.Language.Notifications.DutyLabel, Config.Language.Notifications.DutyName, 'error', Config.CoreSettings.Notify.Length.Error)
        elseif Config.CoreSettings.Notify.Type == 'ox' then
            lib.notify({ title = Config.Language.Notifications.DutyLabel, description = Config.Language.Notifications.DutyName, type = 'error', duration = Config.CoreSettings.Notify.Length.Error})
        end
    end
end)

--Prepare CookieDough IceCream
RegisterNetEvent("lusty94_icecream:client:PrepareCookieDoughIceCream", function()
    if onDuty then
        QBCore.Functions.TriggerCallback('lusty94_icecream:get:CookieDoughIceCream', function(HasItems)  
            if HasItems then
                if Config.CoreSettings.Sound.UseInteractSound then
                    TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 10, Config.CoreSettings.Sound.ServeIceCream, 0.5)
                end
                QBCore.Functions.Progressbar("prepare_CookieDoughIceCream", Config.Language.CookieDoughIceCream.ProgressBarName, Config.CoreSettings.ProgressBar.Times.PrepareIceCream, false, false, {
                    disableMovement = true,
                    disableCarMovement = true,
                    disableMouse = false,
                    disableCombat = true,
                }, {
                    animDict = "amb@prop_human_parking_meter@female@base",
                    anim = "base_female",
                    flags = 41,
                }, {}, {}, function()
                    ClearPedTasks(PlayerPedId())
                    TriggerServerEvent('lusty94_icecream:server:CreateCookieDoughIceCream')
                        if Config.CoreSettings.Notify.Type == 'qb' then
                            QBCore.Functions.Notify(Config.Language.CookieDoughIceCream.NotifyName, "success", Config.CoreSettings.Notify.Length.Success)
                        elseif Config.CoreSettings.Notify.Type == 'okok' then
                            exports['okokNotify']:Alert(Config.Language.CookieDoughIceCream.NotifyLabel, Config.Language.CookieDoughIceCream.NotifyName, Config.CoreSettings.Notify.Length.Success, 'success', Config.CoreSettings.Notify.Sound)
                        elseif Config.CoreSettings.Notify.Type == 'mythic' then
                            exports['mythic_notify']:DoHudText('success', Config.Language.CookieDoughIceCream.NotifyName)
                        elseif Config.CoreSettings.Notify.Type == 'boii' then
                            exports['boii_ui']:notify(Config.Language.CookieDoughIceCream.NotifyLabel, Config.Language.CookieDoughIceCream.NotifyName, 'success', Config.CoreSettings.Notify.Length.Success)
                        elseif Config.CoreSettings.Notify.Type == 'ox' then
                            lib.notify({ title = Config.Language.CookieDoughIceCream.NotifyLabel, description = Config.Language.CookieDoughIceCream.NotifyName, type = 'success', duration = Config.CoreSettings.Notify.Length.Success})
                        end
                end, function()
                    ClearPedTasks(PlayerPedId())
                    if Config.CoreSettings.Notify.Type == 'qb' then
                        QBCore.Functions.Notify(Config.Language.Notifications.CancelledName, "error", Config.CoreSettings.Notify.Length.Error)
                    elseif Config.CoreSettings.Notify.Type == 'okok' then
                        exports['okokNotify']:Alert(Config.Language.Notifications.CancelledLabel,Config.Language.Notifications.CancelledName, Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound)
                    elseif Config.CoreSettings.Notify.Type == 'mythic' then
                        exports['mythic_notify']:DoHudText('error', Config.Language.Notifications.CancelledName) 
                    elseif Config.CoreSettings.Notify.Type == 'boii' then
                        exports['boii_ui']:notify(Config.Language.Notifications.CancelledLabel, Config.Language.Notifications.CancelledName, 'error', Config.CoreSettings.Notify.Length.Error)
                    elseif Config.CoreSettings.Notify.Type == 'ox' then
                        lib.notify({ title = Config.Language.Notifications.CancelledLabel, description = Config.Language.Notifications.CancelledName, type = 'error', duration = Config.CoreSettings.Notify.Length.Error})
                    end
                end)
                else
                    ClearPedTasks(PlayerPedId())
                    if Config.CoreSettings.Notify.Type == 'qb' then
                        QBCore.Functions.Notify(Config.Language.Notifications.MissingItemsName, "error", Config.CoreSettings.Notify.Length.Error)
                    elseif Config.CoreSettings.Notify.Type == 'okok' then
                        exports['okokNotify']:Alert(Config.Language.Notifications.MissingItemsLabel,Config.Language.Notifications.MissingItemsName, Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound) 
                    elseif Config.CoreSettings.Notify.Type == 'mythic' then
                        exports['mythic_notify']:DoHudText('error', Config.Language.Notifications.MissingItemsName)
                    elseif Config.CoreSettings.Notify.Type == 'boii' then
                        exports['boii_ui']:notify(Config.Language.Notifications.MissingItemsLabel, Config.Language.Notifications.MissingItemsName, 'error', Config.CoreSettings.Notify.Length.Error)
                    elseif Config.CoreSettings.Notify.Type == 'ox' then
                        lib.notify({ title = Config.Language.Notifications.MissingItemsLabel, description = Config.Language.Notifications.MissingItemsName, type = 'error', duration = Config.CoreSettings.Notify.Length.Error})
                    end
                end
            end)
    else 
        if Config.CoreSettings.Notify.Type == 'qb' then
            QBCore.Functions.Notify(Config.Language.Notifications.DutyName, "error", Config.CoreSettings.Notify.Length.Error)
        elseif Config.CoreSettings.Notify.Type == 'okok' then
            exports['okokNotify']:Alert(Config.Language.Notifications.DutyLabel,Config.Language.Notifications.DutyName, Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound) 
        elseif Config.CoreSettings.Notify.Type == 'mythic' then
            exports['mythic_notify']:DoHudText('error', Config.Language.Notifications.DutyName)
        elseif Config.CoreSettings.Notify.Type == 'boii' then
            exports['boii_ui']:notify(Config.Language.Notifications.DutyLabel, Config.Language.Notifications.DutyName, 'error', Config.CoreSettings.Notify.Length.Error)
        elseif Config.CoreSettings.Notify.Type == 'ox' then
            lib.notify({ title = Config.Language.Notifications.DutyLabel, description = Config.Language.Notifications.DutyName, type = 'error', duration = Config.CoreSettings.Notify.Length.Error})
        end
    end
end)

-------------------------------------------------< MAKE ICE CREAMS END >--------------------------------






-----------------------------------------------------< BILLING SECTION START >---------------------------------------------------
RegisterNetEvent("lusty94_icecream:client:bill")
AddEventHandler("lusty94_icecream:bill", function()
        if onDuty then
            local bill = exports['qb-input']:ShowInput({
                header = "Create Invoice",
                submitText = "Send Invoice",
                inputs = {
                    {
                        text = "Server ID(#)",
                        name = "citizenid", -- name of the input should be unique otherwise it might override
                        type = "text", -- type of the input
                        isRequired = true -- Optional [accepted values: true | false] but will submit the form if no value is inputted
                    },
                    {
                        text = "Total Bill Price: "..Config.InteractionLocations.Payment.CashSymbol, -- text you want to be displayed as a place holder
                        name = "billprice", -- name of the input should be unique otherwise it might override
                        type = "number", -- type of the input - number will not allow non-number characters in the field so only accepts 0-9
                        isRequired = true -- Optional [accepted values: true | false] but will submit the form if no value is inputted
                    }
                    
                }
            })
            if bill ~= nil then
                if bill.citizenid == nil or bill.billprice == nil then 
                    return 
                end
                TriggerServerEvent("lusty94_icecream:server:bill:player", bill.citizenid, bill.billprice)
            end
        else
            if Config.CoreSettings.Notify.Type == 'qb' then
                QBCore.Functions.Notify(Config.Language.Notifications.DutyName, "error", Config.CoreSettings.Notify.Length.Error)
            elseif Config.CoreSettings.Notify.Type == 'okok' then
                exports['okokNotify']:Alert(Config.Language.Notifications.DutyLabel,Config.Language.Notifications.DutyName, Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound) 
            elseif Config.CoreSettings.Notify.Type == 'mythic' then
                exports['mythic_notify']:DoHudText('error', Config.Language.Notifications.DutyName)
            elseif Config.CoreSettings.Notify.Type == 'boii' then
                exports['boii_ui']:notify(Config.Language.Notifications.DutyLabel, Config.Language.Notifications.DutyName, 'error', Config.CoreSettings.Notify.Length.Error)
            elseif Config.CoreSettings.Notify.Type == 'ox' then
                lib.notify({ title = Config.Language.Notifications.DutyLabel, description = Config.Language.Notifications.DutyName, type = 'error', duration = Config.CoreSettings.Notify.Length.Error})
            end
        end
end)
-----------------------------------------------------< BILLING SECTION END >---------------------------------------------------







AddEventHandler('onResourceStop', function(resourceName) if resourceName ~= GetCurrentResourceName() then return end
if (GetCurrentResourceName() ~= resourceName) then
end
    print('^5--<^3!^5>-- ^7Lusty94 ^5| ^5--<^3!^5>-- ^7Ice Cream V1.1.0 Stopped Successfully ^5--<^3!^5>--^7')
    SetModelAsNoLongerNeeded(Computer)
    SetModelAsNoLongerNeeded(Fridge)
    DeleteObject(Fridge)
    DeleteObject(Computer)
    if TargetType == 'qb' then
        exports['qb-target']:RemoveZone("Duty")
        exports['qb-target']:RemoveZone("BossMenu")
        exports['qb-target']:RemoveZone("ClothingLocker")
        exports['qb-target']:RemoveZone("ProductsMenu")
        exports['qb-target']:RemoveZone("Payment")
        exports['qb-target']:RemoveZone("CollectionTray")
        exports['qb-target']:RemoveZone("IceCream")
        exports['qb-target']:RemoveZone("SmoothieMachine")
        exports['qb-target']:RemoveZone("SoftDrinks")
        exports['qb-target']:RemoveZone("HotDrinks")
        exports['qb-target']:RemoveZone("Fridge")
        exports['qb-target']:RemoveZone("Ingredients")
        exports['qb-target']:RemoveZone("Snacks")
    elseif TargetType == 'ox' then
        exports.ox_target:removeZone(1)
        exports.ox_target:removeZone(2)
        exports.ox_target:removeZone(3)
        exports.ox_target:removeZone(4)
        exports.ox_target:removeZone(5)
        exports.ox_target:removeZone(6)
        exports.ox_target:removeZone(7)
        exports.ox_target:removeZone(8)
        exports.ox_target:removeZone(9)
        exports.ox_target:removeZone(10)
        exports.ox_target:removeZone(11)
        exports.ox_target:removeZone(12)
        exports.ox_target:removeZone(13)
    end
    
end)