## Lusty94_IceCream


<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

PLEASE MAKE SURE TO READ THIS ENTIRE FILE AS IT COVERS SOME IMPORTANT INFORMATION

<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>




## Features

- Create 10 different flavours of smoothie
- Create 10 different flavours of ice cream
- Create soft drinks
- Create hot drinks

- Custom spawned props inside the MLO to interact with for certain events [management menu and ingredients fridge]
- Management menu system to hire / fire employees & much more
- Payment till charge customers for orders
- Clothing lockers to change outfits
- Custom sounds when performing certain actions such as making smoothies and ice creams [REQUIRES_INTERACT_SOUND]

- Multiple types of notification support [qb-notify, okokNotify, mythic_notify, boii_ui notify, ox_lib notify]
- Multiple types of menu support [qb-menu, jixel-menu, boii_ui menu, ox_lib menu]
- Support for qb-shops & jim-shops
- Support for qb-target & ox_target
- Support for qb-inventory and ox_inventory
- Support for jim-consumables with different props for each food/drink item


- Extensive config file
- Change core settings to suit your server such as progressbar timers, notify lengths, event names and much more
- Support for [ANY] MLO or building - moveable target locations via config file
- Language settings for custom translations



## INSTALLATION

- Add the ##ITEMS snippet below into your core/shared/items.lua file
- Add the ##JOB snippet below to your core/shared/jobs.lua
- Add all .png images inside [images] folder into your inventory/html/images folder
- Add all .ogg files inside [interact-sounds] folder into your interact-sound/client/sounds folder


## OX INVENTORY USERS - STORAGE FRIDGE, INGREDIENTS FRIDGE, SNACK SHELF & COLLECTION TRAY INFORMATION

- If you are using ox_inventory you must add this snippet below to ox_inventory/data/shops & stashes.lua for the ingredients and snack shelf stores to work correctly. 

``
--SHOPS.LUA--

PolarIceIngredients = {
		name = 'Polar Ice Ingredients Store',
		groups = {
			['icecream'] = 0
		},
		inventory = {
			{ name = 'softscoopmix', price = 0 },
			{ name = 'smoothiemix', price = 0 },
			{ name = 'vanilla', price = 0 },
			{ name = 'chocolate', price = 0 },
			{ name = 'strawberry', price = 0 },
			{ name = 'mint', price = 0 },
			{ name = 'pistachio', price = 0 },
			{ name = 'butterscotch', price = 0 },
			{ name = 'saltedcaramel', price = 0 },
			{ name = 'bubblegum', price = 0 },
			{ name = 'toffee', price = 0 },
			{ name = 'cookiedough', price = 0 },
		},
		locations = {
			vec3(276.6, 132.4, 104.5)
		}, 
		targets = {
			{ loc = vec3(276.6, 132.4, 104.5), length = 1.4, width = 0.8, heading = 160.28, minZ = 103.75, maxZ = 105.5, distance = 3 }
		}
	},

	PolarIceSnacks = {
		name = 'Polar Ice Snack Shelf',
		inventory = {
			{ name = 'vanillacupcake', price = 10 },
			{ name = 'chocolatecupcake', price = 10 },
			{ name = 'chocolatebar', price = 10 },
			{ name = 'jamdoughnut', price = 10 },
			{ name = 'sugardoughnut', price = 10 },
			{ name = 'custarddoughnut', price = 10 },
			{ name = 'chocolatedoughnut', price = 10 },
		},
		locations = {
			vec3(273.65, 137.24, 104.5)
		}, 
		targets = {
			{ loc = vec3(273.65, 137.24, 104.5), length = 0.8, width = 0.8, heading = 159.08, minZ = 104, maxZ = 104.75, distance = 3 }
		}
	},




--STASHES.LUA--



