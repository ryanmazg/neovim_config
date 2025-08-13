return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope-fzf-native.nvim",
        "nvim-tree/nvim-web-devicons",
    },

    config = function()
        require("telescope").setup({
            defaults = {
                sorting_strategy = "ascending",
            },
        })
        local builtin = require("telescope.builtin")

        -- PROJECT-WIDE OPERATIONS (<leader>p)
        vim.keymap.set("n", "<leader>pf", function()
            builtin.find_files({ follow = true, hidden = true })
        end, { desc = "Project: Find files" })

        vim.keymap.set("n", "<leader>pg", function()
            builtin.live_grep()
        end, { desc = "Project: Live grep" })

        vim.keymap.set("n", "<leader>ps", function()
            builtin.grep_string()
        end, { desc = "Project: Search string under cursor" })

        vim.keymap.set("n", "<leader>pD", function()
            builtin.diagnostics()
        end, { desc = "Project: All diagnostics" })

        -- GIT OPERATIONS (<leader>g)
        vim.keymap.set("n", "<leader>gf", function()
            builtin.git_files()
        end, { desc = "Git: Find files" })

        -- BUFFER OPERATIONS (<leader>b)
        vim.keymap.set("n", "<leader>bb", function()
            builtin.buffers({ ignore_current_buffer = true, sort_mru = true })
        end, { desc = "Buffer: Switch buffers" })

        vim.keymap.set("n", "<leader>bf", function()
            builtin.current_buffer_fuzzy_find({ skip_empty_lines = true })
        end, { desc = "Buffer: Fuzzy find in current buffer" })

        vim.keymap.set("n", "<leader>bd", function()
            builtin.diagnostics({ bufnr = nil })
        end, { desc = "Buffer: Current buffer diagnostics" })

        -- LSP OPERATIONS (<leader>l)
        vim.keymap.set("n", "<leader>lr", function()
            builtin.lsp_references()
        end, { desc = "LSP: Find references" })

        vim.keymap.set("n", "<leader>li", function()
            builtin.lsp_incoming_calls()
        end, { desc = "LSP: Incoming calls" })

        vim.keymap.set("n", "<leader>lo", function()
            builtin.lsp_outgoing_calls()
        end, { desc = "LSP: Outgoing calls" })

        vim.keymap.set("n", "gd", function()
            builtin.lsp_definitions()
        end, { desc = "Go to definition" })

        -- NAVIGATION/HISTORY (<leader>n or <leader>h)
        vim.keymap.set("n", "<leader>nj", function()
            builtin.jumplist()
        end, { desc = "Navigate: Jumplist" })

        -- QUICKFIX/LOCATION LIST (<leader>q)
        vim.keymap.set("n", "<leader>qq", function()
            builtin.quickfix()
        end, { desc = "Quickfix: Current list" })

        vim.keymap.set("n", "<leader>qh", function()
            builtin.quickfixhistory()
        end, { desc = "Quickfix: History" })

        vim.keymap.set("n", "<leader>ql", function()
            builtin.loclist()
        end, { desc = "Quickfix: Location list" })
    end,
}
