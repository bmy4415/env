set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/nerdcommenter'
Plugin 'pangloss/vim-javascript'
Plugin 'airblade/vim-gitgutter'
Plugin 'kchmck/vim-coffee-script'
Plugin 'bling/vim-airline'


call vundle#end()            " required
filetype plugin indent on    " required


" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" nerdtree 
nmap <F1> :NERDTreeToggle<CR>

" tagbar
nmap <F2> :TagbarToggle<CR>

" tagbar - coffee script
let g:tagbar_type_coffee = {
    \ 'ctagstype' : 'coffee',
    \ 'kinds'     : [
        \ 'c:classes',
        \ 'm:methods',
        \ 'f:functions',
        \ 'v:variables',
        \ 'f:fields',
    \ ]
\ }

" nerdcommenter
let mapleader=","
let g:NERDSpaceDelims = 1 " Add spaces after comment delimiters by default
let g:NERDCompactSexyComs = 1 " Use compact syntax for prettified multi-line comments
let g:NERDDefaultAlign = 'left' " Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDAltDelims_java = 1 " Set a language to use its alternate delimiters by default
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } } " Add your own custom formats or override the defaults
let g:NERDCommentEmptyLines = 1 " Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDTrimTrailingWhitespace = 1 " Enable trimming of trailing whitespace when uncommenting

" gitgutter
set updatetime=100

" vim-coffee-script
autocmd BufNewFile,BufReadPost *.coffee setl shiftwidth=2 tabstop=2 expandtab



" 구문 강조 사용
if has("syntax")
 syntax on
endif


" 마지막으로 수정된 곳에 커서를 위치함
au BufReadPost *
\ if line("'\"") > 0 && line("'\"") <= line("$") |
\ exe "norm g`\"" |
\ endif

set hlsearch " 검색어 하이라이팅
set nu " 줄번호
set autoindent " 자동 들여쓰기
set ts=4 "tag select
set sts=4 "st select
set sw=1 " 스크롤바 너비
" set wildmode=list,longest,full // vim-airline때문에 지움
" set wildmenu " wildmode 색칠 highlight // vim-airline때문에 지움
set cindent " C언어 자동 들여쓰기
set bs=eol,start,indent " backspace 사용
set history=256 " viminfo에 쌓이는 histroy갯수 
set laststatus=2 " 상태바 표시 항상
set statusline=\ %<%l:%v\ [%P]%=%a\ %h%m%r\ %F\ " 상태바 내용
set paste " 붙여넣기 계단현상 없애기
set shiftwidth=4 " 자동 들여쓰기 너비 설정
set showmatch " 일치하는 괄호 하이라이팅
set smartcase " 검색시 대소문자 구별
set smartindent
set tabstop=4
set ruler " 현재 커서 위치 표시
set incsearch
" ?? set clipboard=unnamed
set cursorline
"set nowrap " 자동 줄바꿈 하지 않음
set noeb vb t_vb= " 잘못 눌렀을 때 소리도안나고 빛도 안나게

colorscheme molokai

