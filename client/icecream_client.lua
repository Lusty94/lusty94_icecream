local QBCore = exports['qb-core']:GetCoreObject()
local ShopType = Config.CoreSettings.Shop.Type
local InvType = Config.CoreSettings.Inventory.Type
local TargetType = Config.CoreSettings.Target.Type
local NotifyType = Config.CoreSettings.Notify.Type
local ClothingType = Config.CoreSettings.Clothing.Type
local busy, onDuty = false, false
PlayerJob = {}
local spawnedProps = {}

if Config.DevMode then
    onDuty = true
end
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
        local IceCreamIngredients = {
            label = "Ingredients Fridge", 
            slots = 12,
            items = {
                [1] = {name = "softscoopmix",   price = 0, amount = 100000, info = {}, type = "item", slot = 1,},
                [2] = {name = "smoothiemix",    price = 0, amount = 100000, info = {}, type = "item", slot = 2,},
                [3] = {name = "vanilla",        price = 0, amount = 100000, info = {}, type = "item", slot = 3,},
                [4] = {name = "chocolate",      price = 0, amount = 100000, info = {}, type = "item", slot = 4,},
                [5] = {name = "strawberry",     price = 0, amount = 100000, info = {}, type = "item", slot = 5,},
                [6] = {name = "mint",           price = 0, amount = 100000, info = {}, type = "item", slot = 6,},
                [7] = {name = "pistachio",      price = 0, amount = 100000, info = {}, type = "item", slot = 7,},
                [8] = {name = "butterscotch",   price = 0, amount = 100000, info = {}, type = "item", slot = 8,},
                [9] = {name = "saltedcaramel",  price = 0, amount = 100000, info = {}, type = "item", slot = 9,},
                [10] = {name = "bubblegum",      price = 0, amount = 100000, info = {}, type = "item", slot = 10,},
                [11] = {name = "toffee",        price = 0, amount = 100000, info = {}, type = "item", slot = 11,},
                [12] = {name = "cookiedough",   price = 0, amount = 100000, info = {}, type = "item", slot = 12,},
            },
        }
        if ShopType == 'qb' then
            TriggerServerEvent("inventory:server:OpenInventory", "shop", "Ingredients", IceCreamIngredients)
        elseif ShopType == 'jim' then
            TriggerServerEvent("jim-shops:ShopOpen", "shop", "Ingredients", IceCreamIngredients)
        elseif ShopType == 'ox' then
            exports.ox_inventory:openInventory('shop', { type = 'IceCreamIngredients' })
        end
    else
        SendNotify("You must be on duty to proceed.", 'error', 2000)
    end
end)

--storage fridge
RegisterNetEvent("lusty94_icecream:client:StorageFridge", function()
    if onDuty then
        if InvType == 'qb' then
            local StashInfo = { maxweight = 10000000, slots = 64, }
            TriggerEvent("inventory:client:SetCurrentStash", "IceCreamStorageFridge")
            TriggerServerEvent("inventory:server:OpenInventory", "stash", "IceCreamStorageFridge", {maxweight = StashInfo.maxweight, slots = StashInfo.slots, })
        elseif InvType == 'ox' then
            exports.ox_inventory:openInventory('stash', 'IceCreamStorageFridge')
        end
    else
        SendNotify("You must be on duty to proceed.", 'error', 2000)
    end
end)

--snack shelf
AddEventHandler("lusty94_icecream:client:SnackShelf", function()
    local IceCreamSnacks = {
        label = "Snack Shelf", 
        slots = 7,
        items = {
            [1] = {name = "vanillacupcake",     price = 10, amount = 100000, info = {}, type = "item", slot = 1,},
            [2] = {name = "chocolatecupcake",   price = 10, amount = 100000, info = {}, type = "item", slot = 2,},
            [3] = {name = "chocolatebar",       price = 10, amount = 100000, info = {}, type = "item", slot = 3,},
            [4] = {name = "jamdoughnut",        price = 10, amount = 100000, info = {}, type = "item", slot = 4,},
            [5] = {name = "sugardoughnut",      price = 10, amount = 100000, info = {}, type = "item", slot = 5,},
            [6] = {name = "custarddoughnut",    price = 10, amount = 100000, info = {}, type = "item", slot = 6,},
            [7] = {name = "chocolatedoughnut",  price = 10, amount = 100000, info = {}, type = "item", slot = 7,},
        }
    }
    if ShopType == 'qb' then
        TriggerServerEvent("inventory:server:OpenInventory", "shop", "SnackShelf", IceCreamSnacks)
    elseif ShopType == 'jim' then
        TriggerServerEvent("jim-shops:ShopOpen", "shop", "SnackShelf", IceCreamSnacks)
    elseif ShopType == 'ox' then
        exports.ox_inventory:openInventory('shop', { type = 'IceCreamSnacks' })
    end
end)

--collection tray
RegisterNetEvent("lusty94_icecream:client:OpenCollectionTray", function()
    if InvType == 'qb' then
        local StashInfo = { maxweight = 1000000, slots = 6, }
        TriggerEvent("inventory:client:SetCurrentStash", "IceCreamCollectionTray")
        TriggerServerEvent("inventory:server:OpenInventory", "stash", "IceCreamCollectionTray", { maxweight = StashInfo.maxweight, slots = StashInfo.slots, })
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
        RequestModel(v.Model)
        while not HasModelLoaded(v.Model) do 
            Wait(1000)
        end
        props = CreateObject(v.Model, v.Coords, true, false, false)
        spawnedProps[#spawnedProps+1] = props
        SetEntityHeading(props, v.Heading)
        FreezeEntityPosition(props, true)
        if TargetType == 'qb' then
            exports['qb-target']:AddTargetEntity(props, { options = { { type = "client", event = v.Event, icon = v.Icon, label = v.Label, job = v.Job, }, }, distance = v.Distance })
        elseif TargetType == 'ox' then
            exports.ox_target:addLocalEntity(props, { { name = 'props', icon = v.Icon, label = v.Label, event = v.Event, groups = v.Job, distance = v.Distance} })
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
                    SendNotify("You are already doing something.", 'error', 2000)
                else
                    local success = lib.skillCheck({'easy', 'easy', 'easy', 'easy', 'easy'}, {'e'})
                    if success then
                        busy = true
                        LockInventory(true)
                        FreezeEntityPosition(PlayerPedId(), true)
                        if Config.CoreSettings.Sound.UseInteractSound then
                            TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 10, Config.CoreSettings.Sound.PourSmoothies, 0.5)
                        end 
                        if lib.progressCircle({ duration = Config.CoreSettings.Timers.PrepareSmoothies, label = 'Preparing smoothie...', position = 'bottom', useWhileDead = false, canCancel = true, disable = { car = true, }, anim = { dict = Config.Animations.PrepareSmoothies.dict, clip = Config.Animations.PrepareSmoothies.anim, flag = Config.Animations.PrepareSmoothies.flag,},}) then
                            busy = false
                            LockInventory(false)
                            ClearPedTasks(PlayerPedId())
                            TriggerServerEvent('lusty94_icecream:server:CreateVanillaSmoothie')
                            SendNotify("Smoothie prepared!", 'success', 2000)
                            FreezeEntityPosition(PlayerPedId(), false)
                        else 
                            busy = false
                            LockInventory(false)
                            ClearPedTasks(PlayerPedId())
                            SendNotify('Action cancelled.', 'error', 2000)
                            FreezeEntityPosition(PlayerPedId(), false)
                        end
                    else
                        SendNotify("Action failed.", 'error', 2000)
                    end
                end
            else
                ClearPedTasks(PlayerPedId())
                SendNotify("You are missing items.", 'error', 2000)
            end
        end)
    else 
        SendNotify("You must be on duty to proceed.", 'error', 2000)
    end
