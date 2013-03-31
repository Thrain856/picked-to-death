/atom
	proc/shock_act()

/obj/item/rocks/generic_rock
	icon = 'icon/object/rocks.dmi'
	icon_state = "generic rock"

/turf/stare_up
	icon = 'icon/object/rocks.dmi'
	icon_state = "generic rock"

	Entered()
		usr.z += 1

/turf/stare_down
	icon = 'icon/mob/ghost.dmi'
	icon_state = "blue"

	Entered()
		usr.z -= 1