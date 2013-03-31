mob
	verb
		Say(msg as text)
			if(icchat)
				world << "<b>[usr]</b> says: \"[msg]\""
			else
				usr << "\red <b>You have been muted.</b>"

		Say_OOC(msg as text)
			if(oocchat)
				world << "\blue <b>[key] says: [msg]</b>"
			else
				usr << "\red <b>You have been muted.</b>"

		Emote(msg as text)
			if(emote)
				world << "[usr] [msg]"
			else
				usr << "\red <b>You have been muted.</b>"

		Announce(msg as message)
			world << "[msg]<br>"

mob/var
	icchat = 1
	icchat_listen = 1
	oocchat = 1
	oocchat_listen = 1
	emote = 1
	emote_listen = 1
	deadchat = 0
	deadchat_listen = 0
	inventory = null
	status = "player"