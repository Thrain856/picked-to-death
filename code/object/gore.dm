/obj/effect/blood
	name = "blood"
	desc = "It's red and gooey. Perhaps it's the chef's cooking?"
	gender = PLURAL
	density = 0
	layer = 2
	icon = 'blood.dmi'
	icon_state = "floor1"
	var/list/random_icon_states = list()
	random_icon_states = list("bug", "bug2", "bug3")

/obj/effect/blood/splatter
	random_icon_states = list("gibup1", "gibdown1", "gibtorso", "gibleg", "gibarm", "gibmid1", "gibmid2", "gibmid3")

/obj/effect/blood/gibs
	name = "gibs"
	desc = "They look bloody and gruesome."
	gender = PLURAL
	density = 0
	layer = 2
	icon = 'blood.dmi'
	icon_state = "gibbl5"
	random_icon_states = list("gib1", "gib2", "gib3", "gib4", "gib5", "gib6")

/obj/effect/blood/gibs/up
	random_icon_states = list("gibup1")

/obj/effect/blood/gibs/down
	random_icon_states = list("gibdown1")

/obj/effect/blood/gibs/body
	random_icon_states = list("gibtorso")

/obj/effect/blood/gibs/limb
	random_icon_states = list("gibleg", "gibarm")

/obj/effect/blood/gibs/core
	random_icon_states = list("gibmid1", "gibmid2", "gibmid3")

/obj/effect/blood/Del()
	..()

/obj/effect/blood/New()
	..()
	if(istype(src, /obj/effect/blood/gibs))
		return
	if(src.loc && isturf(src.loc))
		for(var/obj/effect/blood/B in src.loc)
			if(B != src)
				del(B)