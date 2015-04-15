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

"powerline
set laststatus=2
set t_Co=256
let g:Powerline_symbols = 'unicode'
set encoding=utf-8

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

let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_disable_auto_complete = 1
let g:SuperTabDefaultCompletionType = '<C-X><C-U>'


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

"func! RunPython() 
        "exec "!python %" 
"endfunc
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
                exec "call RunPython()" 
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
            exec "!python %"
            "exec "call RunPython" 
        elseif &filetype == "java" 
            exec "!java %<" 
        elseif &filetype == "ruby" 
            exec "!ruby -w %" 
        elseif &filetype == "haskell" 
            exec "!runghc %" 
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
            exec "!python % < in.txt"
            "exec "call RunPython" 
        elseif &filetype == "java" 
            exec "!java %< < in.txt" 
        elseif &filetype == "ruby" 
            exec "!ruby -w % < in.txt" 
        endif 
endfunc

map <F5> :call CompileCode()<CR> 
imap <F5> <ESC>:call CompileCode(<CR>) 
vmap <F5> <ESC>:call CompileCode()<CR> 

map <F6> :call RunResult()<CR>
map <F7> :call RunWithInput()<CR>
nnoremap <F4> :UndotreeToggle<cr>
nnoremap <F3> :NERDTreeToggle<cr>
nnoremap <F2> :TlistToggle<cr>
