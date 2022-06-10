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

Plug 'dracula/vim', {'name': 'dracula'}
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'jiangmiao/auto-pairs'
Plug 'tomtom/tcomment_vim'
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'dstein64/vim-win'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'Yggdroot/indentLine'
Plug 'elzr/vim-json'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' },
Plug 'junegunn/fzf.vim',
Plug 'stephpy/vim-yaml',
Plug 'vim-scripts/LargeFile'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'yaegassy/coc-intelephense', {'do': 'yarn install --frozen-lockfile'}
" Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }   " CocInstall coc-go

call plug#end()

autocmd Filetype json let g:indentLine_setConceal = 0
" set conceallevel=0
let g:vim_json_syntax_conceal = 0

let g:airline_theme='dracula'
let g:airline_powerline_fonts = 1
let g:airline_skip_empty_sections = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#enabled = 1      
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_section_z = "%l行, %c列 "

" NERDTree
map <leader>e :NERDTreeTabsToggle<CR>
let g:NERDTreeWinSize=40
let NERDTreeShowHidden=1
let NERDTreeShowLineNumbers=1
autocmd FileType nerdtree setlocal relativenumber

" vim-go
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

" FZF
let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -l -g ""'
let g:fzf_layout = { 'down': '~30%' }
nnoremap <leader>f :FZF<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>] :vert winc ]<CR>

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
