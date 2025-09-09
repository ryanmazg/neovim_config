return {
    "mfussenegger/nvim-lint",
    config = function()
        require("lint").linters_by_ft =
            {
                python = { "ruff" },
                lua = { "luacheck" },
                html = { "htmlhint" },
                css = { "stylelint" },
                javascript = { "eslint" },
                c = { "cppcheck" },
            }, vim.api.nvim_create_autocmd({ "BufWritePost" }, {
                callback = function()
                    require("lint").try_lint()
                end,
            })
    end,
}
