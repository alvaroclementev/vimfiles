source $VIMRUNTIME/mswin.vim
behave mswin

set nocompatible
filetype plugin indent on
let $MYVIMRC=$HOME.'\vimfiles\_vimrc'

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

set tabstop=4
set softtabstop=4
set expandtab

set number
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

"Map j and k to move between virtual lines
"(wrapped lines are not ignored)
set textwidth=80
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

let mapleader=" "
"Map ,h to remove highlight when searching
nnoremap <Leader>h :set hlsearch!<CR> 