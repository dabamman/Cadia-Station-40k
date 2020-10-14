//SUPPLY PACKS
//NOTE: only secure crate types use the access var (and are lockable)
//NOTE: hidden packs only show up when the computer has been hacked.
//ANOTHER NOTE: Contraband is obtainable through modified supplycomp circuitboards.
//BIG NOTE: Don't add living things to crates, that's bad, it will break the shuttle.
//NEW NOTE: Do NOT set the price of any crates below 20 points. Doing so allows infinite points.

// Supply Groups
var/const/supply_emergency 	= 1
var/const/supply_security 	= 2
var/const/supply_armory 	= 3
var/const/supply_engineer	= 4
var/const/supply_medical	= 5
var/const/supply_science	= 6
var/const/supply_organic	= 7
var/const/supply_materials 	= 8
var/const/supply_misc		= 9

var/list/all_supply_groups = list(supply_emergency,supply_security,supply_armory,supply_engineer,supply_medical,supply_science,supply_organic,supply_materials,supply_misc)

/proc/get_supply_group_name(var/cat)
	switch(cat)
		if(1)
			return "Emergency"
		if(2)
			return "Security"
		if(3)
			return "Armory"
		if(4)
			return "Engineering"
		if(5)
			return "Medical"
		if(6)
			return "Science"
		if(7)
			return "Food & Livestock"
		if(8)
			return "Raw Materials"
		if(9)
			return "Miscellaneous"


/datum/supply_packs
	var/name = null
	var/list/contains = list()
	var/manifest = ""
	var/amount = null
	var/cost = null
	var/containertype = /obj/structure/closet/crate
	var/containername = null
	var/access = null
	var/hidden = 0
	var/contraband = 0
	var/group = supply_misc

/datum/supply_packs/New()
	manifest += "<ul>"
	for(var/path in contains)
		if(!path)	continue
		var/atom/movable/AM = new path()
		manifest += "<li>[AM.name]</li>"
//		del AM	//just to make sure they're deleted, no longer garbage collected, as there are way to many objects in crates that have other references.
		qdel(AM) // How about we fix the issues rather than bypass them, mmkay?
	manifest += "</ul>"

////// Use the sections to keep things tidy please /Malkevin

//////////////////////////////////////////////////////////////////////////////
//////////////////////////// Emergency ///////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////

/datum/supply_packs/emergency	// Section header - use these to set default supply group and crate type for sections
	name = "HEADER"				// Use "HEADER" to denote section headers, this is needed for the supply computers to filter them
	containertype = /obj/structure/closet/crate/internals
	group = supply_emergency


/datum/supply_packs/emergency/evac
	name = "Emergency equipment"
	contains = list(/obj/machinery/bot/floorbot,
					/obj/machinery/bot/floorbot,
					/obj/machinery/bot/medbot,
					/obj/machinery/bot/medbot,
					/obj/item/weapon/tank/air,
					/obj/item/weapon/tank/air,
					/obj/item/weapon/tank/air,
					/obj/item/weapon/tank/air,
					/obj/item/weapon/tank/air,
					/obj/item/clothing/mask/gas,
					/obj/item/clothing/mask/gas,
					/obj/item/clothing/mask/gas,
					/obj/item/clothing/mask/gas,
					/obj/item/clothing/mask/gas)
	cost = 45
	containertype = /obj/structure/closet/crate/internals
	containername = "emergency crate"
	group = supply_emergency

/datum/supply_packs/emergency/internals
	name = "Internals crate"
	contains = list(/obj/item/clothing/mask/gas,
					/obj/item/clothing/mask/gas,
					/obj/item/clothing/mask/gas,
					/obj/item/weapon/tank/air,
					/obj/item/weapon/tank/air,
					/obj/item/weapon/tank/air)
	cost = 35
	containername = "internals crate"

/datum/supply_packs/emergency/firefighting
	name = "Firefighting Crate"
	contains = list(/obj/item/clothing/suit/fire/firefighter,
					/obj/item/clothing/suit/fire/firefighter,
					/obj/item/clothing/mask/gas,
					/obj/item/clothing/mask/gas,
					/obj/item/device/flashlight,
					/obj/item/device/flashlight,
					/obj/item/weapon/tank/oxygen/red,
					/obj/item/weapon/tank/oxygen/red,
					/obj/item/weapon/extinguisher,
					/obj/item/weapon/extinguisher,
					/obj/item/clothing/head/hardhat/red,
					/obj/item/clothing/head/hardhat/red)
	cost = 35
	containertype = /obj/structure/closet/crate
	containername = "firefighting crate"

/datum/supply_packs/emergency/atmostank
	name = "Firefighting Watertank"
	contains = list(/obj/item/weapon/watertank/atmos)
	cost = 40
	containertype = /obj/structure/closet/crate/secure
	containername = "firefighting watertank crate"
	access = access_atmospherics

/datum/supply_packs/emergency/weedcontrol
	name = "Weed Control Crate"
	contains = list(/obj/item/weapon/scythe,
					/obj/item/clothing/mask/gas,
					/obj/item/weapon/grenade/chem_grenade/antiweed,
					/obj/item/weapon/grenade/chem_grenade/antiweed)
	cost = 355
	containertype = /obj/structure/closet/crate/secure/hydrosec
	containername = "weed control crate"
	access = access_hydroponics

/datum/supply_packs/emergency/specialops
	name = "Special Ops supplies"
	contains = list(/obj/item/weapon/storage/box/emps,
					/obj/item/weapon/grenade/smokebomb,
					/obj/item/weapon/grenade/smokebomb,
					/obj/item/weapon/grenade/smokebomb,
					/obj/item/weapon/pen/paralysis,
					/obj/item/weapon/grenade/chem_grenade/incendiary)
	cost = 50
	containertype = /obj/structure/closet/crate
	containername = "Special Ops Crate"
	hidden = 1

/datum/supply_packs/emergency/inquisitor //I figure this will be enough for one traitor and his friend to play dress up
	name = "Inquisitor supplies"
	contains = list(/obj/item/clothing/under/rank/acolyte,
					/obj/item/clothing/suit/armor/acolytecoat,
					/obj/item/clothing/shoes/acolyteboots,
					/obj/item/clothing/gloves/acolytegloves,
					/obj/item/clothing/mask/gas/sechailer,
					/obj/item/weapon/gun/projectile/automatic/laspistol2,
					/obj/item/clothing/under/rank/research_director,
					/obj/item/clothing/shoes/sneakers/brown,)
	cost = 150
	containername = "Inquisitor supplies"
	hidden = 1


//////////////////////////////////////////////////////////////////////////////
//////////////////////////// Security ////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////

/datum/supply_packs/security
	name = "HEADER"
	containertype = /obj/structure/closet/crate/secure/gear
	access = access_security
	group = supply_security


/datum/supply_packs/security/supplies
	name = "Security Supplies crate"
	contains = list(/obj/item/weapon/storage/box/flashbangs,
					/obj/item/weapon/storage/box/teargas,
					/obj/item/weapon/storage/box/flashes,
					/obj/item/weapon/storage/box/handcuffs)
	cost = 35
	containername = "Security Supply Crate"

////// Armor: Basic

/datum/supply_packs/security/helmets
	name = "Helmets crate"
	contains = list(/obj/item/clothing/head/helmet,
					/obj/item/clothing/head/helmet,
					/obj/item/clothing/head/helmet)
	cost = 35
	containername = "Helmet Crate"

/datum/supply_packs/security/armor
	name = "Armor crate"
	contains = list(/obj/item/clothing/suit/armor/vest,
					/obj/item/clothing/suit/armor/vest,
					/obj/item/clothing/suit/armor/vest)
	cost = 35
	containername = "Armor Crate"

