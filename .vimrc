syntax on  "色分け
colorscheme molokai "色指定
set number  "行番号の表示 :set nonumber で非表示
set showmatch  "対応する括弧を強調表示
set cursorline  "カーソル行の背景を変更
set whichwrap=b,s,h,l,<,>,[,]  "行頭行末の左右移動で行をまたぐ
set tabstop=4  "画面上でタブ文字が占める幅
set expandtab  "タブ入力を複数の空白入力に置き換える
set shiftwidth=4  "自動インデントでずれる幅
set softtabstop=4  "連続した空白に対して<tab>や<del>でガーソルが動く幅
set backspace=indent,eol,start "バックスペースの有効化

:command NT NERDTree
:command QR QuickRun

inoremap ( ()<LEFT>
inoremap { {}<LEFT>
inoremap [ []<LEFT>
inoremap ' ''<LEFT>
inoremap " ""<LEFT>


" ファイルタイプ関連を無効化する
" はじめに無効化しておかないと，多重読み込みかなんかでうまくいかなくなるときがあるらしい
filetype off "ファイルタイプの自動検出をしないようになる．有効になっていた検出方法は無効化される
filetype plugin indent off "ファイルタイプ用のインデント設定を自動読み込みしないようになる

"--------------------------------------------------------------------------
" neobundleのプラグイン管理
"--------------------------------------------------------------------------

 " Note: Skip initialization for vim-tiny or vim-small.
 if 0 | endif

 if &compatible
   set nocompatible               " Be iMproved
 endif

 " neobundle.vimを呼び出せるようにする(必要) 必要の代わりに"Required:って書いてあった
 set runtimepath^=~/.vim/bundle/neobundle.vim/

 " neobundle.vimの初期化(必要)
 call neobundle#begin(expand('~/.vim/bundle/'))

 " neobundle.vimが管理するプラグインの登録(必要)
 NeoBundleFetch 'Shougo/neobundle.vim'

 " ファイルをtree表示してくれる
 NeoBundle 'scrooloose/nerdtree' 
 " 単語補完やインクルードパスの補完候補を自動生成しポップアップ表示する
 NeoBundle 'Shougo/neocomplete.vim'
" ソースコードを実行して実行結果をvim内で確認する(quickrun)
 NeoBundle 'thinca/vim-quickrun'
let g:quickrun_config = {'*': {'hook/time/enable': '1'},}

" vimprocのビルド
" quickrunを非同期に行うために必要（quickrun中にvim操作）
 NeoBundle 'Shougo/vimproc', {
    \ 'build' : {
    \     'windows' : 'make -f make_mingw32.mak',
    \     'cygwin' : 'make -f make_cygwin.mak',
    \     'mac' : 'make -f make_mac.mak',
    \     'unix' : 'make -f make_unix.mak',
    \    },
    \ }

" quickrunのoptionを設定
 " 一番下のウインドウに結果を表示
 " 出力がなかった場合に出力バッファを自動的に閉じる(実行時間のオプションがあると意味ないけど）
 " 実行時間を計測し，その結果も最後に出力　
 " "runner"で非同期処理，updatetimeで出力バッファの更新間隔をmsで設定（このオプションがないと非同期処理できなかった）
let g:quickrun_config = {
\   "_" : {
\       "outputter/buffer/split" : ":botright",
\       "outputter/buffer/close_on_empty" : 1,
\       "hook/time/enable" : 1,
\       "runner" : "vimproc",
\       "runner/vimproc/updatetime" : 60
\   },
\}

" quickrunを<C-c> で実行を強制終了させる
" quickrun.vim が実行していない場合には <C-c> を呼び出す
nnoremap <expr><silent> <C-c> quickrun#is_running() ? quickrun#sweep_sessions() : "\<C-c>"

 call neobundle#end()

 "ファイルタイプが変更された時，ファイルタイプ用のプラグインとインデント設定を自動読み込みするようにする
 filetype plugin indent on
 
 " vimを立ち上げるたびにプラグインをチェック
 NeoBundleCheck

"--------------------------------------------------------------------------
" 補完機能の追加（公式:https://github.com/Shougo/neocomplete.vim をコピペ)
"--------------------------------------------------------------------------

"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType *.cpp set omnifunc=ccomplete#Complete

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
