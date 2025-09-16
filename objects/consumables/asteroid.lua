SMODS.Atlas({
	key = "asteroid",
	path = {
		["default"] = "c_asteroid.png",
		["ru"] = "c_asteroid_ru.png",
	},
	px = 71,
	py = 95,
})

SMODS.Consumable({
	key = "asteroid",
	set = "Planet",
	atlas = "asteroid",
	cost = 3,
	unlocked = true,
	discovered = true,
	loc_vars = function(self, info_queue, card)
		MP.UTILS.add_nemesis_info(info_queue)
		return { vars = { 1 } }
	end,
	in_pool = function(self)
		return MP.LOBBY.code and MP.LOBBY.config.multiplayer_jokers
	end,
	can_use = function(self, card)
		return true
	end,
	use = function(self, card, area, copier)
		local asteroids = MP.GAME.asteroids
		update_hand_text(
			{ sound = "button", volume = 0.7, pitch = 0.8, delay = 0.3 },
			{ handname = localize("k_asteroids"), chips = localize("k_amount_short"), mult = MP.GAME.asteroids }
		)
		G.E_MANAGER:add_event(Event({
			trigger = "after",
			delay = 0.2,
			func = function()
				play_sound("tarot1", 0.9 + (MP.GAME.asteroids / 10), 1)
				card:juice_up(0.8, 0.5)
				return true
			end,
		}))
		update_hand_text({ delay = 0 }, { mult = "+1", StatusText = true })
		MP.GAME.asteroids = MP.GAME.asteroids + 1
		update_hand_text({ delay = 0 }, { mult = MP.GAME.asteroids })
		delay(2.5)
		update_hand_text(
			{ sound = "button", volume = 0.7, pitch = 1.1, delay = 0 },
			{ mult = 0, chips = 0, handname = "", level = "" }
		)
	end,
	mp_credits = {
		idea = { "Zilver" },
		art = { "TheTrueRaven" },
		code = { "Virtualized" },
	},
})
