" ==== Plugins ====

call plug#begin('~/.vim/plugged')
Plug 'EdenEast/nightfox.nvim'
Plug '/usr/local/opt/fzf'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'tpope/vim-surround'
Plug 'airblade/vim-gitgutter'
" Plug 'machakann/vim-highlightedyank'
Plug 'preservim/nerdcommenter'
Plug 'kien/rainbow_parentheses.vim'
Plug 'tpope/vim-markdown'
" Plug 'Asheq/close-buffers.vim'
" Plug 'AndrewRadev/linediff.vim'
Plug 'terryma/vim-multiple-cursors'
call plug#end()

filetype plugin on

" ==== Configuration =====
" turn on syntax highlighting
syntax on
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
" set tabstop=4
" set softtabstop=4
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
" searching
set hlsearch

" history
set history=100

" set theme
colorscheme nightfox 
" set line number colour to grey
highlight LineNr ctermfg=grey 
set autowrite " Save file when switching buffers
set guifont=Fira\ Code:h14

" -------------------------------------------------------------------------------------------------
" Airline
" -------------------------------------------------------------------------------------------------
" let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

" -------------------------------------------------------------------------------------------------
" Gitgutter
" -------------------------------------------------------------------------------------------------
let g:gitgutter_map_keys=0

" System clipboard
" This sends all yanks to the system clipboard (requires building vim with
" +clipboard support)
set clipboard=unnamed

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

