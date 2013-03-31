obj/item/verb
	get()
		if(!istype(usr, /mob/ghost)) //checks to see if you can grab the item (cant be a ghost yo)
			set src in usr.loc
			loc = usr
		else
			usr << "You cant grab this."
	drop()
		set src in usr //realised no check is needed
		loc = usr.loc

mob/human/Stat()
	stat(usr.contents)