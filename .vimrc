runtime bundle/pathogen/autoload/pathogen.vim
execute pathogen#infect()

set encoding=utf-8                                    "设置gvim内部编码  
set fileencoding=utf-8                                "设置当前文件编码 
set fileencodings=ucs-bom,utf-8,gbk,cp936,latin-1,gb2312     "设置支持打开的文件的编码 

set ts=4
set expandtab
set cindent
set shiftwidth=4

filetype on
filetype plugin on

set columns=120
"set foldmethod=indent
set foldmethod=syntax
set nofoldenable
set cindent
set wildmenu
set nowrap
set number
"set tags=/home/linux/linux/tags
set laststatus=2
set ruler
"set cursorline
"set cursorcolumn
set hlsearch
set guioptions-=m
set guioptions-=T
set background=dark
syntax enable
colorscheme molokai
"colorscheme solarized

nmap <Leader>tn :tnext<CR>
nmap <Leader>tp :tprevious<CR>

"without name
"nmap <buffer> <silent> <leader> ,PN 
"nmap <buffer> <silent> <leader> ,PP

nmap <Leader>ch :A<CR>
nmap <Leader>sch :AS<CR>
"let g:indexer_ctagsCommandLineOptions="--c++-kinds=+p+l+x+c+d+e+f+g+m+n+s+t+u+v --fields=+iaSl --extra=+q"

let tagbar_left=1
nnoremap <Leader>tl :TagbarToggle<CR>
let tagbar_width=32
let g:tagbar_compact=1 
let g:tagbar_type_cpp = {
\ 'kinds' : [
\ 'd:macros:1', 'g:enums', 't:typedefs:0:0', 'e:enumerators:0:0',
\'n:namespaces',
\ 'c:classes', 's:structs', 'u:unions', 'f:functions', 'm:members:0:0',
\ 'v:global:0:0', 'x:external:0:0', 'l:local:0:0' ],
\ 'sro'    : '::',
\ 'kind2scope' : { 'g' : 'enum', 'n' : 'namespace', 'c' : 'class',
\ 's' : 'struct', 'u' : 'union' },
\ 'scope2kind' : { 'enum'      : 'g', 'namespace' : 'n',
\ 'class'     : 'c', 'struct'    : 's', 'union'     : 'u' }
\ }

nmap <Leader>fl :NERDTreeToggle<CR>
let NERDTreewinsize=32
let NERDTreeWinPos="right"
let NERDTreeShowHidden=1
let NERDTreeMinimalUI=1
let NERDTreeAutoDeleteBuffer=1

set guifont=Courier\ 11 "字体

set autochdir

let g:protodefprotogetter='~/.vim/bundle/protodef/pullproto.pl'
let g:disable_protodef_sorting=1

source $VIMRUNTIME/ftplugin/man.vim
nmap <Leader>man :Man 3 <cword><CR>
nmap <Leader>m :wa<CR>:make<CR><CR>:cw<CR>
nnoremap <Leader>sp :Grep -ir<CR><CR><CR>
nnoremap <Leader>sb :GrepBuffer -ir<CR><CR><CR>


highlight Pmenu ctermfg=2 ctermbg=3 guifg=#005f87 guibg=#EEE8D5
highlight PmenuSel ctermfg=2 ctermbg=3 guifg=#AFD700 guibg=#106900
let g:ycm_complete_in_comments=1
let g:ycm_confirm_extra_conf=0
let g:ycm_collect_identifiers_form_tags_files=1
set tags+=/data/misc/software/misc./vim/stdcpp.tags
inoremap <leader>; <C-x><C-o>
set completeopt-=preview
let g:ycm_min_num_of_chars_for_completion=1
let g:ycm_cache_omnifunc=0
let g:ycm_seed_identifiers_with_syntax=1
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_collect_identifiers_from_tag_files = 1



let g:UltiSnipsExpandTrigger="<leader><tab>"
let g:UltiSnipsJumpForwardTrigger="<leader><tab>"
let g:UltiSnipsJumpBackwardTrigger="<leader><s-tab>"


"Toggle Menu and Toolbar
set guioptions-=m
set guioptions-=T
map <silent> <F3> :if &guioptions =~# 'T' <Bar>
        \set guioptions-=T <Bar>
        \set guioptions-=m <bar>
    \else <Bar>
        \set guioptions+=T <Bar>
        \set guioptions+=m <Bar>
    \endif<CR>


function! AutoLoadCTagsAndCScope()
    let max = 8
    let dir = './'
    let i = 0
    let break = 0
    while isdirectory(dir) && i < max
        if filereadable(dir . 'cscope.out') 
            execute 'cs add ' . dir . 'cscope.out'
            let break = 1
        endif
        if filereadable(dir . 'tags')
            execute 'set tags =' . dir . 'tags'
            let break = 1
        endif
        if break == 1
            execute 'lcd ' . dir
            break
        endif
        let dir = dir . '../'
        let i = i + 1
    endwhile
endf
nmap <F7> :call AutoLoadCTagsAndCScope()<CR>
