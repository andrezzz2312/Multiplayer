if next(SMODS.find_mod("AntePreview")) then
	sendDebugMessage("Next Ante Preview compatibility detected", "MULTIPLAYER")
	local predict_next_ante_ref = predict_next_ante
	function predict_next_ante()
		local predictions = predict_next_ante_ref()
		if MP.LOBBY.code then
			if G.GAME.round_resets.ante > 1 then predictions.Boss.blind = "bl_mp_nemesis" end
		end
		return predictions
	end
end
