return {
    "nvim-treesitter/nvim-treesitter",
    config = function ()
        require'nvim-treesitter.configs'.setup {
            highlight = {
                enable = true,
                disable = {"mysql"},
            },
            indent = {
                enable = true
            }
        }
    end
}
