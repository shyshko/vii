set mouse=a
set number

set tabstop=4
set shiftwidth=4

set backspace=indent,eol,start

"empty symbols highlight

set list
set listchars=tab:│\ 
set listchars+=trail:~

"80 symbols width line
set cc=80

" Enable file type detection.
filetype plugin indent on

let g:tagbar_autofocus = 1
let g:tagbar_autoclose = 1

set t_Co=256
colorscheme wombat256mod
set cursorline
hi CursorLine cterm=bold
hi ColorColumn cterm=bold ctermbg=236
set laststatus=2

syntax enable
set hlsearch
set incsearch
set ignorecase
set smartcase

set nocompatible              " be iMproved, required
filetype off                  " required

nnoremap <silent> <F8> :TlistToggle<CR>

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'vim-scripts/taglist.vim'
Plugin 'vim-scripts/Conque-Shell'
Plugin 'bkad/CamelCaseMotion'
Plugin 'garbas/vim-snipmate'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'bling/vim-airline'
Plugin 'honza/vim-snippets'
"Plugin 'vim-scripts/cscope.vim'

call vundle#end()

set noshowmode

let g:airline_powerline_fonts = 1
let g:airline_theme = "wombat"
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#branch#enabled = 1

filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on

" :PluginList          - list configured plugins
" :PluginInstall(!)    - install (update) plugins
" :PluginSearch(!) foo - search (or refresh cache first) for foo
" :PluginClean(!)      - confirm (or auto-approve) removal of unused plugins

"caseCamle options
map <S-W> <Plug>CamelCaseMotion_w
map <S-B> <Plug>CamelCaseMotion_b
map <S-E> <Plug>CamelCaseMotion_e
"casecamle end

let Tlist_Show_One_File = 1 "show tags of only one file

function! LoadCscope()
  let db = findfile("cscope.out", ".;")
  if (!empty(db))
    let path = strpart(db, 0, match(db, "/cscope.out$"))
    set nocscopeverbose " suppress 'duplicate connection' error
    exe "cs add " . db . " " . path
    set cscopeverbose
  endif
endfunction
au BufEnter /* call LoadCscope()
