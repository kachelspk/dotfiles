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
"
" " Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position.
" " Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
"
" " Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)
"
"" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)


" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1):
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

nmap <Leader>t :TagbarToggle<CR>
" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>
"
function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    else
        call CocAction('doHover')
    endif
endfunction


function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)



command! -bang -nargs=* Ag
  \ call fzf#vim#grep(
  \   'ag --column --numbers --noheading --color --smart-case --follow '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)
