
--smoothies
lib.registerContext({
    id = 'SmoothieMenuIceCream',
    title = '🥤 Prepare Fresh Smoothies!',
    options = {
      {
        title = 'Get Smoothie Cup',
        event = 'lusty94_icecream:client:GiveSmoothieCup',
        arrow = true,
        icon = ItemImage('smoothiecup'),
        image = ItemImage('smoothiecup'),
      },
      {
        title = 'Prepare Vanilla Smoothie',
        event = 'lusty94_icecream:client:PrepareVanillaSmoothie',
        arrow = true,
        description = 'Ingredients Required: \n Vanilla \n Smoothie Mix \n Smoothie Cup',
        icon = ItemImage('vanillasmoothie'),
        image = ItemImage('vanillasmoothie'),
      },
      {
        title = 'Prepare Chocolate Smoothie',
        event = 'lusty94_icecream:client:PrepareChocolateSmoothie',
        arrow = true,
        description = 'Ingredients Required: \n Chocolate \n Smoothie Mix \n Smoothie Cup',
        icon = ItemImage('chocolatesmoothie'),
        image = ItemImage('chocolatesmoothie'),
      },
      {
        title = 'Prepare Strawberry Smoothie',
        event = 'lusty94_icecream:client:PrepareStrawberrySmoothie',
        arrow = true,
        description = 'Ingredients Required: \n Strawberry \n Smoothie Mix \n Smoothie Cup',
        icon = ItemImage('strawberrysmoothie'),
        image = ItemImage('strawberrysmoothie'),
      },
      {
        title = 'Prepare Mint Smoothie', 
        event = 'lusty94_icecream:client:PrepareMintSmoothie',
        arrow = true,
        description = 'Ingredients Required: \n Mint \n Smoothie Mix \n Smoothie Cup',
        icon = ItemImage('mintsmoothie'),
        image = ItemImage('mintsmoothie'),
      },
      {
        title = 'Prepare Pistachio Smoothie', 
        event = 'lusty94_icecream:client:PreparePistachioSmoothie',
        arrow = true,
        description = 'Ingredients Required: \n Pistachio \n Smoothie Mix \n Smoothie Cup',
        icon = ItemImage('pistachiosmoothie'),
        image = ItemImage('pistachiosmoothie'),
      },
      {
        title = 'Prepare Butter Scotch Smoothie', 
        event = 'lusty94_icecream:client:PrepareButterScotchSmoothie',
        arrow = true,
        description = 'Ingredients Required: \n Butterscotch \n Smoothie Mix \n Smoothie Cup',
        icon = ItemImage('butterscotchsmoothie'),
        image = ItemImage('butterscotchsmoothie'),
      },
      {
        title = 'Prepare Salted Caramel Smoothie', 
        event = 'lusty94_icecream:client:PrepareSaltedCaramelSmoothie',
        arrow = true,
        description = 'Ingredients Required: \n Salted Caramel \n Smoothie Mix \n Smoothie Cup',
        icon = ItemImage('saltedcaramelsmoothie'),
        image = ItemImage('saltedcaramelsmoothie'),
      },
      {
        title = 'Prepare Bubblegum Smoothie', 
        event = 'lusty94_icecream:client:PrepareBubblegumSmoothie',
        arrow = true,
        description = 'Ingredients Required: \n Bubblegum \n Smoothie Mix \n Smoothie Cup',
        icon = ItemImage('bubblegumsmoothie'),
        image = ItemImage('bubblegumsmoothie'),
      },
      {
        title = 'Prepare Toffee Smoothie', 
        event = 'lusty94_icecream:client:PrepareToffeeSmoothie',
        arrow = true,
        description = 'Ingredients Required: \n Toffee \n Smoothie Mix \n Smoothie Cup',
        icon = ItemImage('toffeesmoothie'),
        image = ItemImage('toffeesmoothie'),
      },
      {
        title = 'Prepare Cookie Dough Smoothie', 
        event = 'lusty94_icecream:client:PrepareCookieDoughSmoothie',
        arrow = true,
        description = 'Ingredients Required: \n Cookie Dough \n Smoothie Mix \n Smoothie Cup',
        icon = ItemImage('cookiedoughsmoothie'),
        image = ItemImage('cookiedoughsmoothie'),
      },
      
    }
})


