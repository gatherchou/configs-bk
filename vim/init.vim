color dracula
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

let mapleader="\<Space>"
nnoremap <c-w>Q :tabclose<CR>
nnoremap <leader>tr :split term://zsh<CR>a
" nnoremap <leader>tr :split term://bash<CR>a
nnoremap <leader>nh :nohl<CR>
tnoremap <A-q> <C-\><C-n>
nnoremap <leader>s :Ag<CR>
nnoremap <leader>num :set number relativenumber<CR>
nnoremap <leader>nonum :set nonumber norelativenumber<CR>

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

call plug#begin('~/.vim/plugged')

" Plug 'dracula/vim', {'name': 'dracula'}
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
" Plug 'scrooloose/nerdtree'
" Plug 'jistr/vim-nerdtree-tabs'
" Plug 'Xuyuanp/nerdtree-git-plugin'
" Plug 'ryanoasis/vim-devicons'
" Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
" Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' },
" Plug 'junegunn/fzf.vim',


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
Plug 'stephpy/vim-yaml',
" Plug 'vim-scripts/LargeFile'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'yaegassy/coc-intelephense', {'do': 'yarn install --frozen-lockfile'}
" Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }   " CocInstall coc-go

Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }

call plug#end()

autocmd Filetype json let g:indentLine_setConceal = 0
" set conceallevel=0
let g:vim_json_syntax_conceal = 0

" vim-fugitive
nnoremap <leader>gs :tab Git<CR>
nnoremap <leader>gl :tabnew<Bar>Gclog<CR>

" coc
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" nnoremap <silent> <leader>tn :TestNearest<CR>  " coc-intelephense:phpunit-singletest

" LargeFile
let g:LargeFile=10

map <leader>e :NvimTreeToggle<CR>
lua << END
require("nvim-tree").setup({
  sort_by = "case_sensitive",
  disable_netrw = true,
  hijack_netrw = false,
  view = {
    adaptive_size = true,
    width = 40,
    number = true,
    relativenumber = true,
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
        { key = "<C-e>", action = "" }
      },
    },
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
      ".git"
    },
    exclude = {
      ".env",
      "node_modules",
      "vendor",
    },
  },
})
END

lua << END
require('nvim-web-devicons')
END

lua << END
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'dracula',
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
    lualine_c = {
      {
        'filename',
        file_status = true,
        path = 2,
      }
    },
    lualine_x = {},
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
END

nnoremap <leader>f <cmd>Telescope find_files<cr>
nnoremap <leader>s <cmd>Telescope live_grep<cr>
nnoremap <leader>b <cmd>Telescope buffers<cr>
lua << END
require('telescope').setup{

}
END

lua << END
require("diffview").setup({})
END

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




" history plugin config
"
" " NERDTredd
" let g:airline_theme='dracula'
" let g:airline_powerline_fonts = 1
" let g:airline_skip_empty_sections = 1
" let g:airline#extensions#branch#enabled = 1
" let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#buffer_nr_show = 1
" let g:airline#extensions#tabline#tab_nr_type = 1
" let g:airline#extensions#tabline#formatter = 'unique_tail'
" let g:airline_section_z = "%l行, %c列 "
" " NERDTree
" map <leader>e :NERDTreeTabsToggle<CR>
" let g:NERDTreeWinSize=40
" let NERDTreeShowHidden=1
" let NERDTreeShowLineNumbers=1
" autocmd FileType nerdtree setlocal relativenumber
" " FZF
" let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -L -g ""'
" let g:fzf_layout = { 'down': '~30%' }
" nnoremap <leader>f :FZF<CR>
" nnoremap <leader>b :Buffers<CR>
" nnoremap <leader>] :vert winc ]<CR>
