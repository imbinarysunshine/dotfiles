set nocompatible
filetype off
map <Space> <Leader>
set splitbelow
set splitright
 
call plug#begin()
 
" Load plugins
" VIM enhancements
 
" GUI enhancements
Plug 'machakann/vim-highlightedyank'
Plug 'chriskempson/base16-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'kyoz/purify', { 'rtp': 'vim' }
"
"Syntax
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'rust-lang/rust.vim'
Plug 'cespare/vim-toml'

" Color hex values
Plug 'gko/vim-coloresque'

 
call plug#end()

" Tab Config
set softtabstop=4 " Use 4 spaces when pressing tab.
set shiftwidth=4 " Shift indentation by 4 spaces.
set expandtab " Use spaces instead of tab-characters.
set smarttab " Insert tabs on the start of the line according to shiftwidth.

" Color Config

set termguicolors
set background=dark
syntax on
 
" Undo Config
set undodir=~/.vimdid
set undofile
 
set copyindent " Copy the previous indentation on auto indentation
set shiftround " Use multiple of shiftwidth when indenting with < and >
set showmatch " Show matching parenthesis
set nofoldenable " No folding

set relativenumber " Relative line numbering
set number " Now we have hybrid numbering!
set hidden " Hide buffers instead of closing them
set hlsearch " Highlight search terms
set incsearch " Show mathces as you type
set gdefault " g flag on by default when searching
set fileformats=unix,dos,mac

set scrolloff=5 " Always have 5 lines above and below the cursor
set visualbell " Visual bell instead of beeping
set noerrorbells " Don't ring the error bells
set title


set noswapfile

set nowrap " Don't wrap
filetype plugin indent on
set number
set autoindent
set timeoutlen=300 " http://stackoverflow.com/questions/2158516/delay-before-o-opens-a-new-line
set encoding=utf-8
set scrolloff=2
set ttyfast
" Show those damn hidden characters
" Verbose: set listchars=nbsp:¬,eol:¶,extends:»,precedes:«,trail:•
set nolist
set listchars=nbsp:¬,extends:»,precedes:«,trail:•
 
" Remaps
" Ctrl+c and Ctrl+j as Esc
nnoremap <Leader>w :w!<CR>
nnoremap <Leader>q :q<CR>
nnoremap <leader><leader> <c-^>
inoremap jk <Esc>
vnoremap jk <Esc>
nnoremap jk <Esc>
snoremap jk <Esc>
xnoremap jk <Esc>
cnoremap jk <Esc>
onoremap jk <Esc>
lnoremap jk <Esc>
tnoremap jk <Esc>
nnoremap ; :

" Jump to start and end of lines using the home row keys
map H ^
map L $


" Airline Config
let g:airline_theme='purify'
let g:airline_powerline_fonts = 1
let g:airline#extensions#whitespace#checks = []
let g:airline_section_y = airline#section#create_right(['%{printf("%s%s",&fenc,&ff!="unix"?":".&ff:"")}'])
let g:airline_section_z = airline#section#create_right(['%3l:%2c'])
let g:airline#extensions#ctrlp#color_template = 'replace'
let g:airline#extensions#tabline#enabled = 1

" 'Smart' nevigation

" Use tab for trigger completion with characters ahead and navigate.

" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by

" other plugin before putting this into your config.

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <c-space> coc#refresh()

" GoTo code navigation.

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.

nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction




" =============================================================================
" # Autocommands
" =============================================================================
" Leave paste mode when leaving insert mode
autocmd InsertLeave * set nopaste

" Jump to last edit position on opening file
if has("autocmd")
  " https://stackoverflow.com/questions/31449496/vim-ignore-specifc-file-in-autocommand
  au BufReadPost * if expand('%:p') !~# '\m/\.git/' && line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

colorscheme purify