--hot drinks
lib.registerContext({
    id = 'HotDrinksMenuIceCream',
    title = '☕ Prepare Hot Drinks!',
    options = {
      {
        title = 'Get A Mug',
        event = 'lusty94_icecream:client:GiveMug',
        arrow = true,
        icon = ItemImage('mug'),
        image = ItemImage('mug'),
      },
      {
        title = 'Prepare Cup of Tea', 
        event = 'lusty94_icecream:client:PrepareTea',
        arrow = true,
        description = 'Mug Required',
        icon = ItemImage('tea'),
        image = ItemImage('tea'),
      },
      {
        title = 'Prepare Cup of Coffee', 
        event = 'lusty94_icecream:client:PrepareCoffee',
        arrow = true,
        description = 'Mug Required',
        icon = ItemImage('coffee'),
        image = ItemImage('coffee'),        
      },
      {
        title = 'Prepare Cup of Hot Chocolate', 
        event = 'lusty94_icecream:client:PrepareHotChocolate',
        arrow = true,
        description = 'Mug Required',
        icon = ItemImage('hotchocolate'),
        image = ItemImage('hotchocolate'),        
      },
    }
})


--soft drinks
lib.registerContext({
    id = 'SoftDrinksMenuIceCream',
    title = '🥤 Prepare Soft Drinks!',
    options = {
      {
        title = 'Get A Soft Drinks Cup', 
        event = 'lusty94_icecream:client:GiveSoftDrinksCup',
        arrow = true,
        icon = ItemImage('softdrinkscup'),
        image = ItemImage('softdrinkscup'),
      },
      {
        title = 'Prepare Cup of Cola', 
        event = 'lusty94_icecream:client:PrepareCola',
        arrow = true,
        description = 'Soft Drinks Cup Required',
        icon = ItemImage('cola'),
        image = ItemImage('cola'),
      },
      {
        title = 'Prepare Cup of Lemonade', 
        event = 'lusty94_icecream:client:PrepareLemonade',
        arrow = true,
        description = 'Soft Drinks Cup Required',
        icon = ItemImage('lemonade'),
        image = ItemImage('lemonade'),
      },
      {
        title = 'Prepare Cup of Orange Soda', 
        event = 'lusty94_icecream:client:PrepareOrangeSoda',
        arrow = true,
        description = 'Soft Drinks Cup Required',
        icon = ItemImage('orangesoda'),
        image = ItemImage('orangesoda'),
      },
    }
})



