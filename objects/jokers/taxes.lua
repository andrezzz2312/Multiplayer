local function next_taxes_total_mult_gain(card)
	local sells = MP.GAME.enemy.sells_per_ante[G.GAME.round_resets.ante] or 0

	-- If PvP hasn't been reached for the first time, accumulate sells from previous Antes
	if G.GAME.round_resets.ante <= MP.LOBBY.config.pvp_start_round then
		for i = 1, G.GAME.round_resets.ante - 1 do
			sells = sells + (MP.GAME.enemy.sells_per_ante[i] or 0)
		end
	end

	return sells * card.ability.extra.mult_gain
end

SMODS.Atlas({
	key = "taxes",
	path = "j_taxes.png",
	px = 71,
	py = 95,
})

SMODS.Joker({
	key = "taxes",
	atlas = "taxes",
	rarity = 1,
	cost = 5,
	unlocked = true,
	discovered = true,
	blueprint_compat = true,
	eternal_compat = true,
	perishable_compat = false,
	config = { extra = { mult_gain = 4, mult = 0 } },
	loc_vars = function(self, info_queue, card)
		MP.UTILS.add_nemesis_info(info_queue)
		return { vars = { card.ability.extra.mult_gain, card.ability.extra.mult } }
	end,
	in_pool = function(self)
		return MP.LOBBY.code and MP.LOBBY.config.multiplayer_jokers
	end,
	calculate = function(self, card, context)
		if context.cardarea == G.jokers and context.joker_main then
			return {
				mult = card.ability.extra.mult,
			}
		elseif
			context.cardarea == G.jokers
			and context.setting_blind
			and not context.blueprint
			and context.blind.key == "bl_mp_nemesis"
		then
			card.ability.extra.mult = card.ability.extra.mult + next_taxes_total_mult_gain(card)
			return {
				message = localize("k_filed_ex"),
			}
		end
	end,
	mp_credits = {
		idea = { "Zwei" },
		art = { "Kittyknight" },
		code = { "Virtualized" },
	},
})
