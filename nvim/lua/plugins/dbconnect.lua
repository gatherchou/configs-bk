local map = vim.keymap.set
map("n", "<leader>db", ":DBUIToggle<CR>")
map("n", "<leader>dbt", ":tab new DBUI|:DBUIToggle<CR>")

local autocmd = vim.api.nvim_create_autocmd
autocmd("FileType", {
    pattern = "dbui",
    command = 'nnoremap <leader>r <Plug>(DBUI_ExecuteQuery)'
}) 
autocmd("User", {
    pattern = "DBUIOpened",
    command = 'setlocal number relativenumber'
})
autocmd("FileType", {
    pattern = "dbout",
    command = 'setlocal winheight=30'
})

return {
    'kristijanhusak/vim-dadbod-ui',
    event = "VeryLazy",
    dependencies = {
        'tpope/vim-dadbod',
    },
    config = function()
        vim.g.db_ui_execute_on_save = 0
        vim.g.db_ui_use_nerd_fonts = 1
        vim.g.db_ui_show_database_icon = 1
    end
}
