SMODS.Atlas({
	key = "bloodstone_sandbox",
	path = "j_bloodstone_sandbox.png",
	px = 71,
	py = 95,
})

SMODS.Joker({
	key = "bloodstone_sandbox",
	no_collection = MP.sandbox_no_collection,
	unlocked = true,
	discovered = true,
	blueprint_compat = true,
	rarity = 2,
	cost = 7,
	atlas = "bloodstone_sandbox",
	config = { extra = { odds = 3, Xmult = 2 }, mp_sticker_balanced = true },
	loc_vars = function(self, info_queue, card)
		local numerator, denominator =
			SMODS.get_probability_vars(card, 1, card.ability.extra.odds, "j_mp_bloodstone_sandbox")
		return { vars = { numerator, denominator } }
	end,
	calculate = function(self, card, context)
		if
			context.individual
			and context.cardarea == G.play
			and context.other_card:is_suit("Hearts")
			and SMODS.pseudorandom_probability(card, "j_mp_bloodstone_sandbox", 1, card.ability.extra.odds)
		then
			return {
				xmult = card.ability.extra.Xmult,
			}
		end
	end,
	mp_credits = { idea = { "LocalThunk" } },
	in_pool = function(self)
		return MP.LOBBY.config.ruleset == "ruleset_mp_sandbox" and MP.LOBBY.code
	end,
})
