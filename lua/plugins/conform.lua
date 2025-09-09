return {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    opts = {
        formatters_by_ft = {
            python = { "black" },
            lua = { "stylua" },
            html = { "prettier" },
            css = { "prettier" },
            javascript = { "prettier" },
            c = { "clang-format" },
        },
        formatters = {
            black = {},
            stylua = {
                prepend_args = { "--indent-type", "Spaces", "--indent-width", "4" },
            },
            prettier = {
                prepend_args = { "--tab-width", "4", "--use-tabs", "false" },
            },
            ["clang-format"] = {
                args = {
                    "--style={BasedOnStyle: LLVM, IndentWidth: 4, UseTab: Never}",
                    "--assume-filename",
                    "$FILENAME",
                },
            },
        },
        format_on_save = {
            timeout_ms = 1000,
            lsp_fallback = true,
        },
    },
    keys = {
        {
            "<leader>fm",
            function()
                require("conform").format({ async = true, lsp_fallback = true })
            end,
            mode = { "n", "v" },
        },
    },
}
