local MenuType = Config.CoreSettings.Menu.Type

-------------------------------------------------------< SMOOTHIE MENU START >---------------------------------------------------
local SmoothieMenuIceCream = {
    {
        header = "🥤 Prepare Fresh Smoothies!",
        isMenuHeader = true,
    },  
    {   
        header = "🥤 Get A Smoothie Cup",
        params = {
            event = "lusty94_icecream:client:GiveSmoothieCup",
        }
    },          
    {   
        header = "🫘 Prepare Vanilla Smoothie",
        txt = "<u>Ingredients Required:</u> <br> Vanilla, Smoothie Mix, Smoothie Cup",
        params = {
            event = "lusty94_icecream:client:PrepareVanillaSmoothie",
        }
    },               
    {   
        header = "🍫 Prepare Chocolate Smoothie",
        txt = "<u>Ingredients Required:</u> <br> Chocolate, Smoothie Mix, Smoothie Cup",
        params = {
            event = "lusty94_icecream:client:PrepareChocolateSmoothie",
        }
    },               
    {   
        header = "🍓 Prepare Strawberry Smoothie",
        txt = "<u>Ingredients Required:</u> <br> Strawberry, Smoothie Mix, Smoothie Cup",
        params = {
            event = "lusty94_icecream:client:PrepareStrawberrySmoothie",
        }
    },               
    {   
        header = "🌿 Prepare Mint Smoothie",
        txt = "<u>Ingredients Required:</u> <br> Mint, Smoothie Mix, Smoothie Cup",
        params = {
            event = "lusty94_icecream:client:PrepareMintSmoothie",
        }
    },               
    {   
        header = "🥜 Prepare Pistachio Smoothie",
        txt = "<u>Ingredients Required:</u> <br> Pistachio, Smoothie Mix, Smoothie Cup",
        params = {
            event = "lusty94_icecream:client:PreparePistachioSmoothie",
        }
    },               
    {   
        header = "🧈 Prepare Butter Scotch Smoothie",
        txt = "<u>Ingredients Required:</u> <br> Butter Scotch, Smoothie Mix, Smoothie Cup",
        params = {
            event = "lusty94_icecream:client:PrepareButterScotchSmoothie",
        }
    },               
    {   
        header = "🧂 Prepare Salted Caramel Smoothie",
        txt = "<u>Ingredients Required:</u> <br> Salted Caramel, Smoothie Mix, Smoothie Cup",
        params = {
            event = "lusty94_icecream:client:PrepareSaltedCaramelSmoothie",
        }
    },               
    {   
        header = "🫧 Prepare Bubblegum Smoothie",
        txt = "<u>Ingredients Required:</u> <br> Bubblegum, Smoothie Mix, Smoothie Cup",
        params = {
            event = "lusty94_icecream:client:PrepareBubblegumSmoothie",
        }
    },               
    {   
        header = "🍬 Prepare Toffee Smoothie",
        txt = "<u>Ingredients Required:</u> <br> Toffee, Smoothie Mix, Smoothie Cup",
        params = {
            event = "lusty94_icecream:client:PrepareToffeeSmoothie",
        }
    },               
    {   
        header = "🍪 Prepare Cookie Dough Smoothie",
        txt = "<u>Ingredients Required:</u> <br> Cookie Dough, Smoothie Mix, Smoothie Cup",
        params = {
            event = "lusty94_icecream:client:PrepareCookieDoughSmoothie",
        }
    },               
    {
        header = "< Close",
        txt = "",
        params = {
            event = "qb-menu:closeMenu",
        }
    },
}

