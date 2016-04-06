syntax on  "色分け
set t_Co=256  "色の種類を256色へ

set number  "行番号の表示 :set nonumber で非表示
set showmatch  "対応する括弧を強調表示
set cursorline  "カーソル行の背景を変更
set whichwrap=b,s,h,l,<,>,[,]  "行頭行末の左右移動で行をまたぐ
set tabstop=4  "画面上でタブ文字が占める幅
set expandtab  "タブ入力を複数の空白入力に置き換える
set shiftwidth=4  "自動インデントでずれる幅
set softtabstop=4  "連続した空白に対して<tab>や<del>でガーソルが動く幅

augroup vimrc
autocmd FileType python setl smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
autocmd FileType html setl shiftwidth=2 tabstop=2 softtabstop=2
augroup END

inoremap ( ()<LEFT>
inoremap { {}<LEFT>
inoremap [ []<LEFT>
inoremap ' ''<LEFT>
inoremap " ""<LEFT>

