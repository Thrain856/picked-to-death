
mob/human
	Login()
		if(src.player_status == 0) //checks player status
			var/dat
			dat = text("<CENTER><b>Login<b></CENTER><br>")
			dat += text("Player name: <A href='?src=\ref[src];text=name'>[src.name]</A><BR><BR>")
			dat += text("Player gender: <A href='?src=\ref[src];text=gender'>[usr.gender]</A><BR><BR>")
			dat += text("<A href='?src=\ref[src];text=ready'>Enter Game</A><BR><BR>")
			dat += text("<A href='?src=\ref[src];text=DevL'>Dev Log</A>")

			usr << browse("[dat]", "window=login;size=300x220;can_close=0")

			..()
		else
			usr << "\red <b>You cannot do this.</b>"  //why do you need to make him a new ghost just because he tried to log in? --QuakeIV
			var/M = client.mob
			loc = src.loc
			var/mob/ghost/G = new(loc)
			client.mob = G
			G.loc = loc
			del M


mob/human/Topic(href, href_list, hsrc)
	if (href_list["text"] == "name")
		var/input = input("Choose a name for your character.", "Your Name", src.name)  //may want to compare this to existing names without overwriting them in the future, thus a separate var
		usr.name = input
		loginupdate() //custom function, defined below

	if (href_list["text"] == "gender")
		usr.gender = input("Select a gender for your character.","Your Gender",usr.gender) in list("male","female")
		loginupdate() //custom function, defined below

	if (href_list["text"] == "ready")
		var/input = alert("Are you sure?","Enter Game","Enter Game","Cancel")
		if (input == "Enter Game") //remember to have this comparison always use the correct input value
			usr << "\blue You have entered the game as [usr.name] and you are a [usr.gender] human."
			usr << browse(null, "window=login")

	if (href_list["text"] == "DevL")
		DevL()

mob/human/proc/loginupdate()
	var/dat
	dat = text("<CENTER><b>Login<b></CENTER><br>")
	dat += text("Player name: <A href='?src=\ref[src];text=name'>[src.name]</A><BR><BR>")
	dat += text("Player gender: <A href='?src=\ref[src];text=gender'>[usr.gender]</A><BR><BR>")
	dat += text("<A href='?src=\ref[src];text=ready'>Enter Game</A><BR><BR>")
	dat += text("<A href='?src=\ref[src];text=DevL'>Dev Log</A>")
	usr << browse("[dat]", "window=login;size=300x220;can_close=0")


proc/DevL()
	usr << browse(file('DevL.txt'), "window=devlog;size=700x600")
	return