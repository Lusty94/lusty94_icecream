## Lusty94_IceCream


<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

PLEASE MAKE SURE TO READ THIS ENTIRE FILE AS IT COVERS SOME IMPORTANT INFORMATION

<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>


======================================
SCRIPT SUPPORT VIA DISCORD: https://discord.gg/BJGFrThmA8
======================================



## Features

- Create 10 different flavours of smoothie
- Create 10 different flavours of ice cream
- Create soft drinks
- Create hot drinks
- Management menu system to hire / fire employees & much more
- Payment till charge customers for orders
- Clothing lockers to change outfits
- Custom sounds when performing certain actions such as making smoothies and ice creams [REQUIRES_INTERACT_SOUND]
- Extensive config file
- Support for [ANY] MLO or building - moveable target locations via config file




## DEPENDENCIES

- [Polar Ice MLO](https://forum.cfx.re/t/free-polar-ice-mlo/5166033)
- [qb-core](https://github.com/qbcore-framework/qb-core)
- [qb-target](https://github.com/qbcore-framework/qb-target)
- [qb-inventory](https://github.com/qbcore-framework/qb-inventory)
- [ox_lib](https://github.com/overextended/ox_lib/releases/)
- [jim-consumables](https://github.com/jimathy/jim-consumables)
- [ps-ui](https://github.com/Project-Sloth/ps-ui)





## INSTALLATION


- Add the ##ITEMS snippet below into your core/shared/items.lua file - ox_inventory users add the items to inventory/data/items.lua
- Add all .png images inside [images] folder into your inventory/html/images folder - ox_inventory users place images inside inventory/web/images
- Add the ##JOB snippet below to your core/shared/jobs.lua
- Add all .ogg files inside [interact-sounds] folder into your interact-sound/client/sounds folder



## OX INVENTORY USERS
- items list is at the bottom of this file under ##OX_INVENTORY ITEMS
- this resource creates shops and stashes automatically, to change item names or prices / stash weight or slots edit the respective function in icecream_server.lua



## INTERACT SOUND

- If set to true in the config then this script uses custom sounds that need to be placed inside of interact-sound resource
- Place ALL .ogg files inside [sounds] folder into your interact-sound/client/html/sounds folder
- Interact sound must be started BEFORE this resource in order to work correctly


## CONSUMABLES

- Set Config.UseJimConsumables to true to enable jim-consumables to handle the useable food and drink items - if getting any issues perhaps set to false and add item names to jim-consuambles itself - if missing any props this is likely due to missing files in your emotes folder

- Make sure jim-consumables starts before this resource as per any dependency


## JOB

```

    icecream = {
		label = 'Polar Ice Cream',
		defaultDuty = false,
		offDutyPay = false,
		grades = {
            ['0'] = { name = 'Kitchen Porter', payment = 25 },
            ['1'] = { name = 'Team Member', payment = 50 },
            ['2'] = { name = 'Sales Manager', payment = 75 },
            ['3'] = { name = 'Shop Manager', isboss= true, payment = 100 },
        },
	},

```



## QB-CORE ITEMS

```

    --ICE CREAM
        smoothiecup 			                    = {name = 'smoothiecup', 			 	  	  	    label = 'Smoothie Cup', 		            weight = 200, 		type = 'item', 					image = 'smoothiecup.png', 				            unique = false, 	    useable = true, 	shouldClose = true,   combinable = nil,   description = 'Smoothie Cup'},
        softdrinkscup 			                    = {name = 'softdrinkscup', 			 	  	  	    label = 'Soft Drinks Cup', 		            weight = 200, 		type = 'item', 					image = 'softdrinkscup.png', 				        unique = false, 	    useable = true, 	shouldClose = true,   combinable = nil,   description = 'Soft Drinks Cup'},
        mug 			                            = {name = 'mug', 			 	  	  	            label = 'Mug', 		                        weight = 200, 		type = 'item', 					image = 'mug.png', 				                    unique = false, 	    useable = true, 	shouldClose = true,   combinable = nil,   description = 'Mug'},
        icecreamcone 			                    = {name = 'icecreamcone', 			 	  	  	    label = 'Ice Cream Cone', 		            weight = 200, 		type = 'item', 					image = 'icecreamcone.png', 				        unique = false, 	    useable = true, 	shouldClose = true,   combinable = nil,   description = 'Ice Cream Cone'},
        
        --INGREDIENTS
        softscoopmix 			                    = {name = 'softscoopmix', 			 	  	  	    label = 'Soft Scoop Mix', 		            weight = 200, 		type = 'item', 					image = 'softscoopmix.png', 				        unique = false, 	    useable = true, 	shouldClose = true,   combinable = nil,   description = 'Soft Scoop Ice Cream Mix'},
        smoothiemix 			                    = {name = 'smoothiemix', 			 	  	  	    label = 'Smoothie Mix', 		            weight = 200, 		type = 'item', 					image = 'smoothiemix.png', 				            unique = false, 	    useable = true, 	shouldClose = true,   combinable = nil,   description = 'Smoothie Mix'},
        vanilla 			                        = {name = 'vanilla', 			 	  	  	        label = 'Vanilla', 		                    weight = 200, 		type = 'item', 					image = 'vanilla.png', 				                unique = false, 	    useable = true, 	shouldClose = true,   combinable = nil,   description = 'Vanilla'},
        chocolate 			                        = {name = 'chocolate', 			 	  	  	        label = 'Chocolate', 		                weight = 200, 		type = 'item', 					image = 'chocolate.png', 				            unique = false, 	    useable = true, 	shouldClose = true,   combinable = nil,   description = 'Chocolate'},
        strawberry 			                        = {name = 'strawberry', 			 	  	  	    label = 'Strawberry', 		                weight = 200, 		type = 'item', 					image = 'strawberry.png', 				            unique = false, 	    useable = true, 	shouldClose = true,   combinable = nil,   description = 'Strawberry'},
        mint 			                            = {name = 'mint', 			 	  	  	            label = 'Mint', 		                    weight = 200, 		type = 'item', 					image = 'mint.png', 				                unique = false, 	    useable = true, 	shouldClose = true,   combinable = nil,   description = 'Mint'},
        pistachio 			                        = {name = 'pistachio', 			 	  	  	        label = 'Pistachio', 		                weight = 200, 		type = 'item', 					image = 'pistachio.png', 				            unique = false, 	    useable = true, 	shouldClose = true,   combinable = nil,   description = 'Pistachio'},
        butterscotch 			                    = {name = 'butterscotch', 			 	  	  	    label = 'Butter Scotch', 		            weight = 200, 		type = 'item', 					image = 'butterscotch.png', 				        unique = false, 	    useable = true, 	shouldClose = true,   combinable = nil,   description = 'Butter Scotch'},
        saltedcaramel 			                    = {name = 'saltedcaramel', 			 	  	  	    label = 'Salted Caramel', 		            weight = 200, 		type = 'item', 					image = 'saltedcaramel.png', 				        unique = false, 	    useable = true, 	shouldClose = true,   combinable = nil,   description = 'Salted Caramel'},
        bubblegum 			                        = {name = 'bubblegum', 			 	  	  	        label = 'Bubblegum', 		                weight = 200, 		type = 'item', 					image = 'bubblegum.png', 				            unique = false, 	    useable = true, 	shouldClose = true,   combinable = nil,   description = 'Bubblegum'},
        toffee 			                            = {name = 'toffee', 			 	  	  	        label = 'Toffee', 		                    weight = 200, 		type = 'item', 					image = 'toffee.png', 				                unique = false, 	    useable = true, 	shouldClose = true,   combinable = nil,   description = 'Toffee'},
        cookiedough 			                    = {name = 'cookiedough', 			 	  	  	    label = 'Cookie Dough', 		            weight = 200, 		type = 'item', 					image = 'cookiedough.png', 				            unique = false, 	    useable = true, 	shouldClose = true,   combinable = nil,   description = 'Cookie Dough'},
        
        --SNACK SHELF
        vanillacupcake 			                    = {name = 'vanillacupcake', 			 	  	  	label = 'Vanilla Cupcake', 		            weight = 200, 		type = 'item', 					image = 'vanillacupcake.png', 				        unique = false, 	    useable = true, 	shouldClose = true,   combinable = nil,   description = 'Vanilla Cupcake'},
        chocolatecupcake 			                = {name = 'chocolatecupcake', 			 	  	  	label = 'Chocolate Cupcake', 		        weight = 200, 		type = 'item', 					image = 'chocolatecupcake.png', 				    unique = false, 	    useable = true, 	shouldClose = true,   combinable = nil,   description = 'Chocolate Cupcake'},
        chocolatebar 			                    = {name = 'chocolatebar', 			 	  	  	    label = 'Chocolate Bar', 		            weight = 200, 		type = 'item', 					image = 'chocolatebar.png', 				        unique = false, 	    useable = true, 	shouldClose = true,   combinable = nil,   description = 'Chocolate Bar'},
        chocolatedoughnut 			                = {name = 'chocolatedoughnut', 			 	  	  	label = 'Chocolate Doughnut', 		        weight = 200, 		type = 'item', 					image = 'chocolatedoughnut.png', 				    unique = false, 	    useable = true, 	shouldClose = true,   combinable = nil,   description = 'Chocolate Doughnut'},
        jamdoughnut 			                    = {name = 'jamdoughnut', 			 	  	  	    label = 'Jam Doughnut', 		            weight = 200, 		type = 'item', 					image = 'jamdoughnut.png', 				            unique = false, 	    useable = true, 	shouldClose = true,   combinable = nil,   description = 'Jam Doughnut'},
        sugardoughnut 			                    = {name = 'sugardoughnut', 			 	  	  	    label = 'Sugar Doughnut', 		            weight = 200, 		type = 'item', 					image = 'sugardoughnut.png', 				        unique = false, 	    useable = true, 	shouldClose = true,   combinable = nil,   description = 'Sugar Doughnut'},
        custarddoughnut 			                = {name = 'custarddoughnut', 			 	  	  	label = 'Custard Doughnut', 		        weight = 200, 		type = 'item', 					image = 'custarddoughnut.png', 				        unique = false, 	    useable = true, 	shouldClose = true,   combinable = nil,   description = 'Custard Doughnut'},
        
        --HOT DRINKS
        tea 			                            = {name = 'tea', 			 	  	  	            label = 'Tea', 		                        weight = 200, 		type = 'item', 					image = 'tea.png', 				                    unique = false, 	    useable = true, 	shouldClose = true,   combinable = nil,   description = 'Hot Tea'},
        coffee 			                            = {name = 'coffee', 			 	  	  	        label = 'Coffee', 		                    weight = 200, 		type = 'item', 					image = 'coffee.png', 				                unique = false, 	    useable = true, 	shouldClose = true,   combinable = nil,   description = 'Hot Coffee'},
        hotchocolate 			                    = {name = 'hotchocolate', 			 	  	  	    label = 'Hot Chocolate', 		            weight = 200, 		type = 'item', 					image = 'hotchocolate.png', 				        unique = false, 	    useable = true, 	shouldClose = true,   combinable = nil,   description = 'Hot Chocolate'},
        
        --SOFT DRINKS
        cola 			                            = {name = 'cola', 			 	  	  	            label = 'Cola', 		                    weight = 200, 		type = 'item', 					image = 'cola.png', 				                unique = false, 	    useable = true, 	shouldClose = true,   combinable = nil,   description = 'Cola'},
        lemonade 			                        = {name = 'lemonade', 			 	  	  	        label = 'Lemonade', 		                weight = 200, 		type = 'item', 					image = 'lemonade.png', 				            unique = false, 	    useable = true, 	shouldClose = true,   combinable = nil,   description = 'Lemonade'},
        orangesoda 			                        = {name = 'orangesoda', 			 	  	  	    label = 'Orange Soda', 		                weight = 200, 		type = 'item', 					image = 'orangesoda.png', 				            unique = false, 	    useable = true, 	shouldClose = true,   combinable = nil,   description = 'Orange Soda'},
    
        --SMOOTHIES
        vanillasmoothie 			                = {name = 'vanillasmoothie', 			 	  	  	label = 'Vanilla Smoothie', 		        weight = 200, 		type = 'item', 					image = 'vanillasmoothie.png', 				        unique = false, 	    useable = true, 	shouldClose = true,   combinable = nil,   description = 'Vanilla Smoothie'},
        chocolatesmoothie 			                = {name = 'chocolatesmoothie', 			 	  	  	label = 'Chocolate Smoothie', 		        weight = 200, 		type = 'item', 					image = 'chocolatesmoothie.png', 				    unique = false, 	    useable = true, 	shouldClose = true,   combinable = nil,   description = 'Chocolate Smoothie'},
        strawberrysmoothie 			                = {name = 'strawberrysmoothie', 			 	  	label = 'Strawberry Smoothie', 		        weight = 200, 		type = 'item', 					image = 'strawberrysmoothie.png', 				    unique = false, 	    useable = true, 	shouldClose = true,   combinable = nil,   description = 'Strawberry Smoothie'},
        mintsmoothie 			                    = {name = 'mintsmoothie', 			 	  	  	    label = 'Mint Smoothie', 		            weight = 200, 		type = 'item', 					image = 'mintsmoothie.png', 				        unique = false, 	    useable = true, 	shouldClose = true,   combinable = nil,   description = 'Mint Smoothie'},
        pistachiosmoothie 			                = {name = 'pistachiosmoothie', 			 	  	  	label = 'Pistachio Smoothie', 		        weight = 200, 		type = 'item', 					image = 'pistachiosmoothie.png', 				    unique = false, 	    useable = true, 	shouldClose = true,   combinable = nil,   description = 'Pistachio Smoothie'},
        butterscotchsmoothie 			            = {name = 'butterscotchsmoothie', 			 	  	label = 'Butter Scotch Smoothie', 		    weight = 200, 		type = 'item', 					image = 'butterscotchsmoothie.png', 				unique = false, 	    useable = true, 	shouldClose = true,   combinable = nil,   description = 'Butter Scotch Smoothie'},
        saltedcaramelsmoothie 			            = {name = 'saltedcaramelsmoothie', 			 	  	label = 'Salted Caramel Smoothie', 		    weight = 200, 		type = 'item', 					image = 'saltedcaramelsmoothie.png', 				unique = false, 	    useable = true, 	shouldClose = true,   combinable = nil,   description = 'Salted Caramel Smoothie'},
        bubblegumsmoothie 			                = {name = 'bubblegumsmoothie', 			 	  	  	label = 'Bubblegum Smoothie', 		        weight = 200, 		type = 'item', 					image = 'bubblegumsmoothie.png', 				    unique = false, 	    useable = true, 	shouldClose = true,   combinable = nil,   description = 'Bubblegum Smoothie'},
        toffeesmoothie 			                    = {name = 'toffeesmoothie', 			 	  	  	label = 'Toffee Smoothie', 		            weight = 200, 		type = 'item', 					image = 'toffeesmoothie.png', 				        unique = false, 	    useable = true, 	shouldClose = true,   combinable = nil,   description = 'Toffee Smoothie'},
        cookiedoughsmoothie 			            = {name = 'cookiedoughsmoothie', 			 	  	label = 'Cookie Dough Smoothie', 		    weight = 200, 		type = 'item', 					image = 'cookiedoughsmoothie.png', 				    unique = false, 	    useable = true, 	shouldClose = true,   combinable = nil,   description = 'Cookie Dough Smoothie'},
    
        --ICE CREAMS
        vanillaicecream 			                = {name = 'vanillaicecream', 			 	  	  	label = 'Vanilla Ice Cream', 		        weight = 200, 		type = 'item', 					image = 'vanillaicecream.png', 				        unique = false, 	    useable = true, 	shouldClose = true,   combinable = nil,   description = 'Vanilla Ice Cream'},
        chocolateicecream 			                = {name = 'chocolateicecream', 			 	  	  	label = 'Chocolate Ice Cream', 		        weight = 200, 		type = 'item', 					image = 'chocolateicecream.png', 				    unique = false, 	    useable = true, 	shouldClose = true,   combinable = nil,   description = 'Chocolate Ice Cream'},
        strawberryicecream 			                = {name = 'strawberryicecream', 			 	  	label = 'Strawberry Ice Cream', 		    weight = 200, 		type = 'item', 					image = 'strawberryicecream.png', 				    unique = false, 	    useable = true, 	shouldClose = true,   combinable = nil,   description = 'Strawberry Ice Cream'},
        minticecream 			                    = {name = 'minticecream', 			 	  	  	    label = 'Mint Ice Cream', 		            weight = 200, 		type = 'item', 					image = 'minticecream.png', 				        unique = false, 	    useable = true, 	shouldClose = true,   combinable = nil,   description = 'Mint Ice Cream'},
        pistachioicecream 			                = {name = 'pistachioicecream', 			 	  	  	label = 'Pistachio Ice Cream', 		        weight = 200, 		type = 'item', 					image = 'pistachioicecream.png', 				    unique = false, 	    useable = true, 	shouldClose = true,   combinable = nil,   description = 'Pistachio Ice Cream'},
        butterscotchicecream 			            = {name = 'butterscotchicecream', 			 	  	label = 'Butter Scotch Ice Cream', 		    weight = 200, 		type = 'item', 					image = 'butterscotchicecream.png', 				unique = false, 	    useable = true, 	shouldClose = true,   combinable = nil,   description = 'Butter Scotch Ice Cream'},
        saltedcaramelicecream 			            = {name = 'saltedcaramelicecream', 			 	  	label = 'Salted Caramel Ice Cream', 		weight = 200, 		type = 'item', 					image = 'saltedcaramelicecream.png', 				unique = false, 	    useable = true, 	shouldClose = true,   combinable = nil,   description = 'Salted Caramel Ice Cream'},
        bubblegumicecream 			                = {name = 'bubblegumicecream', 			 	  	  	label = 'Bubblegum Ice Cream', 		        weight = 200, 		type = 'item', 					image = 'bubblegumicecream.png', 				    unique = false, 	    useable = true, 	shouldClose = true,   combinable = nil,   description = 'Bubblegum Ice Cream'},
        toffeeicecream 			                    = {name = 'toffeeicecream', 			 	  	  	label = 'Toffee Ice Cream', 		        weight = 200, 		type = 'item', 					image = 'toffeeicecream.png', 				        unique = false, 	    useable = true, 	shouldClose = true,   combinable = nil,   description = 'Toffee Ice Cream'},
        cookiedoughicecream 			            = {name = 'cookiedoughicecream', 			 	  	label = 'Cookie Dough Ice Cream', 		    weight = 200, 		type = 'item', 					image = 'cookiedoughicecream.png', 				    unique = false, 	    useable = true, 	shouldClose = true,   combinable = nil,   description = 'Cookie Dough Ice Cream'},

```


## OX_INVENTORY ITEMS

```

	["saltedcaramelsmoothie"] = {
		label = "Salted Caramel Smoothie",
		weight = 200,
		stack = true,
		close = true,
		description = "Salted Caramel Smoothie",
		client = {
			image = "saltedcaramelsmoothie.png",
		}
	},

	["pistachiosmoothie"] = {
		label = "Pistachio Smoothie",
		weight = 200,
		stack = true,
		close = true,
		description = "Pistachio Smoothie",
		client = {
			image = "pistachiosmoothie.png",
		}
	},

	["toffeesmoothie"] = {
		label = "Toffee Smoothie",
		weight = 200,
		stack = true,
		close = true,
		description = "Toffee Smoothie",
		client = {
			image = "toffeesmoothie.png",
		}
	},

	["mug"] = {
		label = "Mug",
		weight = 200,
		stack = true,
		close = true,
		description = "Mug",
		client = {
			image = "mug.png",
		}
	},

	["hotchocolate"] = {
		label = "Hot Chocolate",
		weight = 200,
		stack = true,
		close = true,
		description = "Hot Chocolate",
		client = {
			image = "hotchocolate.png",
		}
	},

	["cola"] = {
		label = "Cola",
		weight = 200,
		stack = true,
		close = true,
		description = "Cola",
		client = {
			image = "cola.png",
		}
	},

	["softscoopmix"] = {
		label = "Soft Scoop Mix",
		weight = 200,
		stack = true,
		close = true,
		description = "Soft Scoop Ice Cream Mix",
		client = {
			image = "softscoopmix.png",
		}
	},

	["minticecream"] = {
		label = "Mint Ice Cream",
		weight = 200,
		stack = true,
		close = true,
		description = "Mint Ice Cream",
		client = {
			image = "minticecream.png",
		}
	},

	["strawberry"] = {
		label = "Strawberry",
		weight = 200,
		stack = true,
		close = true,
		description = "Strawberry",
		client = {
			image = "strawberry.png",
		}
	},

	["cookiedoughsmoothie"] = {
		label = "Cookie Dough Smoothie",
		weight = 200,
		stack = true,
		close = true,
		description = "Cookie Dough Smoothie",
		client = {
			image = "cookiedoughsmoothie.png",
		}
	},

	["bubblegumicecream"] = {
		label = "Bubblegum Ice Cream",
		weight = 200,
		stack = true,
		close = true,
		description = "Bubblegum Ice Cream",
		client = {
			image = "bubblegumicecream.png",
		}
	},

	["mintsmoothie"] = {
		label = "Mint Smoothie",
		weight = 200,
		stack = true,
		close = true,
		description = "Mint Smoothie",
		client = {
			image = "mintsmoothie.png",
		}
	},

	["bubblegum"] = {
		label = "Bubblegum",
		weight = 200,
		stack = true,
		close = true,
		description = "Bubblegum",
		client = {
			image = "bubblegum.png",
		}
	},

	["bubblegumsmoothie"] = {
		label = "Bubblegum Smoothie",
		weight = 200,
		stack = true,
		close = true,
		description = "Bubblegum Smoothie",
		client = {
			image = "bubblegumsmoothie.png",
		}
	},

	["butterscotchsmoothie"] = {
		label = "Butter Scotch Smoothie",
		weight = 200,
		stack = true,
		close = true,
		description = "Butter Scotch Smoothie",
		client = {
			image = "butterscotchsmoothie.png",
		}
	},

	["chocolateicecream"] = {
		label = "Chocolate Ice Cream",
		weight = 200,
		stack = true,
		close = true,
		description = "Chocolate Ice Cream",
		client = {
			image = "chocolateicecream.png",
		}
	},

	["tea"] = {
		label = "Tea",
		weight = 200,
		stack = true,
		close = true,
		description = "Hot Tea",
		client = {
			image = "tea.png",
		}
	},

	["lemonade"] = {
		label = "Lemonade",
		weight = 200,
		stack = true,
		close = true,
		description = "Lemonade",
		client = {
			image = "lemonade.png",
		}
	},

	["butterscotch"] = {
		label = "Butter Scotch",
		weight = 200,
		stack = true,
		close = true,
		description = "Butter Scotch",
		client = {
			image = "butterscotch.png",
		}
	},

	["butterscotchicecream"] = {
		label = "Butter Scotch Ice Cream",
		weight = 200,
		stack = true,
		close = true,
		description = "Butter Scotch Ice Cream",
		client = {
			image = "butterscotchicecream.png",
		}
	},

	["chocolatecupcake"] = {
		label = "Chocolate Cupcake",
		weight = 200,
		stack = true,
		close = true,
		description = "Chocolate Cupcake",
		client = {
			image = "chocolatecupcake.png",
		}
	},

	["chocolatedoughnut"] = {
		label = "Chocolate Doughnut",
		weight = 200,
		stack = true,
		close = true,
		description = "Chocolate Doughnut",
		client = {
			image = "chocolatedoughnut.png",
		}
	},

	["strawberryicecream"] = {
		label = "Strawberry Ice Cream",
		weight = 200,
		stack = true,
		close = true,
		description = "Strawberry Ice Cream",
		client = {
			image = "strawberryicecream.png",
		}
	},

	["orangesoda"] = {
		label = "Orange Soda",
		weight = 200,
		stack = true,
		close = true,
		description = "Orange Soda",
		client = {
			image = "orangesoda.png",
		}
	},

	["toffee"] = {
		label = "Toffee",
		weight = 200,
		stack = true,
		close = true,
		description = "Toffee",
		client = {
			image = "toffee.png",
		}
	},

	["vanillaicecream"] = {
		label = "Vanilla Ice Cream",
		weight = 200,
		stack = true,
		close = true,
		description = "Vanilla Ice Cream",
		client = {
			image = "vanillaicecream.png",
		}
	},

	["cookiedoughicecream"] = {
		label = "Cookie Dough Ice Cream",
		weight = 200,
		stack = true,
		close = true,
		description = "Cookie Dough Ice Cream",
		client = {
			image = "cookiedoughicecream.png",
		}
	},

	["icecreamcone"] = {
		label = "Ice Cream Cone",
		weight = 200,
		stack = true,
		close = true,
		description = "Ice Cream Cone",
		client = {
			image = "icecreamcone.png",
		}
	},

	["chocolatebar"] = {
		label = "Chocolate Bar",
		weight = 200,
		stack = true,
		close = true,
		description = "Chocolate Bar",
		client = {
			image = "chocolatebar.png",
		}
	},

	["jamdoughnut"] = {
		label = "Jam Doughnut",
		weight = 200,
		stack = true,
		close = true,
		description = "Jam Doughnut",
		client = {
			image = "jamdoughnut.png",
		}
	},

	["vanilla"] = {
		label = "Vanilla",
		weight = 200,
		stack = true,
		close = true,
		description = "Vanilla",
		client = {
			image = "vanilla.png",
		}
	},

	["saltedcaramelicecream"] = {
		label = "Salted Caramel Ice Cream",
		weight = 200,
		stack = true,
		close = true,
		description = "Salted Caramel Ice Cream",
		client = {
			image = "saltedcaramelicecream.png",
		}
	},

	["chocolatesmoothie"] = {
		label = "Chocolate Smoothie",
		weight = 200,
		stack = true,
		close = true,
		description = "Chocolate Smoothie",
		client = {
			image = "chocolatesmoothie.png",
		}
	},

	["toffeeicecream"] = {
		label = "Toffee Ice Cream",
		weight = 200,
		stack = true,
		close = true,
		description = "Toffee Ice Cream",
		client = {
			image = "toffeeicecream.png",
		}
	},

	["softdrinkscup"] = {
		label = "Soft Drinks Cup",
		weight = 200,
		stack = true,
		close = true,
		description = "Soft Drinks Cup",
		client = {
			image = "softdrinkscup.png",
		}
	},

	["pistachio"] = {
		label = "Pistachio",
		weight = 200,
		stack = true,
		close = true,
		description = "Pistachio",
		client = {
			image = "pistachio.png",
		}
	},

	["chocolate"] = {
		label = "Chocolate",
		weight = 200,
		stack = true,
		close = true,
		description = "Chocolate",
		client = {
			image = "chocolate.png",
		}
	},

	["pistachioicecream"] = {
		label = "Pistachio Ice Cream",
		weight = 200,
		stack = true,
		close = true,
		description = "Pistachio Ice Cream",
		client = {
			image = "pistachioicecream.png",
		}
	},

	["saltedcaramel"] = {
		label = "Salted Caramel",
		weight = 200,
		stack = true,
		close = true,
		description = "Salted Caramel",
		client = {
			image = "saltedcaramel.png",
		}
	},

	["smoothiemix"] = {
		label = "Smoothie Mix",
		weight = 200,
		stack = true,
		close = true,
		description = "Smoothie Mix",
		client = {
			image = "smoothiemix.png",
		}
	},

	["sugardoughnut"] = {
		label = "Sugar Doughnut",
		weight = 200,
		stack = true,
		close = true,
		description = "Sugar Doughnut",
		client = {
			image = "sugardoughnut.png",
		}
	},

	["strawberrysmoothie"] = {
		label = "Strawberry Smoothie",
		weight = 200,
		stack = true,
		close = true,
		description = "Strawberry Smoothie",
		client = {
			image = "strawberrysmoothie.png",
		}
	},

	["smoothiecup"] = {
		label = "Smoothie Cup",
		weight = 200,
		stack = true,
		close = true,
		description = "Smoothie Cup",
		client = {
			image = "smoothiecup.png",
		}
	},

	["cookiedough"] = {
		label = "Cookie Dough",
		weight = 200,
		stack = true,
		close = true,
		description = "Cookie Dough",
		client = {
			image = "cookiedough.png",
		}
	},

	["vanillacupcake"] = {
		label = "Vanilla Cupcake",
		weight = 200,
		stack = true,
		close = true,
		description = "Vanilla Cupcake",
		client = {
			image = "vanillacupcake.png",
		}
	},

	["coffee"] = {
		label = "Coffee",
		weight = 200,
		stack = true,
		close = true,
		description = "Hot Coffee",
		client = {
			image = "coffee.png",
		}
	},

	["vanillasmoothie"] = {
		label = "Vanilla Smoothie",
		weight = 200,
		stack = true,
		close = true,
		description = "Vanilla Smoothie",
		client = {
			image = "vanillasmoothie.png",
		}
	},

	["mint"] = {
		label = "Mint",
		weight = 200,
		stack = true,
		close = true,
		description = "Mint",
		client = {
			image = "mint.png",
		}
	},

	["custarddoughnut"] = {
		label = "Custard Doughnut",
		weight = 200,
		stack = true,
		close = true,
		description = "Custard Doughnut",
		client = {
			image = "custarddoughnut.png",
		}
	},


```