{ -- polar ice cream shop storage fridge
		coords = vec3(276.49, 124.58, 104.5),
		target = {
			loc = vec3(276.49, 124.58, 104.5),
			length = 1.0,
			width = 1.0,
			heading = 161.12,
			minZ = 103.5,
			maxZ = 104.5,
			label = 'Open Storage Fridge'
		},
		name = 'polaricestoragefridge',
		label = 'Polar Ice Storage Fridge',
		owner = true,
		slots = 64,
		weight = 10000000,
		groups = {['icecream'] = 0}
	},

	{ -- polar ice cream shop collection tray
		coords = vec3(272.73, 137.3, 104.5),
		target = {
			loc = vec3(273.65, 137.24, 104.5),
			length = 0.8,
			width = 0.8,
			heading = 159.08,
			minZ = 104,
			maxZ = 104.75,
			label = 'Open Collection Tray'
		},
		name = 'polaricecollectiontray',
		label = 'Polar Ice Collection Tray',
		owner = false,
		slots = 5,
		weight = 1000000,
	},




``


## DEPENDENCIES

- POLAR ICE MLO - https://forum.cfx.re/t/free-polar-ice-mlo/5166033 [CAN BE MOVED TO ANOTHER MLO BY MOVING TARGET LOCATIONS IN CONFIG]

- QB-CORE - https://github.com/qbcore-framework/qb-core
- QB-TARGET - https://github.com/qbcore-framework/qb-target
- QB-MENU - https://github.com/qbcore-framework/qb-menu
- QB-INPUT - https://github.com/qbcore-framework/qb-input
- PROGRESSBAR - https://github.com/qbcore-framework/progressbar

- OX_LIB - https://github.com/overextended/ox_lib/releases/tag/v3.10.0

- JIM-CONSUMABLES - https://github.com/jimathy/jim-consumables [ONLY REQUIRED IF CONFIG.USEJIMCONSUMABLES IS SET TO TRUE]

- PS-UI - https://github.com/Project-Sloth/ps-ui [REQUIRED FOR THE MENU IMAGE TO BE DISPLAYED]

## INTERACT SOUND

- If set to true in the config then this script uses custom sounds that need to be placed inside of interact-sound resource

- Place ALL .ogg files inside [sounds] folder into your interact-sound/client/html/sounds folder

- Interact sound must be started BEFORE this resource in order to work correctly

## CONSUMABLES

- Set Config.UseJimConsumables to true to enable jim-consumables to handle the useable food and drink items

- ENSURE JIM-CONSUMABLES STARTS BEFORE THIS SCRIPT TO FUNCTION CORRECTLY


## JOB