end)


--Prepare Chocolate Smoothie
RegisterNetEvent("lusty94_icecream:client:PrepareChocolateSmoothie", function()
    if onDuty then
        QBCore.Functions.TriggerCallback('lusty94_icecream:get:ChocolateSmoothie', function(HasItems)  
            if HasItems then                
                if busy then
                    SendNotify("You are already doing something.", 'error', 2000)
                else
                    local success = lib.skillCheck({'easy', 'easy', 'easy', 'easy', 'easy'}, {'e'})
                    if success then
                        busy = true
                        LockInventory(true)
                        FreezeEntityPosition(PlayerPedId(), true)
                        if Config.CoreSettings.Sound.UseInteractSound then
                            TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 10, Config.CoreSettings.Sound.PourSmoothies, 0.5)
                        end 
                        if lib.progressCircle({ duration = Config.CoreSettings.Timers.PrepareSmoothies, label = 'Preparing smoothie...', position = 'bottom', useWhileDead = false, canCancel = true, disable = { car = true, }, anim = { dict = Config.Animations.PrepareSmoothies.dict, clip = Config.Animations.PrepareSmoothies.anim, flag = Config.Animations.PrepareSmoothies.flag,},}) then
                            busy = false
                            LockInventory(false)
                            ClearPedTasks(PlayerPedId())
                            TriggerServerEvent('lusty94_icecream:server:CreateChocolateSmoothie')
                            SendNotify("Smoothie prepared!", 'success', 2000)
                            FreezeEntityPosition(PlayerPedId(), false)
                        else 
                            busy = false
                            LockInventory(false)
                            ClearPedTasks(PlayerPedId())
                            SendNotify('Action cancelled.', 'error', 2000)
                            FreezeEntityPosition(PlayerPedId(), false)
                        end
                    else
                        SendNotify("Action failed.", 'error', 2000)
                    end
                end
            else
                ClearPedTasks(PlayerPedId())
                SendNotify("You are missing items.", 'error', 2000)
            end
        end)
    else 
        SendNotify("You must be on duty to proceed.", 'error', 2000)
    end
end)


--Prepare Strawberry Smoothie
RegisterNetEvent("lusty94_icecream:client:PrepareStrawberrySmoothie", function()
    if onDuty then
        QBCore.Functions.TriggerCallback('lusty94_icecream:get:StrawberrySmoothie', function(HasItems)  
            if HasItems then                
                if busy then
                    SendNotify("You are already doing something.", 'error', 2000)
                else
                    local success = lib.skillCheck({'easy', 'easy', 'easy', 'easy', 'easy'}, {'e'})
                    if success then
                        busy = true
                        LockInventory(true)
                        FreezeEntityPosition(PlayerPedId(), true)
                        if Config.CoreSettings.Sound.UseInteractSound then
                            TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 10, Config.CoreSettings.Sound.PourSmoothies, 0.5)
                        end 
                        if lib.progressCircle({ duration = Config.CoreSettings.Timers.PrepareSmoothies, label = 'Preparing smoothie...', position = 'bottom', useWhileDead = false, canCancel = true, disable = { car = true, }, anim = { dict = Config.Animations.PrepareSmoothies.dict, clip = Config.Animations.PrepareSmoothies.anim, flag = Config.Animations.PrepareSmoothies.flag,},}) then
                            busy = false
                            LockInventory(false)
                            ClearPedTasks(PlayerPedId())
                            TriggerServerEvent('lusty94_icecream:server:CreateStrawberrySmoothie')
                            SendNotify("Smoothie prepared!", 'success', 2000)
                            FreezeEntityPosition(PlayerPedId(), false)
                        else 
                            busy = false
                            LockInventory(false)
                            ClearPedTasks(PlayerPedId())
                            SendNotify('Action cancelled.', 'error', 2000)
                            FreezeEntityPosition(PlayerPedId(), false)
                        end
                    else
                        SendNotify("Action failed.", 'error', 2000)
                    end
                end
            else
                ClearPedTasks(PlayerPedId())
                SendNotify("You are missing items.", 'error', 2000)
            end
        end)
    else 
        SendNotify("You must be on duty to proceed.", 'error', 2000)
    end
end)


--Prepare Mint Smoothie
RegisterNetEvent("lusty94_icecream:client:PrepareMintSmoothie", function()
    if onDuty then
        QBCore.Functions.TriggerCallback('lusty94_icecream:get:MintSmoothie', function(HasItems)  
            if HasItems then                
                if busy then
                    SendNotify("You are already doing something.", 'error', 2000)
                else
                    local success = lib.skillCheck({'easy', 'easy', 'easy', 'easy', 'easy'}, {'e'})
                    if success then
                        busy = true
                        LockInventory(true)
                        FreezeEntityPosition(PlayerPedId(), true)
                        if Config.CoreSettings.Sound.UseInteractSound then
                            TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 10, Config.CoreSettings.Sound.PourSmoothies, 0.5)
                        end 
                        if lib.progressCircle({ duration = Config.CoreSettings.Timers.PrepareSmoothies, label = 'Preparing smoothie...', position = 'bottom', useWhileDead = false, canCancel = true, disable = { car = true, }, anim = { dict = Config.Animations.PrepareSmoothies.dict, clip = Config.Animations.PrepareSmoothies.anim, flag = Config.Animations.PrepareSmoothies.flag,},}) then
                            busy = false
                            LockInventory(false)
                            ClearPedTasks(PlayerPedId())
                            TriggerServerEvent('lusty94_icecream:server:CreateMintSmoothie')
                            SendNotify("Smoothie prepared!", 'success', 2000)
                            FreezeEntityPosition(PlayerPedId(), false)
                        else 
                            busy = false
                            LockInventory(false)
                            ClearPedTasks(PlayerPedId())
                            SendNotify('Action cancelled.', 'error', 2000)
                            FreezeEntityPosition(PlayerPedId(), false)
                        end
                    else
                        SendNotify("Action failed.", 'error', 2000)
                    end
                end
            else
                ClearPedTasks(PlayerPedId())
                SendNotify("You are missing items.", 'error', 2000)
            end
        end)
    else 
        SendNotify("You must be on duty to proceed.", 'error', 2000)
    end
end)


--Prepare Pistachio Smoothie
RegisterNetEvent("lusty94_icecream:client:PreparePistachioSmoothie", function()
    if onDuty then
        QBCore.Functions.TriggerCallback('lusty94_icecream:get:PistachioSmoothie', function(HasItems)  
            if HasItems then                
                if busy then
                    SendNotify("You are already doing something.", 'error', 2000)
                else
                    local success = lib.skillCheck({'easy', 'easy', 'easy', 'easy', 'easy'}, {'e'})
                    if success then
                        busy = true
                        LockInventory(true)
                        FreezeEntityPosition(PlayerPedId(), true)
                        if Config.CoreSettings.Sound.UseInteractSound then
                            TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 10, Config.CoreSettings.Sound.PourSmoothies, 0.5)
                        end 
                        if lib.progressCircle({ duration = Config.CoreSettings.Timers.PrepareSmoothies, label = 'Preparing smoothie...', position = 'bottom', useWhileDead = false, canCancel = true, disable = { car = true, }, anim = { dict = Config.Animations.PrepareSmoothies.dict, clip = Config.Animations.PrepareSmoothies.anim, flag = Config.Animations.PrepareSmoothies.flag,},}) then
                            busy = false
                            LockInventory(false)
                            ClearPedTasks(PlayerPedId())
                            TriggerServerEvent('lusty94_icecream:server:CreatePistachioSmoothie')
                            SendNotify("Smoothie prepared!", 'success', 2000)
                            FreezeEntityPosition(PlayerPedId(), false)
                        else 
                            busy = false
                            LockInventory(false)
                            ClearPedTasks(PlayerPedId())
                            SendNotify('Action cancelled.', 'error', 2000)
                            FreezeEntityPosition(PlayerPedId(), false)
                        end
                    else
                        SendNotify("Action failed.", 'error', 2000)
                    end
                end
            else
                ClearPedTasks(PlayerPedId())
                SendNotify("You are missing items.", 'error', 2000)
            end
        end)
    else 
        SendNotify("You must be on duty to proceed.", 'error', 2000)
    end
