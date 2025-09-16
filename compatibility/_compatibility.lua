MP.DECK = {}

MP.DECK.BANNED_JOKERS = {}

MP.DECK.BANNED_CONSUMABLES = {}

MP.DECK.BANNED_VOUCHERS = {}

MP.DECK.BANNED_ENHANCEMENTS = {}

MP.DECK.BANNED_TAGS = {}

MP.DECK.BANNED_BLINDS = {}

function MP.DECK.ban_card(card_id)
	if card_id:sub(1, 1) == "j" then
		MP.DECK.BANNED_JOKERS[card_id] = true
	elseif card_id:sub(1, 1) == "v" then
		MP.DECK.BANNED_VOUCHERS[card_id] = true
	elseif card_id:sub(1, 1) == "m" then
		MP.DECK.BANNED_ENHANCEMENTS[card_id] = true
	end
end

function MP.DECK.ban_tag(tag_id)
	MP.DECK.BANNED_TAGS[tag_id] = true
end

function MP.DECK.ban_blind(blind_id)
	MP.DECK.BANNED_BLINDS[blind_id] = true
end

local j_broken = {
	order = 1,
	unlocked = true,
	start_alerted = true,
	discovered = true,
	blueprint_compat = true,
	perishable_compat = true,
	eternal_compat = true,
	rarity = 4,
	cost = 10000,
	name = "BROKEN",
	pos = { x = 9, y = 9 },
	set = "Joker",
	effect = "",
	cost_mult = 1.0,
	config = {},
	key = "j_broken",
}

local card_init_ref = Card.init
function Card:init(X, Y, W, H, card, center, params)
	if center == nil then center = j_broken end
	card_init_ref(self, X, Y, W, H, card, center, params)
end

MP.DECK.MAX_STAKE = 0

local stake_queue = {}

function MP.set_max_stake(stake_key)
	if not SMODS.booted then
		stake_queue[stake_key] = true
		return
	end
	local stake = 1
	repeat
		local key = SMODS.stake_from_index(stake)
		if key == stake_key then
			sendTraceMessage("Setting max stake to " .. stake, "MULTIPLAYER")
			MP.DECK.MAX_STAKE = math.max(stake, MP.DECK.MAX_STAKE)
			return
		end
		stake = stake + 1
	until key == "error"
end

local game_update_ref = Game.update
---@diagnostic disable-next-line: duplicate-set-field
function Game:update(dt)
	game_update_ref(self, dt)

	if next(stake_queue) and SMODS.booted then
		for key, _ in pairs(stake_queue) do
			MP.set_max_stake(key)
			stake_queue[key] = nil
		end
	end
end
