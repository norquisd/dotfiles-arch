syntax enable

source ~/.config/nvim/plug-config/coc.vim
source ~/.config/nvim/plug-config/startify.vim

let g:python3_host_prog = expand('/usr/bin/python3.9')


set nowrap
set encoding=utf-8
set nu
set relativenumber
set smarttab
set tabstop=4 softtabstop=4
set shiftwidth=4
set smartindent
set autoindent
set noerrorbells
set background=dark
set undodir=~/.vim/undodir
set undofile
set undolevels=1000
set undoreload=10000
set formatoptions-=cro
set clipboard=unnamedplus
set timeoutlen=500
set laststatus=0
set mouse=a

let g:ale_disable_lsp=1

call plug#begin('~/.config/nvim/autoload/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'chrisbra/vim-commentary'
Plug 'lervag/vimtex', {'tag': 'v1.6'}
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'arcticicestudio/nord-vim'
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'dense-analysis/ale'
Plug 'morhetz/gruvbox'
Plug 'mhinz/vim-startify'
Plug 'junegunn/goyo.vim'
Plug 'sainnhe/forest-night'
Plug 'sainnhe/gruvbox-material'

call plug#end()

colorscheme gruvbox-material
" better tex syntax higlighting
" highlight texMathMatcher ctermfg = Green
" highlight texMathZoneAmsAs ctermfg = Green
" highlight texMathZoneX ctermfg = Green
" highlight texSuperscript ctermfg = White
" highlight texSubscript ctermfg = White
" highlight Delimiter ctermfg = Magenta
" highlight texZone ctermfg = cyan
highlight clear Conceal

" *cterm-colors*

" NR-16   NR-8    COLOR NAME
" 0       0       Black
" 1       4       DarkBlue
" 2       2       DarkGreen
" 3       6       DarkCyan
" 4       1       DarkRed
" 5       5       DarkMagenta
" 6       3       Brown, DarkYellow
" 7       7       LightGray, LightGrey, Gray, Grey
" 8       0*      DarkGray, DarkGrey
" 9       4*      Blue, LightBlue
" 10      2*      Green, LightGreen
" 11      6*      Cyan, LightCyan
" 12      1*      Red, LightRed
" 13      5*      Magenta, LightMagenta
" 14      3*      Yellow, LightYellow
" 15      7*      White

" change register key
nnoremap <Space> "

map <F9> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

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

" replace word, hit . to go replace next instance of word
nnoremap "x *``cgn
nnoremap "X #``cgN

" menu nav with ctl-j and ctl-k
inoremap <expr> <c-j> ("\<C-n>")
inoremap <expr> <c-k> ("\<C-p>")

let g:BASH_Ctrl_j = 'off'

let g:UltiSnipsExpandTrigger="<C-l>"
let g:UltiSnipsJumpForwardTrigger="<Tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-Tab>"

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end


let g:vimtex_compiler_progname = 'nvr'
let g:tex_flavor = 'latex'
let g:vimtex_latexmk_continuous = 1
let g:vimtex_view_method = 'zathura'
let g:vimtex_quickfix_mode = 0
set conceallevel=1
let g:tex_conceal = 'abdmg'

let g:ale_linters_explicit = 1
let g:ale_python_flake8_options='--ignore=E501,W503'
let b:ale_fixers = {'python': ['black']}
let g:ale_linters = {
\   'python': ['flake8'],
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

" WSL yank support
"let s:clip = '/mnt/c/Windows/System32/clip.exe'  " change this path according to your mount point
"if executable(s:clip)
"    augroup WSLYank
"        autocmd!
"        autocmd TextYankPost * if v:event.operator ==# 'y' | call system(s:clip, @0) | endif
"    augroup END
"endif
