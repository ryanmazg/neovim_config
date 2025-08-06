return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope-fzf-native.nvim",
    "nvim-tree/nvim-web-devicons",
  },

  config = function()
    require('telescope').setup{}
    local builtin = require('telescope.builtin')

    vim.keymap.set('n', '<leader>ff', builtin.find_files)
    vim.keymap.set('n', '<leader>fg', builtin.live_grep)
    vim.keymap.set('n', '<leader>fw', builtin.grep_string)
    vim.keymap.set('n', '<leader>b', builtin.buffers)
    vim.keymap.set('n', '<leader>q', builtin.quickfix)
    vim.keymap.set('n', '<leader>qh', builtin.quickfixhistory)
    vim.keymap.set('n', '<leader>l', builtin.loclist)
    vim.keymap.set('n', '<leader>s', builtin.current_buffer_fuzzy_find)
    vim.keymap.set('n', '<leader>r', builtin.lsp_references)
    vim.keymap.set('n', '<leader>d', builtin.diagnostics)
    vim.keymap.set('n', '<leader>i', builtin.lsp_implementations)
  end,
}
