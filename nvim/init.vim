call plug#begin()

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'kyazdani42/nvim-tree.lua'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'elixir-editors/vim-elixir'
Plug 'renderedtext/vim-elixir-alternative-files'
Plug 'kien/ctrlp.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-commentary'
Plug 'vim-airline/vim-airline'

call plug#end()

"
" General Options
"

set encoding=UTF-8
set number

set noerrorbells visualbell t_vb=        " Disable bell
set backupdir=~/.config/nvim/_backup     " where to put backup files
set directory=~/.config/nvim/_temp       " where to put swap files
set inccommand=nosplit                   " incremental substitute

" Whitespace
set nowrap                               " don't wrap lines
set tabstop=2                            " a tab is two spaces
set shiftwidth=2                         " an autoindent (with <<) is two spaces
set expandtab                            " use spaces, not tabs

" Searching
set ignorecase                           " searches are case insensitive...
set smartcase                            " ... unless they contain at least one capital letter

"
" Keybindings
"

let mapleader=" "

" split nativation
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" disable cursor keys in normal mode
map <Left>  :echo "no! use h!"<cr>
map <Down>  :echo "no! use j!"<cr>
map <Up>    :echo "no! use k!"<cr>
map <Right> :echo "no! use l!"<cr>

" fast escape
inoremap jj <Esc>

" clear the search buffer when hitting return
nnoremap <CR> :nohlsearch<cr>

" toggle neovim tree
nnoremap <leader>l :NvimTreeToggle<cr>

map <leader>s :split<CR>
map <leader>v :vsplit<CR>

nnoremap <silent><leader>t :call ElixirAlternateFile()<cr>

let g:indentLine_setColors = 1

"
" Vim tree
"
lua << EOF
  vim.g.loaded = 1
  vim.g.loaded_netrwPlugin = 1
  vim.opt.list = true

  require("nvim-tree").setup({
    renderer = {
      icons = {
        webdev_colors = false
      }
    }
  })

  require("indent_blankline").setup({
    char_highlight_list = {"NonText"},
    space_char_highlight_list = {"NonText"},
  })
EOF

let g:indent_blankline_char_list = [' ', '¦', '┆', '┊']

"
" Color Adjustments
"

" displays vim syntax group under cursor
function! SynGroup()
    let l:s = synID(line('.'), col('.'), 1)
    echo synIDattr(l:s, 'name') . ' -> ' . synIDattr(synIDtrans(l:s), 'name')
endfun

hi NonText ctermfg=240
hi PreProc cterm=none ctermfg=13
hi Constant ctermfg=81
hi Type ctermfg=81
hi Identifier cterm=none ctermfg=81
hi elixirString ctermfg=185
hi elixirStringDelimiter ctermfg=185 cterm=none
hi elixirOperator cterm=none ctermfg=231
hi Comment cterm=italic ctermfg=28
hi Todo cterm=italic ctermfg=40 ctermbg=22
hi LineNr cterm=none ctermfg=244 ctermbg=none

if has("autocmd")
  " Delete empty space from the end of lines on every save
  au BufWritePre * :%s/\s\+$//e

  " Spellcheck
  au BufRead,BufNewFile *.feature setlocal spell

  " Treat JSON files like JavaScript
  au BufNewFile,BufRead *.json set ft=javascript

  " Encrypted Yaml
  au BufRead,BufNewFile *.{yml.enc} setlocal filetype=yaml

  au BufRead,BufNewFile *.{inky} setlocal filetype=html

  " Git
  au Filetype gitcommit setlocal spell textwidth=72
endif

" Airline
let g:airline_left_sep=""
let g:airline_right_sep=""
let g:airline_section_x=""
let g:airline_section_y=""
let g:airline_section_z="%l/%L %-3.c"
