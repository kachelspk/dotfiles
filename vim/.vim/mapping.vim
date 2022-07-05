" Hot keys
let mapleader = ","
nnoremap <C-p> :Files<CR>

"fast saves
nnoremap <leader>w :w!<CR>

noremap <silent> <C-S>          :update<CR>
vnoremap <silent> <C-S>         <C-C>:update<CR>
inoremap <silent> <C-S>         <C-O>:update<CR>

"exit quickly
nnoremap <silent> <leader>q :lclose<bar>b#<bar>bd #<CR>


"GitGutter
nmap <Leader>gn <Plug>(GitGutterNextHunk)
nmap <Leader>gp <Plug>(GitGutterPrevHunk)
nmap <Leader>gs <Plug>(GitGutterStageHunk)
nmap <Leader>gu <Plug>(GitGutterUndoHunk)
nmap <Leader>gv <Plug>(GitGutterPreviewHunk)

"Nerdtree
nnoremap <leader>ne :NERDTreeToggle<CR>
nnoremap <leader>nf :NERDTreeFind<CR>
nnoremap <leader>t :TagbarToggle<CR>

" clean off  search  hightlight
nmap  <C-l> :noh<CR>

" Quick replace
nnoremap <C-h> :%s/\<<C-r><C-w>\>//g<Left><Left>
nnoremap <C-f> :Ag <C-r><C-w><CR>

" tagbar toggle
nmap <F8> :TagbarToggle<CR>

" Retb: convert tab to space!!!
nmap <F9> :set tabstop=4 shiftwidth=4 expandtab<CR>:retab<CR>

" Quick replace
nnoremap <C-h> :%s/\<<C-r><C-w>\>//g<Left><Left>

" Add shortcut for clipboard registers
noremap <leader>p "*p
noremap <leader>y "+y
noremap <leader>d "+d

" CTRL-C and CTRL-Insert are Copy
vmap <C-c> y:Oscyank<cr>

nnoremap <TAB> :bnext<CR>
" SHIFT-TAB will go back
nnoremap <S-TAB> :bprevious<CR>
"set airline
nmap <Leader>1 <Plug>lightline#bufferline#go(1)
nmap <Leader>2 <Plug>lightline#bufferline#go(2)
nmap <Leader>3 <Plug>lightline#bufferline#go(3)
nmap <Leader>4 <Plug>lightline#bufferline#go(4)
nmap <Leader>5 <Plug>lightline#bufferline#go(5)
nmap <Leader>6 <Plug>lightline#bufferline#go(6)
nmap <Leader>7 <Plug>lightline#bufferline#go(7)
nmap <Leader>8 <Plug>lightline#bufferline#go(8)
nmap <Leader>9 <Plug>lightline#bufferline#go(9)
nmap <Leader>0 <Plug>lightline#bufferline#go(10)
" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Coc
" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nnoremap <silent> K :call <SID>show_documentation()<CR>

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
function! s:show_documentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
