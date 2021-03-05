" unnecessary with treesitter?
syntax enable

source ~/.config/nvim/plug-config/coc.vim
source ~/.config/nvim/plug-config/startify.vim


set nowrap
set nu
set relativenumber
set smarttab
set tabstop=4 softtabstop=4
set shiftwidth=4
set smartindent
set autoindent
set noerrorbells
set background=dark
set termguicolors

"persistent undo
set undodir=~/.config/nvim/undodir
set undofile
set undolevels=1000
set undoreload=10000


set formatoptions-=cro
set clipboard=unnamedplus
set timeoutlen=500
set laststatus=0
set mouse=a

" let g:ale_disable_lsp=1

call plug#begin('~/.config/nvim/autoload/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'chrisbra/vim-commentary'
Plug 'lervag/vimtex'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'SirVer/ultisnips' 
Plug 'honza/vim-snippets'
" Plug 'dense-analysis/ale'
Plug 'mhinz/vim-startify'
Plug 'sheerun/vim-polyglot'
Plug 'Chiel92/vim-autoformat'
Plug 'junegunn/goyo.vim'

" Some colorschemes

" Plug 'arcticicestudio/nord-vim'
" Plug 'sainnhe/gruvbox-material'
" Plug 'sainnhe/forest-night'
Plug 'sainnhe/sonokai'
" Plug 'sainnhe/edge'

call plug#end()

colorscheme sonokai

highlight clear Conceal

" change register key
nnoremap <Space> "

"alternate Esc and save
inoremap <C-c> <Esc>
nnoremap <C-s> :w<CR>

"disable search highlighting
nnoremap <silent><C-c> :noh<CR>

" move between windows
noremap <C-j> <C-W>j
noremap <C-k> <C-W>k
noremap <C-h> <C-W>h
noremap <C-l> <C-W>l

" page up/down
nnoremap <S-j> <C-d>
nnoremap <S-k> <C-u>

" menu nav with ctl-j and ctl-k
inoremap <expr> <c-j> ("\<C-n>")
inoremap <expr> <c-k> ("\<C-p>")

let g:BASH_Ctrl_j = 'off'

" Snippet expansion
let g:UltiSnipsExpandTrigger="<C-l>"
let g:UltiSnipsJumpForwardTrigger="<Tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-Tab>"

" Auto format on save, requires external formatting engine
" au BufWrite * :Autoformat
"
"

let g:vimtex_compiler_progname = 'nvr'
let g:tex_flavor = 'latex'
let g:vimtex_latexmk_continuous = 1
let g:vimtex_view_method = 'zathura'
" hides menu showing errors, can bring up menu with :copen
let g:vimtex_quickfix_mode = 0
set conceallevel=1
let g:tex_conceal = 'abdmg'
" compilier options for minted package and synctex
let g:vimtex_compiler_latexmk = {
            \ 'options' : [
            \   '-pdf',
            \   '-shell-escape',
            \   '-verbose',
            \   '-file-line-error',
            \   '-synctex=1',
            \   '-interaction=nonstopmode',
            \ ],
            \}

function! s:goyo_enter()
    if executable('tmux') && strlen($TMUX)
        silent !tmux set status off
        silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
    endif
    set noshowmode
    set noshowcmd
    set scrolloff=999
    " ...
endfunction

function! s:goyo_leave()
    if executable('tmux') && strlen($TMUX)
        silent !tmux set status on
        silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
    endif
    set showmode
    set showcmd
    set scrolloff=5
    " ...
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()