end)


--Prepare Butter Scotch Smoothie
RegisterNetEvent("lusty94_icecream:client:PrepareButterScotchSmoothie", function()
    if onDuty then
        QBCore.Functions.TriggerCallback('lusty94_icecream:get:ButterScotchSmoothie', function(HasItems)  
            if HasItems then                
                if busy then
                    SendNotify("You are already doing something.", 'error', 2000)
                else
                    local success = lib.skillCheck({'easy', 'easy', 'easy', 'easy', 'easy'}, {'e'})
                    if success then
                        busy = true
                        LockInventory(true)
                        FreezeEntityPosition(PlayerPedId(), true)
                        if Config.CoreSettings.Sound.UseInteractSound then
                            TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 10, Config.CoreSettings.Sound.PourSmoothies, 0.5)
                        end 
                        if lib.progressCircle({ duration = Config.CoreSettings.Timers.PrepareSmoothies, label = 'Preparing smoothie...', position = 'bottom', useWhileDead = false, canCancel = true, disable = { car = true, }, anim = { dict = Config.Animations.PrepareSmoothies.dict, clip = Config.Animations.PrepareSmoothies.anim, flag = Config.Animations.PrepareSmoothies.flag,},}) then
                            busy = false
                            LockInventory(false)
                            ClearPedTasks(PlayerPedId())
                            TriggerServerEvent('lusty94_icecream:server:CreateButterScotchSmoothie')
                            SendNotify("Smoothie prepared!", 'success', 2000)
                            FreezeEntityPosition(PlayerPedId(), false)
                        else 
                            busy = false
                            LockInventory(false)
                            ClearPedTasks(PlayerPedId())
                            SendNotify('Action cancelled.', 'error', 2000)
                            FreezeEntityPosition(PlayerPedId(), false)
                        end
                    else
                        SendNotify("Action failed.", 'error', 2000)
                    end
                end
            else
                ClearPedTasks(PlayerPedId())
                SendNotify("You are missing items.", 'error', 2000)
            end
        end)
    else 
        SendNotify("You must be on duty to proceed.", 'error', 2000)
    end
end)


--Prepare Salted Caramel Smoothie
RegisterNetEvent("lusty94_icecream:client:PrepareSaltedCaramelSmoothie", function()
    if onDuty then
        QBCore.Functions.TriggerCallback('lusty94_icecream:get:SaltedCaramelSmoothie', function(HasItems)  
            if HasItems then                
                if busy then
                    SendNotify("You are already doing something.", 'error', 2000)
                else
                    local success = lib.skillCheck({'easy', 'easy', 'easy', 'easy', 'easy'}, {'e'})
                    if success then
                        busy = true
                        LockInventory(true)
                        FreezeEntityPosition(PlayerPedId(), true)
                        if Config.CoreSettings.Sound.UseInteractSound then
                            TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 10, Config.CoreSettings.Sound.PourSmoothies, 0.5)
                        end 
                        if lib.progressCircle({ duration = Config.CoreSettings.Timers.PrepareSmoothies, label = 'Preparing smoothie...', position = 'bottom', useWhileDead = false, canCancel = true, disable = { car = true, }, anim = { dict = Config.Animations.PrepareSmoothies.dict, clip = Config.Animations.PrepareSmoothies.anim, flag = Config.Animations.PrepareSmoothies.flag,},}) then
                            busy = false
                            LockInventory(false)
                            ClearPedTasks(PlayerPedId())
                            TriggerServerEvent('lusty94_icecream:server:CreateSaltedCaramelSmoothie')
                            SendNotify("Smoothie prepared!", 'success', 2000)
                            FreezeEntityPosition(PlayerPedId(), false)
                        else 
                            busy = false
                            LockInventory(false)
                            ClearPedTasks(PlayerPedId())
                            SendNotify('Action cancelled.', 'error', 2000)
                            FreezeEntityPosition(PlayerPedId(), false)
                        end
                    else
                        SendNotify("Action failed.", 'error', 2000)
                    end
                end
            else
                ClearPedTasks(PlayerPedId())
                SendNotify("You are missing items.", 'error', 2000)
            end
        end)
    else 
        SendNotify("You must be on duty to proceed.", 'error', 2000)
    end
end)


--Prepare Bubblegum Smoothie
RegisterNetEvent("lusty94_icecream:client:PrepareBubblegumSmoothie", function()
    if onDuty then
        QBCore.Functions.TriggerCallback('lusty94_icecream:get:BubblegumSmoothie', function(HasItems)  
            if HasItems then                
                if busy then
                    SendNotify("You are already doing something.", 'error', 2000)
                else
                    local success = lib.skillCheck({'easy', 'easy', 'easy', 'easy', 'easy'}, {'e'})
                    if success then
                        busy = true
                        LockInventory(true)
                        FreezeEntityPosition(PlayerPedId(), true)
                        if Config.CoreSettings.Sound.UseInteractSound then
                            TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 10, Config.CoreSettings.Sound.PourSmoothies, 0.5)
                        end 
                        if lib.progressCircle({ duration = Config.CoreSettings.Timers.PrepareSmoothies, label = 'Preparing smoothie...', position = 'bottom', useWhileDead = false, canCancel = true, disable = { car = true, }, anim = { dict = Config.Animations.PrepareSmoothies.dict, clip = Config.Animations.PrepareSmoothies.anim, flag = Config.Animations.PrepareSmoothies.flag,},}) then
                            busy = false
                            LockInventory(false)
                            ClearPedTasks(PlayerPedId())
                            TriggerServerEvent('lusty94_icecream:server:CreateBubblegumSmoothie')
                            SendNotify("Smoothie prepared!", 'success', 2000)
                            FreezeEntityPosition(PlayerPedId(), false)
                        else 
                            busy = false
                            LockInventory(false)
                            ClearPedTasks(PlayerPedId())
                            SendNotify('Action cancelled.', 'error', 2000)
                            FreezeEntityPosition(PlayerPedId(), false)
                        end
                    else
                        SendNotify("Action failed.", 'error', 2000)
                    end
                end
            else
                ClearPedTasks(PlayerPedId())
                SendNotify("You are missing items.", 'error', 2000)
            end
        end)
    else 
        SendNotify("You must be on duty to proceed.", 'error', 2000)
    end
end)


