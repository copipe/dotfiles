syntax on  "色分け
colorscheme molokai "色指定
set number  "行番号の表示 :set nonumber で非表示
set title
set showmatch  "対応する括弧を強調表示
set cursorcolumn "カーソル列の背景を変更"
set cursorline  "カーソル行の背景を変更
set whichwrap=b,s,h,l,<,>,[,]  "行頭行末の左右移動で行をまたぐ
set tabstop=4  "画面上でタブ文字が占める幅
set expandtab  "タブ入力を複数の空白入力に置き換える
set shiftwidth=4  "自動インデントでずれる幅
set softtabstop=4  "連続した空白に対して<tab>や<del>でガーソルが動く幅
set backspace=indent,eol,start "バックスペースの有効化


inoremap ( ()<LEFT>
inoremap { {}<LEFT>
inoremap [ []<LEFT>
inoremap ' ''<LEFT>
inoremap " ""<LEFT>
inoremap $ $$<LEFT>


nnoremap <silent> ss :<C-u>sp<CR>
nnoremap <silent> sv :<C-u>vs<CR>
nnoremap <silent> sq :<C-u>q<CR>

nnoremap <silent> sj <C-w>j
nnoremap <silent> sk <C-w>k
nnoremap <silent> sl <C-w>l
nnoremap <silent> sh <C-w>h

nnoremap <silent> sJ <C-w>J
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
"  plugin の設定
" ---------------------

call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'Shougo/neocomplete'
"Plug 'jalvesaq/Nvim-R'
"Plug 'Shougo/deoplete.nvim'

call plug#end()

call plug#begin('~/.config/nvim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'Shougo/neocomplete'
Plug 'jalvesaq/Nvim-R'
Plug 'Shougo/deoplete.nvim'

call plug#end()


" ---------------------
"  nerdtree の設定
" ---------------------

" Ctrl+eでNERDTREEを開く
nnoremap <silent><C-n> :NERDTreeTabsToggle<CR>
" 隠しファイルを表示する
let NERDTreeShowHidden = 1


" ---------------------
"  neocomplete の設定
" ---------------------

"Note: This option must be set in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3

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
