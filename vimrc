"                                                                                               
autocmd BufReadPost *.cpp,*.c,*.h,*.hpp,*.cc,*.cxx call tagbar#autoopen()       
                                                                                
"txt按照wiki语法高亮                                                            
autocmd BufNewFile *.txt set ft=confluencewiki                                  
autocmd BufEnter *.txt set ft=confluencewiki                                    
                                                                                
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif                                                                    
"                                                                               
highlight Search ctermbg=black ctermfg=white guifg=white guibg=black            
color molokai                                                                   
syntax on                                                                       
filetype on                                                                     
filetype indent on                                                              
filetype plugin on                                                              
filetype plugin indent on                                                       
                                                                                
                                                                                
let mapleader=" "    

let &t_SI = "\<ESC>]50;Cursorshape=1\x7"                                        
let &t_SP = "\<ESC>]50;Cursorshape=2\x7"                                        
let &t_EI = "\<ESC>]50;Cursorshape=0\x7"                                        
                                                                                
let &t_ut =''                                                                   
"                                                                               
""set number                                                                    
""set listchars=tab:*\,trail:-                                                  
""set mouse=a                                                                   
"                                                                               
set clipboard=unnamed                                                           
set magic                                                                       
set guioptions-=T                                                               
set guioptions-=m                                                               
set nocp                                                                        
set noeb                                                                        
set nobackup                                                                    
set noswapfile                                                                  
set completeopt=longest,preview,menu                                            
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\%H:%M\")}    

set vb t_vb=                                                                    
set si                                                                          
set cursorline                                                                  
set expandtab                                                                   
set tabstop=4                                                                   
set shiftwidth=4                                                                
set softtabstop=4                                                               
set backspace=indent,eol,start                                                  
set autochdir                                                                   
set laststatus=2                                                                
set encoding=utf-8                                                              
set nocompatible                                                                
set history=1000                                                                
set autoindent                                                                  
set smartindent                                                                 
set incsearch                                                                   
set scrolloff=5                                                                 
set tw=0                                                                        
set indentexpr=                                                                 
set foldmethod=indent                                                           
set foldlevel=99                                                                
set norelativenumber  
set wrap                                                                        
set showcmd                                                                     
set wildmenu                                                                    
set hlsearch                                                                    
exec "nohlsearch"                                                               
set incsearch                                                                   
set ignorecase                                                                  
set smartcase                                                                   
set iskeyword+=_,$,@,%,#,-                                                      
set report=0                                                                    
set cmdheight=1                                                                 
set noerrorbells                                                                
set novisualbell                                                                
set showmatch                                                                   
                                                                                
                                                                                
map si :set splitright<CR>:vsplit<CR>                                           
map sn :set nosplitright<CR>:vsplit<CR>                                         
map su :set nosplitbelow<CR>:split<CR>                                          
map se :set splitbelow<CR>:split<CR>                                            
                                    
                            map <C-l> $                                                                     
map <C-h> ^                                                                     
map s <nop>                                                                     
map S :w<CR>                                                                    
map Q :q<CR>                                                                    
map R :source $MYVIMRC<CR>                                                      
map ; :                                                                         
                                                                                
                                                                                
map <UP> :res +5<CR>                                                            
map <down> :res -5<CR>                                                          
map <left> :vertical resize -5<CR>                                              
map <right> :vertical resize +5<CR>                                             
                                                                                
                                                                                
autocmd BufNewFile *.cpp,*.[ch],*.sh,*.java exec ":call SetTitle()"       

