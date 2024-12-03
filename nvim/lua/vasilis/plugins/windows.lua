return {
	"anuvyklack/windows.nvim",
	enabled = false,
	dependencies = {
		"anuvyklack/middleclass",
		"anuvyklack/animation.nvim",
	},
	config = function()
		vim.o.winwidth = 10
		vim.o.winminwidth = 10
		vim.o.equalalways = true

		require("windows").setup({
			animation = { duration = 100 },
		})
	end,
}
