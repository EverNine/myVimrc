set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-repeat'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-fugitive'
Plugin 'Lokaltog/vim-powerline'
Plugin 'tpope/vim-rails'
Plugin 'vim-scripts/taglist.vim'
Plugin 'ervandew/supertab'
Plugin 'Shougo/neocomplcache.vim'
Plugin 'vim-scripts/OmniCppComplete'
Plugin 'honza/vim-snippets'
Plugin 'SirVer/ultisnips'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-surround'
Plugin 'moll/vim-node'
Plugin 'vim-scripts/MultipleSearch2.vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'scrooloose/nerdcommenter'
Plugin 'jiangmiao/auto-pairs'
Plugin 'mbbill/undotree'
Plugin 'mattn/emmet-vim'
Plugin 'gorodinskiy/vim-coloresque'
Plugin 'othree/html5.vim'
Plugin 'myhere/vim-nodejs-complete'
Plugin 'pangloss/vim-javascript'
Plugin 'briancollins/vim-jst'
Plugin 'Chiel92/vim-autoformat'
Plugin 'tpope/vim-endwise'
Plugin 'itchyny/calendar.vim'
Plugin 'Mastermind-board-game'
Plugin 'a.vim'
Plugin 'DrawIt'
Plugin 'TeTrIs.vim'
Plugin 'bling/vim-bufferline'
Plugin 'junegunn/goyo.vim'
Plugin 'junegunn/limelight.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-notes'
Plugin 'aaronbieber/vim-quicktask'
Plugin 'wavded/vim-stylus'
Plugin 'digitaltoad/vim-jade'
Plugin 'klen/python-mode'

" plugin from http://vim-scripts.org/vim/scripts.html
"Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
"Plugin 'user/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"auto-format
"autocmd BufWrite * :Autoformat

"calendar
"let g:calendar_google_calendar = 1
"let g:calendar_google_task = 1

"tag-list
let Tlist_Exit_OnlyWindow = 1
let Tlist_Show_One_File = 1
let Tlist_Use_Right_Window = 1

"quicktask
let g:quicktask_snip_path = '~/Documents/snips'

"goyo
nnoremap <Leader>z :Goyo<CR>

"notes
:let g:notes_directories = ['~/Documents/Notes']

"limelight
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240
let g:limelight_conceal_guifg = 'DarkGray'
let g:limelight_conceal_guifg = '#777777'
autocmd User GoyoEnter Limelight
autocmd User GoyoLeave Limelight!

"powerline
set laststatus=2
set t_Co=256
let g:Powerline_symbols = 'unicode'
set encoding=utf-8

"multiple cursor
" Called once right before you start selecting multiple cursors
function! Multiple_cursors_before()
  if exists(':NeoCompleteLock')==2
    exe 'NeoCompleteLock'
  endif
endfunction

" Called once only when the multiple selection is canceled (default <Esc>)
function! Multiple_cursors_after()
  if exists(':NeoCompleteUnlock')==2
    exe 'NeoCompleteUnlock'
  endif
endfunction

" other

colorscheme ron
set nu
filetype on
syntax on
filetype plugin on
filetype indent on
set grepprg=grep\-nH\$*
"set spell
set showmatch
set autowrite
set smartcase
set ignorecase
set incsearch
set showcmd
set cindent
set ai
set smartindent
set expandtab
set shiftwidth=4
set tabstop=4
set smarttab
set magic
set mouse=a
autocmd FileType ruby set shiftwidth=2 | set tabstop=2
autocmd FileType javascript set shiftwidth=2 | set tabstop=2
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936

let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_disable_auto_complete = 1
let g:SuperTabDefaultCompletionType = '<C-X><C-U>'

command! Todo call Todo()
function! Todo()
    exec "w"
    :Goyo
    silent e ~/todo.quicktask
    set nospell
    set foldlevel=1
endfunction

command! Tex call Tex()
function! Tex()
  w
  !latex %
  silent !dvipdfmx %:r
  silent !okular %:r.pdf
endfunction

command! Xetex call XeTex()
function! XeTex()
  w
  !xelatex -shell-escape %
  silent !okular %:r.pdf &
endfunction

