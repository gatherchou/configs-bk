call plug#begin('~/.vim/plugged')

" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
" Plug 'scrooloose/nerdtree'
" Plug 'jistr/vim-nerdtree-tabs'
" Plug 'Xuyuanp/nerdtree-git-plugin'
" Plug 'ryanoasis/vim-devicons'
" Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
" Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' },
" Plug 'junegunn/fzf.vim',

" Plug 'dracula/vim', { 'as': 'dracula' }
"Plug 'shaunsingh/moonlight.nvim'
Plug 'Mofiqul/dracula.nvim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons' " optional, for file icons
Plug 'kyazdani42/nvim-tree.lua'
Plug 'tpope/vim-fugitive'
Plug 'nvim-lua/plenary.nvim'
Plug 'sindrets/diffview.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'branch': '0.1.x' }

Plug 'jiangmiao/auto-pairs'
Plug 'tomtom/tcomment_vim'
Plug 'Yggdroot/indentLine'
Plug 'dstein64/vim-win'
Plug 'elzr/vim-json'
Plug 'tpope/vim-fugitive'
" Plug 'stephpy/vim-yaml',
" Plug 'vim-scripts/LargeFile'

Plug 'mattn/emmet-vim'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'yaegassy/coc-intelephense', {'do': 'yarn install --frozen-lockfile'}
" Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }   " CocInstall coc-go

Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }

call plug#end()

colorscheme dracula

lua << EOF

local function open_nvim_tree(data)
  local is_real_file = vim.fn.filereadable(data.file) == 1
  local is_no_name_file = data.file == "" and vim.bo[data.buf].buftype == ""
  local is_a_directory = vim.fn.isdirectory(data.file) == 1

  if is_a_directory then
    vim.cmd.cd(data.file)
    require("nvim-tree.api").tree.open()
    return
  end

  if is_real_file or is_no_name_file then
    return
  end

  -- open the tree but don't focus it
  require("nvim-tree.api").tree.toggle({ focus = false, find_file = true, })
end

local function on_attach(bufnr)
  local api = require('nvim-tree.api')

  local function opts(desc)
    return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  api.config.mappings.default_on_attach(bufnr)

  vim.keymap.set('n', '<C-e>', '', { buffer = bufnr })
  vim.keymap.del('n', '<C-e>', { buffer = bufnr })
  vim.keymap.set('n', 'u', api.tree.change_root_to_parent, opts('Up'))

end

vim.opt.termguicolors = true
require("nvim-tree").setup({
  on_attach = on_attach,
  sort_by = "case_sensitive",
  disable_netrw = true,
  hijack_netrw = false,
  view = {
    width = 40,
    number = true,
    relativenumber = true,
    preserve_window_proportions = true,
  },
  renderer = {
    add_trailing = true,
    group_empty = true,
    icons = {
      glyphs = {
        folder = {
          arrow_closed = "▸",
          arrow_open = "▾",
        }
      }
    }
  },
  filters = {
    dotfiles = false,
    custom = {
      ".git$"
    },
    exclude = {
      ".env$",
      "node_modules",
      "vendor",
      ".gitlab-ci.yml"
    },
  },
})

require('nvim-web-devicons')

require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'dracula-nvim',
    -- theme = 'moonlight',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {},
    always_divide_middle = true,
    globalstatus = false,
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff'},
    lualine_c = {
      {
        'filename',
        file_status = true,
        path = 2,
      } 
    },
    lualine_x = {'diagnostics', 'filetype'},
    lualine_y = {'encoding', 'fileformat'},
    lualine_z = {'%l行, %c列', '%L:%p%%'},
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {
    lualine_a = {'buffers'},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {'tabs'}
  }
}

require('telescope').setup{
  pickers = {
    find_files = {
      find_command = { "rg", "--files", "--hidden", "-g", "!.git" },
    },
  },
}

require("diffview").setup({})

EOF

syntax on
set guicursor=

set cole&
" set shell=bash
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set smarttab

set number
set relativenumber
set ruler
set cursorline
set encoding=utf-8
set fileencoding=utf-8
set nocompatible
set splitright
set splitbelow
set foldmethod=syntax   
set foldnestmax=10
set nofoldenable
set foldlevel=2

autocmd BufReadPost *.lock set syntax=json
autocmd BufReadPost *.conf set filetype=sh
autocmd BufReadPost www*.conf set filetype=dosini
autocmd BufReadPost *.ini set filetype=dosini
autocmd BufReadPost Dockerfile* set filetype=dockerfile

autocmd FileType php set tabstop=4|set shiftwidth=4|set expandtab
autocmd FileType java set tabstop=4|set shiftwidth=4|set expandtab
autocmd FileType typescript set tabstop=4|set shiftwidth=4|set expandtab
autocmd FileType javascript set tabstop=4|set shiftwidth=4|set expandtab

autocmd BufReadPost .aliasLists set filetype=sh

augroup CursorLineOnlyInActiveWindow
  autocmd!
  autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  autocmd WinLeave * setlocal nocursorline
augroup END


autocmd Filetype json let g:indentLine_setConceal = 0
" set conceallevel=0
let g:vim_json_syntax_conceal = 0

" LargeFile
let g:LargeFile=10


" Key Mappings
let mapleader="\<Space>"
nnoremap <c-w>Q :tabclose<CR>
nnoremap <leader>tr :split term://zsh<CR>a
" nnoremap <leader>tr :split term://bash<CR>a
nnoremap <leader>nh :nohl<CR>
tnoremap <A-q> <C-\><C-n>
nnoremap <leader>s :Ag<CR>
nnoremap <leader>num :set number relativenumber<CR>
nnoremap <leader>nonum :set nonumber norelativenumber<CR>

" nvim-tree
map <leader>e :NvimTreeToggle<CR>
map <leader>ff :NvimTreeFindFile<CR>

" vim-fugitive
nnoremap <leader>gs :tab Git<CR>
nnoremap <leader>gl :tabnew<Bar>Gclog<CR>

" coc
inoremap <expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"
inoremap <expr> <Tab> coc#pum#visible() ? coc#pum#next(1) : "\<Tab>"
inoremap <expr> <S-Tab> coc#pum#visible() ? coc#pum#prev(1) : "\<S-Tab>"
inoremap <expr> <C-f> coc#float#has_scroll() ? coc#pum#scroll(1) : "\<C-f>"
inoremap <expr> <C-b> coc#float#has_scroll() ? coc#pum#scroll(0) : "\<C-b>"
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gdv :call CocAction('jumpDefinition', 'vsplit')<CR>
nmap <silent> gdt :call CocAction('jumpDefinition', 'tabnew')<CR>
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" nnoremap <silent> <leader>tn :TestNearest<CR>  " coc-intelephense:phpunit-singletest

" telescope
noremap <leader>f <cmd>Telescope find_files<cr>
noremap <leader>s <cmd>Telescope live_grep<cr>
noremap <leader>b <cmd>Telescope buffers<cr>

" " vim-go
" let g:go_highlight_types = 1
" let g:go_highlight_functions = 1
" let g:go_highlight_function_calls = 1
" let g:go_highlight_fields = 1
" let g:go_highlight_operators = 1
" let g:go_highlight_extra_types = 1
" autocmd FileType go nmap <leader>bd  <Plug>(go-build)
" autocmd FileType go nmap <leader>r  <Plug>(go-run)

" let g:go_fmt_command = "goimports"
" let g:go_def_mode='gopls'
" let g:go_info_mode='gopls'

