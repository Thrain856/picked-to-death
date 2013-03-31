/obj/item/attackby(var/mob/user, attackobj)
	if (!istype(user,/mob/ghost)) //basically checking if you can hold items, add here as needed
		if (user in range(1,src))
			if (src in user)
				set src in usr
				loc = user.loc
			else
				set src in usr.loc
				loc = user
		else
			user << "That item is too far away"
	else
		user << "You cannot hold items."