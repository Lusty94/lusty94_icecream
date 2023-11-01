Config = {}


--
--██╗░░░░░██╗░░░██╗░██████╗████████╗██╗░░░██╗░█████╗░░░██╗██╗
--██║░░░░░██║░░░██║██╔════╝╚══██╔══╝╚██╗░██╔╝██╔══██╗░██╔╝██║
--██║░░░░░██║░░░██║╚█████╗░░░░██║░░░░╚████╔╝░╚██████║██╔╝░██║
--██║░░░░░██║░░░██║░╚═══██╗░░░██║░░░░░╚██╔╝░░░╚═══██║███████║
--███████╗╚██████╔╝██████╔╝░░░██║░░░░░░██║░░░░█████╔╝╚════██║
--╚══════╝░╚═════╝░╚═════╝░░░░╚═╝░░░░░░╚═╝░░░░╚════╝░░░░░░╚═╝


--Thank you for downloading this script!

--Below you can change multiple options to suit your server needs.


Config.DebugPoly = false
--Debugs polyzones and shows green boxes


Config.UseJimConsumables = false
--Uses jim-consumables for consuming food / drink items -- IF SET TO FALSE MAKE SURE TO ADD THE ITEM NAMES TO YOUR OWN CONSUMABLES SCRIPT


--Blip Settings
Config.Blips = {
    {title = 'Polar Ice', colour = 8, id = 267, coords = vector3(281.04, 148.03, 104.28), scale = 0.7, useblip = true},
}


Config.CoreSettings = {
    Job = {
        Name = 'icecream', -- name of job in core/shared/jobs.lua
    },
    EventNames = {
        BossMenu = 'qb-bossmenu:client:OpenMenu', -- NAME OF BOSS MENU EVENT TO OPEN MANAGEMENT MENU
        ClothingLocker = 'qb-clothing:client:openOutfitMenu', -- NAME OF BOSS MENU EVENT TO OPEN MANAGEMENT MENU
    },
    Target = {
        Type = 'qb', -- target script name support for qb-target and ox_target 
        --EDIT TARGETS.LUA TO ADD YOUR OWN CUSTOM TARGET SCRIPT        
        --use 'qb' for qb-target
        --use 'ox' for ox_target
        --use 'custom' for custom target 
    },
    Notify = {
        Type = 'qb', -- notification type, support for qb-core notify, okokNotify, boii_ui notify and ox_lib notify
        --use 'qb' for default qb-core notify
        --use 'okok' for okokNotify
        --use 'mythic' for mythic_notify
        --use 'boii' for boii_ui notify
        --use 'ox' for ox_lib notify
        Sound = true, -- use sound for OKOK notifications ONLY
        Length = {
            Success = 2500,
            Error = 2500,
        },
    },    
    Menu = {
        Type = 'qb', -- menu script name, support for qb-menu, jixel-menu, boii_ui menu and ox_lib context menu
        --EDIT MENUS.LUA TO ADD YOUR OWN CUSTOM MENU SCRIPT 
        --use 'qb' for qb-menu
        --use 'jixel' for jixel-menu
        --use 'boii' for boii_ui-menu
        --use 'ox' for ox_lib context menu
        --use 'custom' for your own custom menu
    },
    Sound = {
        UseInteractSound = true, -- set to true to play sound when performing certain actions 
        --[[ REQUIRES INTERACT-SOUND AND MUST BE STARTED BEFORE THIS RESOURCE TO WORK PROPERLY]]
        --[[ MAKE SURE YOU HAVE PUT THE .OGG FILES INSIDE OF [SOUNDS] IN YOUR INTERACT-SOUND/CLIENT/HTML/SOUNDS FOLDER TO WORK PROPERLY ]]

        -- [[  IF YOU CHANGE ANY SOUNDS BELOW THEN MAKE SURE THE .OGG FILE IS LOCATED IN YOUR INTERACT-SOUND/CLIENT/HTML/SOUNDS TO WORK PROPERLY ]]

        PourSmoothies = 'smoothiemachine', -- sound to be played when preparing smoothies
        PourHotDrinks = 'hotdrinksmachine', -- sound to be played when preparing hot drinks
        PourSoftDrinks = 'fizzydrinksmachine', -- sound to be played when preparing soft drinks
        ServeIceCream = 'serveicecream', -- sound to be played when preparing ice cream
    },
    Inventory = {
        Type = 'qb' -- support for qb-inventory & ox_inventory
        --use 'qb' for qb-inventory
        --use 'ox' for ox_inventory
    },
    Shop = { -- support for qb-inventory shops, jim-shops and ox_inventory shops - IF USING OX INVENTORY YOU MUST CREATE YOUR OWN SHOP INSIDE OX_INVENTORY TO ACCESS THE SUPPLIES STORE USING THE SNIPPET PROVIDED IN THE README FILE
        Type = 'qb',
        --use 'qb' for qb-inventory shops
        --use 'jim' for jim-shops
        --use 'ox' for ox_inventory shops
    },
    ProgressBar = {
        Times = {
            PrepareSoftDrinks = 10000, -- time it takes to prepare soft drinks [default is 10000 MS so 10 seconds]
            PrepareHotDrinks = 10000,  -- time it takes to prepare hot drinks [default is 10000 MS so 10 seconds]
            PrepareSmoothies = 10000,  -- time it takes to prepare smoothies [default is 10000 MS so 10 seconds]
            PrepareIceCream = 7500,  -- time it takes to prepare ice cream [default is 7500 MS so 7.5 seconds]
        },
    },
}



