" 色設定
syntax on  "色分け
autocmd ColorScheme * highlight Visual ctermbg=243
colorscheme molokai "カラースキーム

" 基本設定
set number  "行番号の表示 :set nonumber で非表示
set ruler "右下に行・列の番号を表示"
set title
set showmatch  "対応する括弧を強調表示
set cursorcolumn "カーソル列の背景を変更"
set cursorline  "カーソル行の背景を変更
set whichwrap=b,s,h,l,<,>,[,]  "行頭行末の左右移動で行をまたぐ
set backspace=indent,eol,start "バックスペースの有効化
set noswapfile " ファイル編集中にスワップファイルを作らない
set ambiwidth=double " □や○文字が崩れる問題を解決 "
set mouse=a "マウス操作オン
set clipboard=unnamed,autoselect "クリップボードにコピー
set wildmenu " コマンドモードの補完 "
set laststatus=2

" クリップボードからコピする際に自動でset paste
if &term =~ "xterm"
    let &t_ti .= "\e[?2004h"
    let &t_te .= "\e[?2004l"
    let &pastetoggle = "\e[201~"

    function XTermPasteBegin(ret)
        set paste
        return a:ret
    endfunction

    noremap <special> <expr> <Esc>[200~ XTermPasteBegin("0i")
    inoremap <special> <expr> <Esc>[200~ XTermPasteBegin("")
    cnoremap <special> <Esc>[200~ <nop>
    cnoremap <special> <Esc>[201~ <nop>
endif

" 検索
set incsearch " インクリメンタルサーチ. １文字入力毎に検索を行う
set ignorecase " 検索パターンに大文字小文字を区別しない
set smartcase " 検索パターンに大文字を含んでいたら大文字小文字を区別する
set hlsearch " 検索結果をハイライト
" ESCキー2度押しでハイライトの切り替え
nnoremap <silent><Esc><Esc> :<C-u>set nohlsearch!<CR>

" インデント
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab
set autoindent
