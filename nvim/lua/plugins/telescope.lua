return {
    'nvim-telescope/telescope.nvim', tag = '0.1.2',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function ()
        require('telescope').setup{
            pickers = {
                find_files = {
                    find_command = { "rg", "--files", "--hidden", "-g", "!.git" },
                },
            },
        }

    end
}
