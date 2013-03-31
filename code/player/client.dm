client
	Click(object, location, control, params)
		//if you click on a rock or some shit
		var/atom/attackedby = object
		attackedby.attackby(src.mob, usr.active_hand)