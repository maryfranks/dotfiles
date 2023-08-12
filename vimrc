" https://github.com/junegunn/vim-plug

" ==== Install vim plug ==== 
" https://github.com/junegunn/vim-plug/wiki/tips#automatic-installation
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" ==== Plugins ====
call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ajh17/spacegray.vim' 
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'airblade/vim-gitgutter'
Plug 'preservim/nerdcommenter'
Plug 'kien/rainbow_parentheses.vim'
Plug 'tpope/vim-markdown'
Plug 'terryma/vim-multiple-cursors'

call plug#end()

" ==== Configuration =====

" set theme
let g:spacegray_low_contrast = 1
colorscheme spacegray 
" set line number colour to grey
highlight LineNr ctermfg=grey 

" turn on syntax highlighting
syntax enable
set t_Co=256

" enable spellcheck for git commit messages
autocmd Filetype gitcommit setlocal spell

" set text wrapping 
set textwidth=72

" show line numbers
set number

" show the last command 
set showcmd

" auto indent and smart indent
set ai
set si

" Turn on smart tab
" set smarttab		          
" Expand tabs to spaces
" set expandtab
" set tabstop=2
" set softtabstop=2
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
" searching
set hlsearch

" history
set history=100



" -------------------------------------------------------------------------------------------------
" NERDTree
" -------------------------------------------------------------------------------------------------
autocmd StdinReadPre * let s:std_in=1
" Automatically open NERDTree when starting vim on a directory
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif 
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
:nnoremap <C-b> :NERDTreeToggle<CR>
" Show hidden files
let NERDTreeShowHidden=1

" -------------------------------------------------------------------------------------------------
" Airline
" -------------------------------------------------------------------------------------------------
" let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

" -------------------------------------------------------------------------------------------------
" Gitgutter
" -------------------------------------------------------------------------------------------------
let g:gitgutter_map_keys=0

" System clipboard
" This sends all yanks to the system clipboard (requires building vim with
" +clipboard support)
set clipboard=unnamed
" set clipboard=unnamedplus

" ----------------------------------------------------------------------------
" FZF
" ----------------------------------------------------------------------------
nnoremap <Leader>b :Buffers<Cr>
function! s:changebranch(branch) 
    execute 'Git checkout' . a:branch
    call feedkeys("i")
endfunction
command! -bang Gbranch call fzf#run({
            \ 'source': 'git branch -a --no-color | grep -v "^\* " ', 
            \ 'sink': function('s:changebranch')
            \ })
" ----------------------------------------------------------------------------
" Rainbow Parentheses
" ----------------------------------------------------------------------------
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" ----------------------------------------------------------------------------
" Multi Cursor
" ----------------------------------------------------------------------------
let g:multi_cursor_use_default_mapping = 0
let g:multi_cursor_start_word_key      = '<C-n>'
let g:multi_cursor_select_all_word_key = '<A-n>'
let g:multi_cursor_start_key           = 'g<C-n>'
let g:multi_cursor_select_all_key      = 'g<A-n>'
let g:multi_cursor_next_key            = '<C-n>'
let g:multi_cursor_prev_key            = '<C-p>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'