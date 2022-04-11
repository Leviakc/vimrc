
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

