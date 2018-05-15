call plug#begin('~/.local/share/nvim/plugged')
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'scrooloose/syntastic'
Plug 'zchee/deoplete-jedi'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'pangloss/vim-javascript' " javascript
Plug 'tomasr/molokai'
call plug#end()



" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" deoplete
let g:deoplete#enable_at_startup = 1


" jedi, remove preview
let g:jedi#auto_vim_configuration = 0
set completeopt-=preview


" set formatoptions-=cro // prevent comment keeping next line



" vim-airline
set statusline+=%#warningmsg#
set statusline+=%*


" vim-alrline-themes
let g:airline_theme='hybrid'


" nerdtree 
nmap <F1> :NERDTreeToggle<CR> 
let NERDTreeMapOpenInTab='<ENTER>' " nerdtree에서 enter치면 tab new


" tagbar
" nmap <F2> :TagbarToggle<CR>


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
" autocmd BufNewFile,BufReadPost *.coffee setl shiftwidth=2 tabstop=2 expandtab



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
" set wildmode=list,longest,full
set wildmenu " vim command tab completion show
set cindent " C언어 자동 들여쓰기
set bs=eol,start,indent " backspace 사용
set history=256 " viminfo에 쌓이는 histroy갯수 
set laststatus=2 " 상태바 표시 항상
" set statusline=\ %<%l:%v\ [%P]%=%a\ %h%m%r\ %F\ " 상태바 내용

" set paste " 붙여넣기 계단현상 없애기
set shiftwidth=4 " 자동 들여쓰기 너비 설정
set showmatch " 일치하는 괄호 하이라이팅
set smartcase " 검색시 대소문자 구별
set smartindent
" 모든 tab을 4로
set tabstop=4
set softtabstop=4
set shiftwidth=4
set ruler " 현재 커서 위치 표시
set incsearch
" ?? set clipboard=unnamed
set cursorline " molokaiㅇ서 line 보이게
"set nowrap " 자동 줄바꿈 하지 않음
set noeb vb t_vb= " 잘못 눌렀을 때 소리도안나고 빛도 안나게


" set mouse=r " enable copy with ctrl-c



colorscheme molokai
