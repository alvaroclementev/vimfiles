set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/vimfiles/bundle/Vundle.vim
call vundle#begin('$HOME/vimfiles/bundle/')
"Let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'scrooloose/nerdtree'
Plugin 'ctrlpvim/ctrlp.vim'
call vundle#end()

filetype plugin indent on

"Change default pointer to _vimrc
let $MYVIMRC=$HOME.'\vimfiles\_vimrc'
let mapleader=" "

"Ignore Files/Directories for Fuzzy Finders
set wildignore+=*/AppData/*

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      if empty(&shellxquote)
        let l:shxq_sav = ''
        set shellxquote&
      endif
      let cmd = '"' . $VIMRUNTIME . '\diff"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
  if exists('l:shxq_sav')
    let &shellxquote=l:shxq_sav
  endif
endfunction

"Taken form dougblack.io/words/a-good-vimrc.html
syntax enable
set background=dark
silent! colorscheme solarized
"Link system clipboard with unnamed buffer (regular copy and paste)
set clipboard=unnamed

"CONFIGURACION ESPECIFICA DE GVIM (Es posible que sea redundante... ya que este
"archivo solo lo lee gVim... pero bueno
"Set font to Hack
if has('gui_running')
    set guifont=Hack:h10
    "start maximized
    au GUIEnter * simalt ~x
    "set where to store backups
    set backupdir=C:\Users\Alvaro\vimbackups
    "set where to store swapfiles
    set dir=C:\Users\Alvaro\vimbackups
endif

"Disable beeping
set noerrorbells visualbell t_vb=
if has('autocmd')
  autocmd GUIEnter * set visualbell t_vb=
endif

set tabstop=4
set softtabstop=4
set expandtab

set number
set relativenumber
"set cursor line "Uncomment to highlight current line

set backspace=indent,eol,start

set wildmenu
set lazyredraw
set showmatch

set incsearch
set hlsearch

"Folding
set foldenable
set foldlevelstart=10
set foldnestmax=10
"Space open/closes folds
nnoremap <space> za 
set foldmethod=indent

"Way to open files from currend directory
cnoremap %% <C-R>=fnameescape(expand('%:h')).'/'<cr>
map <leader>ew :e %%
map <leader>es :sp %%
map <leader>ev :vsp %%
map <leader>et :tabe %%

"Map j and k to move between virtual lines
"(wrapped lines are not ignored)
set textwidth=80
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

"Map ,h to remove highlight when searching
nnoremap <Leader>h :set hlsearch!<CR> 

"NERDTree settings (make NERDTreeCWD the active buffer's directory)
set autochdir
let NERDTreeChDirMode=2
nnoremap <Leader>n :NERDTree<CR>

"Ctrl-P Settings
let g:ctrlp_map='<c-p>'
let g:ctrlp_cmd='CtrlP'
let g:ctrlp_working_path_mode='ra'
"If a file is already open, open new file in new pane
let g:ctrlp_switch_buffer='et'
"To ignore files in .gitignore
"let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
