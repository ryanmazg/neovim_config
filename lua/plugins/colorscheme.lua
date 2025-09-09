return {
    {
        "dasupradyumna/midnight.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require("midnight").setup({})

            -- require("one_monokai").load()
        end,
    },
}