/datum/supply_packs/security/flakarmor
	name = "Flak Armor crate"
	contains = list(/obj/item/clothing/suit/armor/imperialarmor,
					/obj/item/clothing/suit/armor/imperialarmor,
					/obj/item/clothing/suit/armor/imperialarmor)
	cost = 55
	containername = "Flak Armor Crate"

/datum/supply_packs/security/reinforcedflakarmor
	name = "Reinforced Flak Armor crate"
	contains = list(/obj/item/clothing/suit/armor/imperialarmor/reinforced,
					/obj/item/clothing/suit/armor/imperialarmor/reinforced)
	cost = 80
	containername = "Reinforced Flak Armor Crate"

/datum/supply_packs/security/valhallanclothes //Now we aren't stuck with just krieg
	name = "Valhallan Clothing Crate"
	contains = list(/obj/item/clothing/head/valhalla,
					/obj/item/clothing/head/valhalla,
					/obj/item/clothing/under/rank/security,
					/obj/item/clothing/under/rank/security,
					/obj/item/clothing/suit/armor/valhalla,
					/obj/item/clothing/suit/armor/valhalla,
					/obj/item/clothing/mask/gas/sechailer,
					/obj/item/clothing/mask/gas/sechailer)
	cost = 60
	contains = "Valhallan Clothing Crate"
	contraband = 1

////// Weapons: Basic

/datum/supply_packs/security/baton
	name = "Stun Batons crate"
	contains = list(/obj/item/weapon/melee/baton/loaded,
					/obj/item/weapon/melee/baton/loaded,
					/obj/item/weapon/melee/baton/loaded)
	cost = 35
	containername = "Stun Baton Crate"

/datum/supply_packs/security/lasgun
	name = "Lasgun Crate"
	contains = list(/obj/item/weapon/gun/projectile/automatic/lasgun,
					/obj/item/weapon/gun/projectile/automatic/lasgun,
					/obj/item/weapon/gun/projectile/automatic/lasgun,
					/obj/item/weapon/storage/box/lasgunmag)
	cost = 30
	containername = "Lasgun Crate"

/datum/supply_packs/security/lasgunacc
	name = "Lasgun Accessories"
	contains = list(/obj/item/weapon/scope,
					/obj/item/weapon/scope,
					/obj/item/weapon/chainb,
					/obj/item/weapon/chainb)
	cost = 30
	containername = "Lasgun Accessories Crate"

/datum/supply_packs/security/laspistol
	name = "LasPistol"
	contains = list(/obj/item/weapon/gun/projectile/automatic/laspistol,
					/obj/item/weapon/gun/projectile/automatic/laspistol,
					/obj/item/weapon/gun/projectile/automatic/laspistol,
					/obj/item/weapon/gun/projectile/automatic/laspistol,)
	cost = 25
	containername = "Laspistol Crate"

/datum/supply_packs/security/lascannon
	name = "Las-Cannon"
	contains = list(/obj/item/weapon/gun/projectile/automatic/lascannon)
	cost = 140
	containername = "Las-Cannon Crate"

/datum/supply_packs/security/lascannonmag
	name = "Las-Cannon Power Packs"
	contains = list(/obj/item/ammo_box/magazine/lascannonmag, /obj/item/ammo_box/magazine/lascannonmag)
	cost = 70
	containername = "Las-Cannon Power Packs Crate"

/datum/supply_packs/security/taser
	name = "Stun Guns crate"
	contains = list(/obj/item/weapon/gun/energy/taser,
					/obj/item/weapon/gun/energy/taser,
					/obj/item/weapon/gun/energy/taser)
	cost = 30
	containername = "Stun gun crate"

/datum/supply_packs/security/disabler
	name = "Disabler crate"
	contains = list(/obj/item/weapon/gun/energy/disabler,
					/obj/item/weapon/gun/energy/disabler,
					/obj/item/weapon/gun/energy/disabler)
	cost = 30
	containername = "Disabler crate"

/datum/supply_packs/security/securitybarriers
	name = "Security barriers"
	contains = list(/obj/machinery/deployable/barrier,
					/obj/machinery/deployable/barrier,
					/obj/machinery/deployable/barrier,
					/obj/machinery/deployable/barrier)
	cost = 35
	containername = "Security barriers crate"

/datum/supply_packs/security/heavystubber
	name = "Heavy Stubber"
	contains = list(/obj/item/weapon/gun/projectile/automatic/l6_saw)
	cost = 80
	containername = "Heavy stubber crate"

/datum/supply_packs/armory/powersword
	name = "Munitorium Power Sword"
	contains = list(/obj/item/weapon/powersword/munitorium)
	cost = 400
	containername = "Power Blade Crate"
	access = access_security
/datum/supply_packs/security/heavystubber_ammo
	name = "Heavy Stubber Ammo"
	contains = list(/obj/item/ammo_box/magazine/m762,
					/obj/item/ammo_box/magazine/m762,
					/obj/item/ammo_box/magazine/m762,
					/obj/item/ammo_box/magazine/m762)
	cost = 60
	containername = "Heavy stubber ammo crate"

/datum/supply_packs/security/securityclothes
	name = "Security clothing crate"
	contains = list(/obj/item/clothing/under/rank/security/navyblue,
					/obj/item/clothing/under/rank/security/navyblue,
					/obj/item/clothing/suit/security/officer,
					/obj/item/clothing/suit/security/officer,
					/obj/item/clothing/head/beret/sec/navyofficer,
					/obj/item/clothing/head/beret/sec/navyofficer,
					/obj/item/clothing/under/rank/warden/navyblue,
					/obj/item/clothing/suit/security/warden,
					/obj/item/clothing/head/beret/sec/navywarden,
					/obj/item/clothing/under/rank/head_of_security/navyblue,
					/obj/item/clothing/suit/security/hos,
					/obj/item/clothing/head/beret/sec/navyhos)
	cost = 35
	containername = "Security clothing crate"

//////////////////////////////////////////////////////////////////////////////
//////////////////////////// Armory ////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////

/datum/supply_packs/armory
	name = "HEADER"
	containertype = /obj/structure/closet/crate/secure/weapon
	access = access_armory
	group = supply_armory

///// Armor: Specialist

/datum/supply_packs/armory/riothelmets
	name = "Riot helmets crate"
	contains = list(/obj/item/clothing/head/helmet/riot,
					/obj/item/clothing/head/helmet/riot,
					/obj/item/clothing/head/helmet/riot)
	cost = 35
	containername = "Riot helmets crate"

/datum/supply_packs/armory/bpistol
	name = "Bolt pistol crate"
	contains = list(/obj/item/weapon/gun/projectile/automatic/bpistol,
					/obj/item/weapon/gun/projectile/automatic/bpistol)
	cost = 80
	containername = "Bolt Pistol Crate"

/datum/supply_packs/armory/bpistol_ammo
	name = "Bolt pistol magazine crate"
	contains = list(/obj/item/ammo_box/magazine/bpistolmag,
					/obj/item/ammo_box/magazine/bpistolmag,
					/obj/item/ammo_box/magazine/bpistolmag,
					/obj/item/ammo_box/magazine/bpistolmag)
	cost = 40
	containername = "Bolt pistol magazine crate"

/datum/supply_packs/armory/bolter
	name = "Bolter Crate"
	contains = list(/obj/item/weapon/gun/projectile/automatic/bolter,
					/obj/item/weapon/gun/projectile/automatic/bolter)
	cost = 400
	containername = "Bolter Crate"
	access = access_armory

