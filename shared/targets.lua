local TargetType = Config.CoreSettings.Target.Type
local ShopType = Config.CoreSettings.Shop.Type
local InvType = Config.CoreSettings.Inventory.Type

if TargetType == 'qb' then
    exports['qb-target']:AddBoxZone("Duty", Config.InteractionLocations.Job.Duty.Location, Config.InteractionLocations.Job.Duty.Width, Config.InteractionLocations.Job.Duty.Height, {
        name = "Duty",
        heading = Config.InteractionLocations.Job.Duty.Heading,
        debugPoly = Config.DebugPoly,
        minZ = Config.InteractionLocations.Job.Duty.MinZ,
        maxZ = Config.InteractionLocations.Job.Duty.MaxZ,
    }, {
        options = {
        {
            type = "client",
            event = "lusty94_icecream:client:ToggleDuty",
            icon = Config.InteractionLocations.Job.Duty.Icon,
            label = Config.InteractionLocations.Job.Duty.Label,
            job = Config.CoreSettings.Job.Name,
        }
        },
        distance = 5.0,
    })
    exports['qb-target']:AddBoxZone("BossMenu", Config.InteractionLocations.Job.BossMenu.Location, Config.InteractionLocations.Job.BossMenu.Width, Config.InteractionLocations.Job.BossMenu.Height, {
        name = "BossMenu",
        heading = Config.InteractionLocations.Job.BossMenu.Heading,
        debugPoly = Config.DebugPoly,
        minZ = Config.InteractionLocations.Job.BossMenu.MinZ,
        maxZ = Config.InteractionLocations.Job.BossMenu.MaxZ,
    }, {
        options = {
        {
            type = "client",
            event = Config.CoreSettings.EventNames.BossMenu,
            icon = Config.InteractionLocations.Job.BossMenu.Icon,
            label = Config.InteractionLocations.Job.BossMenu.Label,
            job = Config.CoreSettings.Job.Name,
           
        }
        },
        distance = 2.0,
    })
    exports['qb-target']:AddBoxZone("ClothingLocker", Config.InteractionLocations.Job.ClothingLocker.Location, Config.InteractionLocations.Job.ClothingLocker.Width, Config.InteractionLocations.Job.ClothingLocker.Height, {
        name = "ClothingLocker",
        heading = Config.InteractionLocations.Job.ClothingLocker.Heading,
        debugPoly = Config.DebugPoly,
        minZ = Config.InteractionLocations.Job.ClothingLocker.MinZ,
        maxZ = Config.InteractionLocations.Job.ClothingLocker.MaxZ,
    }, {
        options = {
        {
            type = "client",
            event = Config.CoreSettings.EventNames.ClothingLocker,
            icon = Config.InteractionLocations.Job.ClothingLocker.Icon,
            label = Config.InteractionLocations.Job.ClothingLocker.Label,
            job = Config.CoreSettings.Job.Name,
           
        }
        },
        distance = 2.0,
    })
    exports['qb-target']:AddBoxZone("ProductsMenu", Config.InteractionLocations.Job.ProductMenu.Location, Config.InteractionLocations.Job.ProductMenu.Width, Config.InteractionLocations.Job.ProductMenu.Height, {
        name = "ProductsMenu",
        heading = Config.InteractionLocations.Job.ProductMenu.Heading,
        debugPoly = Config.DebugPoly,
        minZ = Config.InteractionLocations.Job.ProductMenu.MinZ,
        maxZ = Config.InteractionLocations.Job.ProductMenu.MaxZ,
    }, {
        options = {
        {
            type = "client",
            event = 'lusty94_icecream:client:OpenProductsMenu',
            icon = Config.InteractionLocations.Job.ProductMenu.Icon,
            label = Config.InteractionLocations.Job.ProductMenu.Label,
            job = Config.CoreSettings.Job.Name,
           
        }
        },
        distance = 10.0,
    })
    exports['qb-target']:AddBoxZone("Payment", Config.InteractionLocations.Payment.Location, Config.InteractionLocations.Payment.Width, Config.InteractionLocations.Payment.Height, {
        name = "Payment",
        heading = Config.InteractionLocations.Payment.Heading,
        debugPoly = Config.DebugPoly,
        minZ = Config.InteractionLocations.Payment.MinZ,
        maxZ = Config.InteractionLocations.Payment.MaxZ,
    }, {
        options = {
        {
            type = "client",
            event = "lusty94_icecream:bill",
            icon = Config.InteractionLocations.Payment.Icon,
            label = Config.InteractionLocations.Payment.Label,
            job = Config.CoreSettings.Job.Name,
        }
        },
        distance = 2.0,
    })
    exports['qb-target']:AddBoxZone("CollectionTray", Config.InteractionLocations.CollectionTray.Location, Config.InteractionLocations.CollectionTray.Width, Config.InteractionLocations.CollectionTray.Height, {
        name = "CollectionTray",
        heading = Config.InteractionLocations.CollectionTray.Heading,
        debugPoly = Config.DebugPoly,
        minZ = Config.InteractionLocations.CollectionTray.MinZ,
        maxZ = Config.InteractionLocations.CollectionTray.MaxZ,
    }, {
        options = {
        {
            type = "client",
            event = "lusty94_icecream:client:OpenCollectionTray",
            icon = Config.InteractionLocations.CollectionTray.Icon,
            label = Config.InteractionLocations.CollectionTray.Label,
        }
        },
        distance = 2.0,
    })
    exports['qb-target']:AddBoxZone("IceCream", Config.InteractionLocations.IceCream.Location, Config.InteractionLocations.IceCream.Width, Config.InteractionLocations.IceCream.Height, {
        name = "IceCream",
        heading = Config.InteractionLocations.IceCream.Heading,
        debugPoly = Config.DebugPoly,
        minZ = Config.InteractionLocations.IceCream.MinZ,
        maxZ = Config.InteractionLocations.IceCream.MaxZ,
    }, {
        options = {
        {
            type = "client",
            event = "lusty94_icecream:client:IceCreamMenu",
            icon = Config.InteractionLocations.IceCream.Icon,
            label = Config.InteractionLocations.IceCream.Label,
        }
        },
        distance = 2.0,
    })
    exports['qb-target']:AddBoxZone("SmoothieMachine", Config.InteractionLocations.SmoothieMachine.Location, Config.InteractionLocations.SmoothieMachine.Width, Config.InteractionLocations.SmoothieMachine.Height, {
        name = "SmoothieMachine",
        heading = Config.InteractionLocations.SmoothieMachine.Heading,
        debugPoly = Config.DebugPoly,
        minZ = Config.InteractionLocations.SmoothieMachine.MinZ,
        maxZ = Config.InteractionLocations.SmoothieMachine.MaxZ,
    }, {
        options = {
        {
            type = "client",
            event = "lusty94_icecream:client:SmoothieMenu",
            icon = Config.InteractionLocations.SmoothieMachine.Icon,
            label = Config.InteractionLocations.SmoothieMachine.Label,
            job = Config.CoreSettings.Job.Name,
        }
        },
        distance = 2.0,
    })
    exports['qb-target']:AddBoxZone("SoftDrinks", Config.InteractionLocations.SoftDrinksMachine.Location, Config.InteractionLocations.SoftDrinksMachine.Width, Config.InteractionLocations.SoftDrinksMachine.Height, {
        name = "SoftDrinks",
        heading = Config.InteractionLocations.SoftDrinksMachine.Heading,
        debugPoly = Config.DebugPoly,
        minZ = Config.InteractionLocations.SoftDrinksMachine.MinZ,
        maxZ = Config.InteractionLocations.SoftDrinksMachine.MaxZ,
    }, {
        options = {
        {
            type = "client",
            event = "lusty94_icecream:client:SoftDrinksMenu",
            icon = Config.InteractionLocations.SoftDrinksMachine.Icon,
            label = Config.InteractionLocations.SoftDrinksMachine.Label,
            job = Config.CoreSettings.Job.Name,
        }
        },
        distance = 2.0,
    })
    exports['qb-target']:AddBoxZone("HotDrinks", Config.InteractionLocations.HotDrinksMachine.Location, Config.InteractionLocations.HotDrinksMachine.Width, Config.InteractionLocations.HotDrinksMachine.Height, {
        name = "HotDrinks",
        heading = Config.InteractionLocations.HotDrinksMachine.Heading,
        debugPoly = Config.DebugPoly,
        minZ = Config.InteractionLocations.HotDrinksMachine.MinZ,
        maxZ = Config.InteractionLocations.HotDrinksMachine.MaxZ,
    }, {
        options = {
        {
            type = "client",
            event = "lusty94_icecream:client:HotDrinksMenu",
            icon = Config.InteractionLocations.HotDrinksMachine.Icon,
            label = Config.InteractionLocations.HotDrinksMachine.Label,
            job = Config.CoreSettings.Job.Name,
        }
        },
        distance = 2.0,
    })
    exports['qb-target']:AddBoxZone("Fridge", Config.InteractionLocations.Fridge.Location, Config.InteractionLocations.Fridge.Width, Config.InteractionLocations.Fridge.Height, {
        name = "Fridge",
        heading = Config.InteractionLocations.Fridge.Heading,
        debugPoly = Config.DebugPoly,
        minZ = Config.InteractionLocations.Fridge.MinZ,
        maxZ = Config.InteractionLocations.Fridge.MaxZ,
    }, {
        options = {
        {
            type = "client",
            event = "lusty94_icecream:client:StorageFridge",
            icon = Config.InteractionLocations.Fridge.Icon,
            label = Config.InteractionLocations.Fridge.Label,
            job = Config.CoreSettings.Job.Name,
        }
        },
        distance = 2.0,
    })
    exports['qb-target']:AddBoxZone("Ingredients", Config.InteractionLocations.Ingredients.Location, Config.InteractionLocations.Ingredients.Width, Config.InteractionLocations.Ingredients.Height, {
        name = "Ingredients",
        heading = Config.InteractionLocations.Ingredients.Heading,
        debugPoly = Config.DebugPoly,
        minZ = Config.InteractionLocations.Ingredients.MinZ,
        maxZ = Config.InteractionLocations.Ingredients.MaxZ,
    }, {
        options = {
        {
            type = "client",
            event = "lusty94_icecream:client:IngredientsFridge",
            icon = Config.InteractionLocations.Ingredients.Icon,
            label = Config.InteractionLocations.Ingredients.Label,
            job = Config.CoreSettings.Job.Name,
        }
        },
        distance = 2.0,
    })
    exports['qb-target']:AddBoxZone("Snacks", Config.InteractionLocations.SnackShelf.Location, Config.InteractionLocations.SnackShelf.Width, Config.InteractionLocations.SnackShelf.Height, {
        name = "Snacks",
        heading = Config.InteractionLocations.SnackShelf.Heading,
        debugPoly = Config.DebugPoly,
        minZ = Config.InteractionLocations.SnackShelf.MinZ,
        maxZ = Config.InteractionLocations.SnackShelf.MaxZ,
    }, {
        options = {
        {
            type = "client",
            event = "lusty94_icecream:client:SnackShelf",
            icon = Config.InteractionLocations.SnackShelf.Icon,
            label = Config.InteractionLocations.SnackShelf.Label,
            
        }
        },
        distance = 2.0,
    })
