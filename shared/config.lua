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


Config.DebugPoly = false -- SET TO FALSE FOR LIVE SERVER
--Debugs polyzones and shows green boxes

Config.DevMode = false
--cancels job duty check set to false for live server

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
    },    
    Inventory = {
        Type = 'qb' -- support for qb-inventory & ox_inventory
        --use 'qb' for qb-inventory
        --use 'ox' for ox_inventory
    },
    Clothing = {
        Type = 'qb' -- clothing type, support for qb-clothing and illenium-appearance
        --use 'qb' for qb-clothing
        --use 'illenium' for illenium-appearance
        --use 'custom' for your own clothing script - edit the following event: 'lusty94_icecream:client:changeClothes' and add your own methods
    },
    Timers = {
        PrepareSmoothies = 10000,  -- time it takes to prepare smoothies
        PrepareSoftDrinks = 10000, -- time it takes to prepare soft drinks
        PrepareHotDrinks = 10000,  -- time it takes to prepare hot drinks
        PrepareIceCream = 7500,  -- time it takes to prepare ice cream
    },
    ProductMenu = {
        URL = "CHANGE ME TO YOUR OWN IMAGE URL FOR THE MENU",
    },
    Sound = {
        UseInteractSound = false, -- set to true to play sound when performing certain actions 
        --[[ REQUIRES INTERACT-SOUND AND MUST BE STARTED BEFORE THIS RESOURCE TO WORK PROPERLY]]
        --[[ MAKE SURE YOU HAVE PUT THE .OGG FILES INSIDE OF [SOUNDS] IN YOUR INTERACT-SOUND/CLIENT/HTML/SOUNDS FOLDER TO WORK PROPERLY ]]

        -- [[  IF YOU CHANGE ANY SOUNDS BELOW THEN MAKE SURE THE .OGG FILE IS LOCATED IN YOUR INTERACT-SOUND/CLIENT/HTML/SOUNDS TO WORK PROPERLY ]]

        PourSmoothies = 'smoothiemachine', -- sound to be played when preparing smoothies
        PourHotDrinks = 'hotdrinksmachine', -- sound to be played when preparing hot drinks
        PourSoftDrinks = 'fizzydrinksmachine', -- sound to be played when preparing soft drinks
        ServeIceCream = 'serveicecream', -- sound to be played when preparing ice cream
    },
}

