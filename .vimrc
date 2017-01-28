syntax on  "色分け
colorscheme molokai "色指定
set number  "行番号の表示 :set nonumber で非表示
set title
set showmatch  "対応する括弧を強調表示
set cursorcolumn "カーソル列の背景を変更"
set cursorline  "カーソル行の背景を変更
set whichwrap=b,s,h,l,<,>,[,]  "行頭行末の左右移動で行をまたぐ
set backspace=indent,eol,start "バックスペースの有効化

" インデント
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab


inoremap ( ()<LEFT>
inoremap { {}<LEFT>
inoremap [ []<LEFT>
inoremap ' ''<LEFT>
inoremap " ""<LEFT>

nnoremap <silent> ss :<C-u>sp<CR>
nnoremap <silent> sv :<C-u>vs<CR>
nnoremap <silent> sq :<C-u>q<CR>

nnoremap <silent> sj <C-w>j
nnoremap <silent> sk <C-w>k
nnoremap <silent> sl <C-w>l
nnoremap <silent> sh <C-w>h

noremap <silent> sJ <C-w>J
nnoremap <silent> sK <C-w>K
nnoremap <silent> sL <C-w>L
nnoremap <silent> sH <C-w>H

nnoremap <silent> sn gt
nnoremap <silent> sp gT

nnoremap <silent> s= <C-w>=
nnoremap <silent> s> <C-w>><C-w>><C-w>><C-w>><C-w>><C-w>>
nnoremap <silent> s< <C-w><<C-w><<C-w><<C-w><<C-w><<C-w><
nnoremap <silent> s+ <C-w>+<C-w>+<C-w>+<C-w>+<C-w>+<C-w>+
nnoremap <silent> s- <C-w>-<C-w>-<C-w>-<C-w>-<C-w>-<C-w>-


" ---------------------
"  プラグインの設定(deinのコピペ)
" /Users/TakayukiYagi/.vim/dein/repos/github.com/Shougo/vimproc.vimでmakeする必要あるかも
" ---------------------


set nocompatible

" Vim起動完了時にインストール
augroup PluginInstall
  autocmd!
  autocmd VimEnter * if dein#check_install() | call dein#install() | endif
augroup END

" 各プラグインをインストールするディレクトリ
let s:plugin_dir = expand('~/.vim/dein/')
" dein.vimをインストールするディレクトリをランタイムパスへ追加
let s:dein_dir = s:plugin_dir . 'repos/github.com/Shougo/dein.vim'
execute 'set runtimepath+=' . s:dein_dir

" dein.vimがまだ入ってなければ 最初に`git clone`
if !isdirectory(s:dein_dir)
  call mkdir(s:dein_dir, 'p')
  silent execute printf('!git clone %s %s', 'https://github.com/Shougo/dein.vim', s:dein_dir)
endif

if dein#load_state(s:plugin_dir)
  call dein#begin(s:plugin_dir)

  " ここからインストールするプラグインを書いていく
  call dein#add('Shougo/dein.vim')
  call dein#add('Shougo/vimshell.vim')

  " python補完
  call dein#add('davidhalter/jedi-vim')
  " デバック用
  call dein#add('andviro/flake8-vim')

  call dein#add('thinca/vim-quickrun')

  " インストール後ビルドする場合
  call dein#add('Shougo/vimproc.vim', {
        \ 'build': {
        \     'mac': 'make -f make_mac.mak',
        \     'linux': 'make',
        \     'unix': 'gmake',
        \    },
        \ })

  " 条件によって使ったり使わなかったり制御する場合
  call dein#add('Shougo/neocomplete.vim', {
        \ 'if' : has('lua')
        \ })

  " 依存関係がある場合
  call dein#add('Shougo/unite.vim')
  call dein#add('ujihisa/unite-colorscheme', {'depends' : 'Shougo/unite.vim'})

  " 手動でcall dein#source('プラグイン名')して使い始める場合
  call dein#add('Shougo/vimfiler', {'lazy' : 1})

  " 指定のファイルタイプ使う場合
  call dein#add('tpope/vim-rails', {'on_ft' : 'ruby'})

  " dein.vimで管理して更新だけするリポジトリ（NeoBundleFetchとおなじ）
  call dein#add('jszakmeister/markdown2ctags', {'rtp': ''})

  " サブディレクトリを指定してdein#add()する場合
  " frozenオプションは自動で更新しない
  " 自分で開発するプラグインの管理に便利
  call dein#local('~/src/github.com/violetyk',
        \ {
        \   'frozen' : 1,
        \   'depends' : [
        \     'kana/vim-gf-user',
        \     'Shougo/neosnippet.vim',
        \     'vim-jp/vital.vim'
        \   ]
        \ },
        \ [
        \   '*.vim',
        \   'neosnippet-*',
        \   'neocomplete-*',
        \   'scratch-utility'
        \ ])
  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on

" ---------------------
"  vimfilerの設定
" ---------------------

" Ctrl+nでVimFilerを開く
nnoremap <silent><C-n> :VimFiler<CR>
nnoremap <silent><C-r> :QuickRun<CR>
