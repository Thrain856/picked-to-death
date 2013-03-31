/proc/get_turf(turf/location as turf)
	while (location)
		if (istype(location, /turf))
			return location

		location = location.loc
	return null