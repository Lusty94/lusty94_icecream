local QBCore = exports['qb-core']:GetCoreObject()



--Give Smoothie Cup
RegisterNetEvent('lusty94_icecream:server:GiveSmoothieCup', function(amount)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)        
        Player.Functions.AddItem("smoothiecup", amount)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["smoothiecup"], "add")
end)


--Give Mug
RegisterNetEvent('lusty94_icecream:server:GiveMug', function(amount)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)        
        Player.Functions.AddItem("mug", amount)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["mug"], "add")
end)


--Give Soft Drinks Cup
RegisterNetEvent('lusty94_icecream:server:GiveSoftDrinksCup', function(amount)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)        
        Player.Functions.AddItem("softdrinkscup", amount)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["softdrinkscup"], "add")
end)


--Give Ice Cream Cone
RegisterNetEvent('lusty94_icecream:server:GiveIceCreamCones', function(amount)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)        
        Player.Functions.AddItem("icecreamcone", amount)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["icecreamcone"], "add")
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

        Player.Functions.RemoveItem("smoothiecup", 1)
            TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["smoothiecup"], "remove")
        Player.Functions.RemoveItem("vanilla", 1)
            TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["vanilla"], "remove")
        Player.Functions.RemoveItem("smoothiemix", 1)
            TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["smoothiemix"], "remove")
            
        Player.Functions.AddItem("vanillasmoothie", 1)
            TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["vanillasmoothie"], "add")
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

        Player.Functions.RemoveItem("smoothiecup", 1)
            TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["smoothiecup"], "remove")
        Player.Functions.RemoveItem("chocolate", 1)
            TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["chocolate"], "remove")
        Player.Functions.RemoveItem("smoothiemix", 1)
            TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["smoothiemix"], "remove")
            
        Player.Functions.AddItem("chocolatesmoothie", 1)
            TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["chocolatesmoothie"], "add")
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

        Player.Functions.RemoveItem("smoothiecup", 1)
            TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["smoothiecup"], "remove")
        Player.Functions.RemoveItem("strawberry", 1)
            TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["strawberry"], "remove")
        Player.Functions.RemoveItem("smoothiemix", 1)
            TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["smoothiemix"], "remove")
            
        Player.Functions.AddItem("strawberrysmoothie", 1)
            TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["strawberrysmoothie"], "add")
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

        Player.Functions.RemoveItem("smoothiecup", 1)
            TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["smoothiecup"], "remove")
        Player.Functions.RemoveItem("mint", 1)
            TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["mint"], "remove")
        Player.Functions.RemoveItem("smoothiemix", 1)
            TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["smoothiemix"], "remove")
            
        Player.Functions.AddItem("mintsmoothie", 1)
            TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["mintsmoothie"], "add")
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

        Player.Functions.RemoveItem("smoothiecup", 1)
            TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["smoothiecup"], "remove")
        Player.Functions.RemoveItem("pistachio", 1)
            TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["pistachio"], "remove")
        Player.Functions.RemoveItem("smoothiemix", 1)
            TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["smoothiemix"], "remove")
            
        Player.Functions.AddItem("pistachiosmoothie", 1)
            TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["pistachiosmoothie"], "add")
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

        Player.Functions.RemoveItem("smoothiecup", 1)
            TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["smoothiecup"], "remove")
        Player.Functions.RemoveItem("butterscotch", 1)
            TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["butterscotch"], "remove")
        Player.Functions.RemoveItem("smoothiemix", 1)
            TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["smoothiemix"], "remove")
            
        Player.Functions.AddItem("butterscotchsmoothie", 1)
            TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["butterscotchsmoothie"], "add")
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

        Player.Functions.RemoveItem("smoothiecup", 1)
            TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["smoothiecup"], "remove")
        Player.Functions.RemoveItem("saltedcaramel", 1)
            TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["saltedcaramel"], "remove")
        Player.Functions.RemoveItem("smoothiemix", 1)
            TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["smoothiemix"], "remove")
            
        Player.Functions.AddItem("saltedcaramelsmoothie", 1)
            TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["saltedcaramelsmoothie"], "add")
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

        Player.Functions.RemoveItem("smoothiecup", 1)
            TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["smoothiecup"], "remove")
        Player.Functions.RemoveItem("bubblegum", 1)
            TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["bubblegum"], "remove")
        Player.Functions.RemoveItem("smoothiemix", 1)
            TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["smoothiemix"], "remove")
            
        Player.Functions.AddItem("bubblegumsmoothie", 1)
            TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["bubblegumsmoothie"], "add")
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

        Player.Functions.RemoveItem("smoothiecup", 1)
            TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["smoothiecup"], "remove")
        Player.Functions.RemoveItem("toffee", 1)
            TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["toffee"], "remove")
        Player.Functions.RemoveItem("smoothiemix", 1)
            TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["smoothiemix"], "remove")
            
        Player.Functions.AddItem("toffeesmoothie", 1)
            TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["toffeesmoothie"], "add")
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

        Player.Functions.RemoveItem("smoothiecup", 1)
            TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["smoothiecup"], "remove")
        Player.Functions.RemoveItem("cookiedough", 1)
            TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["cookiedough"], "remove")
        Player.Functions.RemoveItem("smoothiemix", 1)
            TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["smoothiemix"], "remove")
            
        Player.Functions.AddItem("cookiedoughsmoothie", 1)
            TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["cookiedoughsmoothie"], "add")
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

        Player.Functions.RemoveItem("mug", 1)
            TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["mug"], "remove")
            
        Player.Functions.AddItem("tea", 1)
            TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["tea"], "add")
end)

--Create Coffee
RegisterNetEvent('lusty94_icecream:server:CreateCoffee', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

        Player.Functions.RemoveItem("mug", 1)
            TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["mug"], "remove")
            
        Player.Functions.AddItem("coffee", 1)
            TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["coffee"], "add")
