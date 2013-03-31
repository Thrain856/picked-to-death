mob
	var/busy = 0
	var/player_status = 0 // 0 = new player (can login) 1 = dead player (cannot login)
	var/active_hand
	luminosity = 0

	proc/busystatus()
		return busy

	proc/setbusy(input)
		busy = input

	proc/gib()
		world << "KABOOM"


mob/ghost
	name = "Ghost"
	desc = "Nothing here"
	density = 0
	icon = 'ghost.dmi'
	icon_state = "blue"
	invisibility = 20
	see_invisible = 20

	emote = 0
	icchat = 0
	deadchat = 1
	deadchat_listen = 1

	verb/play()
		set category = "ghost"
		loc = src.loc
		var/mob/human/H = new(loc)
		client.mob = H
		H.loc = loc



mob/human
	name = "Human"
	gender = "male"
	desc = "Pink and hairless"
	density = 1
	icon = 'person.dmi'
	see_invisible = 10

	//perhaps default values other than null should be used at some point? -QuakeIV

	active_hand = new/obj/item/mining/digging/pick() //current selected hand.

	var/head_slot = null
	var/turso_slot = null
	var/left_arm_slot = null
	var/left_hand_slot = null
	var/right_arm_slot = null
	var/right_hand_slot = null
	var/left_leg_slot = null
	var/left_foot_slot = null
	var/right_leg_slot = null
	var/right_foot_slot = null

	var/health = 100



