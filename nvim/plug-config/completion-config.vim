" Use completion-nvim in every buffer
autocmd BufEnter * lua require'completion'.on_attach()

" Navigate through popup menu
inoremap <expr> <C-j>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

" Avoid showing message extra message when using completion
set shortmess+=c

"map <C-l> to manually trigger completion
imap <silent> <C-l> <Plug>(completion_trigger)

" possible value: 'UltiSnips', 'Neosnippet', 'vim-vsnip', 'snippets.nvim'
let g:completion_enable_snippet = 'UltiSnips'

let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy', 'all']

let g:completion_matching_smart_case = 1

let g:completion_chain_complete_list = {
      \'default' : [
      \    {'complete_items': ['lsp', 'snippet', 'path']},
      \    {'mode': '<c-p>'},
      \    {'mode': '<c-n>'}
      \]
      \}
