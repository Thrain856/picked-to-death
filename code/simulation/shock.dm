/*
DOCUMENTATION

This is the shockwave code for triggering collapses and such
*/

/* No longer of use, probably wouldn't have worked anyhow
proc/shockwave(location, bigshock, medshock, littleshock, tinyshock, massiveshock)
	//massiveshock instagibs people and should only be caused by bombs, tinyshock is peoples footsteps and shit, all of this refers to radius except location which is pretty obvious
	var/list/objectlist[10]
	//vital for ensuring it is big enough,4 generalizes pi, so its like pi r squared except simpler

	if (massiveshock > 0)
		objectlist.len = 4*massiveshock*massiveshock
		//vital for ensuring it is big enough,4 generalizes pi, so its like pi r squared except simpler

		objectlist.Add(range(location, massiveshock))
		var/i
		for (i=0, i<objectlist.len, i++)
			if (istype(objectlist[i],/mob))
				objectlist[i].gib()
				*/

proc/shockwave(turf/epicenter, devastation_range, heavy_impact_range, medium_impact_range, light_impact_range)
	if(!epicenter)
		return
	spawn(0)
		if (!istype(epicenter, /turf))
			epicenter = get_turf(epicenter.loc)
		/*playsound(epicenter.loc, 'explosionfar.ogg', 100, 1, round(devastation_range*2,1) )
		playsound(epicenter.loc, "explosion", 100, 1, round(devastation_range,1) ) */  //need to load these sound effects into the file


		var/list/Turfs[4] = list() //Holds the turfs

		Turfs[0] = range(epicenter,devastation_range) //ground zero, etc
		Turfs[1] = range(epicenter,heavy_impact_range) - Turfs[0]
		Turfs[2] = range(epicenter,medium_impact_range) - Turfs[0] - Turfs[1]
		Turfs[3] = range(epicenter,light_impact_range) - Turfs[0] - Turfs[1] - Turfs[2]

		for (var/i = 0, i<4, i++)
			shock_turf_process(Turfs[i])



proc/shock_turf_process(list/turfs, action, message)
	for(var/turf/T in turfs)
		spawn() //Try to pop each turf into it's own thread, speed things along.
			if(T) //Sanity checking.
				T.shock_act(action)
				for(var/atom/object in T.contents)
					spawn()
						if(object)
							object.shock_act(action)
							//the idea with this one being this sorta liquifies peoples organs -QuakeIV


		return 1