end)

--Create Hot Chocolate
RegisterNetEvent('lusty94_icecream:server:CreateHotChocolate', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

        Player.Functions.RemoveItem("mug", 1)
            TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["mug"], "remove")
            
        Player.Functions.AddItem("hotchocolate", 1)
            TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["hotchocolate"], "add")
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

        Player.Functions.RemoveItem("softdrinkscup", 1)
            TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["softdrinkscup"], "remove")
            
        Player.Functions.AddItem("cola", 1)
            TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["cola"], "add")
end)

--Create Lemonade
RegisterNetEvent('lusty94_icecream:server:CreateLemonade', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

        Player.Functions.RemoveItem("softdrinkscup", 1)
            TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["softdrinkscup"], "remove")
            
        Player.Functions.AddItem("lemonade", 1)
            TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["lemonade"], "add")
end)

--Create Orange Soda
RegisterNetEvent('lusty94_icecream:server:CreateOrangeSoda', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

        Player.Functions.RemoveItem("softdrinkscup", 1)
            TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["softdrinkscup"], "remove")
            
        Player.Functions.AddItem("orangesoda", 1)
            TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["orangesoda"], "add")
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

        Player.Functions.RemoveItem("icecreamcone", 1)
            TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["icecreamcone"], "remove")
        Player.Functions.RemoveItem("vanilla", 1)
            TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["vanilla"], "remove")
        Player.Functions.RemoveItem("softscoopmix", 1)
            TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["softscoopmix"], "remove")
            
        Player.Functions.AddItem("vanillaicecream", 1)
            TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["vanillaicecream"], "add")
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

        Player.Functions.RemoveItem("icecreamcone", 1)
            TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["icecreamcone"], "remove")
        Player.Functions.RemoveItem("chocolate", 1)
            TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["chocolate"], "remove")
        Player.Functions.RemoveItem("softscoopmix", 1)
            TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["softscoopmix"], "remove")
            
        Player.Functions.AddItem("chocolateicecream", 1)
            TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["chocolateicecream"], "add")
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

        Player.Functions.RemoveItem("icecreamcone", 1)
            TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["icecreamcone"], "remove")
        Player.Functions.RemoveItem("strawberry", 1)
            TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["strawberry"], "remove")
        Player.Functions.RemoveItem("softscoopmix", 1)
            TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["softscoopmix"], "remove")
            
        Player.Functions.AddItem("strawberryicecream", 1)
            TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["strawberryicecream"], "add")
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

        Player.Functions.RemoveItem("icecreamcone", 1)
            TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["icecreamcone"], "remove")
        Player.Functions.RemoveItem("mint", 1)
            TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["mint"], "remove")
        Player.Functions.RemoveItem("softscoopmix", 1)
            TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["softscoopmix"], "remove")
            
        Player.Functions.AddItem("minticecream", 1)
            TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["minticecream"], "add")
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

        Player.Functions.RemoveItem("icecreamcone", 1)
            TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["icecreamcone"], "remove")
        Player.Functions.RemoveItem("pistachio", 1)
            TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["pistachio"], "remove")
        Player.Functions.RemoveItem("softscoopmix", 1)
            TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["softscoopmix"], "remove")
            
        Player.Functions.AddItem("pistachioicecream", 1)
            TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["pistachioicecream"], "add")
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

        Player.Functions.RemoveItem("icecreamcone", 1)
            TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["icecreamcone"], "remove")
        Player.Functions.RemoveItem("butterscotch", 1)
            TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["butterscotch"], "remove")
        Player.Functions.RemoveItem("softscoopmix", 1)
            TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["softscoopmix"], "remove")
            
        Player.Functions.AddItem("butterscotchicecream", 1)
            TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["butterscotchicecream"], "add")
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

        Player.Functions.RemoveItem("icecreamcone", 1)
            TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["icecreamcone"], "remove")
        Player.Functions.RemoveItem("saltedcaramel", 1)
            TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["saltedcaramel"], "remove")
        Player.Functions.RemoveItem("softscoopmix", 1)
            TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["softscoopmix"], "remove")
            
        Player.Functions.AddItem("saltedcaramelicecream", 1)
            TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["saltedcaramelicecream"], "add")
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

        Player.Functions.RemoveItem("icecreamcone", 1)
            TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["icecreamcone"], "remove")
        Player.Functions.RemoveItem("bubblegum", 1)
            TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["bubblegum"], "remove")
        Player.Functions.RemoveItem("softscoopmix", 1)
            TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["softscoopmix"], "remove")
            
        Player.Functions.AddItem("bubblegumicecream", 1)
            TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["bubblegumicecream"], "add")
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

        Player.Functions.RemoveItem("icecreamcone", 1)
            TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["icecreamcone"], "remove")
        Player.Functions.RemoveItem("toffee", 1)
            TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["toffee"], "remove")
        Player.Functions.RemoveItem("softscoopmix", 1)
            TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["softscoopmix"], "remove")
            
        Player.Functions.AddItem("toffeeicecream", 1)
            TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["toffeeicecream"], "add")
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

        Player.Functions.RemoveItem("icecreamcone", 1)
            TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["icecreamcone"], "remove")
        Player.Functions.RemoveItem("cookiedough", 1)
            TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["cookiedough"], "remove")
        Player.Functions.RemoveItem("softscoopmix", 1)
            TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["softscoopmix"], "remove")
            
        Player.Functions.AddItem("cookiedoughicecream", 1)
            TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["cookiedoughicecream"], "add")
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

else
    print("Lusty94_IceCream - Config.UseJimConsumables is set to FALSE - Make sure you add them to your own consumables script.")
end


