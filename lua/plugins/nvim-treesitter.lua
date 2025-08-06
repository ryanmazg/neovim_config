return {
  "nvim-treesitter/nvim-treesitter",
  config = function()
    require 'nvim-treesitter.configs'.setup {
      ensure_installed = {"python"},
      highlight = {
        enable = true,
      },
      incremental_selection = {
        enable = true,
      },
    }
  end,
}
