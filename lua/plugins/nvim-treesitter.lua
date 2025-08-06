return {
	"nvim-treesitter/nvim-treesitter",
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = { "python", "lua" },
			highlight = {
				enable = true,
			},
			incremental_selection = {
				enable = true,
			},
		})
	end,
}
