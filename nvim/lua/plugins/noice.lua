return {
	"folke/noice.nvim",
	event = "VeryLazy",
	dependencies = {
		-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
		"MunifTanjim/nui.nvim",
		-- OPTIONAL:
		--   `nvim-notify` is only needed, if you want to use the notification view.
		--   If not available, we use `mini` as the fallback
		-- "rcarriga/nvim-notify",
	},
	config = function()
		require("telescope").load_extension("noice")

		require("noice").setup({
			views = {
				mini = {
					align = "message-left",
					position = {
						row = 1,
					},
					timeout = 5000,
				},
			},
			-- Disable command-line messages (like `:w`, `:q`, etc.)
			messages = {
				enabled = true, -- enables the Noice messages UI
				view = "mini", -- default view for messages
				view_error = "mini", -- view for errors
				view_warn = "mini", -- view for warnings
				view_history = "messages", -- view for :messages
				view_search = "virtualtext", -- view for search count messages. Set to `false` to disable
			},
			history = {
				filter = {
					["not"] = {
						cmdline = false,
						event = "msg_show",
					},
				},
			},
		})
	end,
}
