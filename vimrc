" Vimscript file settings ------------------------------------------------ {{{
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}

" Support for Bundle Plugin ---------------------------------------------- {{{
" Do this before using Vundle:
" $ mkdir -p ~/.vim/bundle && git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" Enable Vundle
Plugin 'VundleVim/Vundle.vim'
" Enable Rust programming language highlight
Plugin 'racer-rust/vim-racer'
Plugin 'rust-lang/rust.vim'
" Solarized Color Theme
Plugin 'altercation/vim-colors-solarized'
" Vim markdown support
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'

call vundle#end()
" }}}
filetype plugin indent on

syntax on
set number
set cursorline
set tabstop=4 shiftwidth=4 expandtab
filetype indent on
" Highlight 80th column
set colorcolumn=80
" Use solarized dark theme
set background=dark
colorscheme solarized
set hlsearch incsearch

" Set encodings ---------------------------------------------------------- {{{
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936,chinese,latin-1
set fileencoding=gb2312
if has("win32")
    set fileencoding=chinese
    set guifont=Consolas:h12
else
    set fileencoding=utf-8
endif
set termencoding=utf-8
" }}}

" 解决菜单乱码
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
" 解决 console 输出乱码
language message zh_CN.utf-8

" For SQC File
"nnoremap <leader>j o * ------------------------------------------------------------------------------<cr> * 修改日期：xxxx-xx-xx<cr> * 修改人员：ckx<cr> * 修改描述：<cr> * 版本信息：<ver><cr> * 专 题 包：<esc>

"" My test script -------------------------------------------------- {{{
" Set leader and localleader
let mapleader = "-"
let maplocalleader = "\\"

" Delete current line
nnoremap <leader>d dd
" Move current line above
nnoremap <leader>_ yykPjjdd
" Make current line upper case
nnoremap <leader>u VU
" Quickly edit vimrc
nnoremap <leader>ev :sp $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
" Quote current word
nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel
nnoremap <leader>' viw<esc>a'<esc>bi'<esc>lel
" Quote the selected word
vnoremap <leader>" <esc>`<i"<esc>`>a"<esc>
vnoremap <leader>' <esc>`<i'<esc>`>a'<esc>
" Highlight tab or trailing whitespace as error
highlight BadSpaces ctermbg=red guibg=red
nnoremap <leader>w :match BadSpaces /\v\s+$\|\t/<cr>
nnoremap <leader>W :match none<cr>

" Common typos
iabbrev adn and


" Comment out the current line for different file type
" Use <localleader>c for these comment cmd
augroup testgroup
    autocmd!
    autocmd FileType javascript nnoremap <buffer> <localleader>c I//<esc>
    autocmd FileType python     nnoremap <buffer> <localleader>c I#<esc>
    autocmd FileType sqc        nnoremap <buffer> <localleader>c I/*<esc>A*/<esc>
augroup END

" print foo(bar)

" }}}

" Method to format xml
" -------------------------------------------
" :%s/></>\r</g
" :0
" =:$
" -------------------------------------------
