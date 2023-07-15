return {
    "nvim-treesitter/nvim-treesitter",
    config = function ()
        require'nvim-treesitter.configs'.setup {
            enable = true,
        }
    end
}
