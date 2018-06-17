set nocompatible
filetype off
filetype plugin indent off
if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
  call neobundle#begin(expand('~/.vim/bundle/'))
  NeoBundle 'racer-rust/vim-racer'
  NeoBundle 'rust-lang/rust.vim'
  NeoBundle 'Shougo/vimproc'
  NeoBundle 'Shougo/vimfiler'
  NeoBundle 'Shougo/vimshell'
  NeoBundle 'Shougo/unite.vim'
  NeoBundle 'vim-jp/vimdoc-ja'
  NeoBundle 'Shougo/neocomplcache'
  NeoBundle 'Shougo/neosnippet'
  NeoBundle 'JavaScript-syntax'
  NeoBundle 'pangloss/vim-javascript'
  NeoBundle 'petdance/vim-perl'
  NeoBundle 'thinca/vim-quickrun'
  NeoBundle 'tpope/vim-fugitive'
  NeoBundle 'sudo.vim'
  NeoBundle 'rking/ag.vim'
  NeoBundle 'terryma/vim-multiple-cursors'
  NeoBundle 'myhere/vim-nodejs-complete'
  NeoBundle 'Blackrush/vim-gocode'
  call neobundle#end()
endif

filetype on
filetype indent on
filetype plugin on

"####
"# 表示系
"####
set number "行番号表示
set showmode "モード表示
set title "編集中のファイル名表示
set ruler "ルーラーの表示
set showcmd "入力中のコマンドをステータンスに表示
set showmatch "波括弧入力時の対応する括弧を表示
set laststatus=2 "ステータスラインを常に表示
"set list listchars=trail:_ "行の後ろの空白文字を表示

"####
"# 操作系
"####

"swapfile を作らない
set noswapfile

"Yで行末までyankする。
nnoremap Y y$

" tab移動をLとHで実行する。
nnoremap L gt
nnoremap H gT

" gjをctrl-jにする。
nnoremap <C-j>  gj
nnoremap <C-k>  gk

" ,r で netrwに戻る
map ,r :Rexplore<CR>

" C-qで全部タブをクローズする
map <C-q>  :tabo<CR>

"####
"# マウス操作系
"####
set mouse=a "マウス操作を有効にする。

"####
" プログラミングヘルプ
"####
syntax on "カラー表示
" tab 関連
set expandtab "タブの代わりに空白文字表示
set ts=2 sw=2 sts=0 "タブは半角2文字
set autoindent "オートインデント
set omnifunc=syntaxcomplete#Complete  "オムニ補完あり

" ファイル開いた時に、前回終了時の行で起動
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif

"yankの結果をクリップボードに入れる
set clipboard+=unnamed,autoselect

"backspace効かせる
set backspace=indent,eol,start

"####
" 検索系
"#####
set ignorecase "検索文字列が小文字の場合は大文字小文字を区別なく検索する
set smartcase "検索文字列に大文字が含まれている場合は区別して検索する
set wrapscan "検索時に最後まで行ったら最初に戻る
set noincsearch "検索文字列入力時に順次対象文字列にヒットさせない
set nohlsearch "検索結果文字列の非ハイライト表示

" コメントを改行時に付与しない。
autocmd FileType * setlocal formatoptions-=ro

"####
" neocomplcache_snippet設定
"####
let g:neocomplcache_snippets_dir='~/.vim/snippets'
" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
      \ 'default'    : '',
      \ 'javascript' : '~/.vim/dict/javascript.dict',
      \ 'perl' : '~/.vim/dict/perl.dict'
      \ }
" キーマップ
imap <C-k> <plug>(neocomplcache_snippets_expand)
smap <C-k> <plug>(neocomplcache_snippets_expand)
let g:neocomplcache_enable_at_startup = 1
function InsertTabWrapper()
  if pumvisible()
    return "\<c-n>"
  endif
  let col = col('.') - 1
  if !col || getline('.')[col - 1] !~ '\k\|<\|/'
    return "\<tab>"
  elseif exists('&omnifunc') && &omnifunc == ''
    return "\<c-n>"
  else
    return "\<c-x>\<c-o>"
  endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper()<cr>

" 保管候補のポップアップの色設定
hi Pmenu cterm=NONE ctermfg=white ctermbg=blue
hi PmenuSbar cterm=NONE ctermbg=white ctermfg=white
hi PmenuSel cterm=NONE ctermfg=blue ctermbg=white

" Vimで存在しないフォルダを指定してファイル保存した時に自動で作成する。
augroup vimrc-auto-mkdir  " {{{
  autocmd!
  autocmd BufWritePre * call s:auto_mkdir(expand('<afile>:p:h'), v:cmdbang)
  function! s:auto_mkdir(dir, force)  " {{{
    if !isdirectory(a:dir) && (a:force ||
          \    input(printf('"%s" does not exist. Create? [y/N]', a:dir)) =~? '^y\%[es]$')
      call mkdir(iconv(a:dir, &encoding, &termencoding), 'p')
    endif
  endfunction  " }}}
augroup END  " }}}

" カレントディレクトリにプロジェクト管理ファイルがあったら読み込む
if getcwd() != $HOME
  if filereadable(getcwd(). '/.vimprojects')
    Project .vimprojects
  endif
endif

" 挿入モードとノーマルモードでステータスラインの色変更
au InsertEnter * hi StatusLine guifg=DarkBlue guibg=DarkYellow gui=none ctermfg=Blue ctermbg=Yellow cterm=none
au InsertLeave * hi StatusLine guifg=DarkBlue guibg=DarkGray gui=none ctermfg=Blue ctermbg=DarkGray cterm=none

" Quickrun設定
nmap <Leader>r <plug>(quickrun)

" VimFilerのセーフモードをオフにする。
let g:vimfiler_safe_mode_by_default = 0

" vimgrepで検索した後、QuickFixウインドウを自動で開く
augroup grepopen
  autocmd QuickfixCmdPost vimgrep cw
augroup END

" Node vim 補完を使う
autocmd FileType javascript setlocal omnifunc=nodejscomplete#CompleteJS
if !exists('g:neocomplcache_omni_functions')
  let g:neocomplcache_omni_functions = {}
endif
let g:neocomplcache_omni_functions.javascript = 'nodejscomplete#CompleteJS'

let g:node_usejscomplete = 1

" Golang 設定
set rtp+=$GOROOT/misc/vim
"golint
exe "set rtp+=" . globpath($GOPATH, "src/github.com/golang/lint/misc/vim")
set completeopt=menu,preview
autocmd BufWritePost,FileWritePost *.go execute 'Lint' | cwindow