lib.registerContext({
    id = 'SmoothieMenuIceCream',
    title = '🥤 Prepare Fresh Smoothies!',
    options = {
      {
        title = '🥤 Get Smoothie Cup',
        event = 'lusty94_icecream:client:GiveSmoothieCup',
        arrow = true,
      },
      {
        title = '🫘 Prepare Vanilla Smoothie',
        event = 'lusty94_icecream:client:PrepareVanillaSmoothie',
        arrow = true,
        metadata = {
            {label = 'Vanilla Required', value = 1},
            {label = 'Smoothie Mix Required', value = 1},
            {label = 'Smoothie Cup Required', value = 1},
          },
      },
      {
        title = '🍫 Prepare Chocolate Smoothie',
        event = 'lusty94_icecream:client:PrepareChocolateSmoothie',
        arrow = true,
        metadata = {
            {label = 'Chocolate Required', value = 1},
            {label = 'Smoothie Mix Required', value = 1},
            {label = 'Smoothie Cup Required', value = 1},
          },
      },
      {
        title = '🍓 Prepare Strawberry Smoothie',
        event = 'lusty94_icecream:client:PrepareStrawberrySmoothie',
        arrow = true,
        metadata = {
            {label = 'Strawberry Required', value = 1},
            {label = 'Smoothie Mix Required', value = 1},
            {label = 'Smoothie Cup Required', value = 1},
          },
      },
      {
        title = '🌿 Prepare Mint Smoothie', 
        event = 'lusty94_icecream:client:PrepareMintSmoothie',
        arrow = true,
        metadata = {
            {label = 'Mint Required', value = 1},
            {label = 'Smoothie Mix Required', value = 1},
            {label = 'Smoothie Cup Required', value = 1},
          },
      },
      {
        title = '🥜 Prepare Pistachio Smoothie', 
        event = 'lusty94_icecream:client:PreparePistachioSmoothie',
        arrow = true,
        metadata = {
            {label = 'Pistachio Required', value = 1},
            {label = 'Smoothie Mix Required', value = 1},
            {label = 'Smoothie Cup Required', value = 1},
          },
      },
      {
        title = '🧈 Prepare Butter Scotch Smoothie', 
        event = 'lusty94_icecream:client:PrepareButterScotchSmoothie',
        arrow = true,
        metadata = {
            {label = 'Butter Scotch Required', value = 1},
            {label = 'Smoothie Mix Required', value = 1},
            {label = 'Smoothie Cup Required', value = 1},
          },
      },
      {
        title = '🧂 Prepare Salted Caramel Smoothie', 
        event = 'lusty94_icecream:client:PrepareSaltedCaramelSmoothie',
        arrow = true,
        metadata = {
            {label = 'Salted Caramel Required', value = 1},
            {label = 'Smoothie Mix Required', value = 1},
            {label = 'Smoothie Cup Required', value = 1},
          },
      },
      {
        title = '🫧 Prepare Bubblegum Smoothie', 
        event = 'lusty94_icecream:client:PrepareBubblegumSmoothie',
        arrow = true,
        metadata = {
            {label = 'Bubblegum Required', value = 1},
            {label = 'Smoothie Mix Required', value = 1},
            {label = 'Smoothie Cup Required', value = 1},
          },
      },
      {
        title = '🍬 Prepare Toffee Smoothie', 
        event = 'lusty94_icecream:client:PrepareToffeeSmoothie',
        arrow = true,
        metadata = {
            {label = 'Toffee Required', value = 1},
            {label = 'Smoothie Mix Required', value = 1},
            {label = 'Smoothie Cup Required', value = 1},
          },
      },
      {
        title = '🍪 Prepare Cookie Dough Smoothie', 
        event = 'lusty94_icecream:client:PrepareCookieDoughSmoothie',
        arrow = true,
        metadata = {
            {label = 'Cookie Dough Required', value = 1},
            {label = 'Smoothie Mix Required', value = 1},
            {label = 'Smoothie Cup Required', value = 1},
          },
      },
      
    }
})


RegisterNetEvent('lusty94_icecream:client:SmoothieMenu', function()
    if MenuType == 'qb' then
        exports['qb-menu']:openMenu(SmoothieMenuIceCream)
    elseif MenuType == 'jixel' then
        exports['jixel-menu']:openMenu(SmoothieMenuIceCream)
    elseif MenuType == 'ox' then
        lib.showContext('SmoothieMenuIceCream')
    elseif MenuType == 'custom' then
        --insert custom menu code here
    end
end)
-------------------------------------------------------< SMOOTHIE MENU END >---------------------------------------------------




