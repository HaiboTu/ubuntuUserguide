
"vim config for the ubuntu user
"auathor Haibo Tu

" <--- base config"
set tabstop=4
set smartindent
set shiftwidth=4
set softtabstop=4
set expandtab
set textwidth=79
set hlsearch
set number
set cindent

" <--- add support for 中文
set fencs=utf-8,GB18030,ucs-bom,default,latin1

let python_highlight_all=1
syntax on

imap <C-k> <Esc>
vmap <C-k> <Esc>
"nnoremap <C-\> %x<C-O>x

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Create the highlight group"
highlight TrailSpace guibg=red ctermbg=darkred

" Show the space located on the end of line"
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h,*.cpp,*.cxx,*.sh match TrailSpace /\s\+$/
" base config --->"

" Enable folding
set foldmethod=indent
set foldlevel=99

" <--- cscope key map config"
nmap <C-y>s :cs find s <C-R>=expand("<cword>") <CR><CR>
nmap <C-y>g :cs find g <C-R>=expand("<cword>") <CR><CR>
nmap <C-y>c :cs find c <C-R>=expand("<cword>") <CR><CR>
nmap <C-y>f :cs find f <C-R>=expand("<cword>") <CR><CR>
" cscope key map config --->"

" <--- ctags key map config"
nmap <C-]> :ts <C-R>=expand("<cword>") <CR><CR>

" <--- cscope and ctags config"
"path is the code didrectory
"
set nocsverb
cscope add ~/.vim/tags/cscope.out ~/.vim/tags
set csverb

set tags=~/.vim/tags/tags
" cscope and ctags config --->"

" <--- ctags key map config"
nmap <C-]> :ts <C-R>=expand("<cword>") <CR><CR>

" <--- Auto pair complete begin"
"function! ClosePair(char)
"    if getline('.')[col('.') - 1] == a:char
"        return "\<Right>"
"    else
"        return a:char
"    endif
"endfunction
"
":inoremap ( ()<ESC>i
":inoremap ) <c-r>=ClosePair(')')<CR>
":inoremap { {<CR>}<ESC>O
":inoremap } <c-r>=ClosePair('}')<CR>
":inoremap [ []<ESC>i
":inoremap ] <c-r>=ClosePair(']')<CR>
":inoremap " ""<ESC>i
":inoremap ' ''<ESC>i
" Auto pair complete begin --->"

" <--- Plug Vundle config begin "
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" The nerdtree plug"
Plugin 'https://github.com/scrooloose/nerdtree.git'

" The tagbar plug"
Plugin 'https://github.com/majutsushi/tagbar.git'

" The ailine plug"
Plugin 'bling/vim-airline'

" The autopair plug for {
" ["''"]
" }
"
Plugin 'https://github.com/jiangmiao/auto-pairs.git'

"autoformat
Plugin 'Chiel92/vim-autoformat'

" The vim-gocode  plug"
"Plugin 'https://github.com/Blackrush/vim-gocode'

" The vim-go plug"
"Plugin 'https://github.com/fatih/vim-go'

" The godef plug""
Plugin 'https://github.com/dgryski/vim-godef'

" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local
" cache
" :PluginClean      - confirms removal of unused plugins; append `!` to
" "auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
" Plug Vundle config end --->"

" auto open the NERDTree plugin"
autocmd vimenter * NERDTree
" Set the nerdtree size "
let NERDTreeWinSize=15
let g:DTreeMinimalUI=1

" auto open the tagbar plugin"
let g:tagbar_compact = 1
let g:tagbar_vertical = 30
autocmd VimEnter * TagbarToggle

" auto set the default cursor position on the editing file"
" wincmd w
autocmd VimEnter * wincmd l

" auto format the code while you save the file
" au BufWrite * :Autoformat

" insert time on insert mode
iab xt <c-r>=strftime("%y-%m-%d")<cr>

nmap gl 080l

let g:go_version_warning = 0

" disable godef split feature
let g:godef_split = 0