/datum/supply_packs/armory/bolter_ammo
	name = "Bolter Ammo Crate"
	contains = list(/obj/item/ammo_box/magazine/boltermag,
					/obj/item/ammo_box/magazine/boltermag,
					/obj/item/ammo_box/magazine/boltermag,
					/obj/item/ammo_box/magazine/boltermag)
	cost = 120
	containername = "Bolter Ammo Crate"
	access = access_armory

/datum/supply_packs/armory/riotsuits
	name = "Riot suits crate"
	contains = list(/obj/item/clothing/suit/armor/riot,
					/obj/item/clothing/suit/armor/riot,
					/obj/item/clothing/suit/armor/riot)
	cost = 50
	containername = "Riot suits crate"

/datum/supply_packs/armory/riotshields
	name = "Riot shields crate"
	contains = list(/obj/item/weapon/shield/riot,
					/obj/item/weapon/shield/riot,
					/obj/item/weapon/shield/riot)
	cost = 35
	containername = "Riot shields crate"

/datum/supply_packs/armory/bulletarmor
	name = "Bulletproof armor crate"
	contains = list(/obj/item/clothing/suit/armor/bulletproof,
					/obj/item/clothing/suit/armor/bulletproof,
					/obj/item/clothing/suit/armor/bulletproof)
	cost = 50
	containername = "Bulletproof armor crate"

/datum/supply_packs/armory/missle
	name = "Missile Launcher Crate"
	contains = list(/obj/item/weapon/gun/magic/staff/misslelauncher)
	cost = 200
	containername = "Missile Launcher Crate"
	access = access_armory

/datum/supply_packs/armory/missles
	name = "Missile Crate"
	contains = list(/obj/item/weapon/misslea,
					/obj/item/weapon/misslea,
					/obj/item/weapon/misslea)
	cost = 150
	containername = "Missile Crate"
	access = access_armory

/datum/supply_packs/armory/plasmapistol
	name = "Plasma Pistol"
	contains = list(/obj/item/weapon/gun/energy/plasma)
	cost = 500     //No cheap super guns, its an outpost not a gun emporium
	containername = "Plasma Pistol Crate"
	access = access_armory

/datum/supply_packs/armory/heavyplasmagun
	name = "Heavy Plasma Gun"
	contains = list(/obj/item/weapon/gun/energy/plasma/rifle)
	cost = 1500
	containername = "Heavy Plasma Gun Crate"
	access = access_captain //To balance out the rarity of these weapons, the Munitorium wont hand it out like candy

/datum/supply_packs/armory/meltagun
	name = "Meltagun"
	contains = list(/obj/item/weapon/gun/projectile/meltagun)
	cost = 700
	containername = "Meltagun Crate"

/datum/supply_packs/armory/refractor
	name = "Refractor field projector crate"
	contains = list(/obj/machinery/shieldgenr,
					/obj/machinery/shieldgenr)
	cost = 60
	containername = "Refractor field projector crate"

/datum/supply_packs/security/handflamer
	name = "Hand Flamer"
	contains = list(/obj/item/weapon/gun/projectile/handflamer)
	cost = 500
	containername = "Hand Flamer Crate"
	access = access_armory

/datum/supply_packs/armory/laserarmor
	name = "Ablative armor crate"
	contains = list(/obj/item/clothing/suit/armor/laserproof,
					/obj/item/clothing/suit/armor/laserproof)		// Only two vests to keep costs down for balance
	cost = 60
	containertype = /obj/structure/closet/crate/secure/plasma
	containername = "ablative armor crate"

/datum/supply_packs/armory/shockarmor
	name = "Cadian Shock trooper armor"
	contains = list(/obj/item/clothing/under/rank/security,
					/obj/item/clothing/under/rank/security,
					/obj/item/clothing/suit/armor/shocktrooper,
					/obj/item/clothing/suit/armor/shocktrooper,
					/obj/item/clothing/gloves/combat,
					/obj/item/clothing/gloves/combat,
					/obj/item/clothing/shoes/cadianboots,
					/obj/item/clothing/shoes/cadianboots,
					/obj/item/clothing/mask/gas,
					/obj/item/clothing/mask/gas,
					/obj/item/clothing/head/cadianhelmet,
					/obj/item/clothing/head/cadianhelmet)
	cost = 450
	containername = "Cadian Shock Trooper Armor"
	hidden = 1

/datum/supply_packs/armory/gravchute
	name = "Elysian Grav Chute"
	contains = list(/obj/item/weapon/tank/oxygen/jump/grav,
					/obj/item/weapon/tank/oxygen/jump/grav)
	cost = 600
	containername = "Elysian Grav Chute"

/////// Weapons: Specialist

/datum/supply_packs/armory/ballistic
	name = "Combat Shotguns crate"
	contains = list(/obj/item/weapon/gun/projectile/shotgun/combat,
					/obj/item/weapon/gun/projectile/shotgun/combat,
					/obj/item/weapon/gun/projectile/shotgun/combat)
	cost = 80
	containername = "combat shotgun crate"

/datum/supply_packs/armory/hbolter
	name = "Heavy bolter crate"
	contains = list(/obj/item/weapon/twohanded/required/bolterc)
	cost = 600
	containername = "Heavy bolter crate"

/datum/supply_packs/armory/slascannon
	name = "Stationary lascannon crate"
	contains = list(/obj/item/weapon/twohanded/required/laserc)
	cost = 450
	containername = "Lascannon crate"

/datum/supply_packs/armory/hbolter_ammo
	name = "Heavy bolter magazine crate"
	contains = list(/obj/item/cannonball/boltermag, /obj/item/cannonball/boltermag, /obj/item/cannonball/boltermag, /obj/item/cannonball/boltermag, /obj/item/cannonball/boltermag)
	cost = 350
	containername = "Ammunition crate"

/datum/supply_packs/armory/slascannon_ammo
	name = "Stationary lascannon power packs crate"
	contains = list(/obj/item/cannonball/lasermag, /obj/item/cannonball/lasermag, /obj/item/cannonball/lasermag, /obj/item/cannonball/lasermag, /obj/item/cannonball/lasermag, /obj/item/cannonball/lasermag)
	cost = 250
	containername = "Ammunition crate"

/datum/supply_packs/armory/expenergy
	name = "Energy Guns crate"
	contains = list(/obj/item/weapon/gun/energy/gun,
					/obj/item/weapon/gun/energy/gun)			// Only two guns to keep costs down
	cost = 200 //Raising cost because these things are rare!
	containertype = /obj/structure/closet/crate/secure/plasma
	containername = "energy gun crate"

/datum/supply_packs/armory/eweapons
	name = "Incendiary weapons crate"
	contains = list(/obj/item/weapon/flamethrower/full,
					/obj/item/weapon/tank/plasma,
					/obj/item/weapon/tank/plasma,
					/obj/item/weapon/tank/plasma,
					/obj/item/weapon/grenade/chem_grenade/incendiary,
					/obj/item/weapon/grenade/chem_grenade/incendiary,
					/obj/item/weapon/grenade/chem_grenade/incendiary)
	cost = 50	// its a fecking flamethrower and some plasma, why the shit did this cost so much before!?
	containertype = /obj/structure/closet/crate/secure/plasma
	containername = "incendiary weapons crate"
	access = access_heads



/////// Implants & etc

/datum/supply_packs/armory/loyalty
	name = "Loyalty implants crate"
	contains = list (/obj/item/weapon/storage/lockbox/loyalty)
	cost = 50
	containername = "loyalty implant crate"

/datum/supply_packs/armory/trackingimp
	name = "Tracking implants crate"
	contains = list (/obj/item/weapon/storage/box/trackimp)
	cost = 40
	containername = "tracking implant crate"

