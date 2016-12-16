" Support for Bundle Plugin
" Do this before using Vundle:
" $ git clone https://github.com/VundleVim/Vundle.vim.git
"   ~/.vim/bundle/Vundle.vim
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
" vim markdown support
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'

call vundle#end()
filetype plugin indent on

syntax on
set number
set cursorline
set tabstop=4 shiftwidth=4 expandtab
filetype indent on
" highlight 80th column
set colorcolumn=80
" use solarized dark theme
set background=dark
colorscheme solarized