Config.InteractionLocations = {
    JobAreas = {
        { Name = "icecreamduty",            Location = vector3(276.49, 131.95, 105.15), Size = vec3(1.5,0.4,1.0),   Height = 1.5,   Width = 0.4, Heading = 337.8,   MinZ = 104.5, MaxZ = 105.65, Icon = 'fa-solid fa-user',             Label = "Toggle Duty",          Job = 'icecream',   Event = 'lusty94_icecream:client:ToggleDuty', Distance = 2.0,},
        { Name = "icecreammenu",            Location = vector3(275.22, 136.76, 104.5),  Size = vec3(0.5,0.5,0.5),   Height = 0.5,   Width = 0.5, Heading = 161.59,  MinZ = 104.0, MaxZ = 104.5,  Icon = 'fa-solid fa-user',             Label = "View Products Menu",   Job = nil,          Event = 'lusty94_icecream:client:OpenProductsMenu', Distance = 2.0,},
        { Name = "icecreamclothing",        Location = vector3(278.7, 129.43, 104.43),  Size = vec3(0.8,0.4,1.5),   Height = 0.8,   Width = 0.4, Heading = 253.55,  MinZ = 103.0, MaxZ = 105.25, Icon = 'fa-solid fa-user',             Label = "Change Clothes",       Job = 'icecream',   Event = 'lusty94_icecream:client:changeClothes', Distance = 2.0,},
        { Name = "icecreampayment",         Location = vector3(271.89, 137.63, 104.6),  Size = vec3(0.5,0.5,0.5),   Height = 0.5,   Width = 0.5, Heading = 0.0,     MinZ = 104.0, MaxZ = 104.75, Icon = 'fa-solid fa-cash-register',    Label = "Charge Customer",      Job = 'icecream',   Event = 'lusty94_icecream:bill', Distance = 2.0,},
        { Name = "icecreamcollection",      Location = vector3(272.73, 137.3, 104.5),   Size = vec3(0.5,0.5,0.35),  Height = 0.5,   Width = 0.5, Heading = 349.0,   MinZ = 104.0, MaxZ = 104.5,  Icon = 'fa-solid fa-box-archive',      Label = "Open Collection Tray", Job = nil,          Event = 'lusty94_icecream:client:OpenCollectionTray', Distance = 2.0,},
        { Name = "icecreampreparation",     Location = vector3(276.4, 135.75, 104.5),   Size = vec3(2.0,0.8,0.75),  Height = 2.0,   Width = 0.8, Heading = 342.46,  MinZ = 104.0, MaxZ = 104.75, Icon = 'fa-solid fa-ice-cream',        Label = "Prepare Ice Creams",   Job = 'icecream',   Event = 'lusty94_icecream:client:IceCreamMenu', Distance = 2.0,},
        { Name = "icecreamsmoothies",       Location = vector3(270.84, 134.48, 104.5),  Size = vec3(1.0,0.5,1.0),   Height = 1.0,   Width = 0.5, Heading = 160.0,   MinZ = 104.0, MaxZ = 105.25, Icon = 'fa-solid fa-blender',          Label = "Prepare Smoothies",    Job = 'icecream',   Event = 'lusty94_icecream:client:SmoothieMenu', Distance = 2.0,},
        { Name = "icecreamsoftdrinks",      Location = vector3(272.1, 134, 104.5),      Size = vec3(0.8,0.4,1.0),   Height = 0.8,   Width = 0.4, Heading = 160.0,   MinZ = 104.0, MaxZ = 104.85, Icon = 'fa-solid fa-glass-water',      Label = "Prepare Soft Drinks",  Job = 'icecream',   Event = 'lusty94_icecream:client:SoftDrinksMenu', Distance = 2.0,},
        { Name = "icecreamhotdrinks",       Location = vector3(274.05, 133.38, 104.5),  Size = vec3(0.95,0.4,1.0),  Height = 0.95,  Width = 0.4, Heading = 160.0,   MinZ = 104.0, MaxZ = 104.85, Icon = 'fa-solid fa-mug-hot',          Label = "Prepare Hot Drinks",   Job = 'icecream',   Event = 'lusty94_icecream:client:HotDrinksMenu', Distance = 2.0,},
        { Name = "icecreamstoragefridge",   Location = vector3(276.49, 124.58, 104.5),  Size = vec3(1.0,1.0,2.0),   Height = 1.0,   Width = 1.0, Heading = 161.12,  MinZ = 103.75,MaxZ = 105.5,  Icon = 'fa-solid fa-box-archive',      Label = "Open Storage Fridge",  Job = 'icecream',   Event = 'lusty94_icecream:client:StorageFridge', Distance = 2.0,},
        { Name = "icecreamsnackshelf",      Location = vector3(273.65, 137.24, 104.5),  Size = vec3(0.8,0.8,0.5),   Height = 0.8,   Width = 0.8, Heading = 159.08,  MinZ = 104.0, MaxZ = 104.75, Icon = 'fa-solid fa-cookie-bite',      Label = "Open Snack Shelf",     Job = 'icecream',   Event = 'lusty94_icecream:client:SnackShelf', Distance = 2.0,},
    },
    Props = {
        { 
            Model = 'xm_prop_x17_computer_01',
            Coords = vector4(271.21, 126.39, 104.37, 163.04),
            Icon = 'fa-solid fa-user',
            Label = 'Open Management Menu',
            Job = 'icecream',
            Event = 'qb-bossmenu:client:OpenMenu',
            Distance = 2.0,
        }, 
        { 
            Model = 'v_res_fridgemoda',
            Coords = vector4(276.6, 132.4, 103.44, 160.28),
            Icon = 'fa-solid fa-box-archive',
            Label = 'Open Ingredients Fridge',
            Job = 'icecream',
            Event = 'lusty94_icecream:client:IngredientsFridge',
            Distance = 2.0,
        }, 
    },
}

Config.Animations = {
    PrepareSmoothies = {
        dict = "mini@repair",
        anim = "fixing_a_player",
        flag = 41, 
    },
    PrepareHotDrinks = {
        dict = "mini@repair",
        anim = "fixing_a_player",
        flag = 41,
    },
    PrepareSoftDrinks = {
        dict = "mini@repair",
        anim = "fixing_a_player",
        flag = 41,
    },
    PrepareIceCream = {
        dict = "mini@repair",
        anim = "fixing_a_player",
        flag = 41,
    },
}

Config.Language = {
    ProgressBar = {
        WashHands = 'Washing hands',
        PrepareSmoothie = 'Preparing slushie',
        PrepareDrink = 'Preparing drink',
        PrepareIceCream = 'Preparing ice cream',
    },
    Notifications = {
        Duty = 'You must be clocked on duty to proceed!',
        Busy = 'You are already doing something!',
        Cancelled = 'Action cancelled!',
        Failed = 'Action failed!',
        CantCarry = 'You cant carry anymore!',
        NoItems = 'You are missing items - check the requirements!',
    },
}