/datum/supply_packs/armory/chemimp
	name = "Chemical implants crate"
	contains = list (/obj/item/weapon/storage/box/chemimp)
	cost = 40
	containername = "chemical implant crate"

/datum/supply_packs/armory/exileimp
	name = "Exile implants crate"
	contains = list (/obj/item/weapon/storage/box/exileimp)
	cost = 60
	containername = "exile implant crate"

//////////////////////////////////////////////////////////////////////////////
//////////////////////////// Engineering /////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////

/datum/supply_packs/engineering
	name = "HEADER"
	group = supply_engineer


/datum/supply_packs/engineering/fueltank
	name = "Fuel tank crate"
	contains = list(/obj/structure/reagent_dispensers/fueltank)
	cost = 25
	containertype = /obj/structure/largecrate
	containername = "fuel tank crate"

/datum/supply_packs/engineering/boxofparts
	name = "Box Of Parts (Vehicle Construction)"
	contains = null
	cost = 250
	containertype = /obj/structure/box
	containername = "Imperium of Man Lot# 277301"

/datum/supply_packs/engineering/skitariiparts
	name = "Skitarii cryostasis coffin"
	contains = null
	cost = 800
	containertype = /obj/structure/skitariiparts
	containername = "Skitarii cryostasis coffin"


/datum/supply_packs/engineering/tools		//the most robust crate
	name = "Toolbox crate"
	contains = list(/obj/item/weapon/storage/toolbox/electrical,
					/obj/item/weapon/storage/toolbox/electrical,
					/obj/item/weapon/storage/toolbox/mechanical,
					/obj/item/weapon/storage/toolbox/electrical,
					/obj/item/weapon/storage/toolbox/mechanical,
					/obj/item/weapon/storage/toolbox/mechanical)
	cost = 40
	containername = "electrical maintenance crate"

/datum/supply_packs/engineering/powergamermitts
	name = "Insulated Gloves crate"
	contains = list(/obj/item/clothing/gloves/yellow,
					/obj/item/clothing/gloves/yellow,
					/obj/item/clothing/gloves/yellow)
	cost = 40	//Made of pure-grade bullshittinium
	containername = "insulated gloves crate"

/datum/supply_packs/engineering/power
	name = "Powercell crate"
	contains = list(/obj/item/weapon/stock_parts/cell/high,		//Changed to an extra high powercell because normal cells are useless
					/obj/item/weapon/stock_parts/cell/high,
					/obj/item/weapon/stock_parts/cell/high)
	cost = 30
	containername = "electrical maintenance crate"

/datum/supply_packs/engineering/engiequipment
	name = "Engineering Gear crate"
	contains = list(/obj/item/weapon/storage/belt/utility,
					/obj/item/weapon/storage/belt/utility,
					/obj/item/weapon/storage/belt/utility,
					/obj/item/clothing/suit/hazardvest,
					/obj/item/clothing/suit/hazardvest,
					/obj/item/clothing/suit/hazardvest,
					/obj/item/clothing/head/welding,
					/obj/item/clothing/head/welding,
					/obj/item/clothing/head/welding,
					/obj/item/clothing/head/hardhat,
					/obj/item/clothing/head/hardhat,
					/obj/item/clothing/head/hardhat)
	cost = 35
	containername = "engineering gear crate"

/datum/supply_packs/engineering/impgen
	name = "Imperial Plasma Generator"
	contains = list(/obj/item/stack/sheet/mineral/wood)
	cost = 500
	containertype = /obj/structure/largecrate/pgen
	containername = "Imperium of Man Lot# 129565"

/datum/supply_packs/engineering/engine
	name = "Emitter crate"
	contains = list(/obj/machinery/power/emitter,
					/obj/machinery/power/emitter)
	cost = 60
	containertype = /obj/structure/closet/crate/secure
	containername = "emitter crate"
	access = access_ce

/datum/supply_packs/engineering/engine/field_gen
	name = "Field Generator crate"
	contains = list(/obj/machinery/field/generator,
					/obj/machinery/field/generator)
	cost = 40
	containername = "field generator crate"

/datum/supply_packs/engineering/engine/sing_gen
	name = "Singularity Generator crate"
	contains = list(/obj/machinery/the_singularitygen)
	cost = 300
	containername = "singularity generator crate"

/datum/supply_packs/engineering/engine/collector
	name = "Collector crate"
	contains = list(/obj/machinery/power/rad_collector,
					/obj/machinery/power/rad_collector,
					/obj/machinery/power/rad_collector)
	cost = 50
	containername = "collector crate"

/datum/supply_packs/engineering/engine/PA
	name = "Particle Accelerator crate"
	contains = list(/obj/structure/particle_accelerator/fuel_chamber,
					/obj/machinery/particle_accelerator/control_box,
					/obj/structure/particle_accelerator/particle_emitter/center,
					/obj/structure/particle_accelerator/particle_emitter/left,
					/obj/structure/particle_accelerator/particle_emitter/right,
					/obj/structure/particle_accelerator/power_box,
					/obj/structure/particle_accelerator/end_cap)
	cost = 100
	containername = "particle accelerator crate"


//////////////////////////////////////////////////////////////////////////////
//////////////////////////// Medical /////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////

/datum/supply_packs/medical
	name = "HEADER"
	containertype = /obj/structure/closet/crate/medical
	group = supply_medical


/datum/supply_packs/medical/supplies
	name = "Medical Supplies crate"
	contains = list(/obj/item/weapon/reagent_containers/glass/bottle/antitoxin,
					/obj/item/weapon/reagent_containers/glass/bottle/antitoxin,
					/obj/item/weapon/reagent_containers/glass/bottle/inaprovaline,
					/obj/item/weapon/reagent_containers/glass/bottle/inaprovaline,
					/obj/item/weapon/reagent_containers/glass/bottle/stoxin,
					/obj/item/weapon/reagent_containers/glass/bottle/stoxin,
					/obj/item/weapon/reagent_containers/glass/bottle/toxin,
					/obj/item/weapon/reagent_containers/glass/bottle/toxin,
					/obj/item/weapon/reagent_containers/glass/beaker/large,
					/obj/item/weapon/reagent_containers/glass/beaker/large,
					/obj/item/weapon/storage/box/beakers,
					/obj/item/weapon/storage/box/syringes)
	cost = 30
	containertype = /obj/structure/closet/crate/medical
	containername = "medical supplies crate"

/datum/supply_packs/medical/firstaid
	name = "First Aid Kits crate"
	contains = list(/obj/item/weapon/storage/firstaid/regular,
					/obj/item/weapon/storage/firstaid/regular,
					/obj/item/weapon/storage/firstaid/regular,
					/obj/item/weapon/storage/firstaid/regular)
	cost = 30
	containername = "first aid kits crate"

/datum/supply_packs/medical/firstaidburns
	name = "Burns Treatment Kits crate"
	contains = list(/obj/item/weapon/storage/firstaid/fire,
					/obj/item/weapon/storage/firstaid/fire,
					/obj/item/weapon/storage/firstaid/fire)
	cost = 30
	containername = "fire first aid kits crate"

/datum/supply_packs/medical/firstaidtoxins
	name = "Toxin Treatment Kits crate"
	contains = list(/obj/item/weapon/storage/firstaid/toxin,
					/obj/item/weapon/storage/firstaid/toxin,
					/obj/item/weapon/storage/firstaid/toxin)
	cost = 30
	containername = "toxin first aid kits crate"

/datum/supply_packs/medical/firstaidoxygen
	name = "Oxygen Deprivation Kits crate"
	contains = list(/obj/item/weapon/storage/firstaid/o2,
					/obj/item/weapon/storage/firstaid/o2,
					/obj/item/weapon/storage/firstaid/o2)
	cost = 30
	containername = "oxygen deprivation kits crate"


