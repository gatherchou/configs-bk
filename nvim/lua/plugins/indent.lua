return {
    "lukas-reineke/indent-blankline.nvim",
    event = "VeryLazy",
    config = function ()
        for _, keymap in pairs({
            'zo',
            'zO',
            'zc',
            'zC',
            'za',
            'zA',
            'zv',
            'zx',
            'zX',
            'zm',
            'zM',
            'zr',
            'zR',
        }) do
            vim.api.nvim_set_keymap('n', keymap,  keymap .. '<CMD>IndentBlanklineRefresh<CR>', { noremap=true, silent=true })
        end

        require("indent_blankline").setup {
            show_current_context = false,
            show_current_context_start = false,
        }
    end
}