--Prepare Toffee Smoothie
RegisterNetEvent("lusty94_icecream:client:PrepareToffeeSmoothie", function()
    if onDuty then
        QBCore.Functions.TriggerCallback('lusty94_icecream:get:ToffeeSmoothie', function(HasItems)  
            if HasItems then                
                if busy then
                    SendNotify("You are already doing something.", 'error', 2000)
                else
                    local success = lib.skillCheck({'easy', 'easy', 'easy', 'easy', 'easy'}, {'e'})
                    if success then
                        busy = true
                        LockInventory(true)
                        FreezeEntityPosition(PlayerPedId(), true)
                        if Config.CoreSettings.Sound.UseInteractSound then
                            TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 10, Config.CoreSettings.Sound.PourSmoothies, 0.5)
                        end 
                        if lib.progressCircle({ duration = Config.CoreSettings.Timers.PrepareSmoothies, label = 'Preparing smoothie...', position = 'bottom', useWhileDead = false, canCancel = true, disable = { car = true, }, anim = { dict = Config.Animations.PrepareSmoothies.dict, clip = Config.Animations.PrepareSmoothies.anim, flag = Config.Animations.PrepareSmoothies.flag,},}) then
                            busy = false
                            LockInventory(false)
                            ClearPedTasks(PlayerPedId())
                            TriggerServerEvent('lusty94_icecream:server:CreateToffeeSmoothie')
                            SendNotify("Smoothie prepared!", 'success', 2000)
                            FreezeEntityPosition(PlayerPedId(), false)
                        else 
                            busy = false
                            LockInventory(false)
                            ClearPedTasks(PlayerPedId())
                            SendNotify('Action cancelled.', 'error', 2000)
                            FreezeEntityPosition(PlayerPedId(), false)
                        end
                    else
                        SendNotify("Action failed.", 'error', 2000)
                    end
                end
            else
                ClearPedTasks(PlayerPedId())
                SendNotify("You are missing items.", 'error', 2000)
            end
        end)
    else 
        SendNotify("You must be on duty to proceed.", 'error', 2000)
    end
end)


--Prepare CookieDough Smoothie
RegisterNetEvent("lusty94_icecream:client:PrepareCookieDoughSmoothie", function()
    if onDuty then
        QBCore.Functions.TriggerCallback('lusty94_icecream:get:CookieDoughSmoothie', function(HasItems)  
            if HasItems then                
                if busy then
                    SendNotify("You are already doing something.", 'error', 2000)
                else
                    local success = lib.skillCheck({'easy', 'easy', 'easy', 'easy', 'easy'}, {'e'})
                    if success then
                        busy = true
                        LockInventory(true)
                        FreezeEntityPosition(PlayerPedId(), true)
                        if Config.CoreSettings.Sound.UseInteractSound then
                            TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 10, Config.CoreSettings.Sound.PourSmoothies, 0.5)
                        end 
                        if lib.progressCircle({ duration = Config.CoreSettings.Timers.PrepareSmoothies, label = 'Preparing smoothie...', position = 'bottom', useWhileDead = false, canCancel = true, disable = { car = true, }, anim = { dict = Config.Animations.PrepareSmoothies.dict, clip = Config.Animations.PrepareSmoothies.anim, flag = Config.Animations.PrepareSmoothies.flag,},}) then
                            busy = false
                            LockInventory(false)
                            ClearPedTasks(PlayerPedId())
                            TriggerServerEvent('lusty94_icecream:server:CreateCookieDoughSmoothie')
                            SendNotify("Smoothie prepared!", 'success', 2000)
                            FreezeEntityPosition(PlayerPedId(), false)
                        else 
                            busy = false
                            LockInventory(false)
                            ClearPedTasks(PlayerPedId())
                            SendNotify('Action cancelled.', 'error', 2000)
                            FreezeEntityPosition(PlayerPedId(), false)
                        end
                    else
                        SendNotify("Action failed.", 'error', 2000)
                    end
                end
            else
                ClearPedTasks(PlayerPedId())
                SendNotify("You are missing items.", 'error', 2000)
            end
        end)
    else 
        SendNotify("You must be on duty to proceed.", 'error', 2000)
    end
end)


--Prepare Tea
RegisterNetEvent("lusty94_icecream:client:PrepareTea", function()
    if onDuty then
        QBCore.Functions.TriggerCallback('lusty94_icecream:get:Mug', function(HasItems)  
            if HasItems then                
                if busy then
                    SendNotify("You are already doing something.", 'error', 2000)
                else
                    local success = lib.skillCheck({'easy', 'easy', 'easy', 'easy', 'easy'}, {'e'})
                    if success then
                        busy = true
                        LockInventory(true)
                        FreezeEntityPosition(PlayerPedId(), true)
                        if Config.CoreSettings.Sound.UseInteractSound then
                            TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 10, Config.CoreSettings.Sound.PourHotDrinks, 0.5)
                        end 
                        if lib.progressCircle({ duration = Config.CoreSettings.Timers.PrepareHotDrinks, label = 'Preparing hot drink...', position = 'bottom', useWhileDead = false, canCancel = true, disable = { car = true, }, anim = { dict = Config.Animations.PrepareHotDrinks.dict, clip = Config.Animations.PrepareHotDrinks.anim, flag = Config.Animations.PrepareHotDrinks.flag,},}) then
                            busy = false
                            LockInventory(false)
                            ClearPedTasks(PlayerPedId())
                            TriggerServerEvent('lusty94_icecream:server:CreateTea')
                            SendNotify("Hot drink prepared!", 'success', 2000)
                            FreezeEntityPosition(PlayerPedId(), false)
                        else 
                            busy = false
                            LockInventory(false)
                            ClearPedTasks(PlayerPedId())
                            SendNotify('Action cancelled.', 'error', 2000)
                            FreezeEntityPosition(PlayerPedId(), false)
                        end
                    else
                        SendNotify("Action failed.", 'error', 2000)
                    end
                end
            else
                ClearPedTasks(PlayerPedId())
                SendNotify("You are missing items.", 'error', 2000)
            end
        end)
    else 
        SendNotify("You must be on duty to proceed.", 'error', 2000)
    end
end)

--Prepare Coffee
RegisterNetEvent("lusty94_icecream:client:PrepareCoffee", function()
    if onDuty then
        QBCore.Functions.TriggerCallback('lusty94_icecream:get:Mug', function(HasItems)  
            if HasItems then                
                if busy then
                    SendNotify("You are already doing something.", 'error', 2000)
                else
                    local success = lib.skillCheck({'easy', 'easy', 'easy', 'easy', 'easy'}, {'e'})
                    if success then
                        busy = true
                        LockInventory(true)
                        FreezeEntityPosition(PlayerPedId(), true)
                        if Config.CoreSettings.Sound.UseInteractSound then
                            TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 10, Config.CoreSettings.Sound.PourHotDrinks, 0.5)
                        end 
                        if lib.progressCircle({ duration = Config.CoreSettings.Timers.PrepareHotDrinks, label = 'Preparing hot drink...', position = 'bottom', useWhileDead = false, canCancel = true, disable = { car = true, }, anim = { dict = Config.Animations.PrepareHotDrinks.dict, clip = Config.Animations.PrepareHotDrinks.anim, flag = Config.Animations.PrepareHotDrinks.flag,},}) then
                            busy = false
                            LockInventory(false)
                            ClearPedTasks(PlayerPedId())
                            TriggerServerEvent('lusty94_icecream:server:CreateCoffee')
                            SendNotify("Hot drink prepared!", 'success', 2000)
                            FreezeEntityPosition(PlayerPedId(), false)
                        else 
                            busy = false
                            LockInventory(false)
                            ClearPedTasks(PlayerPedId())
                            SendNotify('Action cancelled.', 'error', 2000)
                            FreezeEntityPosition(PlayerPedId(), false)
                        end
                    else
                        SendNotify("Action failed.", 'error', 2000)
                    end
                end
            else
                ClearPedTasks(PlayerPedId())
                SendNotify("You are missing items.", 'error', 2000)
            end
        end)
    else 
        SendNotify("You must be on duty to proceed.", 'error', 2000)
    end