Config.InteractionLocations = {
    Job = {
        Duty = {
            Location = vector3(276.49, 131.79, 105.15), Height = 1.5, Width = 0.4, Heading = 337.8, MinZ = 104.5, MaxZ = 105.65, Icon = 'fa-solid fa-clipboard-user', Label = "Toggle Duty", Size = vec3(1.5,0.4,1), },
            BossMenu = { 
            Location = vector3(271.21, 126.35, 104.7), Height = 0.6, Width = 0.3, Heading = 167.4, MinZ = 104.5, MaxZ = 105, Icon = 'fa-solid fa-users', Label = "Open Management Menu", Size = vec3(0.6,0.3,0.5), },
            -- IF MOVING MANAGEMENT MENU DONT FORGET TO MOVE THE COMPUTER PROP LOCATION TOO
        ProductMenu = {
            Location = vector3(272.71, 134.27, 107), Height = 5.0, Width = 0.8, Heading = 161.59, MinZ = 106, MaxZ = 107.5, Icon = 'fa-solid fa-users', Label = "Open Products Menu", Size = vec3(5,0.8,1.5),
            URL = "https://cdn.discordapp.com/attachments/1101679103419109476/1154839246654414928/icecream_menu.png", },
            -- CHANGE THE URL TO YOUR OWN IMAGE - IDEALLY USE DISCORD TO SHARE THE PHOTO AND THEN COPY LINK AS THAT SEEMS TO WORK, IMGUR AND OTHERS DON'T SEEM TO LOAD THE IMAGE?
        ClothingLocker = {
            Location = vector3(278.7, 129.43, 104.43), Height = 0.8, Width = 0.4, Heading = 255.34, MinZ = 103, MaxZ = 105.25, Icon = 'fa-solid fa-users', Label = "Change Clothes", Size = vec3(0.8,0.4,1.5), }
    },
    Payment = {
        Location = vector3(271.89, 137.63, 104.6), Height = 0.5, Width = 0.5, Heading = 1.87, MinZ = 104, MaxZ = 104.75, CashSymbol = '£', Icon = 'fa-solid fa-cash-register', Label = "Charge Customer", Size = vec3(0.5,0.5,0.5), 
    },
    CollectionTray = {
        Location = vector3(272.73, 137.3, 104.5), Height = 0.5, Width = 0.5, Heading = 348.95, MinZ = 104, MaxZ = 105, Icon = 'fa-solid fa-box-archive', Label = "Open Collection Tray",  Size = vec3(0.5,0.5,0.35),
        StashSize = 1000000,  
        StashSlots = 5,       
    },
    IceCream = {
        Location = vector3(276.4, 135.75, 104.5), Height = 2.0, Width = 0.8, Heading = 342.46, MinZ = 104, MaxZ = 104.75, Icon = 'fa-solid fa-ice-cream', Label = "Prepare Ice Cream", Size = vec3(2,0.8,0.75),
    },
    SmoothieMachine = {
        Location = vector3(270.84, 134.48, 104.5), Height = 1.0, Width = 0.5, Heading = 160, MinZ = 104, MaxZ = 105.25, Icon = 'fa-solid fa-blender', Label = "Pour Smoothies", Size = vec3(1,0.5,1),
    },
    SoftDrinksMachine = {
        Location = vector3(272.1, 134, 104.5), Height = 0.8, Width = 0.4, Heading = 160, MinZ = 104, MaxZ = 104.84, Icon = 'fa-solid fa-glass-water', Label = "Pour Soft Drinks", Size = vec3(0.8,0.4,1),
    },
    HotDrinksMachine = {
        Location = vector3(274.05, 133.38, 104.5), Height = 0.95, Width = 0.4, Heading = 160, MinZ = 104, MaxZ = 104.825, Icon = 'fa-solid fa-mug-hot', Label = "Prepare Hot Drinks", Size = vec3(0.95,0.4,1),
    },
    Fridge = { 
        Location = vector3(276.49, 124.58, 104.5), Height = 1.0, Width = 1.0, Heading = 161.12, MinZ = 103.75, MaxZ = 105.5, Icon = 'fa-solid fa-box-archive', Label = "Open Storage Fridge", Size = vec3(1.0,1.0,2),
        StashSize = 10000000,
        StashSlots = 64,
    },
    Ingredients = { 
        Location = vector3(276.6, 132.4, 104.5), Height = 1.4, Width = 0.8, Heading = 160.28, MinZ = 103.75, MaxZ = 105.5, Icon = 'fa-solid fa-box-archive', Label = "Open Ingredients Fridge", Size = vec3(1.4,0.8,2),
        -- IF MOVING INGREDIENTS FRIDGE DONT FORGET TO MOVE THE FRIDGE PROP LOCATION TOO
        Items = {
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
        },
    },
    SnackShelf = {
        Location = vector3(273.65, 137.24, 104.5), Height = 0.8, Width = 0.8, Heading = 159.08, MinZ = 104, MaxZ = 104.75, Icon = 'fa-solid fa-cookie-bite', Label = "Open Snack Shelf", Size = vec3(0.8,0.8,0.5),
        Items = {
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
            },
        },
    },
}



