vim.g["test#php#phpunit#executable"] = './vendor/bin/phpunit'
vim.g["test#neovim#term_position"] = 'vert'

return {
    "vim-test/vim-test",
    event = "VeryLazy",
}