```

    ['icecream'] = {
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



## ITEMS

```

    --ITEMS
    ['smoothiecup'] 			                    = {['name'] = 'smoothiecup', 			 	  	  	    ['label'] = 'Smoothie Cup', 		            ['weight'] = 200, 		['type'] = 'item', 					['image'] = 'smoothiecup.png', 				            ['unique'] = false, 	    ['useable'] = true, 	['shouldClose'] = true,   ['combinable'] = nil,   ['description'] = 'Smoothie Cup'},
    ['softdrinkscup'] 			                    = {['name'] = 'softdrinkscup', 			 	  	  	    ['label'] = 'Soft Drinks Cup', 		            ['weight'] = 200, 		['type'] = 'item', 					['image'] = 'softdrinkscup.png', 				        ['unique'] = false, 	    ['useable'] = true, 	['shouldClose'] = true,   ['combinable'] = nil,   ['description'] = 'Soft Drinks Cup'},
    ['mug'] 			                            = {['name'] = 'mug', 			 	  	  	            ['label'] = 'Mug', 		                        ['weight'] = 200, 		['type'] = 'item', 					['image'] = 'mug.png', 				                    ['unique'] = false, 	    ['useable'] = true, 	['shouldClose'] = true,   ['combinable'] = nil,   ['description'] = 'Mug'},
    ['icecreamcone'] 			                    = {['name'] = 'icecreamcone', 			 	  	  	    ['label'] = 'Ice Cream Cone', 		            ['weight'] = 200, 		['type'] = 'item', 					['image'] = 'icecreamcone.png', 				        ['unique'] = false, 	    ['useable'] = true, 	['shouldClose'] = true,   ['combinable'] = nil,   ['description'] = 'Ice Cream Cone'},
    
    --INGREDIENTS
    ['softscoopmix'] 			                    = {['name'] = 'softscoopmix', 			 	  	  	    ['label'] = 'Soft Scoop Mix', 		            ['weight'] = 200, 		['type'] = 'item', 					['image'] = 'softscoopmix.png', 				        ['unique'] = false, 	    ['useable'] = true, 	['shouldClose'] = true,   ['combinable'] = nil,   ['description'] = 'Soft Scoop Ice Cream Mix'},
    ['smoothiemix'] 			                    = {['name'] = 'smoothiemix', 			 	  	  	    ['label'] = 'Smoothie Mix', 		            ['weight'] = 200, 		['type'] = 'item', 					['image'] = 'smoothiemix.png', 				            ['unique'] = false, 	    ['useable'] = true, 	['shouldClose'] = true,   ['combinable'] = nil,   ['description'] = 'Smoothie Mix'},
    ['vanilla'] 			                        = {['name'] = 'vanilla', 			 	  	  	        ['label'] = 'Vanilla', 		                    ['weight'] = 200, 		['type'] = 'item', 					['image'] = 'vanilla.png', 				                ['unique'] = false, 	    ['useable'] = true, 	['shouldClose'] = true,   ['combinable'] = nil,   ['description'] = 'Vanilla'},
    ['chocolate'] 			                        = {['name'] = 'chocolate', 			 	  	  	        ['label'] = 'Chocolate', 		                ['weight'] = 200, 		['type'] = 'item', 					['image'] = 'chocolate.png', 				            ['unique'] = false, 	    ['useable'] = true, 	['shouldClose'] = true,   ['combinable'] = nil,   ['description'] = 'Chocolate'},
    ['strawberry'] 			                        = {['name'] = 'strawberry', 			 	  	  	    ['label'] = 'Strawberry', 		                ['weight'] = 200, 		['type'] = 'item', 					['image'] = 'strawberry.png', 				            ['unique'] = false, 	    ['useable'] = true, 	['shouldClose'] = true,   ['combinable'] = nil,   ['description'] = 'Strawberry'},
    ['mint'] 			                            = {['name'] = 'mint', 			 	  	  	            ['label'] = 'Mint', 		                    ['weight'] = 200, 		['type'] = 'item', 					['image'] = 'mint.png', 				                ['unique'] = false, 	    ['useable'] = true, 	['shouldClose'] = true,   ['combinable'] = nil,   ['description'] = 'Mint'},
    ['pistachio'] 			                        = {['name'] = 'pistachio', 			 	  	  	        ['label'] = 'Pistachio', 		                ['weight'] = 200, 		['type'] = 'item', 					['image'] = 'pistachio.png', 				            ['unique'] = false, 	    ['useable'] = true, 	['shouldClose'] = true,   ['combinable'] = nil,   ['description'] = 'Pistachio'},
    ['butterscotch'] 			                    = {['name'] = 'butterscotch', 			 	  	  	    ['label'] = 'Butter Scotch', 		            ['weight'] = 200, 		['type'] = 'item', 					['image'] = 'butterscotch.png', 				        ['unique'] = false, 	    ['useable'] = true, 	['shouldClose'] = true,   ['combinable'] = nil,   ['description'] = 'Butter Scotch'},
    ['saltedcaramel'] 			                    = {['name'] = 'saltedcaramel', 			 	  	  	    ['label'] = 'Salted Caramel', 		            ['weight'] = 200, 		['type'] = 'item', 					['image'] = 'saltedcaramel.png', 				        ['unique'] = false, 	    ['useable'] = true, 	['shouldClose'] = true,   ['combinable'] = nil,   ['description'] = 'Salted Caramel'},
    ['bubblegum'] 			                        = {['name'] = 'bubblegum', 			 	  	  	        ['label'] = 'Bubblegum', 		                ['weight'] = 200, 		['type'] = 'item', 					['image'] = 'bubblegum.png', 				            ['unique'] = false, 	    ['useable'] = true, 	['shouldClose'] = true,   ['combinable'] = nil,   ['description'] = 'Bubblegum'},
    ['toffee'] 			                            = {['name'] = 'toffee', 			 	  	  	        ['label'] = 'Toffee', 		                    ['weight'] = 200, 		['type'] = 'item', 					['image'] = 'toffee.png', 				                ['unique'] = false, 	    ['useable'] = true, 	['shouldClose'] = true,   ['combinable'] = nil,   ['description'] = 'Toffee'},
    ['cookiedough'] 			                    = {['name'] = 'cookiedough', 			 	  	  	    ['label'] = 'Cookie Dough', 		            ['weight'] = 200, 		['type'] = 'item', 					['image'] = 'cookiedough.png', 				            ['unique'] = false, 	    ['useable'] = true, 	['shouldClose'] = true,   ['combinable'] = nil,   ['description'] = 'Cookie Dough'},
    
    --SNACK SHELF
    ['vanillacupcake'] 			                    = {['name'] = 'vanillacupcake', 			 	  	  	['label'] = 'Vanilla Cupcake', 		            ['weight'] = 200, 		['type'] = 'item', 					['image'] = 'vanillacupcake.png', 				        ['unique'] = false, 	    ['useable'] = true, 	['shouldClose'] = true,   ['combinable'] = nil,   ['description'] = 'Vanilla Cupcake'},
    ['chocolatecupcake'] 			                = {['name'] = 'chocolatecupcake', 			 	  	  	['label'] = 'Chocolate Cupcake', 		        ['weight'] = 200, 		['type'] = 'item', 					['image'] = 'chocolatecupcake.png', 				    ['unique'] = false, 	    ['useable'] = true, 	['shouldClose'] = true,   ['combinable'] = nil,   ['description'] = 'Chocolate Cupcake'},
    ['chocolatebar'] 			                    = {['name'] = 'chocolatebar', 			 	  	  	    ['label'] = 'Chocolate Bar', 		            ['weight'] = 200, 		['type'] = 'item', 					['image'] = 'chocolatebar.png', 				        ['unique'] = false, 	    ['useable'] = true, 	['shouldClose'] = true,   ['combinable'] = nil,   ['description'] = 'Chocolate Bar'},
    ['chocolatedoughnut'] 			                = {['name'] = 'chocolatedoughnut', 			 	  	  	['label'] = 'Chocolate Doughnut', 		        ['weight'] = 200, 		['type'] = 'item', 					['image'] = 'chocolatedoughnut.png', 				    ['unique'] = false, 	    ['useable'] = true, 	['shouldClose'] = true,   ['combinable'] = nil,   ['description'] = 'Chocolate Doughnut'},
    ['jamdoughnut'] 			                    = {['name'] = 'jamdoughnut', 			 	  	  	    ['label'] = 'Jam Doughnut', 		            ['weight'] = 200, 		['type'] = 'item', 					['image'] = 'jamdoughnut.png', 				            ['unique'] = false, 	    ['useable'] = true, 	['shouldClose'] = true,   ['combinable'] = nil,   ['description'] = 'Jam Doughnut'},
    ['sugardoughnut'] 			                    = {['name'] = 'sugardoughnut', 			 	  	  	    ['label'] = 'Sugar Doughnut', 		            ['weight'] = 200, 		['type'] = 'item', 					['image'] = 'sugardoughnut.png', 				        ['unique'] = false, 	    ['useable'] = true, 	['shouldClose'] = true,   ['combinable'] = nil,   ['description'] = 'Sugar Doughnut'},
    ['custarddoughnut'] 			                = {['name'] = 'custarddoughnut', 			 	  	  	['label'] = 'Custard Doughnut', 		        ['weight'] = 200, 		['type'] = 'item', 					['image'] = 'custarddoughnut.png', 				        ['unique'] = false, 	    ['useable'] = true, 	['shouldClose'] = true,   ['combinable'] = nil,   ['description'] = 'Custard Doughnut'},
    
    --HOT DRINKS
    ['tea'] 			                            = {['name'] = 'tea', 			 	  	  	            ['label'] = 'Tea', 		                        ['weight'] = 200, 		['type'] = 'item', 					['image'] = 'tea.png', 				                    ['unique'] = false, 	    ['useable'] = true, 	['shouldClose'] = true,   ['combinable'] = nil,   ['description'] = 'Hot Tea'},
    ['coffee'] 			                            = {['name'] = 'coffee', 			 	  	  	        ['label'] = 'Coffee', 		                    ['weight'] = 200, 		['type'] = 'item', 					['image'] = 'coffee.png', 				                ['unique'] = false, 	    ['useable'] = true, 	['shouldClose'] = true,   ['combinable'] = nil,   ['description'] = 'Hot Coffee'},
    ['hotchocolate'] 			                    = {['name'] = 'hotchocolate', 			 	  	  	    ['label'] = 'Hot Chocolate', 		            ['weight'] = 200, 		['type'] = 'item', 					['image'] = 'hotchocolate.png', 				        ['unique'] = false, 	    ['useable'] = true, 	['shouldClose'] = true,   ['combinable'] = nil,   ['description'] = 'Hot Chocolate'},
    
    --SOFT DRINKS
    ['cola'] 			                            = {['name'] = 'cola', 			 	  	  	            ['label'] = 'Cola', 		                    ['weight'] = 200, 		['type'] = 'item', 					['image'] = 'cola.png', 				                ['unique'] = false, 	    ['useable'] = true, 	['shouldClose'] = true,   ['combinable'] = nil,   ['description'] = 'Cola'},
    ['lemonade'] 			                        = {['name'] = 'lemonade', 			 	  	  	        ['label'] = 'Lemonade', 		                ['weight'] = 200, 		['type'] = 'item', 					['image'] = 'lemonade.png', 				            ['unique'] = false, 	    ['useable'] = true, 	['shouldClose'] = true,   ['combinable'] = nil,   ['description'] = 'Lemonade'},
    ['orangesoda'] 			                        = {['name'] = 'orangesoda', 			 	  	  	    ['label'] = 'Orange Soda', 		                ['weight'] = 200, 		['type'] = 'item', 					['image'] = 'orangesoda.png', 				            ['unique'] = false, 	    ['useable'] = true, 	['shouldClose'] = true,   ['combinable'] = nil,   ['description'] = 'Orange Soda'},

    --SMOOTHIES
    ['vanillasmoothie'] 			                = {['name'] = 'vanillasmoothie', 			 	  	  	['label'] = 'Vanilla Smoothie', 		        ['weight'] = 200, 		['type'] = 'item', 					['image'] = 'vanillasmoothie.png', 				        ['unique'] = false, 	    ['useable'] = true, 	['shouldClose'] = true,   ['combinable'] = nil,   ['description'] = 'Vanilla Smoothie'},
    ['chocolatesmoothie'] 			                = {['name'] = 'chocolatesmoothie', 			 	  	  	['label'] = 'Chocolate Smoothie', 		        ['weight'] = 200, 		['type'] = 'item', 					['image'] = 'chocolatesmoothie.png', 				    ['unique'] = false, 	    ['useable'] = true, 	['shouldClose'] = true,   ['combinable'] = nil,   ['description'] = 'Chocolate Smoothie'},
    ['strawberrysmoothie'] 			                = {['name'] = 'strawberrysmoothie', 			 	  	['label'] = 'Strawberry Smoothie', 		        ['weight'] = 200, 		['type'] = 'item', 					['image'] = 'strawberrysmoothie.png', 				    ['unique'] = false, 	    ['useable'] = true, 	['shouldClose'] = true,   ['combinable'] = nil,   ['description'] = 'Strawberry Smoothie'},
    ['mintsmoothie'] 			                    = {['name'] = 'mintsmoothie', 			 	  	  	    ['label'] = 'Mint Smoothie', 		            ['weight'] = 200, 		['type'] = 'item', 					['image'] = 'mintsmoothie.png', 				        ['unique'] = false, 	    ['useable'] = true, 	['shouldClose'] = true,   ['combinable'] = nil,   ['description'] = 'Mint Smoothie'},
    ['pistachiosmoothie'] 			                = {['name'] = 'pistachiosmoothie', 			 	  	  	['label'] = 'Pistachio Smoothie', 		        ['weight'] = 200, 		['type'] = 'item', 					['image'] = 'pistachiosmoothie.png', 				    ['unique'] = false, 	    ['useable'] = true, 	['shouldClose'] = true,   ['combinable'] = nil,   ['description'] = 'Pistachio Smoothie'},
    ['butterscotchsmoothie'] 			            = {['name'] = 'butterscotchsmoothie', 			 	  	['label'] = 'Butter Scotch Smoothie', 		    ['weight'] = 200, 		['type'] = 'item', 					['image'] = 'butterscotchsmoothie.png', 				['unique'] = false, 	    ['useable'] = true, 	['shouldClose'] = true,   ['combinable'] = nil,   ['description'] = 'Butter Scotch Smoothie'},
    ['saltedcaramelsmoothie'] 			            = {['name'] = 'saltedcaramelsmoothie', 			 	  	['label'] = 'Salted Caramel Smoothie', 		    ['weight'] = 200, 		['type'] = 'item', 					['image'] = 'saltedcaramelsmoothie.png', 				['unique'] = false, 	    ['useable'] = true, 	['shouldClose'] = true,   ['combinable'] = nil,   ['description'] = 'Salted Caramel Smoothie'},
    ['bubblegumsmoothie'] 			                = {['name'] = 'bubblegumsmoothie', 			 	  	  	['label'] = 'Bubblegum Smoothie', 		        ['weight'] = 200, 		['type'] = 'item', 					['image'] = 'bubblegumsmoothie.png', 				    ['unique'] = false, 	    ['useable'] = true, 	['shouldClose'] = true,   ['combinable'] = nil,   ['description'] = 'Bubblegum Smoothie'},
    ['toffeesmoothie'] 			                    = {['name'] = 'toffeesmoothie', 			 	  	  	['label'] = 'Toffee Smoothie', 		            ['weight'] = 200, 		['type'] = 'item', 					['image'] = 'toffeesmoothie.png', 				        ['unique'] = false, 	    ['useable'] = true, 	['shouldClose'] = true,   ['combinable'] = nil,   ['description'] = 'Toffee Smoothie'},
    ['cookiedoughsmoothie'] 			            = {['name'] = 'cookiedoughsmoothie', 			 	  	['label'] = 'Cookie Dough Smoothie', 		    ['weight'] = 200, 		['type'] = 'item', 					['image'] = 'cookiedoughsmoothie.png', 				    ['unique'] = false, 	    ['useable'] = true, 	['shouldClose'] = true,   ['combinable'] = nil,   ['description'] = 'Cookie Dough Smoothie'},

    --ICE CREAMS
    ['vanillaicecream'] 			                = {['name'] = 'vanillaicecream', 			 	  	  	['label'] = 'Vanilla Ice Cream', 		        ['weight'] = 200, 		['type'] = 'item', 					['image'] = 'vanillaicecream.png', 				        ['unique'] = false, 	    ['useable'] = true, 	['shouldClose'] = true,   ['combinable'] = nil,   ['description'] = 'Vanilla Ice Cream'},
    ['chocolateicecream'] 			                = {['name'] = 'chocolateicecream', 			 	  	  	['label'] = 'Chocolate Ice Cream', 		        ['weight'] = 200, 		['type'] = 'item', 					['image'] = 'chocolateicecream.png', 				    ['unique'] = false, 	    ['useable'] = true, 	['shouldClose'] = true,   ['combinable'] = nil,   ['description'] = 'Chocolate Ice Cream'},
    ['strawberryicecream'] 			                = {['name'] = 'strawberryicecream', 			 	  	['label'] = 'Strawberry Ice Cream', 		    ['weight'] = 200, 		['type'] = 'item', 					['image'] = 'strawberryicecream.png', 				    ['unique'] = false, 	    ['useable'] = true, 	['shouldClose'] = true,   ['combinable'] = nil,   ['description'] = 'Strawberry Ice Cream'},
    ['minticecream'] 			                    = {['name'] = 'minticecream', 			 	  	  	    ['label'] = 'Mint Ice Cream', 		            ['weight'] = 200, 		['type'] = 'item', 					['image'] = 'minticecream.png', 				        ['unique'] = false, 	    ['useable'] = true, 	['shouldClose'] = true,   ['combinable'] = nil,   ['description'] = 'Mint Ice Cream'},
    ['pistachioicecream'] 			                = {['name'] = 'pistachioicecream', 			 	  	  	['label'] = 'Pistachio Ice Cream', 		        ['weight'] = 200, 		['type'] = 'item', 					['image'] = 'pistachioicecream.png', 				    ['unique'] = false, 	    ['useable'] = true, 	['shouldClose'] = true,   ['combinable'] = nil,   ['description'] = 'Pistachio Ice Cream'},
    ['butterscotchicecream'] 			            = {['name'] = 'butterscotchicecream', 			 	  	['label'] = 'Butter Scotch Ice Cream', 		    ['weight'] = 200, 		['type'] = 'item', 					['image'] = 'butterscotchicecream.png', 				['unique'] = false, 	    ['useable'] = true, 	['shouldClose'] = true,   ['combinable'] = nil,   ['description'] = 'Butter Scotch Ice Cream'},
    ['saltedcaramelicecream'] 			            = {['name'] = 'saltedcaramelicecream', 			 	  	['label'] = 'Salted Caramel Ice Cream', 		['weight'] = 200, 		['type'] = 'item', 					['image'] = 'saltedcaramelicecream.png', 				['unique'] = false, 	    ['useable'] = true, 	['shouldClose'] = true,   ['combinable'] = nil,   ['description'] = 'Salted Caramel Ice Cream'},
    ['bubblegumicecream'] 			                = {['name'] = 'bubblegumicecream', 			 	  	  	['label'] = 'Bubblegum Ice Cream', 		        ['weight'] = 200, 		['type'] = 'item', 					['image'] = 'bubblegumicecream.png', 				    ['unique'] = false, 	    ['useable'] = true, 	['shouldClose'] = true,   ['combinable'] = nil,   ['description'] = 'Bubblegum Ice Cream'},
    ['toffeeicecream'] 			                    = {['name'] = 'toffeeicecream', 			 	  	  	['label'] = 'Toffee Ice Cream', 		        ['weight'] = 200, 		['type'] = 'item', 					['image'] = 'toffeeicecream.png', 				        ['unique'] = false, 	    ['useable'] = true, 	['shouldClose'] = true,   ['combinable'] = nil,   ['description'] = 'Toffee Ice Cream'},
    ['cookiedoughicecream'] 			            = {['name'] = 'cookiedoughicecream', 			 	  	['label'] = 'Cookie Dough Ice Cream', 		    ['weight'] = 200, 		['type'] = 'item', 					['image'] = 'cookiedoughicecream.png', 				    ['unique'] = false, 	    ['useable'] = true, 	['shouldClose'] = true,   ['combinable'] = nil,   ['description'] = 'Cookie Dough Ice Cream'},



```