-------------------------------------------------------< HOT DRINKS MENU START >---------------------------------------------------
local HotDrinksMenuIceCream = {
    {
        header = "☕ Prepare Fresh Fruit Smoothies!",
        isMenuHeader = true,
    },  
    {   
        header = "☕ Get A Mug",
        params = {
            event = "lusty94_icecream:client:GiveMug",
        }
    },          
    {   
        header = "🍵 Prepare Cup of Tea",
        txt = "Mug Required",
        params = {
            event = "lusty94_icecream:client:PrepareTea",
        }
    },       
    {   
        header = "☕ Prepare Cup of Coffee",
        txt = "Mug Required",
        params = {
            event = "lusty94_icecream:client:PrepareCoffee",
        }
    },       
    {   
        header = "🍫 Prepare Cup of Hot Chocolate",
        txt = "Mug Required",
        params = {
            event = "lusty94_icecream:client:PrepareHotChocolate",
        }
    },       
    {
        header = "< Close",
        txt = "",
        params = {
            event = "qb-menu:closeMenu",
        }
    },
}

lib.registerContext({
    id = 'HotDrinksMenuIceCream',
    title = '☕ Prepare Hot Drinks!',
    options = {
      {
        title = '☕ Get A Mug',
        icon = 'mug-saucer',
        event = 'lusty94_icecream:client:GiveMug',
        arrow = true,
      },
      {
        title = '🍵 Prepare Cup of Tea', 
        event = 'lusty94_icecream:client:PrepareTea',
        description = 'Mug Required',
        arrow = true,
      },
      {
        title = '☕Prepare Cup of Coffee', 
        event = 'lusty94_icecream:client:PrepareCoffee',
        description = 'Mug Required',
        arrow = true,
      },
      {
        title = '🍫 Prepare Cup of Hot Chocolate', 
        event = 'lusty94_icecream:client:PrepareHotChocolate',
        description = 'Mug Required',
        arrow = true,
      },
    }
})


RegisterNetEvent('lusty94_icecream:client:HotDrinksMenu', function()
    if MenuType == 'qb' then
        exports['qb-menu']:openMenu(HotDrinksMenuIceCream)
    elseif MenuType == 'jixel' then
        exports['jixel-menu']:openMenu(HotDrinksMenuIceCream)
    elseif MenuType == 'boii' then
        exports['boii_ui']:open_menu('default', HotDrinksMenu)
    elseif MenuType == 'ox' then
        lib.showContext('HotDrinksMenu')
    elseif MenuType == 'custom' then
        --insert custom menu code here
    end
end)
-------------------------------------------------------< HOT DRINKS MENU END >---------------------------------------------------




-------------------------------------------------------< HOT DRINKS MENU START >---------------------------------------------------
local SoftDrinksMenuIceCream = {
    {
        header = "🥤 Prepare Soft Drinks!",
        isMenuHeader = true,
    },  
    {   
        header = "🥤 Get A Soft Drinks Cup",
        params = {
            event = "lusty94_icecream:client:GiveSoftDrinksCup",
        }
    },          
    {   
        header = "🥤 Prepare Cup of Cola",
        txt = "Soft Drinks Cup Required",
        params = {
            event = "lusty94_icecream:client:PrepareCola",
        }
    },       
    {   
        header = "🍋 Prepare Cup of Lemonade",
        txt = "Soft Drinks Cup Required",
        params = {
            event = "lusty94_icecream:client:PrepareLemonade",
        }
    },       
    {   
        header = "🍊 Prepare Cup of Orange Soda",
        txt = "Soft Drinks Cup Required",
        params = {
            event = "lusty94_icecream:client:PrepareOrangeSoda",
        }
    },       
    {
        header = "< Close",
        txt = "",
        params = {
            event = "qb-menu:closeMenu",
        }
    },
}

lib.registerContext({
    id = 'SoftDrinksMenuIceCream',
    title = '🥤 Prepare Soft Drinks!',
    options = {
      {
        title = '🥤 Get A Soft Drinks Cup', 
        event = 'lusty94_icecream:client:GiveSoftDrinksCup',
        arrow = true,
      },
      {
        title = '🥤 Prepare Cup of Cola', 
        event = 'lusty94_icecream:client:PrepareCola',
        description = 'Soft Drinks Cup Required',
        arrow = true,
      },
      {
        title = '🍋 Prepare Cup of Lemonade', 
        event = 'lusty94_icecream:client:PrepareLemonade',
        description = 'Soft Drinks Cup Required',
        arrow = true,
      },
      {
        title = '🍊 Prepare Cup of Orange Soda', 
        event = 'lusty94_icecream:client:PrepareOrangeSoda',
        description = 'Soft Drinks Cup Required',
        arrow = true,
      },
    }
})


