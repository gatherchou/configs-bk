local map = vim.keymap.set
map("n", "<leader>gs", ":tab Git<CR>")
map("n", "<leader>gl", ":tabnew<Bar>Gclog<CR>")

return {
    "tpope/vim-fugitive",
    event = "VeryLazy",
}