/datum/supply_packs/medical/virus
	name = "Virus crate"
	contains = list(/obj/item/weapon/reagent_containers/glass/bottle/flu_virion,
					/obj/item/weapon/reagent_containers/glass/bottle/cold,
					/obj/item/weapon/reagent_containers/glass/bottle/epiglottis_virion,
					/obj/item/weapon/reagent_containers/glass/bottle/liver_enhance_virion,
					/obj/item/weapon/reagent_containers/glass/bottle/fake_gbs,
					/obj/item/weapon/reagent_containers/glass/bottle/magnitis,
					/obj/item/weapon/reagent_containers/glass/bottle/pierrot_throat,
					/obj/item/weapon/reagent_containers/glass/bottle/brainrot,
					/obj/item/weapon/reagent_containers/glass/bottle/hullucigen_virion,
					/obj/item/weapon/storage/box/syringes,
					/obj/item/weapon/storage/box/beakers,
					/obj/item/weapon/reagent_containers/glass/bottle/mutagen)
	cost = 45
	containertype = /obj/structure/closet/crate/secure/plasma
	containername = "virus crate"
	access = access_cmo

/datum/supply_packs/medical/surgical
	name = "Surgical Mechadendrite Crate"
	contains = list(/obj/item/aluminumtube4/surgical)
	cost = 500
	containertype = /obj/structure/closet/crate/secure/plasma
	containername = "surgical mechadendrite crate"
	access = access_cmo

//////////////////////////////////////////////////////////////////////////////
//////////////////////////// Science /////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////

/datum/supply_packs/science
	name = "HEADER"
	group = supply_science


/datum/supply_packs/science/robotics
	name = "Robotics Assembly Crate"
	contains = list(/obj/item/device/assembly/prox_sensor,
					/obj/item/device/assembly/prox_sensor,
					/obj/item/device/assembly/prox_sensor,
					/obj/item/weapon/storage/toolbox/electrical,
					/obj/item/weapon/storage/box/flashes,
					/obj/item/weapon/stock_parts/cell/high,
					/obj/item/weapon/stock_parts/cell/high)
	cost = 35
	containertype = /obj/structure/closet/crate/secure
	containername = "robotics assembly crate"
	access = access_robotics

/datum/supply_packs/science/robotics/mecha_ripley
	name = "Circuit Crate (\"Ripley\" APLU)"
	contains = list(/obj/item/weapon/book/manual/ripley_build_and_repair,
					/obj/item/weapon/circuitboard/mecha/ripley/main, //TEMPORARY due to lack of circuitboard printer
					/obj/item/weapon/circuitboard/mecha/ripley/peripherals) //TEMPORARY due to lack of circuitboard printer
	cost = 40
	containertype = /obj/structure/closet/crate/secure
	containername = "\improper APLU \"Ripley\" circuit crate"

/datum/supply_packs/science/robotics/mecha_odysseus
	name = "Circuit Crate (\"Odysseus\")"
	contains = list(/obj/item/weapon/circuitboard/mecha/odysseus/peripherals, //TEMPORARY due to lack of circuitboard printer
					/obj/item/weapon/circuitboard/mecha/odysseus/main) //TEMPORARY due to lack of circuitboard printer
	cost = 40
	containertype = /obj/structure/closet/crate/secure
	containername = "\improper \"Odysseus\" circuit crate"

/datum/supply_packs/science/minerals
	name = "Raw Materials"
	contains = list(/obj/item/stack/sheet/mineral/diamond, /obj/item/stack/sheet/mineral/uranium, /obj/item/stack/sheet/mineral/plasma, /obj/item/stack/sheet/mineral/gold, /obj/item/stack/sheet/mineral/silver, /obj/item/stack/sheet/mineral/enruranium, /obj/item/stack/sheet/mineral/adamantine, /obj/item/stack/sheet/mineral/mythril, /obj/item/stack/sheet/mineral/sandstone)
	cost = 600
	containername = "Box of Minerals"
	amount = 20
	access = access_research

/datum/supply_packs/science/plasma
	name = "Plasma assembly crate"
	contains = list(/obj/item/weapon/tank/plasma,
					/obj/item/weapon/tank/plasma,
					/obj/item/weapon/tank/plasma,
					/obj/item/device/assembly/igniter,
					/obj/item/device/assembly/igniter,
					/obj/item/device/assembly/igniter,
					/obj/item/device/assembly/prox_sensor,
					/obj/item/device/assembly/prox_sensor,
					/obj/item/device/assembly/prox_sensor,
					/obj/item/device/assembly/timer,
					/obj/item/device/assembly/timer,
					/obj/item/device/assembly/timer)
	cost = 80
	containertype = /obj/structure/closet/crate/secure/plasma
	containername = "plasma assembly crate"
	access = access_tox_storage
	group = supply_science

/datum/supply_packs/science/shieldwalls
	name = "Shield Generators"
	contains = list(/obj/machinery/shieldwallgen,
					/obj/machinery/shieldwallgen,
					/obj/machinery/shieldwallgen,
					/obj/machinery/shieldwallgen)
	cost = 70
	containertype = /obj/structure/closet/crate/secure
	containername = "shield generators crate"
	access = access_teleporter


//////////////////////////////////////////////////////////////////////////////
//////////////////////////// Organic /////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////

/datum/supply_packs/organic
	name = "HEADER"
	group = supply_organic
	containertype = /obj/structure/closet/crate/freezer


/datum/supply_packs/organic/food
	name = "Food crate"
	contains = list(/obj/item/weapon/reagent_containers/food/drinks/flour,
					/obj/item/weapon/reagent_containers/food/drinks/milk,
					/obj/item/weapon/reagent_containers/food/drinks/soymilk,
					/obj/item/weapon/storage/fancy/egg_box,
					/obj/item/weapon/reagent_containers/food/condiment/enzyme,
					/obj/item/weapon/reagent_containers/food/condiment/sugar,
					/obj/item/weapon/reagent_containers/food/snacks/meat/monkey,
					/obj/item/weapon/reagent_containers/food/snacks/grown/banana,
					/obj/item/weapon/reagent_containers/food/snacks/grown/banana,
					/obj/item/weapon/reagent_containers/food/snacks/grown/banana)
	cost = 30
	containername = "food crate"

/datum/supply_packs/organic/rations
	name = "Imperial Rations Crate"
	contains = list(/obj/machinery/rack/ration/full)
	cost = 20
	containername = "Imperial Rations Crate"

/datum/supply_packs/organic/monkey
	name = "Monkey crate"
	contains = list (/obj/item/weapon/storage/box/monkeycubes)
	cost = 40
	containername = "monkey crate"

/datum/supply_packs/organic/party
	name = "Party equipment"
	contains = list(/obj/item/weapon/storage/box/drinkingglasses,
					/obj/item/weapon/reagent_containers/food/drinks/shaker,
					/obj/item/weapon/reagent_containers/food/drinks/bottle/patron,
					/obj/item/weapon/reagent_containers/food/drinks/bottle/goldschlager,
					/obj/item/weapon/reagent_containers/food/drinks/ale,
					/obj/item/weapon/reagent_containers/food/drinks/ale,
					/obj/item/weapon/storage/fancy/sixpack_cola,
					/obj/item/weapon/storage/fancy/sixpack_rootbeer,
					/obj/item/weapon/storage/fancy/sixpack_beer,
					/obj/item/weapon/storage/fancy/sixpack_beer,
					/obj/item/weapon/storage/fancy/sixpack_beer)
	cost = 50
	containername = "party equipment"

