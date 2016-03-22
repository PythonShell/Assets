" Support for Bundle Plugin
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" Enable Vundle
Plugin 'VundleVim/Vundle.vim'
" Enable Rust programming language highlight
Plugin 'racer-rust/vim-racer'
Plugin 'rust-lang/rust.vim'

call vundle#end()
filetype plugin indent on

syntax on
set number
set cursorline
set tabstop=4 shiftwidth=4 expandtab
filetype indent on
" highlight 80th column
set colorcolumn=80

