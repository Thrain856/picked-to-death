/proc/gibs(atom/location)		//CARN MARKER
	new /obj/effect/gibspawner(get_turf(location))


/obj/effect/gibspawner
	var/list/gibtypes = list()
	var/list/gibdirections = list() //of lists

	gibtypes = list(/obj/effect/blood/gibs/up,/obj/effect/blood/gibs/down,/obj/effect/blood/gibs,/obj/effect/blood/gibs,/obj/effect/blood/gibs/body,/obj/effect/blood/gibs/limb,/obj/effect/blood/gibs/core)
	var/list/alldirs = list()
	alldirs = list(NORTH, SOUTH, EAST, WEST, NORTHEAST, NORTHWEST, SOUTHWEST, SOUTHEAST)
	New(loc)
		gibdirections = list(list(NORTH, NORTHEAST, NORTHWEST),list(SOUTH, SOUTHEAST, SOUTHWEST),list(WEST, NORTHWEST, SOUTHWEST),list(EAST, NORTHEAST, SOUTHEAST), alldirs, alldirs, list())
		..()

		if(istype(loc,/turf)) //basically if a badmin spawns it
			Gib(loc)

	proc/Gib(var/atom/location)
		var/obj/effect/blood/gibs/gib = null

		for(var/i = 1, i<= gibtypes.len, i++)
			var/gibType = gibtypes[i]
			gib = new gibType(location)

			var/list/directions = gibdirections[i]
			if(directions.len)
				gib.streak(directions)
		del(src)


/obj/effect/blood/gibs/proc/streak(var/list/directions)
	spawn (0)
		var/direction = pick(directions)
		sleep(3)
		new /obj/effect/blood/splatter(src.loc)
		step_to(src, get_step(src, direction), 0)

//Ideally no longer needed though i may have messed up -QuakeIV
/*/obj/effect/gibspawner
	generic
		gibtypes = list(/obj/effect/blood/gibs/up,/obj/effect/blood/gibs/down,/obj/effect/blood/gibs,/obj/effect/blood/gibs,/obj/effect/blood/gibs/body,/obj/effect/blood/gibs/limb,/obj/effect/blood/gibs/core)
		gibamounts = list(1,1,1,1,1,1,1)

		New()
			gibdirections = list(list(NORTH, NORTHEAST, NORTHWEST),list(SOUTH, SOUTHEAST, SOUTHWEST),list(WEST, NORTHWEST, SOUTHWEST),list(EAST, NORTHEAST, SOUTHEAST), alldirs, alldirs, list())
			..()*/