//////// livestock
/datum/supply_packs/organic/cow
	name = "Cow Crate"
	cost = 50
	containertype = /obj/structure/closet/critter/cow
	containername = "cow crate"

/datum/supply_packs/organic/goat
	name = "Goat Crate"
	cost = 45
	containertype = /obj/structure/closet/critter/goat
	containername = "goat crate"

/datum/supply_packs/organic/chicken
	name = "Chicken Crate"
	cost = 35
	containertype = /obj/structure/closet/critter/chick
	containername = "chicken crate"

/datum/supply_packs/organic/corgi
	name = "Corgi Crate"
	cost = 60
	containertype = /obj/structure/closet/critter/corgi
	containername = "corgi crate"

/datum/supply_packs/organic/cat
	name = "Cat crate"
	cost = 60//Cats are worth as much as corgis.
	containertype = /obj/structure/closet/critter/cat
	containername = "cat crate"

/datum/supply_packs/organic/pug
	name = "Pug crate"
	cost = 60
	containertype = /obj/structure/closet/critter/pug
	containername = "pug crate"

/datum/supply_packs/organic/parrot
	name = "Parrot crate"
	cost = 60
	containertype = /obj/structure/closet/critter/parrot
	containername = "parrot crate"

////// hippy gear

/datum/supply_packs/organic/hydroponics // -- Skie
	name = "Hydroponics Supply Crate"
	contains = list(/obj/item/weapon/reagent_containers/spray/plantbgone,
					/obj/item/weapon/reagent_containers/spray/plantbgone,
					/obj/item/weapon/reagent_containers/glass/bottle/ammonia,
					/obj/item/weapon/reagent_containers/glass/bottle/ammonia,
					/obj/item/weapon/hatchet,
					/obj/item/weapon/minihoe,
					/obj/item/device/analyzer/plant_analyzer,
					/obj/item/clothing/gloves/botanic_leather,
					/obj/item/clothing/suit/apron) // Updated with new things
	cost = 50
	containertype = /obj/structure/closet/crate/hydroponics
	containername = "hydroponics crate"

/datum/supply_packs/misc/hydroponics/hydrotank
	name = "Hydroponics Watertank Backpack Crate"
	contains = list(/obj/item/weapon/watertank)
	cost = 45
	containertype = /obj/structure/closet/crate/secure
	containername = "hydroponics watertank crate"
	access = access_hydroponics

/datum/supply_packs/organic/hydroponics/seeds
	name = "Seeds Crate"
	contains = list(/obj/item/seeds/chiliseed,
					/obj/item/seeds/berryseed,
					/obj/item/seeds/cornseed,
					/obj/item/seeds/eggplantseed,
					/obj/item/seeds/tomatoseed,
					/obj/item/seeds/soyaseed,
					/obj/item/seeds/wheatseed,
					/obj/item/seeds/carrotseed,
					/obj/item/seeds/sunflowerseed,
					/obj/item/seeds/chantermycelium,
					/obj/item/seeds/potatoseed,
					/obj/item/seeds/sugarcaneseed)
	cost = 45
	containername = "seeds crate"

/datum/supply_packs/organic/hydroponics/exoticseeds
	name = "Exotic Seeds Crate"
	contains = list(/obj/item/seeds/nettleseed,
					/obj/item/seeds/replicapod,
					/obj/item/seeds/replicapod,
					/obj/item/seeds/replicapod,
					/obj/item/seeds/plumpmycelium,
					/obj/item/seeds/libertymycelium,
					/obj/item/seeds/amanitamycelium,
					/obj/item/seeds/reishimycelium,
					/obj/item/seeds/bananaseed,
					/obj/item/seeds/eggyseed)
	cost = 30
	containername = "exotic seeds crate"

/datum/supply_packs/organic/vending
	name = "Bartending Supply Crate"
	contains = list(/obj/item/weapon/vending_refill/boozeomat,
					/obj/item/weapon/vending_refill/boozeomat,
					/obj/item/weapon/vending_refill/boozeomat,
					/obj/item/weapon/vending_refill/coffee,
					/obj/item/weapon/vending_refill/coffee,
					/obj/item/weapon/vending_refill/coffee)
	cost = 30
	containername = "bartending supply crate"

/datum/supply_packs/organic/vending/snack
	name = "Snack Supply Crate"
	contains = list(/obj/item/weapon/vending_refill/snack,
					/obj/item/weapon/vending_refill/snack,
					/obj/item/weapon/vending_refill/snack)
	cost = 30
	containername = "snacks supply crate"

/datum/supply_packs/organic/vending/cola
	name = "Softdrinks Supply Crate"
	contains = list(/obj/item/weapon/vending_refill/cola,
					/obj/item/weapon/vending_refill/cola,
					/obj/item/weapon/vending_refill/cola)
	cost = 30
	containername = "softdrinks supply crate"

/datum/supply_packs/organic/vending/cigarette
	name = "Cigarette Supply Crate"
	contains = list(/obj/item/weapon/vending_refill/cigarette,
					/obj/item/weapon/vending_refill/cigarette,
					/obj/item/weapon/vending_refill/cigarette)
	cost = 30
	containername = "cigarette supply crate"

//////////////////////////////////////////////////////////////////////////////
//////////////////////////// Materials ///////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////

/datum/supply_packs/materials		//tag
	name = "HEADER"
	group = supply_materials


/datum/supply_packs/materials/metal50
	name = "50 Metal Sheets"
	contains = list(/obj/item/stack/sheet/metal)
	amount = 50
	cost = 30
	containername = "metal sheets crate"

/datum/supply_packs/materials/plasteel20
	name = "20 Plasteel Sheets"
	contains = list(/obj/item/stack/sheet/plasteel)
	amount = 20
	cost = 50
	containername = "plasteel sheets crate"

/datum/supply_packs/materials/plasteel50
	name = "50 Plasteel Sheets"
	contains = list(/obj/item/stack/sheet/plasteel)
	amount = 50
	cost = 100
	containername = "plasteel sheets crate"

/datum/supply_packs/materials/glass50
	name = "50 Glass Sheets"
	contains = list(/obj/item/stack/sheet/glass)
	amount = 50
	cost = 40
	containername = "glass sheets crate"

/datum/supply_packs/materials/cardboard50
	name = "50 Cardboard Sheets"
	contains = list(/obj/item/stack/sheet/cardboard)
	amount = 50
	cost = 40
	containername = "cardboard sheets crate"

/datum/supply_packs/materials/sandstone30
	name = "30 Sandstone Blocks"
	contains = list(/obj/item/stack/sheet/mineral/sandstone)
	amount = 30
	cost = 40
	containername = "sandstone blocks crate"


//////////////////////////////////////////////////////////////////////////////
//////////////////////////// Miscellaneous ///////////////////////////////////
//////////////////////////////////////////////////////////////////////////////

/datum/supply_packs/misc
	name = "HEADER"
	group = supply_misc

/datum/supply_packs/misc/mule
	name = "MULEbot Crate"
	contains = list(/obj/machinery/bot/mulebot)
	cost = 40
	containertype = /obj/structure/largecrate/mule
	containername = "\improper MULEbot Crate"

/datum/supply_packs/misc/watertank
	name = "Water tank crate"
	contains = list(/obj/structure/reagent_dispensers/watertank)
	cost = 40
	containertype = /obj/structure/largecrate
	containername = "water tank crate"

