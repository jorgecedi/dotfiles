if empty(glob("~/.vim/autoload/plug.vim"))
    silent !curl -fLso ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall
end

call plug#begin('~/vimfiles/plugged/')

Plug 'tpope/vim-repeat'
Plug 'ap/vim-buftabline'
Plug 'mattn/emmet-vim'
Plug 'scrooloose/nerdtree'
Plug 'Valloric/YouCompleteMe'
Plug 'sheerun/vim-polyglot'
Plug 'majutsushi/tagbar'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-sensible'
Plug 'Lokaltog/vim-easymotion'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'ervandew/supertab'
Plug 'rbgrouleff/bclose.vim'
Plug 'vim-scripts/BufOnly.vim'
Plug 'jamessan/vim-gnupg'
Plug 'ryanoasis/vim-devicons'

set rtp+=~/.fzf
Plug 'junegunn/fzf.vim'

call plug#end()

set nocompatible            " disable vi compatibility mode
set history=1000            " increase history size
set noswapfile              " don't create swapfiles
set nobackup                " don't backup, use git!

set autoindent              " autoindent always ON.
set expandtab               " expand tabs
set shiftwidth=4            " spaces for autoindenting
set softtabstop=4           " remove a full pseudo-TAB when i press <BS>

set encoding=utf-8          " always use unicode (god damnit, windows)
set backspace=indent,eol,start " backspace always works on insert mode
set hidden

set noeb novb

autocmd FileType html,css,sass,scss setlocal sw=2 sts=2
autocmd FileType javascript setlocal sw=4 sts=4
autocmd FileType sh,bash setlocal sw=2 sts=2
autocmd FileType json setlocal sw=2 sts=2
autocmd FileType ruby,eruby setlocal sw=2 sts=2
autocmd FileType yaml setlocal sw=2 sts=2

if &t_Co > 2 || has("gui_running")
   syntax on
   silent! color pablo
   set background=dark
   set guifont=DroidSansMono\ NF:h11
   set guifontwide=DroidSansMono\ NF:h11
endif

if &t_Co >= 256 || has("gui_running")
    hi CursorLine guibg=#001122
endif

if &t_Co > 2 || has("gui_running")
    highlight ExtraWhitespace ctermbg=red guibg=red
    match ExtraWhitespace /\s\+$/
else
    set listchars=trail:~
    set list
endif

set fillchars+=vert:\   " Remove unpleasant pipes from vertical splits
                        " Sauce on this: http://stackoverflow.com/a/9001540

set showmode            " always show which more are we in
set laststatus=2        " always show statusbar
set wildmenu            " enable visual wildmenu

set nowrap              " don't wrap long lines
set relativenumber      " show numbers as relative by default
set showmatch           " higlight matching parentheses and brackets

let mapleader=","

let g:ycm_collect_identifiers_from_tags_files = 1 " Let YCM read tags from Ctags file
let g:ycm_seed_identifiers_with_syntax = 1 " Completion for programming language's keyword
let g:ycm_complete_in_comments = 1 " Completion in comments
let g:ycm_complete_in_strings = 1 " Completion in string

let NERDTreeQuitOnOpen=1
let NERDTreeWinSize=20
let NERDTreeIgnore = ['\.pyc$']

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,venv,node_modules,*.pyc,bower_components,*.png,*.jpg

" Removes white space before save
autocmd BufWritePre * %s/\s\+$//e

" Fuzzy search out of the box
set path+=**

" Maximize the GVim window on startup
autocmd GUIEnter * simalt ~x

" enable line numbers in NerdTree
let NERDTreeShowLineNumbers=1
" make sure relative line numbers are used
autocmd FileType nerdtree setlocal relativenumber

" Removes menus, tabs and other stuff from GVim window
set guioptions-=m
set guioptions-=T
set guioptions-=r
set guioptions-=L
set guioptions-=e

set ignorecase
set smartcase
set spellsuggest=best,10
set ttimeoutlen=50

" I hate my self for this
inoremap <Left>  <NOP>
inoremap <Right> <NOP>
inoremap <Up>    <NOP>
inoremap <Down>  <NOP>

" Cool mappings
inoremap jj <Esc>

nnoremap <Up>    :resize +5<CR>
nnoremap <Down>  :resize -5<CR>
nnoremap <Left>  :vertical resize +5<CR>
nnoremap <Right> :vertical resize -5<CR>

" use emmet
imap <C-E> <C-Y>,

" Ergomappings
noremap <Space>nt :NERDTreeToggle<CR>
noremap <Space>tt :TagbarToggle<CR>
noremap <Tab> :bn<CR>
noremap <S-Tab> :bp<CR>
noremap <Leader><Tab> :bd<CR>
noremap <Leader><S-Tab> :bd!<CR>
noremap <Space>fs :w<CR>
noremap <Space>ff :Files<CR>
noremap <Space>ft :Tags<CR>
noremap <Space>fg :Ag<CR>
noremap <Space>fl :Lines<CR>
noremap <Space>bb :Buffers<CR>
noremap <Space>bd :bd<CR>
noremap <Space>wk <C-w>k
noremap <Space>wj <C-w>j
noremap <Space>wh <C-w>h
noremap <Space>wl <C-w>l
noremap <Space>wm :on<CR>
noremap <Space>fed :e $MYVIMRC<CR>
noremap <Space>feR :so %<CR>
noremap <Space>pp :set paste!<CR>
noremap <Space>gd <C-]>

let g:airline_theme='dracula'

set clipboard^=unnamed
set clipboard^=unnamedplus

" Makes FZF better
command! -bang -nargs=* Ag
  \ call fzf#vim#ag(<q-args>,
  \                 <bang>0 ? fzf#vim#with_preview('up:60%')
  \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
  \                 <bang>0)

command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)