end)

--Prepare HotChocolate
RegisterNetEvent("lusty94_icecream:client:PrepareHotChocolate", function()
    if onDuty then
        QBCore.Functions.TriggerCallback('lusty94_icecream:get:Mug', function(HasItems)  
            if HasItems then                
                if busy then
                    SendNotify("You are already doing something.", 'error', 2000)
                else
                    local success = lib.skillCheck({'easy', 'easy', 'easy', 'easy', 'easy'}, {'e'})
                    if success then
                        busy = true
                        LockInventory(true)
                        FreezeEntityPosition(PlayerPedId(), true)
                        if Config.CoreSettings.Sound.UseInteractSound then
                            TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 10, Config.CoreSettings.Sound.PourHotDrinks, 0.5)
                        end 
                        if lib.progressCircle({ duration = Config.CoreSettings.Timers.PrepareHotDrinks, label = 'Preparing hot drink...', position = 'bottom', useWhileDead = false, canCancel = true, disable = { car = true, }, anim = { dict = Config.Animations.PrepareHotDrinks.dict, clip = Config.Animations.PrepareHotDrinks.anim, flag = Config.Animations.PrepareHotDrinks.flag,},}) then
                            busy = false
                            LockInventory(false)
                            ClearPedTasks(PlayerPedId())
                            TriggerServerEvent('lusty94_icecream:server:CreateHotChocolate')
                            SendNotify("Hot drink prepared!", 'success', 2000)
                            FreezeEntityPosition(PlayerPedId(), false)
                        else 
                            busy = false
                            LockInventory(false)
                            ClearPedTasks(PlayerPedId())
                            SendNotify('Action cancelled.', 'error', 2000)
                            FreezeEntityPosition(PlayerPedId(), false)
                        end
                    else
                        SendNotify("Action failed.", 'error', 2000)
                    end
                end
            else
                ClearPedTasks(PlayerPedId())
                SendNotify("You are missing items.", 'error', 2000)
            end
        end)
    else 
        SendNotify("You must be on duty to proceed.", 'error', 2000)
    end
end)


--Prepare Cola
RegisterNetEvent("lusty94_icecream:client:PrepareCola", function()
    if onDuty then
        QBCore.Functions.TriggerCallback('lusty94_icecream:get:SoftDrinksCup', function(HasItems)  
            if HasItems then                
                if busy then
                    SendNotify("You are already doing something.", 'error', 2000)
                else
                    local success = lib.skillCheck({'easy', 'easy', 'easy', 'easy', 'easy'}, {'e'})
                    if success then
                        busy = true
                        LockInventory(true)
                        FreezeEntityPosition(PlayerPedId(), true)
                        if Config.CoreSettings.Sound.UseInteractSound then
                            TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 10, Config.CoreSettings.Sound.PourSoftDrinks, 0.5)
                        end 
                        if lib.progressCircle({ duration = Config.CoreSettings.Timers.PrepareSoftDrinks, label = 'Preparing soft drink...', position = 'bottom', useWhileDead = false, canCancel = true, disable = { car = true, }, anim = { dict = Config.Animations.PrepareSoftDrinks.dict, clip = Config.Animations.PrepareSoftDrinks.anim, flag = Config.Animations.PrepareSoftDrinks.flag,},}) then
                            busy = false
                            LockInventory(false)
                            ClearPedTasks(PlayerPedId())
                            TriggerServerEvent('lusty94_icecream:server:CreateCola')
                            SendNotify("Soft drink prepared!", 'success', 2000)
                            FreezeEntityPosition(PlayerPedId(), false)
                        else 
                            busy = false
                            LockInventory(false)
                            ClearPedTasks(PlayerPedId())
                            SendNotify('Action cancelled.', 'error', 2000)
                            FreezeEntityPosition(PlayerPedId(), false)
                        end
                    else
                        SendNotify("Action failed.", 'error', 2000)
                    end
                end
            else
                ClearPedTasks(PlayerPedId())
                SendNotify("You are missing items.", 'error', 2000)
            end
        end)
    else 
        SendNotify("You must be on duty to proceed.", 'error', 2000)
    end
end)

--Prepare Lemonade
RegisterNetEvent("lusty94_icecream:client:PrepareLemonade", function()
    if onDuty then
        QBCore.Functions.TriggerCallback('lusty94_icecream:get:SoftDrinksCup', function(HasItems)  
            if HasItems then                
                if busy then
                    SendNotify("You are already doing something.", 'error', 2000)
                else
                    local success = lib.skillCheck({'easy', 'easy', 'easy', 'easy', 'easy'}, {'e'})
                    if success then
                        busy = true
                        LockInventory(true)
                        FreezeEntityPosition(PlayerPedId(), true)
                        if Config.CoreSettings.Sound.UseInteractSound then
                            TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 10, Config.CoreSettings.Sound.PourSoftDrinks, 0.5)
                        end 
                        if lib.progressCircle({ duration = Config.CoreSettings.Timers.PrepareSoftDrinks, label = 'Preparing soft drink...', position = 'bottom', useWhileDead = false, canCancel = true, disable = { car = true, }, anim = { dict = Config.Animations.PrepareSoftDrinks.dict, clip = Config.Animations.PrepareSoftDrinks.anim, flag = Config.Animations.PrepareSoftDrinks.flag,},}) then
                            busy = false
                            LockInventory(false)
                            ClearPedTasks(PlayerPedId())
                            TriggerServerEvent('lusty94_icecream:server:CreateLemonade')
                            SendNotify("Soft drink prepared!", 'success', 2000)
                            FreezeEntityPosition(PlayerPedId(), false)
                        else 
                            busy = false
                            LockInventory(false)
                            ClearPedTasks(PlayerPedId())
                            SendNotify('Action cancelled.', 'error', 2000)
                            FreezeEntityPosition(PlayerPedId(), false)
                        end
                    else
                        SendNotify("Action failed.", 'error', 2000)
                    end
                end
            else
                ClearPedTasks(PlayerPedId())
                SendNotify("You are missing items.", 'error', 2000)
            end
        end)
    else 
        SendNotify("You must be on duty to proceed.", 'error', 2000)
    end
end)

--Prepare Orange Soda
RegisterNetEvent("lusty94_icecream:client:PrepareOrangeSoda", function()
    if onDuty then
        QBCore.Functions.TriggerCallback('lusty94_icecream:get:SoftDrinksCup', function(HasItems)  
            if HasItems then                
                if busy then
                    SendNotify("You are already doing something.", 'error', 2000)
                else
                    local success = lib.skillCheck({'easy', 'easy', 'easy', 'easy', 'easy'}, {'e'})
                    if success then
                        busy = true
                        LockInventory(true)
                        FreezeEntityPosition(PlayerPedId(), true)
                        if Config.CoreSettings.Sound.UseInteractSound then
                            TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 10, Config.CoreSettings.Sound.PourSoftDrinks, 0.5)
                        end 
                        if lib.progressCircle({ duration = Config.CoreSettings.Timers.PrepareSoftDrinks, label = 'Preparing soft drink...', position = 'bottom', useWhileDead = false, canCancel = true, disable = { car = true, }, anim = { dict = Config.Animations.PrepareSoftDrinks.dict, clip = Config.Animations.PrepareSoftDrinks.anim, flag = Config.Animations.PrepareSoftDrinks.flag,},}) then
                            busy = false
                            LockInventory(false)
                            ClearPedTasks(PlayerPedId())
                            TriggerServerEvent('lusty94_icecream:server:CreateOrangeSoda')
                            SendNotify("Soft drink prepared!", 'success', 2000)
                            FreezeEntityPosition(PlayerPedId(), false)
                        else 
                            busy = false
                            LockInventory(false)
                            ClearPedTasks(PlayerPedId())
                            SendNotify('Action cancelled.', 'error', 2000)
                            FreezeEntityPosition(PlayerPedId(), false)
                        end
                    else
                        SendNotify("Action failed.", 'error', 2000)
                    end
                end
            else
                ClearPedTasks(PlayerPedId())
                SendNotify("You are missing items.", 'error', 2000)
            end
        end)
    else 
        SendNotify("You must be on duty to proceed.", 'error', 2000)
    end