/datum/supply_packs/misc/lasertag
	name = "LaserTag Crate"
	contains = list(/obj/item/weapon/gun/energy/laser/redtag,
					/obj/item/weapon/gun/energy/laser/redtag,
					/obj/item/weapon/gun/energy/laser/redtag,
					/obj/item/weapon/gun/energy/laser/bluetag,
					/obj/item/weapon/gun/energy/laser/bluetag,
					/obj/item/weapon/gun/energy/laser/bluetag,
					/obj/item/clothing/suit/redtag,
					/obj/item/clothing/suit/redtag,
					/obj/item/clothing/suit/redtag,
					/obj/item/clothing/suit/bluetag,
					/obj/item/clothing/suit/bluetag,
					/obj/item/clothing/suit/bluetag,
					/obj/item/clothing/head/helmet/redtaghelm,
					/obj/item/clothing/head/helmet/bluetaghelm)
	cost = 40
	containername = "LaserTag Crate"

/datum/supply_packs/misc/religious_supplies
	name = "Religious Supplies Crate"
	contains = list(/obj/item/weapon/reagent_containers/food/drinks/bottle/holywater,
					/obj/item/weapon/reagent_containers/food/drinks/bottle/holywater,
					/obj/item/weapon/storage/bible/booze,
					/obj/item/weapon/storage/bible/booze,
					/obj/item/clothing/suit/chaplain_hoodie,
					/obj/item/clothing/head/chaplain_hood,
					/obj/item/clothing/suit/chaplain_hoodie,
					/obj/item/clothing/head/chaplain_hood)
	cost = 65	// it costs so much because the Space Church is ran by Space Jews-eesh who wrote this?
	containername = "religious supplies crate"

/datum/supply_packs/misc/posters
	name = "Imperial Posters Crate"
	contains = list(/obj/item/weapon/contraband/poster/legit,
					/obj/item/weapon/contraband/poster/legit,
					/obj/item/weapon/contraband/poster/legit,
					/obj/item/weapon/contraband/poster/legit,
					/obj/item/weapon/contraband/poster/legit)
	cost = 25
	containername = "Imperial Posters Crate"

/datum/supply_packs/misc/cleanbot
	name = "Cleanbot Crate"
	contains = list(/obj/machinery/bot/cleanbot)
	cost = 30
	containername = "Cleanbot Crate"

///////////// Paper Work

/datum/supply_packs/misc/paper
	name = "Bureaucracy Crate"
	contains = list(/obj/structure/filingcabinet/chestdrawer/wheeled,
					/obj/item/device/camera_film,
					/obj/item/weapon/hand_labeler,
					/obj/item/hand_labeler_refill,
					/obj/item/hand_labeler_refill,
					/obj/item/weapon/paper_bin,
					/obj/item/weapon/pen,
					/obj/item/weapon/pen/blue,
					/obj/item/weapon/pen/red,
					/obj/item/weapon/folder/blue,
					/obj/item/weapon/folder/red,
					/obj/item/weapon/folder/yellow,
					/obj/item/weapon/clipboard,
					/obj/item/weapon/clipboard)
	cost = 30
	containername = "bureaucracy crate"

/datum/supply_packs/misc/toner
	name = "Toner Cartridges"
	contains = list(/obj/item/device/toner,
					/obj/item/device/toner,
					/obj/item/device/toner,
					/obj/item/device/toner,
					/obj/item/device/toner,
					/obj/item/device/toner)
	cost = 25
	containername = "toner cartridges"


///////////// Janitor Supplies

/datum/supply_packs/misc/janitor
	name = "Janitorial supplies"
	contains = list(/obj/item/weapon/reagent_containers/glass/bucket,
					/obj/item/weapon/reagent_containers/glass/bucket,
					/obj/item/weapon/reagent_containers/glass/bucket,
					/obj/item/weapon/mop,
					/obj/item/weapon/holosign_creator,
					/obj/item/weapon/storage/bag/trash,
					/obj/item/weapon/reagent_containers/spray/cleaner,
					/obj/item/weapon/reagent_containers/glass/rag,
					/obj/item/weapon/grenade/chem_grenade/cleaner,
					/obj/item/weapon/grenade/chem_grenade/cleaner,
					/obj/item/weapon/grenade/chem_grenade/cleaner)
	cost = 25
	containername = "janitorial supplies"

/datum/supply_packs/misc/janitor/janicart
	name = "Janitorial Cart and Galoshes crate"
	contains = list(/obj/structure/janitorialcart,
					/obj/item/clothing/shoes/galoshes)
	cost = 40
	containertype = /obj/structure/largecrate
	containername = "janitorial cart crate"

/datum/supply_packs/misc/janitor/janitank
	name = "Janitor Watertank Backpack Crate"
	contains = list(/obj/item/weapon/watertank/janitor)
	cost = 35
	containertype = /obj/structure/closet/crate/secure
	containername = "janitor watertank crate"
	access = access_janitor

/datum/supply_packs/misc/janitor/lightbulbs
	name = "Replacement lights"
	contains = list(/obj/item/weapon/storage/box/lights/mixed,
					/obj/item/weapon/storage/box/lights/mixed,
					/obj/item/weapon/storage/box/lights/mixed)
	cost = 30
	containername = "replacement lights"


///////////// Costumes

/datum/supply_packs/misc/costume
	name = "Standard Costume crate"
	contains = list(/obj/item/weapon/storage/backpack/clown,
					/obj/item/clothing/shoes/clown_shoes,
					/obj/item/clothing/mask/gas/clown_hat,
					/obj/item/clothing/under/rank/clown,
					/obj/item/weapon/bikehorn,
					/obj/item/clothing/under/mime,
					/obj/item/clothing/shoes/sneakers/black,
					/obj/item/clothing/gloves/white,
					/obj/item/clothing/mask/gas/mime,
					/obj/item/clothing/head/beret,
					/obj/item/clothing/suit/suspenders,
					/obj/item/weapon/reagent_containers/food/drinks/bottle/bottleofnothing,
					/obj/item/weapon/storage/backpack/mime)
	cost = 30
	containertype = /obj/structure/closet/crate/secure
	containername = "standard costumes"
	access = access_theatre

/datum/supply_packs/misc/wizard
	name = "Wizard costume"
	contains = list(/obj/item/weapon/staff,
					/obj/item/clothing/suit/wizrobe/fake,
					/obj/item/clothing/shoes/sandal,
					/obj/item/clothing/head/wizard/fake)
	cost = 30
	containername = "wizard costume crate"

/datum/supply_packs/misc/randomised
	var/num_contained = 3 //number of items picked to be contained in a randomised crate
	contains = list(/obj/item/clothing/head/collectable/chef,
					/obj/item/clothing/head/collectable/paper,
					/obj/item/clothing/head/collectable/tophat,
					/obj/item/clothing/head/collectable/captain,
					/obj/item/clothing/head/collectable/beret,
					/obj/item/clothing/head/collectable/welding,
					/obj/item/clothing/head/collectable/flatcap,
					/obj/item/clothing/head/collectable/pirate,
					/obj/item/clothing/head/collectable/kitty,
					/obj/item/clothing/head/collectable/rabbitears,
					/obj/item/clothing/head/collectable/wizard,
					/obj/item/clothing/head/collectable/hardhat,
					/obj/item/clothing/head/collectable/HoS,
					/obj/item/clothing/head/collectable/thunderdome,
					/obj/item/clothing/head/collectable/swat,
					/obj/item/clothing/head/collectable/slime,
					/obj/item/clothing/head/collectable/police,
					/obj/item/clothing/head/collectable/slime,
					/obj/item/clothing/head/collectable/xenom,
					/obj/item/clothing/head/collectable/petehat)
	name = "Collectable hat crate!"
	cost = 350
	containername = "Collectable hats crate! Brought to you by Bass.inc!"

