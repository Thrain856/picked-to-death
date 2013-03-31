/turf/underground/earth/attackby(user, attackobj)
	if((user in range(1, src)) && istype(user, /mob/human) && istype(attackobj, /obj/item/mining/digging/pick))  //apparantly the 'in' operator screws up, future coders beware, always include parenthesis --QuakeIV
	{
		world << "[user] starts mining!"
		sleep(10)
		if (user in view(1,src))
		{
			new/turf/aboveground/surface(src)
			new/obj/item/rocks/generic_rock(src)
			world << "[user] mined that shit!"
		}
	}

	if ((user in view(1, src.loc)) && istype(user, /mob/ghost))
	{
		user << "Your hand passes through the stone uselessly, it sucks being a ghost eh?"
	}


/turf/underground/earth
	icon_state = "solid dirt"
	density = 1
	opacity = 1
	luminosity = 0

/turf/aboveground/surface
	icon_state = "surface dirt"
	luminosity = 0

/turf
	icon = 'icon/turf/turf.dmi'