end)


--Prepare Vanilla IceCream
RegisterNetEvent("lusty94_icecream:client:PrepareVanillaIceCream", function()
    if onDuty then
        QBCore.Functions.TriggerCallback('lusty94_icecream:get:VanillaIceCream', function(HasItems)  
            if HasItems then                
                if busy then
                    SendNotify("You are already doing something.", 'error', 2000)
                else
                    local success = lib.skillCheck({'easy', 'easy', 'easy', 'easy', 'easy'}, {'e'})
                    if success then
                        busy = true
                        LockInventory(true)
                        FreezeEntityPosition(PlayerPedId(), true)
                        if Config.CoreSettings.Sound.UseInteractSound then
                            TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 10, Config.CoreSettings.Sound.ServeIceCream, 0.5)
                        end 
                        if lib.progressCircle({ duration = Config.CoreSettings.Timers.PrepareIceCream, label = 'Preparing ice cream...', position = 'bottom', useWhileDead = false, canCancel = true, disable = { car = true, }, anim = { dict = Config.Animations.PrepareIceCream.dict, clip = Config.Animations.PrepareIceCream.anim, flag = Config.Animations.PrepareIceCream.flag,},}) then
                            busy = false
                            LockInventory(false)
                            ClearPedTasks(PlayerPedId())
                            TriggerServerEvent('lusty94_icecream:server:CreateVanillaIceCream')
                            SendNotify("Ice cream prepared!", 'success', 2000)
                            FreezeEntityPosition(PlayerPedId(), false)
                        else 
                            busy = false
                            LockInventory(false)
                            ClearPedTasks(PlayerPedId())
                            SendNotify('Action cancelled.', 'error', 2000)
                            FreezeEntityPosition(PlayerPedId(), false)
                        end
                    else
                        SendNotify("Action failed.", 'error', 2000)
                    end
                end
            else
                ClearPedTasks(PlayerPedId())
                SendNotify("You are missing items.", 'error', 2000)
            end
        end)
    else 
        SendNotify("You must be on duty to proceed.", 'error', 2000)
    end
end)

--Prepare Chocolate IceCream
RegisterNetEvent("lusty94_icecream:client:PrepareChocolateIceCream", function()
    if onDuty then
        QBCore.Functions.TriggerCallback('lusty94_icecream:get:ChocolateIceCream', function(HasItems)  
            if HasItems then                
                if busy then
                    SendNotify("You are already doing something.", 'error', 2000)
                else
                    local success = lib.skillCheck({'easy', 'easy', 'easy', 'easy', 'easy'}, {'e'})
                    if success then
                        busy = true
                        LockInventory(true)
                        FreezeEntityPosition(PlayerPedId(), true)
                        if Config.CoreSettings.Sound.UseInteractSound then
                            TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 10, Config.CoreSettings.Sound.ServeIceCream, 0.5)
                        end 
                        if lib.progressCircle({ duration = Config.CoreSettings.Timers.PrepareIceCream, label = 'Preparing ice cream...', position = 'bottom', useWhileDead = false, canCancel = true, disable = { car = true, }, anim = { dict = Config.Animations.PrepareIceCream.dict, clip = Config.Animations.PrepareIceCream.anim, flag = Config.Animations.PrepareIceCream.flag,},}) then
                            busy = false
                            LockInventory(false)
                            ClearPedTasks(PlayerPedId())
                            TriggerServerEvent('lusty94_icecream:server:CreateChocolateIceCream')
                            SendNotify("Ice cream prepared!", 'success', 2000)
                            FreezeEntityPosition(PlayerPedId(), false)
                        else 
                            busy = false
                            LockInventory(false)
                            ClearPedTasks(PlayerPedId())
                            SendNotify('Action cancelled.', 'error', 2000)
                            FreezeEntityPosition(PlayerPedId(), false)
                        end
                    else
                        SendNotify("Action failed.", 'error', 2000)
                    end
                end
            else
                ClearPedTasks(PlayerPedId())
                SendNotify("You are missing items.", 'error', 2000)
            end
        end)
    else 
        SendNotify("You must be on duty to proceed.", 'error', 2000)
    end
end)


--Prepare Strawberry IceCream
RegisterNetEvent("lusty94_icecream:client:PrepareStrawberryIceCream", function()
    if onDuty then
        QBCore.Functions.TriggerCallback('lusty94_icecream:get:StrawberryIceCream', function(HasItems)  
            if HasItems then                
                if busy then
                    SendNotify("You are already doing something.", 'error', 2000)
                else
                    local success = lib.skillCheck({'easy', 'easy', 'easy', 'easy', 'easy'}, {'e'})
                    if success then
                        busy = true
                        LockInventory(true)
                        FreezeEntityPosition(PlayerPedId(), true)
                        if Config.CoreSettings.Sound.UseInteractSound then
                            TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 10, Config.CoreSettings.Sound.ServeIceCream, 0.5)
                        end 
                        if lib.progressCircle({ duration = Config.CoreSettings.Timers.PrepareIceCream, label = 'Preparing ice cream...', position = 'bottom', useWhileDead = false, canCancel = true, disable = { car = true, }, anim = { dict = Config.Animations.PrepareIceCream.dict, clip = Config.Animations.PrepareIceCream.anim, flag = Config.Animations.PrepareIceCream.flag,},}) then
                            busy = false
                            LockInventory(false)
                            ClearPedTasks(PlayerPedId())
                            TriggerServerEvent('lusty94_icecream:server:CreateStrawberryIceCream')
                            SendNotify("Ice cream prepared!", 'success', 2000)
                            FreezeEntityPosition(PlayerPedId(), false)
                        else 
                            busy = false
                            LockInventory(false)
                            ClearPedTasks(PlayerPedId())
                            SendNotify('Action cancelled.', 'error', 2000)
                            FreezeEntityPosition(PlayerPedId(), false)
                        end
                    else
                        SendNotify("Action failed.", 'error', 2000)
                    end
                end
            else
                ClearPedTasks(PlayerPedId())
                SendNotify("You are missing items.", 'error', 2000)
            end
        end)
    else 
        SendNotify("You must be on duty to proceed.", 'error', 2000)
    end
end)

