" ~/.vimrc

""" general settings
set nocompatible                        " use Vim settings rather than Vi settings
set encoding=UTF-8                      " set UTF-8 as standard encoding
set history=1000                        " increase command history
set autoread                            " auto read when file is changed externally
set hidden                              " allow switching buffers without saving
set backspace=indent,eol,start          " make backspace behave normally
set nostartofline                       " don't reset cursor to start of line when moving around

" no backup files
set nobackup
set nowritebackup
set noswapfile
set backupskip=/tmp/*,/private/tmp/*

" use system clipboard
set clipboard=unnamed

" better command-line completion
set wildmenu
set wildmode=list:longest,full

""" ui settings
set number                              " show line numbers
set ruler                               " show cursor position
set showmatch                           " show matching brackets
set laststatus=2                        " always show status line
set mouse=a                             " enable mouse support

""" colors and fonts
syntax enable                           " enable syntax highlighting

""" text, tab and indent related
set expandtab                           " use spaces instead of tabs
set smarttab                            " be smart when using tabs
set shiftwidth=4                        " 1 tab == 4 spaces
set tabstop=4                           " 1 tab == 4 spaces
set autoindent                          " auto indent
set smartindent                         " smart indent
set wrap                                " wrap lines
set linebreak                           " break lines at word boundaries
set showbreak=↪                         " show break symbol for wrapped lines

""" search settings
set hlsearch                            " highlight search results
set incsearch                           " show search matches as you type
set ignorecase                          " ignore case when searching
set smartcase                           " case sensitive when uppercase present
set gdefault                            " add the g flag to search/replace by default

""" performance settings
set lazyredraw                          " don't redraw while executing macros
set updatetime=300                      " faster completion
set timeout timeoutlen=500              " faster key sequence completion

""" plugins (vim-plug)
call plug#begin()                       " enable plugins with https://github.com/junegunn/vim-plug
Plug 'vim-airline/vim-airline'          " status bar
Plug 'ap/vim-css-color'                 " color preview
Plug 'preservim/nerdtree'               " file explorer
Plug 'tc50cal/vim-terminal'             " terminal integration
Plug 'tpope/vim-commentary'             " easy commenting
Plug 'tpope/vim-surround'               " surround text objects
call plug#end()

""" plugin settings
" airline
let g:airline#extensions#tabline#enabled = 1

" NERDTree
nnoremap <C-t> :NERDTreeToggle<CR>

" fzf integration
set rtp+=/opt/homebrew/opt/fzf

""" key mappings
" move lines up/down with CTRL+k/j
noremap <C-k> :m-2<CR>
noremap <C-j> :m+1<CR>

" buffer navigation with CTRL+l
noremap <C-l> :bn<CR>

" clear search highlighting with <leader><space>
nnoremap <leader><space> :noh<CR>

" quick save with <leader>w
nnoremap <leader>w :w<CR>

" quick quit with <leader>q
nnoremap <leader>q :q<CR>
