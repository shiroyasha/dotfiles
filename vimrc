set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Plugin 'gmarik/vundle'
Plugin 'tpope/vim-rails'
Plugin 'renderedtext/vim-bdd'
Plugin 'tpope/vim-cucumber'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-commentary'
Plugin 'Lokaltog/vim-powerline'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'vlasar/snipmate'
Plugin 'vlasar/snipmate-snippets'
Plugin 'thisivan/vim-bufexplorer'
Plugin 'gregsexton/MatchTag'
Plugin 'altercation/vim-colors-solarized'
Plugin 'kchmck/vim-coffee-script'
Plugin 'airblade/vim-gitgutter'
Plugin 'kien/ctrlp.vim'
"Plugin 'scrooloose/nerdtree'
Plugin 'Shougo/unite.vim'
Plugin 'Shougo/vimfiler.vim'
Plugin 'ConradIrwin/vim-bracketed-paste'
Plugin 'Shougo/neocomplcache.vim'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'mileszs/ack.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

autocmd BufWritePre * :%s/\s\+$//e

set title
set hidden

" Numbers
set number
set numberwidth=4
set ruler

exe "set path=".expand("$PATH")

syntax enable

set nomodeline
set backspace=indent,eol,start    " Backspace will delete EOL chars, as well as indents
set matchpairs+=<:>               " For characters that forms pairs for using % commands,       this is for HTML Tags
set shortmess=atToOI              " To avoid the 'Hit Enter' prompts caused by the file         messages
set iskeyword+=_,$,@,%,#          " Keywords are use to searching and recognized with many      commands
set history=1000
set undolevels=1000
set confirm
set updatetime=1500

" Encoding "
set encoding=utf-8
set termencoding=utf-8

" Instantly leave insert mode when pressing <ESC>"
" This works by disabling the mapping timeout completely in normal
" mode, and enabling it in insert mode with a very low timeout length.
augroup fastescape
  autocmd!

  set notimeout
  set ttimeout
  set timeoutlen=10

  au InsertEnter * set timeout
  au InsertLeave * set notimeout
augroup END

" CTRL P
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)|deps|_build|vendor$'

" Define , as map leader"
let mapleader = '\'
let g:mapleader = '\'


" Disable all bells"
set noerrorbells visualbell t_vb=

" Wild menu (Autocompletion)"
set wildmenu
set wildignore=.svn,CVS,.git,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.jpeg,*.png,*.xpm,*.gif
set wildmode=full

" Backup and Swap"
set nobackup
set nowritebackup
set noswapfile

" Search Options"
set hlsearch   " Highlight search
set incsearch  " Incremental search
set magic      " Set magic on, for regular expressions
set ignorecase " Searches are Non Case-sensitive
set smartcase

" FOLDING
set foldenable
set foldmethod=marker
set foldlevel=0
set foldcolumn=0

" Ack vim
let g:ackprg="ack-grep -H --nocolor --nogroup --column --ignore-dir={vendor,.git}"

" General UI Options"
set laststatus=2       " Always show the statusline

set showmatch          " Shows matching brackets when text indicator is over them
set scrolloff=5        " Show 5 lines of context around the cursor
set sidescrolloff=20
set lazyredraw         " The screen won't be redrawn unless actions took place
set scrolljump=10
set showcmd
set ttyfast            " Improves redrawing for newer computers
set pumheight=10
set diffopt+=context:3

" Formatting Options
set wrap  " Soft Wrap in all files, while hard wrap can be allow by filetype
set linebreak " It maintains the whole words when wrapping

" Indentation"
set autoindent
set cindent
set smartindent

" Tab Options"
set shiftwidth=2
set tabstop=2
set expandtab

" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 2

inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" Clear search highlighting
nnoremap <silent><leader>c :nohlsearch<CR>

" Start BufExplorer
nnoremap <silent><leader>q :BufExplorer<CR>
nnoremap <silent><leader>s :A<CR>
nnoremap <silent><leader>1 :e ~/.vimrc<CR>
nnoremap <silent><leader>2 :source ~/.vimrc<CR>

nnoremap <silent><leader><CR> :nohl<CR>

nnoremap <silent><leader>z [<C-d>

nnoremap <silent><leader>r :!rspec %<CR>
nnoremap <silent><leader>w :wa<CR>
nnoremap <silent><leader>, <C-W><C-H>
nnoremap <silent><leader>. <C-W><C-L>

let g:vimfiler_as_default_explorer = 1
map Q :VimFilerBufferDir -toggle<CR>

" easier navigation between split windows
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" disable cursor keys in normal mode
map <Left>  :echo "no!"<cr>
map <Right> :echo "no!"<cr>
map <Up>    :echo "no!"<cr>
map <Down>  :echo "no!"<cr>

" Paste
let paste_mode = 0 " 0 = normal, 1 = paste

func! Paste_on_off()
  if g:paste_mode == 0
    set paste
    let g:paste_mode = 1
  else
    set nopaste
    let g:paste_mode = 0
  endif
  return
endfunc

" Paste Mode <F3>
nnoremap <silent> <F3> :call Paste_on_off()<CR>
set pastetoggle=<F3>

" Repurpose left and right arrow keys to move between the buffers
" nnoremap <silent> <Down>   :bn<CR>
" nnoremap <silent> <Up>  :bp<CR>

" Indent visual selected code without unselecting
" As seen in vimcasts.org
vmap > >gv
vmap < <gv
vmap = =gv

au BufRead,BufNewFile *.go setlocal filetype=go
au BufRead,BufNewFile *.cap setlocal filetype=ruby
au BufRead,BufNewFile Capfile* setlocal filetype=ruby
au BufRead,BufNewFile *.md setlocal textwidth=80
au BufRead,BufNewFile *.md setlocal colorcolumn=+1

au BufRead,BufNewFile *.md.erb setlocal textwidth=80
au BufRead,BufNewFile *.md.erb setlocal colorcolumn=+1

au BufRead,BufNewFile *.md setlocal spell
au BufRead,BufNewFile *.md.erb setlocal spell

au BufRead,BufNewFile *.feature setlocal spell

" Buffer Explorer
let g:bufExplorerDefaultHelp=0       " Do not show default help.
let g:bufExplorerShowRelativePath=1  " Show relative paths.

set wildignore+=vendor/**

" Vim Git Gutter
highlight SignColumn ctermbg=none
let g:gitgutter_signs = 1            " Activate gutter signs

nnoremap K :Ack "\b<C-R><C-W>\b" app lib spec

colorscheme desert
hi VertSplit ctermbg=White ctermfg=Black
hi NonText ctermfg=Black ctermbg=Black

set foldmethod=indent
set foldlevelstart=99

nnoremap <leader>v :vsplit<cr>
nnoremap <leader>h :split<cr>