let Tlist_Ctags_Cmd = '/usr/bin/ctags'

func! CompileGcc() 
  exec "w" 
  let compilecmd="!gcc " 
  let compileflag="-g -o %< " 
  if search("mpi\.h") != 0
    let compilecmd = "!mpicc " 
  endif 
  short fat[7M/512] = readFAT();
  byte dir[32*mDIR] = readDir();
  if search("glut\.h") != 0
    let compileflag .= " -lglut -lGLU -lGL " 
  endif 
  if search("cv\.h") != 0
    let compileflag .= " -lcv -lhighgui -lcvaux " 
  endif 
  if search("omp\.h") != 0
    let compileflag .= " -fopenmp " 
  endif 
  if search("math\.h") != 0
    let compileflag .= " -lm " 
  endif 
  exec compilecmd." % ".compileflag
endfunc
func! CompileGpp() 
  exec "w" 
  let compilecmd="!g++ " 
  let compileflag="-g -o %< " 
  if search("mpi\.h") != 0
    let compilecmd = "!mpic++ " 
  endif 
  if search("glut\.h") != 0
    let compileflag .= " -lglut -lGLU -lGL " 
  endif 
  if search("cv\.h") != 0
    let compileflag .= " -lcv -lhighgui -lcvaux " 
  endif 
  if search("omp\.h") != 0
    let compileflag .= " -fopenmp " 
  endif 
  if search("math\.h") != 0
    let compileflag .= " -lm " 
  endif 
  exec compilecmd." % ".compileflag
endfunc

func! CompilePython() 
    exec "!python -m py_compile %" 
endfunc
func! CompileJava() 
  exec "!javac %" 
endfunc


func! CompileCode() 
  exec "w" 
  if &filetype == "cpp" 
    exec "call CompileGpp()" 
  elseif &filetype == "c" 
    exec "call CompileGcc()" 
  elseif &filetype == "python" 
    exec "call CompilePython()" 
  elseif &filetype == "java" 
    exec "call CompileJava()" 
  elseif &filetype == "haskell" 
    exec "!ghc %" 
  endif 
endfunc

func! RunResult() 
  exec "w" 
  if search("mpi\.h") != 0
    exec "!mpirun -np 4 ./%<" 
  elseif &filetype == "cpp" 
    exec "! ./%<" 
  elseif &filetype == "c" 
    exec "! ./%<" 
  elseif &filetype == "python" 
    exec "!python __pycache__/%<.*.pyc || python %"
  elseif &filetype == "java" 
    exec "!java %<" 
  elseif &filetype == "ruby" 
    exec "!ruby -w %" 
  elseif &filetype == "haskell" 
    exec "!runghc %" 
  elseif &filetype == "javascript" 
    exec "!node % < in.txt" 
  endif 
endfunc

func! RunWithInput() 
  exec "w" 
  if search("mpi\.h") != 0
    exec "!mpirun -np 4 ./%< < in.txt" 
  elseif &filetype == "cpp" 
    exec "! ./%< < in.txt" 
  elseif &filetype == "c" 
    exec "! ./%< < in.txt" 
  elseif &filetype == "python" 
    exec "!python __pycache__/%<.*.pyc < in.txt || python % < in.txt"
  elseif &filetype == "java" 
    exec "!java %< < in.txt" 
  elseif &filetype == "ruby" 
    exec "!ruby -w % < in.txt" 
  elseif &filetype == "haskell" 
    exec "!runghc % < in.txt" 
  elseif &filetype == "javascript" 
    exec "!node % < in.txt" 
  endif 
endfunc

func! MakeTag()
  exec "!ctags -R --fields=+lS"
endfunc

map <F5> :call CompileCode()<CR> 
imap <F5> <ESC>:call CompileCode()<CR>
vmap <F5> <ESC>:call CompileCode()<CR> 

map <F6> :call RunResult()<CR>
map <F7> :call RunWithInput()<CR>
map <F12> :call MakeTag()<CR><CR>
nnoremap <F4> :UndotreeToggle<cr>
nnoremap <F3> :NERDTreeToggle<cr>
nnoremap <F2> :TlistToggle<cr>