--ice creams
lib.registerContext({
    id = 'IceCreamMenu',
    title = '🍦 Prepare Fresh Ice Cream!',
    options = {
        {
            title = 'Get Ice Cream Cones',
            event = 'lusty94_icecream:client:GiveIceCreamCones',
            arrow = true,
            icon = ItemImage('icecreamcone'),
            image = ItemImage('icecreamcone'),
        },
        {
            title = 'Prepare Vanilla Ice Cream',
            event = 'lusty94_icecream:client:PrepareVanillaIceCream',
            description = 'Ingredients Required: \n Vanilla \n Soft Scoop Mix \n Ice Cream Cone',
            icon = ItemImage('vanillaicecream'),
            image = ItemImage('vanillaicecream'),
            arrow = true,
        },     
        {
            title = 'Prepare Chocolate Ice Cream',
            event = 'lusty94_icecream:client:PrepareChocolateIceCream',
            description = 'Ingredients Required: \n Chocolate \n Soft Scoop Mix \n Ice Cream Cone',
            icon = ItemImage('chocolateicecream'),
            image = ItemImage('chocolateicecream'),
            arrow = true,
        },     
        {
            title = 'Prepare Strawberry Ice Cream',
            event = 'lusty94_icecream:client:PrepareStrawberryIceCream',
            description = 'Ingredients Required: \n Strawberry \n Soft Scoop Mix \n Ice Cream Cone',
            icon = ItemImage('strawberryicecream'),
            image = ItemImage('strawberryicecream'),
            arrow = true,
        },     
        {
            title = 'Prepare Mint Ice Cream',
            event = 'lusty94_icecream:client:PrepareMintIceCream',
            description = 'Ingredients Required: \n Mint \n Soft Scoop Mix \n Ice Cream Cone',
            icon = ItemImage('minticecream'),
            image = ItemImage('minticecream'),
            arrow = true,
        },     
        {
            title = 'Prepare Pistachio Ice Cream',
            event = 'lusty94_icecream:client:PreparePistachioIceCream',
            description = 'Ingredients Required: \n Pistachio \n Soft Scoop Mix \n Ice Cream Cone',
            icon = ItemImage('pistachioicecream'),
            image = ItemImage('pistachioicecream'),
            arrow = true,
        },     
        {
            title = 'Prepare Butter Scotch Ice Cream',
            event = 'lusty94_icecream:client:PrepareButterScotchIceCream',
            description = 'Ingredients Required: \n Butter Scotch \n Soft Scoop Mix \n Ice Cream Cone',
            icon = ItemImage('butterscotchicecream'),
            image = ItemImage('butterscotchicecream'),
            arrow = true,
        },     
        {
            title = 'Prepare Salted Caramel Ice Cream',
            event = 'lusty94_icecream:client:PrepareSaltedCaramelIceCream',
            description = 'Ingredients Required: \n Salted Caramel \n Soft Scoop Mix \n Ice Cream Cone',
            icon = ItemImage('saltedcaramelicecream'),
            image = ItemImage('saltedcaramelicecream'),
            arrow = true,
        },     
        {
            title = 'Prepare Bubblegum Ice Cream',
            event = 'lusty94_icecream:client:PrepareBubblegumIceCream',
            description = 'Ingredients Required: \n Bubblegum \n Soft Scoop Mix \n Ice Cream Cone',
            icon = ItemImage('bubblegumicecream'),
            image = ItemImage('bubblegumicecream'),
            arrow = true,
        },     
        {
            title = 'Prepare Toffee Ice Cream',
            event = 'lusty94_icecream:client:PrepareToffeeIceCream',
            description = 'Ingredients Required: \n Toffee \n Soft Scoop Mix \n Ice Cream Cone',
            icon = ItemImage('toffeeicecream'),
            image = ItemImage('toffeeicecream'),
            arrow = true,
        },     
        {
            title = 'Prepare Cookie Dough Ice Cream',
            event = 'lusty94_icecream:client:PrepareCookieDoughIceCream',
            description = 'Ingredients Required: \n Cookie Dough \n Soft Scoop Mix \n Ice Cream Cone',
            icon = ItemImage('cookiedoughicecream'),
            image = ItemImage('cookiedoughicecream'),
            arrow = true,
        },     
    }
})



------------------------------< EVENTS >--------------------------

RegisterNetEvent('lusty94_icecream:client:SmoothieMenu', function()
    lib.showContext('SmoothieMenuIceCream')
end)

RegisterNetEvent('lusty94_icecream:client:SoftDrinksMenu', function()
    lib.showContext('SoftDrinksMenuIceCream')
end)

RegisterNetEvent('lusty94_icecream:client:HotDrinksMenu', function()
    lib.showContext('HotDrinksMenuIceCream')
end)

RegisterNetEvent('lusty94_icecream:client:IceCreamMenu', function()
    lib.showContext('IceCreamMenu')
end)