Config.Language = {
    Notifications = { CancelledLabel = "Action Cancelled!", CancelledName = 'Cancelled', MissingItemsLabel = "Mising Items!", MissingItemsName = "You Are Missing Items, Check The Recipe!", DutyLabel = 'Duty Check!', DutyName = 'You Must Be On Duty To Do This!'},
    VanillaSmoothie = { ProgressBarName = "Preparing Vanilla Smoothie!", NotifyLabel = "Item Prepared!", NotifyName = "You Prepared A Vanilla Smoothie!", },
    ChocolateSmoothie = { ProgressBarName = "Preparing Chocolate Smoothie!", NotifyLabel = "Item Prepared!", NotifyName = "You Prepared A Chocolate Smoothie!", },
    StrawberrySmoothie = { ProgressBarName = "Preparing Strawberry Smoothie!", NotifyLabel = "Item Prepared!", NotifyName = "You Prepared A Strawberry Smoothie!", },
    MintSmoothie = { ProgressBarName = "Preparing Mint Smoothie!", NotifyLabel = "Item Prepared!", NotifyName = "You Prepared A Mint Smoothie!", },
    PistachioSmoothie = { ProgressBarName = "Preparing Pistachio Smoothie!", NotifyLabel = "Item Prepared!", NotifyName = "You Prepared A Pistachio Smoothie!", },
    ButterScotchSmoothie = { ProgressBarName = "Preparing Butter Scotch Smoothie!", NotifyLabel = "Item Prepared!", NotifyName = "You Prepared A Butter Scotch Smoothie!", },
    SaltedCaramelSmoothie = { ProgressBarName = "Preparing Salted Caramel Smoothie!", NotifyLabel = "Item Prepared!", NotifyName = "You Prepared A Salted Caramel Smoothie!", },
    BubblegumSmoothie = { ProgressBarName = "Preparing Bubblegum Smoothie!", NotifyLabel = "Item Prepared!", NotifyName = "You Prepared A Bubblegum Smoothie!", },
    ToffeeSmoothie = { ProgressBarName = "Preparing Toffee Smoothie!", NotifyLabel = "Item Prepared!", NotifyName = "You Prepared A Toffee Smoothie!", },
    CookieDoughSmoothie = { ProgressBarName = "Preparing Cookie Dough Smoothie!", NotifyLabel = "Item Prepared!", NotifyName = "You Prepared A Cookie Dough Smoothie!", },
    Coffee = { ProgressBarName = "Preparing Coffee!", NotifyLabel = "Item Prepared!", NotifyName = "You Prepared A Coffee!", },
    Tea = { ProgressBarName = "Preparing Tea!", NotifyLabel = "Item Prepared!", NotifyName = "You Prepared A Tea!", },
    HotChocolate = { ProgressBarName = "Preparing Hot Chocolate!", NotifyLabel = "Item Prepared!", NotifyName = "You Prepared A Hot Chocolate!", },
    Cola = { ProgressBarName = "Preparing Cola!", NotifyLabel = "Item Prepared!", NotifyName = "You Prepared A Cola!", },
    Lemonade = { ProgressBarName = "Preparing Lemonade!", NotifyLabel = "Item Prepared!", NotifyName = "You Prepared A Lemonade!", },
    OrangeSoda = { ProgressBarName = "Preparing Orange Soda!", NotifyLabel = "Item Prepared!", NotifyName = "You Prepared A Orange Soda!", },
    VanillaIceCream = { ProgressBarName = "Preparing Vanilla Ice Cream!", NotifyLabel = "Item Prepared!", NotifyName = "You Prepared A Vanilla Ice Cream!", },
    ChocolateIceCream = { ProgressBarName = "Preparing Chocolate Ice Cream!", NotifyLabel = "Item Prepared!", NotifyName = "You Prepared A Chocolate Ice Cream!", },
    StrawberryIceCream = { ProgressBarName = "Preparing Strawberry Ice Cream!", NotifyLabel = "Item Prepared!", NotifyName = "You Prepared A Strawberry Ice Cream!", },
    MintIceCream = { ProgressBarName = "Preparing Mint Ice Cream!", NotifyLabel = "Item Prepared!", NotifyName = "You Prepared A Mint Ice Cream!", },
    PistachioIceCream = { ProgressBarName = "Preparing Pistachio Ice Cream!", NotifyLabel = "Item Prepared!", NotifyName = "You Prepared A Pistachio Ice Cream!", },
    ButterScotchIceCream = { ProgressBarName = "Preparing Butter Scotch Ice Cream!", NotifyLabel = "Item Prepared!", NotifyName = "You Prepared A Butter Scotch Ice Cream!", },
    SaltedCaramelIceCream = { ProgressBarName = "Preparing Salted Caramel Ice Cream!", NotifyLabel = "Item Prepared!", NotifyName = "You Prepared A Salted Caramel Ice Cream!", },
    BubblegumIceCream = { ProgressBarName = "Preparing Bubblegum Ice Cream!", NotifyLabel = "Item Prepared!", NotifyName = "You Prepared A Bubblegum Ice Cream!", },
    ToffeeIceCream = { ProgressBarName = "Preparing Toffee Ice Cream!", NotifyLabel = "Item Prepared!", NotifyName = "You Prepared A Toffee Ice Cream!", },
    CookieDoughIceCream = { ProgressBarName = "Preparing Cookie Dough Ice Cream!", NotifyLabel = "Item Prepared!", NotifyName = "You Prepared A Cookie Dough Ice Cream!", },
}