--Prepare Mint IceCream
RegisterNetEvent("lusty94_icecream:client:PrepareMintIceCream", function()
    if onDuty then
        QBCore.Functions.TriggerCallback('lusty94_icecream:get:MintIceCream', function(HasItems)  
            if HasItems then                
                if busy then
                    SendNotify("You are already doing something.", 'error', 2000)
                else
                    local success = lib.skillCheck({'easy', 'easy', 'easy', 'easy', 'easy'}, {'e'})
                    if success then
                        busy = true
                        LockInventory(true)
                        FreezeEntityPosition(PlayerPedId(), true)
                        if Config.CoreSettings.Sound.UseInteractSound then
                            TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 10, Config.CoreSettings.Sound.ServeIceCream, 0.5)
                        end 
                        if lib.progressCircle({ duration = Config.CoreSettings.Timers.PrepareIceCream, label = 'Preparing ice cream...', position = 'bottom', useWhileDead = false, canCancel = true, disable = { car = true, }, anim = { dict = Config.Animations.PrepareIceCream.dict, clip = Config.Animations.PrepareIceCream.anim, flag = Config.Animations.PrepareIceCream.flag,},}) then
                            busy = false
                            LockInventory(false)
                            ClearPedTasks(PlayerPedId())
                            TriggerServerEvent('lusty94_icecream:server:CreateMintIceCream')
                            SendNotify("Ice cream prepared!", 'success', 2000)
                            FreezeEntityPosition(PlayerPedId(), false)
                        else 
                            busy = false
                            LockInventory(false)
                            ClearPedTasks(PlayerPedId())
                            SendNotify('Action cancelled.', 'error', 2000)
                            FreezeEntityPosition(PlayerPedId(), false)
                        end
                    else
                        SendNotify("Action failed.", 'error', 2000)
                    end
                end
            else
                ClearPedTasks(PlayerPedId())
                SendNotify("You are missing items.", 'error', 2000)
            end
        end)
    else 
        SendNotify("You must be on duty to proceed.", 'error', 2000)
    end
end)


--Prepare Pistachio IceCream
RegisterNetEvent("lusty94_icecream:client:PreparePistachioIceCream", function()
    if onDuty then
        QBCore.Functions.TriggerCallback('lusty94_icecream:get:PistachioIceCream', function(HasItems)  
            if HasItems then                
                if busy then
                    SendNotify("You are already doing something.", 'error', 2000)
                else
                    local success = lib.skillCheck({'easy', 'easy', 'easy', 'easy', 'easy'}, {'e'})
                    if success then
                        busy = true
                        LockInventory(true)
                        FreezeEntityPosition(PlayerPedId(), true)
                        if Config.CoreSettings.Sound.UseInteractSound then
                            TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 10, Config.CoreSettings.Sound.ServeIceCream, 0.5)
                        end 
                        if lib.progressCircle({ duration = Config.CoreSettings.Timers.PrepareIceCream, label = 'Preparing ice cream...', position = 'bottom', useWhileDead = false, canCancel = true, disable = { car = true, }, anim = { dict = Config.Animations.PrepareIceCream.dict, clip = Config.Animations.PrepareIceCream.anim, flag = Config.Animations.PrepareIceCream.flag,},}) then
                            busy = false
                            LockInventory(false)
                            ClearPedTasks(PlayerPedId())
                            TriggerServerEvent('lusty94_icecream:server:CreatePistachioIceCream')
                            SendNotify("Ice cream prepared!", 'success', 2000)
                            FreezeEntityPosition(PlayerPedId(), false)
                        else 
                            busy = false
                            LockInventory(false)
                            ClearPedTasks(PlayerPedId())
                            SendNotify('Action cancelled.', 'error', 2000)
                            FreezeEntityPosition(PlayerPedId(), false)
                        end
                    else
                        SendNotify("Action failed.", 'error', 2000)
                    end
                end
            else
                ClearPedTasks(PlayerPedId())
                SendNotify("You are missing items.", 'error', 2000)
            end
        end)
    else 
        SendNotify("You must be on duty to proceed.", 'error', 2000)
    end
end)

--Prepare ButterScotch IceCream
RegisterNetEvent("lusty94_icecream:client:PrepareButterScotchIceCream", function()
    if onDuty then
        QBCore.Functions.TriggerCallback('lusty94_icecream:get:ButterScotchIceCream', function(HasItems)  
            if HasItems then                
                if busy then
                    SendNotify("You are already doing something.", 'error', 2000)
                else
                    local success = lib.skillCheck({'easy', 'easy', 'easy', 'easy', 'easy'}, {'e'})
                    if success then
                        busy = true
                        LockInventory(true)
                        FreezeEntityPosition(PlayerPedId(), true)
                        if Config.CoreSettings.Sound.UseInteractSound then
                            TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 10, Config.CoreSettings.Sound.ServeIceCream, 0.5)
                        end 
                        if lib.progressCircle({ duration = Config.CoreSettings.Timers.PrepareIceCream, label = 'Preparing ice cream...', position = 'bottom', useWhileDead = false, canCancel = true, disable = { car = true, }, anim = { dict = Config.Animations.PrepareIceCream.dict, clip = Config.Animations.PrepareIceCream.anim, flag = Config.Animations.PrepareIceCream.flag,},}) then
                            busy = false
                            LockInventory(false)
                            ClearPedTasks(PlayerPedId())
                            TriggerServerEvent('lusty94_icecream:server:CreateButterScotchIceCream')
                            SendNotify("Ice cream prepared!", 'success', 2000)
                            FreezeEntityPosition(PlayerPedId(), false)
                        else 
                            busy = false
                            LockInventory(false)
                            ClearPedTasks(PlayerPedId())
                            SendNotify('Action cancelled.', 'error', 2000)
                            FreezeEntityPosition(PlayerPedId(), false)
                        end
                    else
                        SendNotify("Action failed.", 'error', 2000)
                    end
                end
            else
                ClearPedTasks(PlayerPedId())
                SendNotify("You are missing items.", 'error', 2000)
            end
        end)
    else 
        SendNotify("You must be on duty to proceed.", 'error', 2000)
    end
end)


--Prepare SaltedCaramel IceCream
RegisterNetEvent("lusty94_icecream:client:PrepareSaltedCaramelIceCream", function()
    if onDuty then
        QBCore.Functions.TriggerCallback('lusty94_icecream:get:SaltedCaramelIceCream', function(HasItems)  
            if HasItems then                
                if busy then
                    SendNotify("You are already doing something.", 'error', 2000)
                else
                    local success = lib.skillCheck({'easy', 'easy', 'easy', 'easy', 'easy'}, {'e'})
                    if success then
                        busy = true
                        LockInventory(true)
                        FreezeEntityPosition(PlayerPedId(), true)
                        if Config.CoreSettings.Sound.UseInteractSound then
                            TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 10, Config.CoreSettings.Sound.ServeIceCream, 0.5)
                        end 
                        if lib.progressCircle({ duration = Config.CoreSettings.Timers.PrepareIceCream, label = 'Preparing ice cream...', position = 'bottom', useWhileDead = false, canCancel = true, disable = { car = true, }, anim = { dict = Config.Animations.PrepareIceCream.dict, clip = Config.Animations.PrepareIceCream.anim, flag = Config.Animations.PrepareIceCream.flag,},}) then
                            busy = false
                            LockInventory(false)
                            ClearPedTasks(PlayerPedId())
                            TriggerServerEvent('lusty94_icecream:server:CreateSaltedCaramelIceCream')
                            SendNotify("Ice cream prepared!", 'success', 2000)
                            FreezeEntityPosition(PlayerPedId(), false)
                        else 
                            busy = false
                            LockInventory(false)
                            ClearPedTasks(PlayerPedId())
                            SendNotify('Action cancelled.', 'error', 2000)
                            FreezeEntityPosition(PlayerPedId(), false)
                        end
                    else
                        SendNotify("Action failed.", 'error', 2000)
                    end
                end
            else
                ClearPedTasks(PlayerPedId())
                SendNotify("You are missing items.", 'error', 2000)
            end
        end)
    else 
        SendNotify("You must be on duty to proceed.", 'error', 2000)
    end
