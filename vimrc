set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Define '\' as map leader
let mapleader = '\'
let g:mapleader = '\'

Plugin 'gmarik/vundle'
Plugin 'shiroyasha/vim-sane-defaults'
Plugin 'mileszs/ack.vim'
Plugin 'renderedtext/vim-bdd'
Plugin 'tpope/vim-projectionist'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-rake'
Plugin 'tpope/vim-cucumber'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-commentary'
Plugin 'Shougo/unite.vim'
Plugin 'Shougo/vimfiler.vim'
Plugin 'Shougo/neocomplcache.vim'
Plugin 'thisivan/vim-bufexplorer'
Plugin 'gregsexton/MatchTag'
Plugin 'kchmck/vim-coffee-script'
Plugin 'airblade/vim-gitgutter'
Plugin 'kien/ctrlp.vim'
Plugin 'Lokaltog/vim-powerline'
Plugin 'elixir-lang/vim-elixir'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" CTRL P
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)|deps|_build|vendor$'

" Ack vim
let g:ackprg="ack-grep -H --nocolor --nogroup --column --ignore-dir={vendor,.git}"

" Search word under cursor
nnoremap F :Ack "\b<cword>\b" app lib spec features config<CR>

" Disable AutoComplPop.
let g:acp_enableAtStartup = 0

" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1

" Use smartcase.
let g:neocomplcache_enable_smart_case = 1

" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 2

" Start BufExplorer
nnoremap <silent><leader>q :BufExplorer<CR>
nnoremap <silent><leader>s :A<CR>

" Use vimfiler as default file browser
let g:vimfiler_safe_mode_by_default = 0
let g:vimfiler_as_default_explorer = 1
map Q :VimFilerBufferDir -toggle<CR>

" Vim Git Gutter
highlight SignColumn ctermbg=none
let g:gitgutter_signs = 1            " Activate gutter signs

colorscheme desert
hi VertSplit ctermbg=White ctermfg=Black
hi NonText ctermfg=Black ctermbg=Black
