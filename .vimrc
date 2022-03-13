set number
set mouse=a
set numberwidth=1
set clipboard+=unnamedplus
syntax enable
set showcmd 
set ruler 
set encoding=UTF-8
set showmatch
set sw=2
set relativenumber
set laststatus=2
set noshowmode
set shiftwidth=2
set smartindent
set tabstop=4 softtabstop=4
set exrc
set hidden
set noerrorbells
set scrolloff=8
set colorcolumn=80
set signcolumn=yes
set noswapfile
set nobackup
set updatetime=100
" Don't pass messages to |ins-completion-menu|.
set shortmess+=c
" Give more space for displaying messages.
set cmdheight=2

":help incsearh to know more about it
		augroup vimrc-incsearch-highlight
		  autocmd!
		  autocmd CmdlineEnter /,\? :set hlsearch
		  autocmd CmdlineLeave /,\? :set nohlsearch
		augroup END


call plug#begin('~/.vim/plugged')

"Autocomplete
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-scripts/SQLComplete.vim'

"Color css
Plug 'ap/vim-css-color'

"Emmet
Plug 'mattn/emmet-vim'

"IDE
Plug 'easymotion/vim-easymotion'
Plug 'yggdroot/indentline'
Plug 'editorconfig/editorconfig-vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'jpalardy/vim-slime'

"NerdTree
Plug 'scrooloose/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'scrooloose/nerdcommenter'


"Status bar
Plug 'maximbaz/lightline-ale'
Plug 'itchyny/lightline.vim'

"Test
Plug 'tyewang/vimux-jest-test'
Plug 'janko-m/vim-test'

"Theme
Plug 'mhartington/oceanic-next'


"Tmux
Plug 'christoomey/vim-tmux-navigator'

"Typing
Plug 'alvan/vim-closetag'
Plug 'tpope/vim-surround'


Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

"Snippetd
Plug 'SirVer/ultisnips'
Plug 'mlaursen/vim-react-snippets'
Plug 'honza/vim-snippets'

"Syntax
Plug 'sheerun/vim-polyglot'
Plug 'airblade/vim-gitgutter'
Plug 'norcalli/nvim-colorizer.lua'

"Navigate
Plug 'francoiscabrol/ranger.vim'
Plug 'rbgrouleff/bclose.vim'

call plug#end()

set splitright

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

"Autocomplete
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
	  \ pumvisible() ? "\<C-n>" :
	  \ <SID>check_back_space() ? "\<TAB>" :
	  \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()


" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

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

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>re <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

 "Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

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

autocmd FileType javascript.jsx setlocal commentstring={/*\ %s\ */}
"prettier
command! -nargs=0 Prettier :CocCommand prettier.formatFile

"coc config
let g:coc_global_extensions = [
  \ 'coc-tsserver',
  \ 'coc-eslint', 
  \ 'coc-pairs',
  \ 'coc-prettier', 
  \ 'coc-json',
  \ ]

"Emmet
let g:user_emmet_leader_key = ','
let g:user_emmet_settings = {
\  'variables': {'lang': 'es'},
\  'html': {
\    'default_attributes': {
\      'option': {'value': v:null},
\      'textarea': {'id': v:null, 'name': v:null, 'cols': 10, 'rows': 10},
\    },
\    'snippets': {
\      '!': "<!DOCTYPE html>\n"
\              ."<html lang=\"${lang}\">\n"
\              ."<head>\n"
\              ."\t<meta charset=\"${charset}\">\n"
\              ."\t<link rel=\"icon\" href=\"data:,\"/>\n"
\              ."\t<link href=\"\" rel=\"stylesheet\" />\n"
\              ."\t<title></title>\n"
\              ."\t<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n"
\              ."</head>\n"
\              ."<body>\n\t${child}|\n</body>\n"
\              ."</html>",
\    },
\  },
\}


"NerdTree
"let NERDTreeQuitOnOpen=1

nmap <leader>nt :NERDTreeFind<CR>
vmap ++ <plug>NERDCommenterToggle
nmap ++ <plug>NERDCommenterToggle

"split resize
nnoremap <leader>x 5<C-w>>
nnoremap <leader>z 5<C-w>< 

"Tiago
" you can add these colors to your .vimrc to help customizing
let s:brown = "905532"
let s:aqua =  "3AFFDB"
let s:blue = "689FB6"
let s:darkBlue = "44788E"
let s:purple = "834F79"
let s:lightPurple = "834F79"
let s:red = "AE403F"
let s:beige = "F5C06F"
let s:yellow = "F09F17"
let s:orange = "D4843E"
let s:darkOrange = "F16529"
let s:pink = "CB6F6F"
let s:salmon = "EE6E73"
let s:green = "8FAA54"
let s:lightGreen = "31B53E"
let s:white = "FFFFFF"
let s:rspec_red = 'FE405F'
let s:git_orange = 'F54D27'

let g:NERDTreeExtensionHighlightColor = {} " this line is needed to avoid error
let g:NERDTreeExtensionHighlightColor['css'] = s:blue " sets the color of css files to blue

let g:NERDTreeExactMatchHighlightColor = {} " this line is needed to avoid error
let g:NERDTreeExactMatchHighlightColor['.gitignore'] = s:git_orange " sets the color for .gitignore files

let g:NERDTreePatternMatchHighlightColor = {} " this line is needed to avoid error
let g:NERDTreePatternMatchHighlightColor['.*_spec\.rb$'] = s:rspec_red " sets the color for files ending with _spec.rb

let g:WebDevIconsDefaultFolderSymbolColor = s:beige " sets the color for folders that did not match any rule
let g:WebDevIconsDefaultFileSymbolColor = s:green " sets the color for files that did not match any rule

"JavaScript
"Import
nnoremap <Leader>if <Plug>(JsFileImport)

nnoremap <Leader>iF <Plug>(JsFileImportList)

nnoremap <Leader>ig <Plug>(JsGotoDefinition)

nnoremap <Leader>iG <Plug>(JsGotoDefinition)

nnoremap <Leader>ip <Plug>(PromptJsFileImport)

nnoremap <Leader>is <Plug>(SortJsFileImport)

nnoremap <Leader>ic <Plug>(JsFixImport)
"Theme
set t_Co=256
colorscheme OceanicNext 

let g:airline_theme='minimalist'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1


highlight Normal ctermbg = NONE


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

"Ranger
let g:ranger_map_keys = 0
map <leader>ra :Ranger<CR>
map <leader>rnt :RangerNewTab<CR>


" list all snippets for current filetype
let g:UltiSnipsListSnippets="<c-l>"

" vim-slime
let g:slime_target = "tmux"
let g:slime_default_config = {"socket_name": get(split($TMUX, ","), 0), "target_pane": ":.2"}
