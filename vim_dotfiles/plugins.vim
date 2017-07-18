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


" Vim起動完了時にインストール
augroup PluginInstall
  autocmd!
  autocmd VimEnter * if dein#check_install() | call dein#install() | endif
augroup END


" インストールするプラグイン
if dein#load_state(s:plugin_dir)
  call dein#begin(s:plugin_dir)

  call dein#add('Shougo/dein.vim')
  call dein#add('Shougo/unite.vim')
  call dein#add('Shougo/vimshell.vim')
  call dein#add('Shougo/vimfiler', {'lazy' : 1})
  call dein#add('Shougo/vimproc.vim') " make -f make_mac.makでビルドする必要あり
	call dein#add('Shougo/neocomplete.vim', {'if' : has('lua')})
  call dein#add('davidhalter/jedi-vim')
  call dein#add('itchyny/lightline.vim')
  call dein#add('tell-k/vim-autopep8')
  call dein#add('Townk/vim-autoclose')

  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