RegisterNetEvent('lusty94_icecream:client:SoftDrinksMenu', function()
    if MenuType == 'qb' then
        exports['qb-menu']:openMenu(SoftDrinksMenuIceCream)
    elseif MenuType == 'jixel' then
        exports['jixel-menu']:openMenu(SoftDrinksMenuIceCream)
    elseif MenuType == 'ox' then
        lib.showContext('SoftDrinksMenuIceCream')
    elseif MenuType == 'custom' then
        --insert custom menu code here
    end
end)
-------------------------------------------------------< HOT DRINKS MENU END >---------------------------------------------------



-------------------------------------------------------< HOT DRINKS MENU START >---------------------------------------------------
local IceCreamMenu = {
    {
        header = "🍦 Prepare Fresh Ice Cream!",
        isMenuHeader = true,
    },          
    {   
        header = "🍦 Get Ice Cream Cones",
        params = {
            event = "lusty94_icecream:client:GiveIceCreamCones",
        }
    },          
    {   
        header = "🫘 Prepare Vanilla Ice Cream",
        txt = "<u>Ingredients Required:</u> <br> Vanilla, Soft Scoop Mix, Ice Cream Cone",
        params = {
            event = "lusty94_icecream:client:PrepareVanillaIceCream",
        }
    },          
    {   
        header = "🍫Prepare Chocolate Ice Cream",
        txt = "<u>Ingredients Required:</u> <br> Chocolate, Soft Scoop Mix, Ice Cream Cone",
        params = {
            event = "lusty94_icecream:client:PrepareChocolateIceCream",
        }
    },          
    {   
        header = "🍓Prepare Strawberry Ice Cream",
        txt = "<u>Ingredients Required:</u> <br> Strawberry, Soft Scoop Mix, Ice Cream Cone",
        params = {
            event = "lusty94_icecream:client:PrepareStrawberryIceCream",
        }
    },          
    {   
        header = "🌿 Prepare Mint Ice Cream",
        txt = "<u>Ingredients Required:</u> <br> Mint, Soft Scoop Mix, Ice Cream Cone",
        params = {
            event = "lusty94_icecream:client:PrepareMintIceCream",
        }
    },          
    {   
        header = "🥜 Prepare Pistachio Ice Cream",
        txt = "<u>Ingredients Required:</u> <br> Pistachio, Soft Scoop Mix, Ice Cream Cone",
        params = {
            event = "lusty94_icecream:client:PreparePistachioIceCream",
        }
    },          
    {   
        header = "🧈 Prepare Butter Scotch Ice Cream",
        txt = "<u>Ingredients Required:</u> <br> Butter Scotch, Soft Scoop Mix, Ice Cream Cone",
        params = {
            event = "lusty94_icecream:client:PrepareButterScotchIceCream",
        }
    },          
    {   
        header = "🧂 Prepare Salted Caramel Ice Cream",
        txt = "<u>Ingredients Required:</u> <br> Salted Caramel, Soft Scoop Mix, Ice Cream Cone",
        params = {
            event = "lusty94_icecream:client:PrepareSaltedCaramelIceCream",
        }
    },          
    {   
        header = "🫧 Prepare Bubblegum Ice Cream",
        txt = "<u>Ingredients Required:</u> <br> Bubblegum, Soft Scoop Mix, Ice Cream Cone",
        params = {
            event = "lusty94_icecream:client:PrepareBubblegumIceCream",
        }
    },          
    {   
        header = "🍬 Prepare Toffee Ice Cream",
        txt = "<u>Ingredients Required:</u> <br> Toffee, Soft Scoop Mix, Ice Cream Cone",
        params = {
            event = "lusty94_icecream:client:PrepareToffeeIceCream",
        }
    },          
    {   
        header = "🍪 Prepare Cookie Dough Ice Cream",
        txt = "<u>Ingredients Required:</u> <br> Cookie Dough, Soft Scoop Mix, Ice Cream Cone",
        params = {
            event = "lusty94_icecream:client:PrepareCookieDoughIceCream",
        }
    },          
    {
        header = "< Close",
        txt = "",
        params = {
            event = "qb-menu:closeMenu",
        }
    },
}