end)

--Prepare Bubblegum IceCream
RegisterNetEvent("lusty94_icecream:client:PrepareBubblegumIceCream", function()
    if onDuty then
        QBCore.Functions.TriggerCallback('lusty94_icecream:get:BubblegumIceCream', function(HasItems)  
            if HasItems then                
                if busy then
                    SendNotify("You are already doing something.", 'error', 2000)
                else
                    local success = lib.skillCheck({'easy', 'easy', 'easy', 'easy', 'easy'}, {'e'})
                    if success then
                        busy = true
                        LockInventory(true)
                        FreezeEntityPosition(PlayerPedId(), true)
                        if Config.CoreSettings.Sound.UseInteractSound then
                            TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 10, Config.CoreSettings.Sound.ServeIceCream, 0.5)
                        end 
                        if lib.progressCircle({ duration = Config.CoreSettings.Timers.PrepareIceCream, label = 'Preparing ice cream...', position = 'bottom', useWhileDead = false, canCancel = true, disable = { car = true, }, anim = { dict = Config.Animations.PrepareIceCream.dict, clip = Config.Animations.PrepareIceCream.anim, flag = Config.Animations.PrepareIceCream.flag,},}) then
                            busy = false
                            LockInventory(false)
                            ClearPedTasks(PlayerPedId())
                            TriggerServerEvent('lusty94_icecream:server:CreateBubblegumIceCream')
                            SendNotify("Ice cream prepared!", 'success', 2000)
                            FreezeEntityPosition(PlayerPedId(), false)
                        else 
                            busy = false
                            LockInventory(false)
                            ClearPedTasks(PlayerPedId())
                            SendNotify('Action cancelled.', 'error', 2000)
                            FreezeEntityPosition(PlayerPedId(), false)
                        end
                    else
                        SendNotify("Action failed.", 'error', 2000)
                    end
                end
            else
                ClearPedTasks(PlayerPedId())
                SendNotify("You are missing items.", 'error', 2000)
            end
        end)
    else 
        SendNotify("You must be on duty to proceed.", 'error', 2000)
    end
end)

--Prepare Toffee IceCream
RegisterNetEvent("lusty94_icecream:client:PrepareToffeeIceCream", function()
    if onDuty then
        QBCore.Functions.TriggerCallback('lusty94_icecream:get:ToffeeIceCream', function(HasItems)  
            if HasItems then                
                if busy then
                    SendNotify("You are already doing something.", 'error', 2000)
                else
                    local success = lib.skillCheck({'easy', 'easy', 'easy', 'easy', 'easy'}, {'e'})
                    if success then
                        busy = true
                        LockInventory(true)
                        FreezeEntityPosition(PlayerPedId(), true)
                        if Config.CoreSettings.Sound.UseInteractSound then
                            TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 10, Config.CoreSettings.Sound.ServeIceCream, 0.5)
                        end 
                        if lib.progressCircle({ duration = Config.CoreSettings.Timers.PrepareIceCream, label = 'Preparing ice cream...', position = 'bottom', useWhileDead = false, canCancel = true, disable = { car = true, }, anim = { dict = Config.Animations.PrepareIceCream.dict, clip = Config.Animations.PrepareIceCream.anim, flag = Config.Animations.PrepareIceCream.flag,},}) then
                            busy = false
                            LockInventory(false)
                            ClearPedTasks(PlayerPedId())
                            TriggerServerEvent('lusty94_icecream:server:CreateToffeeIceCream')
                            SendNotify("Ice cream prepared!", 'success', 2000)
                            FreezeEntityPosition(PlayerPedId(), false)
                        else 
                            busy = false
                            LockInventory(false)
                            ClearPedTasks(PlayerPedId())
                            SendNotify('Action cancelled.', 'error', 2000)
                            FreezeEntityPosition(PlayerPedId(), false)
                        end
                    else
                        SendNotify("Action failed.", 'error', 2000)
                    end
                end
            else
                ClearPedTasks(PlayerPedId())
                SendNotify("You are missing items.", 'error', 2000)
            end
        end)
    else 
        SendNotify("You must be on duty to proceed.", 'error', 2000)
    end
end)

--Prepare CookieDough IceCream
RegisterNetEvent("lusty94_icecream:client:PrepareCookieDoughIceCream", function()
    if onDuty then
        QBCore.Functions.TriggerCallback('lusty94_icecream:get:CookieDoughIceCream', function(HasItems)  
            if HasItems then                
                if busy then
                    SendNotify("You are already doing something.", 'error', 2000)
                else
                    local success = lib.skillCheck({'easy', 'easy', 'easy', 'easy', 'easy'}, {'e'})
                    if success then
                        busy = true
                        LockInventory(true)
                        FreezeEntityPosition(PlayerPedId(), true)
                        if Config.CoreSettings.Sound.UseInteractSound then
                            TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 10, Config.CoreSettings.Sound.ServeIceCream, 0.5)
                        end 
                        if lib.progressCircle({ duration = Config.CoreSettings.Timers.PrepareIceCream, label = 'Preparing ice cream...', position = 'bottom', useWhileDead = false, canCancel = true, disable = { car = true, }, anim = { dict = Config.Animations.PrepareIceCream.dict, clip = Config.Animations.PrepareIceCream.anim, flag = Config.Animations.PrepareIceCream.flag,},}) then
                            busy = false
                            LockInventory(false)
                            ClearPedTasks(PlayerPedId())
                            TriggerServerEvent('lusty94_icecream:server:CreateCookieDoughIceCream')
                            SendNotify("Ice cream prepared!", 'success', 2000)
                            FreezeEntityPosition(PlayerPedId(), false)
                        else 
                            busy = false
                            LockInventory(false)
                            ClearPedTasks(PlayerPedId())
                            SendNotify('Action cancelled.', 'error', 2000)
                            FreezeEntityPosition(PlayerPedId(), false)
                        end
                    else
                        SendNotify("Action failed.", 'error', 2000)
                    end
                end
            else
                ClearPedTasks(PlayerPedId())
                SendNotify("You are missing items.", 'error', 2000)
            end
        end)
    else 
        SendNotify("You must be on duty to proceed.", 'error', 2000)
    end
end)




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
                        text = "Total Bill Price:", -- text you want to be displayed as a place holder
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
            SendNotify("You must be on duty to proceed.", 'error', 2000)
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

--delete props and targets
local function deleteIceCreamProps()
    for _, v in pairs(spawnedProps) do SetEntityAsMissionEntity(v, false, true) DeleteObject(v) end print('Ice Cream Props - Objects Deleted')
    for k,v in pairs(Config.InteractionLocations.Props) do
        if TargetType == 'qb' then exports['qb-target']:RemoveTargetEntity(props, 'props') elseif TargetType == 'ox' then exports.ox_target:removeLocalEntity(props, 'props') end print('Ice Cream Props - Targets Removed')
    end
end


--dont touch
AddEventHandler('onResourceStop', function(resource)
	if resource == GetCurrentResourceName() then
        deleteIceCreamProps()
        busy = false
        print('^5--<^3!^5>-- ^7| Lusty94 |^5 ^5--<^3!^5>--^7 Ice Cream V2.0.0 Stopped Successfully ^5--<^3!^5>--^7')
    end
end)