/datum/supply_packs/misc/randomised/New()
	manifest += "Contains any [num_contained] of:"
	..()

/datum/supply_packs/misc/randomised/DK
	name = "Death Korps of Krieg Supply"
	num_contained = 20
	contains = list(/obj/item/clothing/mask/gas/sechailer/DK,
					/obj/item/clothing/head/DKhelmet,
					/obj/item/clothing/suit/armor/DKcoat,
					/obj/item/weapon/tank/emergency_oxygen/double/DK,
					/obj/item/clothing/under/color/DK,
					/obj/item/clothing/shoes/DK
					)
	cost = 40
	containername = "Imperial Guard Supply"	//let's keep it subtle, eh?
	contraband = 1

/datum/supply_packs/misc/DKofficer
	name = "Death Korps of Krieg Officer supply"
	contains = list(/obj/item/weapon/complexsword/DKsword,
					/obj/item/weapon/card/id/dogtag,
					/obj/item/weapon/card/id/dogtag,
					/obj/item/weapon/card/id/dogtag,
					/obj/item/weapon/card/id/dogtag,
					/obj/item/weapon/card/id/dogtag,
					/obj/item/weapon/card/id/dogtag,
					/obj/item/weapon/card/id/dogtag
					)
	cost = 40
	containername = "Imperial Guard Supply"	//let's keep it subtle, eh?
	contraband = 1

/datum/supply_packs/misc/DKweapons
	name = "Krieg Munitions"
	contains = list(/obj/item/weapon/gun/projectile/automatic/hellgun,
					/obj/item/weapon/gun/projectile/automatic/hellgun,
					/obj/item/weapon/gun/projectile/automatic/hellgun,
					/obj/item/weapon/gun/projectile/automatic/hellgun,
					/obj/item/weapon/storage/box/hellgunmag
					)
	cost = 180
	containername = "Imperial Guard Supply"	//let's keep it subtle, eh?
	contraband = 1

/datum/supply_packs/misc/randomised/contraband
	num_contained = 5
	contains = list(/obj/item/weapon/contraband/poster,
					/obj/item/weapon/storage/fancy/cigarettes/dromedaryco,
					/obj/item/weapon/lipstick/random)
	name = "Contraband crate"
	cost = 40
	containername = "crate"	//let's keep it subtle, eh?
	contraband = 1

/datum/supply_packs/misc/randomised/salivatingarnies
	num_contained = 10
	contains = list(/obj/item/clothing/gloves/fingerless,
					/obj/item/clothing/head/beanie,
					/obj/item/clothing/head/flatcap,
					/obj/item/clothing/head/soft/grey,
					/obj/item/clothing/head/soft/black,
					/obj/item/clothing/head/ushanka,
					/obj/item/clothing/head/fedora,
					/obj/item/clothing/head/sombrero,
					/obj/item/clothing/glasses/regular,
					/obj/item/clothing/glasses/sunglasses,
					/obj/item/clothing/glasses/sunglasses/big,
					/obj/item/clothing/mask/balaclava,
					/obj/item/clothing/mask/bandana/red,
					/obj/item/clothing/mask/bandana/blue,
					/obj/item/clothing/mask/bandana/gold,
					/obj/item/clothing/mask/bandana/green,
					/obj/item/clothing/mask/bandana/skull,
					/obj/item/clothing/mask/bandana/black,
					/obj/item/clothing/shoes/sneakers/black,
					/obj/item/clothing/shoes/sneakers/brown,
					/obj/item/clothing/shoes/boots,
					/obj/item/clothing/suit/apron/overalls,
					/obj/item/clothing/suit/poncho,
					/obj/item/clothing/suit/labcoat/coat/jacket,
					/obj/item/clothing/suit/labcoat/coat,
					/obj/item/clothing/suit/labcoat/coat/jacket/leather,
					/obj/item/clothing/suit/lawyer/blackjacket,
					/obj/item/clothing/suit/lawyer/bluejacket,
					/obj/item/clothing/under/shorts/blue,
					/obj/item/clothing/under/jeans,
					/obj/item/clothing/under/trackpants,
					/obj/item/clothing/under/khaki,
					/obj/item/clothing/under/camo,
					/obj/item/clothing/under/shorts/grey,
					/obj/item/clothing/tie/black,
					/obj/item/clothing/under/overalls,
					/obj/item/clothing/under/color/brownoveralls,
					/obj/item/clothing/under/redoveralls,
					/obj/item/clothing/tie/red)
	name = "Surplus Clothing Crate"
	cost = 45
	containername = "surplus clothing crate"

/datum/supply_packs/misc/autodrobe
	name = "Autodrobe Supply crate"
	contains = list(/obj/item/weapon/vending_refill/autodrobe,
					/obj/item/weapon/vending_refill/autodrobe)
	cost = 45
	containername = "autodrobe supply crate"

/datum/supply_packs/misc/formalwear //This is a very classy crate.
	name = "Formal-wear crate"
	contains = list(/obj/item/clothing/under/blacktango,
					/obj/item/clothing/under/assistantformal,
					/obj/item/clothing/under/assistantformal,
					/obj/item/clothing/under/lawyer/bluesuit,
					/obj/item/clothing/suit/lawyer/bluejacket,
					/obj/item/clothing/under/lawyer/purpsuit,
					/obj/item/clothing/suit/lawyer/purpjacket,
					/obj/item/clothing/under/lawyer/blacksuit,
					/obj/item/clothing/suit/lawyer/blackjacket,
					/obj/item/clothing/tie/waistcoat,
					/obj/item/clothing/tie/blue,
					/obj/item/clothing/tie/red,
					/obj/item/clothing/tie/black,
					/obj/item/clothing/head/bowler,
					/obj/item/clothing/head/fedora,
					/obj/item/clothing/head/flatcap,
					/obj/item/clothing/head/beret,
					/obj/item/clothing/head/that,
					/obj/item/clothing/shoes/laceup,
					/obj/item/clothing/shoes/laceup,
					/obj/item/clothing/shoes/laceup,
					/obj/item/clothing/under/suit_jacket/charcoal,
					/obj/item/clothing/under/suit_jacket/navy,
					/obj/item/clothing/under/suit_jacket/burgundy,
					/obj/item/clothing/under/suit_jacket/checkered,
					/obj/item/clothing/under/suit_jacket/tan)
	cost = 100 //Lots of very expensive items. You gotta pay up to look good!
	containername = "formal-wear crate"

/datum/supply_packs/misc/drugs
	name = "Black Market Drugs"
	contains = list(/obj/item/weapon/reagent_containers/glass/bottle/stimulant,
					/obj/item/weapon/reagent_containers/glass/bottle/stimulant,
					/obj/item/weapon/reagent_containers/glass/bottle/stimulant,
					/obj/item/weapon/reagent_containers/glass/bottle/stimulant,
					/obj/item/weapon/reagent_containers/glass/bottle/stimulant
					)
	cost = 450
	containername = "Imperial Guard Supply"	//let's keep it subtle, eh?
	contraband = 1

/datum/supply_packs/misc/needler
	name = "Needler Pistols"
	contains = list(/obj/item/weapon/gun/projectile/automatic/needler,
					/obj/item/weapon/gun/projectile/automatic/needler,
					/obj/item/weapon/gun/projectile/automatic/needler,
					/obj/item/ammo_box/magazine/needlermag,
					/obj/item/ammo_box/magazine/needlermag,
					/obj/item/ammo_box/magazine/needlermag,
					/obj/item/ammo_box/magazine/needlermag,
					/obj/item/ammo_box/magazine/needlermag
					)
	cost = 60
	containername = "Imperial Guard Supply"	//let's keep it subtle, eh?
	contraband = 1