" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2019 Jan 26
"
" To use it, copy it to
"   for Unix and OS/2:  ~/.vimrc
"   for Amiga:  s:.vimrc
"   for MS-DOS and Win32:  $VIM\_vimrc
"   for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings, bail
" out.
if v:progname =~? "evim"
  finish
endif

" Get the defaults that most users want.
source $VIMRUNTIME/defaults.vim

if has("vms")
  set nobackup      " do not keep a backup file, use versions instead
else
  set backup        " keep a backup file (restore to previous version)
  if has('persistent_undo')
    set undodir=~/.vim/undo
    set undofile    " keep an undo file (undo changes after closing)
  endif
endif

if &t_Co > 2 || has("gui_running")
  " Switch on highlighting the last used search pattern.
  set hlsearch
endif

" Put these in an autocmd group, so that we can delete them easily.
augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78
augroup END

" Add optional packages.
"
" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
" The ! means the package won't be loaded right away but when plugins are
" loaded during initialization.
if has('syntax') && has('eval')
  packadd! matchit
endif

" ADD tanykazy
" 行番号表示
set number

" メッセージ表示2行
set cmdheight=2

" ステータス行表示
set laststatus=2

" 未実行のコマンド表示
set showcmd

" インデント幅
set shiftwidth=4

" タブ
set tabstop=4
" set expandtab
set smarttab
set softtabstop=4

" 対応する括弧の強調
set showmatch

" yでコピーしたらクリップボードに入れる
set guioptions+=a

" インデント
set autoindent
set smartindent

" タイトル表示
set title

" シンタックスハイライト
syntax enable

" for ctags
set tags+=./.tags;.tags;

" タブ表示関連
set list
set listchars=tab:»-,trail:-,eol:$,extends:»,precedes:«,nbsp:%

" 挿入モードを抜けると IM がオフ
" 再度挿入モードに入ると IM 復元
set iminsert=0
set imsearch=-1

function ImActivateFunc(active)
    if a:active
	echo 'active'
    else
	echo 'not active'
    endif
    " 戻り値は使われない
endfunction
set imactivatefunc=ImActivateFunc

set imactivatekey=C-space