lib.registerContext({
    id = 'IceCreamMenu',
    title = '🍦 Prepare Fresh Ice Cream!',
    options = {
        {
            title = '🍦 Get Ice Cream Cones',
            event = 'lusty94_icecream:client:GiveIceCreamCones',
            arrow = true,
          },
      {
        title = '🫘 Prepare Vanilla Ice Cream',
        event = 'lusty94_icecream:client:PrepareVanillaIceCream',
        metadata = {
            {label = 'Vanilla Required', value = 1},
            {label = 'Soft Scoop Mix Required', value = 1},
            {label = 'Ice Cream Cone Required', value = 1},
          },
        arrow = true,
      },     
      {
        title = '🍫 Prepare Chocolate Ice Cream',
        event = 'lusty94_icecream:client:PrepareChocolateIceCream',
        metadata = {
            {label = 'Chocolate Required', value = 1},
            {label = 'Soft Scoop Mix Required', value = 1},
            {label = 'Ice Cream Cone Required', value = 1},
          },
        arrow = true,
      },     
      {
        title = '🍓 Prepare Strawberry Ice Cream',
        event = 'lusty94_icecream:client:PrepareStrawberryIceCream',
        metadata = {
            {label = 'Strawberry Required', value = 1},
            {label = 'Soft Scoop Mix Required', value = 1},
            {label = 'Ice Cream Cone Required', value = 1},
          },
        arrow = true,
      },     
      {
        title = '🌿 Prepare Mint Ice Cream',
        event = 'lusty94_icecream:client:PrepareMintIceCream',
        metadata = {
            {label = 'Mint Required', value = 1},
            {label = 'Soft Scoop Mix Required', value = 1},
            {label = 'Ice Cream Cone Required', value = 1},
          },
        arrow = true,
      },     
      {
        title = '🥜 Prepare Pistachio Ice Cream',
        event = 'lusty94_icecream:client:PreparePistachioIceCream',
        metadata = {
            {label = 'Pistachio Required', value = 1},
            {label = 'Soft Scoop Mix Required', value = 1},
            {label = 'Ice Cream Cone Required', value = 1},
          },
        arrow = true,
      },     
      {
        title = '🧈 Prepare Butter Scotch Ice Cream',
        event = 'lusty94_icecream:client:PrepareButterScotchIceCream',
        metadata = {
            {label = 'Butter Scotch Required', value = 1},
            {label = 'Soft Scoop Mix Required', value = 1},
            {label = 'Ice Cream Cone Required', value = 1},
          },
        arrow = true,
      },     
      {
        title = '🧂 Prepare Salted Caramel Ice Cream',
        event = 'lusty94_icecream:client:PrepareSaltedCaramelIceCream',
        metadata = {
            {label = 'Salted Caramel Required', value = 1},
            {label = 'Soft Scoop Mix Required', value = 1},
            {label = 'Ice Cream Cone Required', value = 1},
          },
        arrow = true,
      },     
      {
        title = '🫧 Prepare Bubblegum Ice Cream',
        event = 'lusty94_icecream:client:PrepareBubblegumIceCream',
        metadata = {
            {label = 'Bubblegum Required', value = 1},
            {label = 'Soft Scoop Mix Required', value = 1},
            {label = 'Ice Cream Cone Required', value = 1},
          },
        arrow = true,
      },     
      {
        title = '🍬 Prepare Toffee Ice Cream',
        event = 'lusty94_icecream:client:PrepareToffeeIceCream',
        metadata = {
            {label = 'Toffee Required', value = 1},
            {label = 'Soft Scoop Mix Required', value = 1},
            {label = 'Ice Cream Cone Required', value = 1},
          },
        arrow = true,
      },     
      {
        title = '🍪 Prepare Cookie Dough Ice Cream',
        event = 'lusty94_icecream:client:PrepareCookieDoughIceCream',
        metadata = {
            {label = 'Cookie Dough Required', value = 1},
            {label = 'Soft Scoop Mix Required', value = 1},
            {label = 'Ice Cream Cone Required', value = 1},
          },
        arrow = true,
      },     
    }
})


RegisterNetEvent('lusty94_icecream:client:IceCreamMenu', function()
    if MenuType == 'qb' then
        exports['qb-menu']:openMenu(IceCreamMenu)
    elseif MenuType == 'jixel' then
        exports['jixel-menu']:openMenu(IceCreamMenu)
    elseif MenuType == 'ox' then
        lib.showContext('IceCreamMenu')
    elseif MenuType == 'custom' then
        --insert custom menu code here
    end
end)
-------------------------------------------------------< HOT DRINKS MENU END >---------------------------------------------------



