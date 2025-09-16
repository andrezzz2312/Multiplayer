MP.Gamemode({
	key = "showdown",
	get_blinds_by_ante = function(self, ante)
		if ante >= MP.LOBBY.config.showdown_starting_antes then
			return "bl_mp_nemesis", "bl_mp_nemesis", "bl_mp_nemesis"
		end
		return nil, nil, nil
	end,
	banned_jokers = {
		"j_mr_bones",
		"j_luchador",
		"j_matador",
		"j_chicot",
	},
	banned_consumables = {},
	banned_vouchers = {
		"v_hieroglyph",
		"v_petroglyph",
		"v_directors_cut",
		"v_retcon",
	},
	banned_enhancements = {},
	banned_tags = {
		"tag_boss",
	},
	banned_blinds = {
		"bl_wall",
		"bl_final_vessel",
	},
	reworked_jokers = {},
	reworked_consumables = {},
	reworked_vouchers = {},
	reworked_enhancements = {},
	reworked_tags = {},
	reworked_blinds = {},
	create_info_menu = function()
		return {
			{
				n = G.UIT.R,
				config = {
					align = "tm",
				},
				nodes = {
					{
						n = G.UIT.T,
						config = {
							text = MP.UTILS.wrapText(localize("k_showdown_description"), 70),
							scale = 0.6,
							colour = G.C.UI.TEXT_LIGHT,
						},
					},
				},
			},
			{
				n = G.UIT.R,
				config = {
					minw = 0.2,
					minh = 0.2,
				},
			},
			{
				n = G.UIT.R,
				config = {
					align = "cm",
					padding = 0.3,
				},
				nodes = {
					{
						n = G.UIT.C,
						config = {
							align = "cm",
						},
						nodes = {
							{
								n = G.UIT.R,
								config = {
									align = "cm",
								},
								nodes = {
									MP.UI.BackgroundGrouping(
										localize({ type = "variable", key = "k_ante_range", vars = { "1", "2" } }),
										{
											{
												n = G.UIT.O,
												config = {
													object = MP.UI.BlindChip.small(),
												},
											},
											{
												n = G.UIT.C,
												config = {
													minw = 0.2,
													minh = 0.2,
												},
											},
											{
												n = G.UIT.O,
												config = {
													object = MP.UI.BlindChip.big(),
												},
											},
											{
												n = G.UIT.C,
												config = {
													minw = 0.2,
													minh = 0.2,
												},
											},
											{
												n = G.UIT.O,
												config = {
													object = MP.UI.BlindChip.random(),
												},
											},
										},
										{ text_scale = 0.6 }
									),
								},
							},
							{
								n = G.UIT.R,
								config = {
									minw = 0.2,
									minh = 0.2,
								},
							},
							{
								n = G.UIT.R,
								config = {
									align = "cm",
								},
								nodes = {
									MP.UI.BackgroundGrouping(
										localize({ type = "variable", key = "k_ante_min", vars = { "3" } }),
										{
											{
												n = G.UIT.O,
												config = {
													object = MP.UI.BlindChip.nemesis(),
												},
											},
											{
												n = G.UIT.C,
												config = {
													minw = 0.2,
													minh = 0.2,
												},
											},
											{
												n = G.UIT.O,
												config = {
													object = MP.UI.BlindChip.nemesis(),
												},
											},
											{
												n = G.UIT.C,
												config = {
													minw = 0.2,
													minh = 0.2,
												},
											},
											{
												n = G.UIT.O,
												config = {
													object = MP.UI.BlindChip.nemesis(),
												},
											},
										},
										{ text_scale = 0.6 }
									),
								},
							},
						},
					},
					{
						n = G.UIT.C,
						config = {
							align = "cm",
						},
						nodes = {
							{
								n = G.UIT.R,
								config = {
									align = "cm",
								},
								nodes = {
									MP.UI.BackgroundGrouping(localize("k_lives"), {
										{
											n = G.UIT.T,
											config = {
												text = "4",
												scale = 1.5,
												colour = G.C.UI.TEXT_LIGHT,
											},
										},
									}, { text_scale = 0.6 }),
								},
							},
						},
					},
				},
			},
			{
				n = G.UIT.R,
				config = {
					align = "bm",
				},
				nodes = {
					{
						n = G.UIT.T,
						config = {
							text = localize("k_values_are_modifiable"),
							scale = 0.4,
							colour = G.C.UI.TEXT_LIGHT,
						},
					},
				},
			},
		}
	end,
}):inject()