func SetTitle()                                                                 
    if &filetype == 'sh'                                                                call setline(1,"\######################################################################################")                                               
        call append(line("."),"\#File Name :".expand("%"))                      
        call append(line(".")+1,"\# Author :ConstAde")                          
        call append(line(".")+2,"\# mail : 1309210302@qq.com")                  
        call append(line(".")+3,"\# Created Time :".strftime("%c"))             
        call append(line(".")+4,"\###################################################################################")                                         
        call append(line(".")+5,"\#!/bin/bash")                                 
        call append(line(".")+6,"")                                             
     else                                                                       
        call setline(1,"\######################################################################################")                                               
        call append(line("."),"\#File Name :".expand("%"))                      
        call append(line(".")+1,"\# Author :ConstAde")                          
        call append(line(".")+2,"\# mail : 1309210302@qq.com")                  
        call append(line(".")+3,"\# Created Time :".strftime("%c"))             
        call append(line(".")+4,"\###################################################################################") 
                call append(line(".")+5,"")                                             
    endif                                                                       
                                                                                
       if&filetype == 'c'                                                       
           call append(line(".")+6,"#include <stdio.h>")                        
           call append(line(".")+7,"")                                          
       endif                                                                    
       if&filetype == 'cpp'                                                     
           call append(line(".")+6,"#include <iostream>")                       
           call append(line(".")+7,"using namespace std;")                      
           call append(line(".")+8,"")                                          
       endif                                                                    
       autocmd BufNewFile * normal G                                            
endfunc   

                                                                                
set rtp+=~/.vim/plugged                                                         
                                                                                
call plug#begin('~/.vim/plugged')                                               
                                                                                
"                                                                               
Plug 'https://github.com/ConstAde/tagbar.git'                                   
Plug 'Valloric/YouCompleteMe'                                                   
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }                         
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }                                
" Error checking                                                                
Plug 'w0rp/ale'                                                                 
                                                                                
call plug#end()   

"ale                                                                            
                                                                                
let b:ale_linters = ['pylint']                                                  
let b:ale_fixers = ['autopep8', 'yapf']                                         
                                                                                
        "ctags                                                                         
                                                                                
let g:tagbar_width=30                                                           
let g:tagbar_ctags_bin='/usr/bin/ctags'                                         
let g:tagbar_right=1                                                            
let g:tagbar_autofocus=0                                               
    nmap <F8> :TagbarToggle<CR>              
    
    "YouCompleteMe                                                                  
                                                                                
let g:ycm_confirm_extra_conf = 0                                                
let g:ycm_global_ycm_extra_conf='~/.vim/plugged/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'  
    
    nnoremap gd :YcmCompleter GoToDefinitionElseDeclaration<CR>                     
nnoremap g/ :YcmCompleter GetDoc<CR>                                            
nnoremap gt :YcmCompleter GetType<CR>                                           
nnoremap gr :YcmCompleter GoToReferences<CR>                                    
let g:ycm_seed_identifiers_with_syntax=1                                        
let g:ycm_collect_identifiers_from_comments_and_strings=0                       
let g:ycm_complete_in_comments=1                                                
let g:ycm_complete_in_strings=1                                                 
let g:ycm_collect_identifiers_from_tags_files=1                                 
                                                                                
let g:ycm_autoclose_preview_window_after_completion=0                           
let g:ycm_autoclose_preview_window_after_insertion=1                            
                                                                                
let g:ycm_goto_buffer_command='horizontal-split'                                
let g:ycm_min_num_of_chars_for_completion=2                                     
let g:ycm_semantic_triggers={                                                   
            \'c' : ['->' , '.' , ' re! \w {2}']                                 
            \}
            
                                                     
"NERDTree                                                                      
                                                               
                                                                                
map tt :NERDTreeToggle<CR>                                                      
let NERDTreeMapOpenExpl = ""                                                    
let NERDTreeMapUpdir = ""                                                       
let NERDTreeMapUpdirKeepOpen = "l"                                              
let NERDTreeMapOpenSplit = ""                                                   
let NERDTreeOpenVSplit = ""                                                     
let NERDTreeMapActivateNode = "i"                                               
let NERDTreeMapOpenInTab = "o"                                                  
let NERDTreeMapPreview = ""                                                     
let NERDTreeMapCloseDir = "n"                                                   
let NERDTreeMapChangeRoot = "y"  