elseif TargetType == 'ox' then
    exports.ox_target:addBoxZone({
        coords = Config.InteractionLocations.Job.Duty.Location,
        size = Config.InteractionLocations.Job.Duty.Size,
        rotation = Config.InteractionLocations.Job.Duty.Heading,
        debug = Config.DebugPoly,
        options = {
            {
                id = 1,
                groups = Config.CoreSettings.Job.Name,
                event = 'lusty94_icecream:client:ToggleDuty',
                label = Config.InteractionLocations.Job.Duty.Label,
                icon = Config.InteractionLocations.Job.Duty.Icon,
            }
        }
    })
    exports.ox_target:addBoxZone({
        coords = Config.InteractionLocations.Job.BossMenu.Location,
        size = Config.InteractionLocations.Job.BossMenu.Size,
        rotation = Config.InteractionLocations.Job.BossMenu.Heading,
        debug = Config.DebugPoly,
        options = {
            {
                id = 2,
                groups = Config.CoreSettings.Job.Name,
                event = Config.CoreSettings.EventNames.BossMenu,
                label = Config.InteractionLocations.Job.BossMenu.Label,
                icon = Config.InteractionLocations.Job.BossMenu.Icon,
            }
        }
    })
    exports.ox_target:addBoxZone({
        coords = Config.InteractionLocations.Job.ClothingLocker.Location,
        size = Config.InteractionLocations.Job.ClothingLocker.Size,
        rotation = Config.InteractionLocations.Job.ClothingLocker.Heading,
        debug = Config.DebugPoly,
        options = {
            {
                id = 3,
                groups = Config.CoreSettings.Job.Name,
                event = Config.CoreSettings.EventNames.ClothingLocker,
                label = Config.InteractionLocations.Job.ClothingLocker.Label,
                icon = Config.InteractionLocations.Job.ClothingLocker.Icon,
            }
        }
    })
    exports.ox_target:addBoxZone({
        coords = Config.InteractionLocations.Job.ProductMenu.Location,
        size = Config.InteractionLocations.Job.ProductMenu.Size,
        rotation = Config.InteractionLocations.Job.ProductMenu.Heading,
        debug = Config.DebugPoly,
        options = {
            {
                id = 4,
                event = 'lusty94_icecream:client:OpenProductsMenu',
                label = Config.InteractionLocations.Job.ProductMenu.Label,
                icon = Config.InteractionLocations.Job.ProductMenu.Icon,
            }
        }
    })
    exports.ox_target:addBoxZone({
        coords = Config.InteractionLocations.Payment.Location,
        size = Config.InteractionLocations.Payment.Size,
        rotation = Config.InteractionLocations.Payment.Heading,
        debug = Config.DebugPoly,
        options = {
            {
                id = 5,
                groups = Config.CoreSettings.Job.Name,
                event = 'lusty94_icecream:bill',
                label = Config.InteractionLocations.Payment.Label,
                icon = Config.InteractionLocations.Payment.Icon,
            }
        }
    })
    exports.ox_target:addBoxZone({
        coords = Config.InteractionLocations.IceCream.Location,
        size = Config.InteractionLocations.IceCream.Size,
        rotation = Config.InteractionLocations.IceCream.Heading,
        debug = Config.DebugPoly,
        options = {
            {
                id = 6,
                groups = Config.CoreSettings.Job.Name,
                event = 'lusty94_icecream:client:IceCreamMenu',
                label = Config.InteractionLocations.IceCream.Label,
                icon = Config.InteractionLocations.IceCream.Icon,
            }
        }
    })
      
    exports.ox_target:addBoxZone({
        coords = Config.InteractionLocations.SmoothieMachine.Location,
        size = Config.InteractionLocations.SmoothieMachine.Size,
        rotation = Config.InteractionLocations.SmoothieMachine.Heading,
        debug = Config.DebugPoly,
        options = {
            {
                id = 7,
                groups = Config.CoreSettings.Job.Name,
                event = 'lusty94_icecream:client:SmoothieMenu',
                label = Config.InteractionLocations.SmoothieMachine.Label,
                icon = Config.InteractionLocations.SmoothieMachine.Icon,
            }
        }
    })
    exports.ox_target:addBoxZone({
        coords = Config.InteractionLocations.SoftDrinksMachine.Location,
        size = Config.InteractionLocations.SoftDrinksMachine.Size,
        rotation = Config.InteractionLocations.SoftDrinksMachine.Heading,
        debug = Config.DebugPoly,
        options = {
            {
                id = 8,
                groups = Config.CoreSettings.Job.Name,
                event = 'lusty94_icecream:client:SoftDrinksMenu',
                label = Config.InteractionLocations.SoftDrinksMachine.Label,
                icon = Config.InteractionLocations.SoftDrinksMachine.Icon,
            }
        }
    })
    exports.ox_target:addBoxZone({
        coords = Config.InteractionLocations.HotDrinksMachine.Location,
        size = Config.InteractionLocations.HotDrinksMachine.Size,
        rotation = Config.InteractionLocations.HotDrinksMachine.Heading,
        debug = Config.DebugPoly,
        options = {
            {
                id = 9,
                groups = Config.CoreSettings.Job.Name,
                event = 'lusty94_icecream:client:HotDrinksMenu',
                label = Config.InteractionLocations.HotDrinksMachine.Label,
                icon = Config.InteractionLocations.HotDrinksMachine.Icon,
            }
        }
    })
    if InvType == 'ox' then
        print('InvType set to ox - target option for collection tray now disabled as its controlled by ox_inventory - MAKE SURE YOU HAVE ADDED THE SNIPPET IN THE README FILE TO OX_INVENTORY/DATA/STASHES.LUA TO WORK PROPERLY!')
    else
        exports.ox_target:addBoxZone({
            coords = Config.InteractionLocations.CollectionTray.Location,
            size = Config.InteractionLocations.CollectionTray.Size,
            rotation = Config.InteractionLocations.CollectionTray.Heading,
            debug = Config.DebugPoly,
            options = {
                {
                    id = 10,
                    event = 'lusty94_icecream:client:OpenCollectionTray',
                    label = Config.InteractionLocations.CollectionTray.Label,
                    icon = Config.InteractionLocations.CollectionTray.Icon,
                }
            }
        }) 
    end
    if InvType == 'ox' then
        print('InvType set to ox - target option for storage fridge now disabled as its controlled by ox_inventory - MAKE SURE YOU HAVE ADDED THE SNIPPET IN THE README FILE TO OX_INVENTORY/DATA/STASHES.LUA TO WORK PROPERLY!')
    else
        exports.ox_target:addBoxZone({
            coords = Config.InteractionLocations.Fridge.Location,
            size = Config.InteractionLocations.Fridge.Size,
            rotation = Config.InteractionLocations.Fridge.Heading,
            debug = Config.DebugPoly,
            options = {
                {
                    id = 11,
                    groups = Config.CoreSettings.Job.Name,
                    event = 'lusty94_icecream:client:OpenStorageFridge',
                    label = Config.InteractionLocations.Fridge.Label,
                    icon = Config.InteractionLocations.Fridge.Icon,
                }
            }
        })
    end
    if ShopType == 'ox' then
        print('ShopType set to ox - target option for ingredients fridge now disabled as its controlled by ox_inventory - MAKE SURE YOU HAVE ADDED THE SNIPPET IN THE README FILE TO OX_INVENTORY/DATA/SHOPS.LUA TO WORK PROPERLY!')
    else
        exports.ox_target:addBoxZone({
            coords = Config.InteractionLocations.Ingredients.Location,
            size = Config.InteractionLocations.Ingredients.Size,
            rotation = Config.InteractionLocations.Ingredients.Heading,
            debug = Config.DebugPoly,
            options = {
                {
                    id = 12,
                    groups = Config.CoreSettings.Job.Name,
                    event = 'lusty94_icecream:client:IngredientsFridge',
                    label = Config.InteractionLocations.Ingredients.Label,
                    icon = Config.InteractionLocations.Ingredients.Icon,
                }
            }
        })
    end
    if ShopType == 'ox' then
        print('ShopType set to ox - target option for snack shelf now disabled as its controlled by ox_inventory - MAKE SURE YOU HAVE ADDED THE SNIPPET IN THE README FILE TO OX_INVENTORY/DATA/SHOPS.LUA TO WORK PROPERLY!')
    else
        exports.ox_target:addBoxZone({
            coords = Config.InteractionLocations.SnackShelf.Location,
            size = Config.InteractionLocations.SnackShelf.Size,
            rotation = Config.InteractionLocations.SnackShelf.Heading,
            debug = Config.DebugPoly,
            options = {
                {
                    id = 13,
                    event = 'lusty94_icecream:client:SnackShelf',
                    label = Config.InteractionLocations.SnackShelf.Label,
                    icon = Config.InteractionLocations.SnackShelf.Icon,
                }
            }
        })
    end
elseif TargetType == 'custom' then
-- inset custom target code here
end