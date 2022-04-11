
"map
let mapleader=" "
inoremap jk <ESC>
nmap <leader>s <Plug>(easymotion-s2)

nmap <leader>nn :vsplit term://node %<CR>

nmap <leader>w :w<CR>
nmap <leader>q :q<CR>
nmap <leader>e :x<CR>
nmap <leader>as :q!<CR>
nmap <leader>hh gT<CR>
nmap <leader>ll gt<CR>
nmap <leader>t :tabnew<CR>
nmap <leader>; $a;<CR>
nmap <leader>u ysiw"<CR>
nmap <leader>rr <c-r><CR>
nmap <leader>do :t.<CR>


nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-1<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv


" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>z  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>x  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>v  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>b  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>zz  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>cc  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>vv  :<C-u>CocListResume<CR>


"split resize
nnoremap <leader>x 5<C-w>>
nnoremap <leader>z 5<C-w>< 


" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" Using Lua functions
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>


" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>
