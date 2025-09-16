SMODS.Challenge({
	key = "scratch",
	jokers = {
		{ id = "j_half" },
	},
	vouchers = {
		{ id = "v_magic_trick" },
	},
	deck = {
		type = "Challenge Deck",
		cards = {
			{ s = "C", r = "7", e = "m_stone" },
		},
	},
	unlocked = function(self)
		return true
	end,
})
