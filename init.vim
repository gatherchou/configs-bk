color dracula
syntax on
set guicursor=

set cole&

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

autocmd FileType php set tabstop=4|set shiftwidth=4|set expandtab
autocmd FileType java set tabstop=4|set shiftwidth=4|set expandtab

let mapleader="\<Space>"
nnoremap <c-w>Q :tabclose<CR>
nnoremap <leader>tr :split term://zsh<CR>a
nnoremap <leader>nh :nohl<CR>
tnoremap <A-q> <C-\><C-n>
nnoremap <leader>s :Ag<CR>
au BufReadPost *.lock set syntax=json

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
Plug 'Yggdroot/indentLine'
Plug 'tpope/vim-fugitive'
"Plug 'elzr/vim-json'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' },
Plug 'junegunn/fzf.vim',

" Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
" Plug 'SirVer/ultisnips'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'janko/vim-test'
"Plug 'dense-analysis/ale'

call plug#end()

" autocmd Filetype json let g:indentLine_setConceal = 0
" set conceallevel=0
" let g:vim_json_syntax_conceal = 0

let g:airline_theme='dracula'
let g:airline_powerline_fonts = 1
let g:airline_skip_empty_sections = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#enabled = 1      
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_section_z = "行%l, 列%c "

" NERDTree
map <leader>e :NERDTreeToggle<CR>
let g:NERDTreeWinSize=50
let NERDTreeShowHidden=1
let NERDTreeShowLineNumbers=1
autocmd FileType nerdtree setlocal relativenumber
"
"" vim-go
"let g:go_highlight_types = 1
"let g:go_highlight_functions = 1
"let g:go_highlight_function_calls = 1
"let g:go_highlight_fields = 1
"let g:go_highlight_operators = 1
"let g:go_highlight_extra_types = 1
"" autocmd FileType go nmap <leader>bd  <Plug>(go-build)
"" autocmd FileType go nmap <leader>r  <Plug>(go-run)
"
"let g:go_fmt_command = "goimports"
"let g:go_def_mode='gopls'
"let g:go_info_mode='gopls'
"
" FZF
let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -l -g ""'
let g:fzf_layout = { 'down': '~30%' }
nnoremap <leader>f :FZF<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>] :vert winc ]<CR>

" vim-fugitive
nnoremap <leader>gs :vert Gstatus<CR>
nnoremap <leader>gl :tabnew<Bar>Glog<CR>

" vim-test
let test#strategy = "neovim"
let test#neovim#term_position = "vertical"
nnoremap <silent> <leader>tn :TestNearest<CR>

" coc
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
