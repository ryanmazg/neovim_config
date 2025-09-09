return {
    {
        "cpea2506/one_monokai.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require("one_monokai").setup({})

            -- require("one_monokai").load()
        end,
    },
}
