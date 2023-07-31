local map = vim.keymap.set
map("n", "<leader>f", ":Telescope find_files<CR>")
map("n", "<leader>s", ":Telescope live_grep<CR>")
map("n", "<leader>b", ":Telescope buffers<CR>")
map("n", "gr", ":Telescope coc references<CR>")
map("n", "gy", ":Telescope coc type_definition<CR>")
map("n", "gi", ":Telescope coc implementation<CR>")
map("n", "gu", ":Telescope coc document_symbols<CR>")
map("n", "dg", ":Telescope coc diagnostics<CR>")

return {
    'nvim-telescope/telescope.nvim', tag = '0.1.2',
    event = "VeryLazy",
    dependencies = {
        'nvim-lua/plenary.nvim',
        'fannheyward/telescope-coc.nvim'
    },
    config = function ()
        require('telescope').setup({
            pickers = {
                find_files = {
                    find_command = { "rg", "--files", "--hidden", "-g", "!.git" },
                },
            },
            extensions = {
                coc = {
                    prefer_locations = true,
                }
            },
        })

        require('telescope').load_extension('coc')
    end
}
