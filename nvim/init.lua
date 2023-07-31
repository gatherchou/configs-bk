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
opt.foldlevel = 5


-- Autocommands
local autocmd = vim.api.nvim_create_autocmd
local CursorLineOnlyInActiveWindow = vim.api.nvim_create_augroup('CursorLineOnlyInActiveWindow', { clear = true})
autocmd("BufReadPost", {
    pattern = "*.lock",
    command = 'set syntax=json'
})
autocmd("BufReadPost", {
    pattern = {"www*.conf", "*.ini"},
    command = 'set filetype=dosini',
})
autocmd("BufReadPost", {
    pattern = {"*.conf", ".aliasLists"},
    command = 'set filetype=sh',
})
autocmd("BufReadPost", {
    pattern = "Dockerfile*",
    command = 'set filetype=dockerfile'
})
autocmd("FileType", {
    pattern = {"php", "java", "typescript", "javascript", "lua"},
    command = 'set tabstop=4|set shiftwidth=4|set expandtab'
})
autocmd({"VimEnter", "WinEnter", "BufWinEnter"}, {
    pattern = "*",
    group = CursorLineOnlyInActiveWindow,
    command = 'setlocal cursorline'
})
autocmd("WinLeave", {
    pattern = "*",
    group = CursorLineOnlyInActiveWindow,
    command = 'setlocal nocursorline'
})


-- Keybindings
local map = vim.keymap.set

map("n", "<C-w>Q", ":tabclose<CR>")
map("n", "<leader>nh", ":nohl<CR>")
map("n", "<leader>tr", ":split term://bash<CR>i")
map("t", "<A-q>", "<C-\\><C-n>")
map("n", "<leader>num", ":set number relativenumber<CR>")
map("n", "<leader>nonum", ":set nonumber norelativenumber<CR>")
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")
-- coc
map("n", "gd", "<Plug>(coc-definition)")
map("n", "<leader>tn", ":TestNearest -strategy=neovim<CR>")
map("n", "<leader>rc", ":CocCommand intelephense.fixClassName<CR>")
map("n", "<leader>rn", ":CocCommand intelephense.fixNamespace<CR>")
map("i", "<CR>", 'coc#pum#visible() ? coc#pum#confirm() : "<CR>"', {expr = true})
map("i", "<Tab>", 'coc#pum#visible() ? coc#pum#next(1) : "<Tab>"', {expr = true})
map("i", "<S-Tab>", 'coc#pum#visible() ? coc#pum#prev(1) : "<S-Tab>"', {expr = true})
local opts = {silent = true, nowait = true, expr = true}
map("i", "<C-f>", 'coc#float#has_scroll() ? "<c-r>=coc#float#scroll(1)<cr>" : "<Right>"', opts)
map("i", "<C-b>", 'coc#float#has_scroll() ? "<c-r>=coc#float#scroll(0)<cr>" : "<Left>"', opts)

-- Plugins
require("lazy_nvim")
