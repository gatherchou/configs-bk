local g = vim.g
local cmd = vim.cmd

-- Leader/local leader
g.mapleader = " "
g.maplocalleader = " "

-- Settings
local opt = vim.opt

opt.termguicolors = true
-- opt.shell = bash
opt.expandtab = true
opt.smarttab = true
opt.number = true
opt.relativenumber = true
opt.ruler = true
opt.cursorline = true
opt.splitright = true
opt.splitbelow = true
opt.wildmenu = true
opt.autoread = true
opt.swapfile = false
opt.backup = false
opt.undofile = true
opt.undodir = vim.fn.expand("$HOME/.local/share/nvim/undo")
opt.wrap = false
opt.completeopt = {"menuone", "noselect"}
opt.encoding = "utf-8"
opt.fileencoding = "utf-8"
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
opt.foldmethod = "indent"
opt.foldnestmax = 10
opt.foldlevel = 2


-- Autocommands
vim.api.nvim_create_autocmd("BufReadPost", {
  pattern = "*.lock",
  command = 'set syntax=json'
})
vim.api.nvim_create_autocmd("BufReadPost", {
  pattern = {"www*.conf", "*.ini"},
  command = 'set filetype=dosini',
})
vim.api.nvim_create_autocmd("BufReadPost", {
  pattern = {"*.conf", ".aliasLists"},
  command = 'set filetype=sh',
})
vim.api.nvim_create_autocmd("BufReadPost", {
  pattern = "Dockerfile*",
  command = 'set filetype=dockerfile'
})
vim.api.nvim_create_autocmd("FileType", {
  pattern = {"php", "java", "typescript", "javascript", "lua"},
  command = 'set tabstop=4|set shiftwidth=4|set expandtab'
})
local CursorLineOnlyInActiveWindow = vim.api.nvim_create_augroup('CursorLineOnlyInActiveWindow', { clear = true})
vim.api.nvim_create_autocmd({"VimEnter", "WinEnter", "BufWinEnter"}, {
  pattern = "*",
  group = CursorLineOnlyInActiveWindow,
  command = 'setlocal cursorline'
})
vim.api.nvim_create_autocmd("WinLeave", {
  pattern = "*",
  group = CursorLineOnlyInActiveWindow,
  command = 'setlocal nocursorline'
})


-- Keybindings
local map = vim.keymap.set

map("n", "<C-w>Q", ":tabclose<CR>")
map("n", "<leader>nh", ":nohl<CR>")
map("n", "<leader>tr", ":split term://zsh<CR>i")
map("t", "<A-q>", "<C-\\><C-n>")
map("n", "<leader>num", ":set number relativenumber")
map("n", "<leader>nonum", ":set nonumber norelativenumber")
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")
-- nvim-tree
map("n", "<leader>e", ":NvimTreeToggle<CR>")
map("n", "<leader>ff", ":NvimTreeFindFile<CR>")
-- vim-fugitive
map("n", "<leader>gs", ":tab Git<CR>")
map("n", "<leader>gl", ":tabnew<Bar>Gclog<CR>")
-- telescope
map("n", "<leader>f", ":Telescope find_files<CR>")
map("n", "<leader>s", ":Telescope live_grep<CR>")
map("n", "<leader>b", ":Telescope buffers<CR>")
-- coc
-- g["test#php#phpunit#executable"] = './vendor/bin/phpunit'
-- g["test#neovim#term_position"] = 'vert'
map("n", "gd", "<Plug>(coc-definition)", {silent = true})
map("n", "gdv", ":call CocAction('jumpDefinition', 'vsplit')<CR>", {silent = true})
map("n", "gdt", ":call CocAction('jumpDefinition', 'tabnew')<CR>", {silent = true})
map("n", "gr", "<Plug>(coc-references)", {silent = true})
map("n", "gy", "<Plug>(coc-type-definition)", {silent = true})
map("n", "gi", "<Plug>(coc-implementation)", {silent = true})
-- map("n", "<leader>tn", ":TestNearest -strategy=neovim<CR>")
map("n", "<leader>rc", ":CocCommand intelephense.fixClassName<CR>")
map("n", "<leader>rn", ":CocCommand intelephense.fixNamespace<CR>")
map("i", "<CR>", function ()
    return vim.fn["coc#pum#visible"]() == 1 and vim.fn["coc#pum#confirm"]() or "<CR>"
end, { expr = true})
map("i", "<Tab>", function ()
    return vim.fn["coc#pum#visible"]() == 1 and vim.fn["coc#pum#next"](1) or "<Tab>"
end, { expr = true})
map("i", "<S-Tab>", function ()
    return vim.fn["coc#pum#visible"]() == 1 and vim.fn["coc#pum#prev"](1) or "<S-Tab>"
end, { expr = true})
map("i", "<C-f>", function ()
    return vim.fn["coc#float#has_scroll"]() == 1 and vim.fn["coc#float#has_scroll"](1) or "<C-f>"
end, { expr = true})
map("i", "<C-b>", function ()
    return vim.fn["coc#float#has_scroll"]() == 1 and vim.fn["coc#float#has_scroll"](0) or "<C-b>"
end, { expr = true})


-- Plugins
require("lazy_nvim")
