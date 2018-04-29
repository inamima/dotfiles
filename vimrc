call plug#begin('~/.vim/plugged')
Plug 'Shougo/vimproc', { 'do': 'make' }
Plug 'Shougo/neocomplete.vim'
Plug 'Shougo/unite.vim'
Plug 'h1mesuke/unite-outline'
Plug 'Shougo/vimshell'
Plug 'Shougo/vimfiler'
Plug 'tpope/vim-surround'
Plug 'tomtom/tcomment_vim'
Plug 'scrooloose/syntastic'
Plug 'altercation/vim-colors-solarized'
Plug 'vim-jp/vimdoc-ja'
Plug 'thinca/vim-quickrun'
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-indent'
Plug 'h1mesuke/textobj-wiw'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'thinca/vim-submode'
"Plug 'davidhalter/jedi-vim'
Plug 'itchyny/lightline.vim'
Plug 'rhysd/clever-f.vim'
Plug 'hrsh7th/vim-versions'
Plug 'tsukkee/unite-tag'
Plug 'dyng/ctrlsf.vim'
"Plug 'koron/codic-vim'
Plug 'Lokaltog/vim-easymotion'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
Plug 'gregsexton/gitv'
Plug 'thinca/vim-ref'
Plug 'leafgarland/typescript-vim'
Plug 'clausreinke/typescript-tools.vim'
Plug 'hynek/vim-python-pep8-indent'
"Plug 'nixprime/cpsm', { 'do': './install.sh' }
call plug#end()

"syntax on
syntax enable

"help lang
set helplang=ja,en

"utf8設定
set encoding=utf-8
set fileformats=unix,dos,mac

"256色設定
set t_Co=256

" カラー設定:
set background=dark
" let g:solarized_visibility = "high"
let g:solarized_contrast = "high"
colorscheme solarized
call togglebg#map("<F5>")

" ビープ音
set noerrorbells
set vb t_vb=

"検索結果ハイライト
set hlsearch
"<ESC>2回でハイライト消去
nnoremap <silent><ESC><ESC> :nohlsearch<CR>

"閉じ括弧が入力されたとき、対応する括弧を表示する
set showmatch

" 行番号表示
set number

"タブ操作 ノーマルモードコマンドでタブ新規作成・移動
nnoremap ,t :tabe new<Enter>
nnoremap <c-h> gT
nnoremap <c-l> gt
set showtabline=2

" jjでEsc
inoremap <silent> jj <ESC>


" 現在のタブを新しいタブへ移動
nnoremap <silent> mt :<C-u>call <SID>MoveToNewTab()<CR>
function! s:MoveToNewTab()
    tab split
    tabprevious

    if winnr('$') > 1
        close
    elseif bufnr('$') > 1
        buffer #
    endif

    tabnext
endfunction


" カーソル行を強調表示しない
set nocursorline
" 挿入モードの時のみ、カーソル行をハイライトする
autocmd InsertEnter,InsertLeave * set cursorline!


"bak, swapファイルを作成しない
set nobackup
set noswapfile

" ステータスエリアにファイル情報表示
" let g:Powerline_colorscheme = 'solarized256'
set laststatus=2
set noshowmode


"挿入・検索モードでIMEOFF"
set iminsert=0
set imsearch=0

" ESCでIMEを確実にOFF
inoremap <silent><ESC> <ESC>:set iminsert=0<CR>

" タブの画面上での幅
set tabstop=4
set shiftwidth=4
set softtabstop=4

" よく押し間違えるので q: を無効化
:nmap q: <NOP>

" 検索文字列が小文字の場合は大文字小文字を区別なく検索する(noignorecase)
set ignorecase
" 検索文字列に大文字が含まれている場合は区別して検索する(nosmartcase)
set smartcase

" 補完時のプレビューウインドウを抑止
" set completeopt=menu,menuone
set completeopt=longest,menuone

" vimgrepのcommand alias(Grep recursive)
:command -nargs=1 Gr :vimgrep /<args>/j **/*.py | cw

"indent-guides
" let g:indent_guides_enable_on_vim_startup = 1
" let g:indent_guides_guide_size = 1
" let g:indent_guides_start_level = 2

" ag.vim
" nmap <Space>a :Ag 


" easymotion
let g:EasyMotion_do_mapping = 0	"Disable default mappings
let g:EasyMotion_smartcase = 1
nmap s <Plug>(easymotion-s2)


"Unite.vim
" 大文字小文字を区別しない
let g:unite_enable_ignore_case = 1
let g:unite_enable_smart_case = 1

" buffer list
nnoremap <silent><Space>ub :<C-u>Unite -buffer-name=buffer buffer<CR>
" grep検索
nnoremap <silent><Space>g  :<C-u>Unite grep:. -buffer-name=search-buffer -no-quit -tab<CR>
" カーソル位置の単語をgrep検索(word match)
nnoremap <silent><Space>cg  :<C-u>Unite grep:.:-w -buffer-name=search-buffer -no-quit -tab<CR><C-R><C-W><CR>


" unite grep に pt(The Platinum Searcher) を使う
if executable('pt')
  let g:unite_source_grep_command = 'pt'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor'
  let g:unite_source_grep_recursive_opt = ''
  let g:unite_source_grep_encoding = 'utf-8'
endif


" unite-outline
nnoremap <silent><Space>uo  :<C-u>Unite outline<CR>


" vimshell
let g:vimshell_user_prompt = 'fnamemodify(getcwd(), ":~")'


" vimfiler
nnoremap <silent><Space>f  :<C-u>VimFiler<CR>


" unite-tag
" カーソル下のワード(word)で絞り込み
autocmd BufEnter *
\ if empty(&buftype)
\| nnoremap <buffer> <C-]> :<C-u>UniteWithCursorWord -immediately tag<CR>
\| endif


" neocomplete.vim
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1

" Use smartcase.
let g:neocomplete_enable_smart_case = 1

" Use camel case completion.
let g:neocomplete_enable_camel_case_completion = 1

" Use underbar completion.
let g:neocomplete_enable_underbar_completion = 1

" Set minimum syntax keyword length.
let g:neocomplete_min_syntax_length = 3

" let g:neocomplete_lock_buffer_name_pattern = '\*ku\*'
" Auto select 1st 
let g:neocomplete_enable_auto_select = 0

" max list
let g:neocomplete_max_list = 20

" if !exists('g:neocomplete_omni_patterns')
" 	let g:neocomplete_omni_patterns = {}
" endif
" let g:neocomplete_omni_patterns.python = '[^. \t]\.\w*'


" Syntastic
let g:syntastic_mode_map = {"mode": "passive"}


" vim-quickrun
nmap <silent><Space>r <Plug>(quickrun)
let g:quickrun_config = {}
let g:quickrun_config['c'] = {'type': 'c/clang'}
set splitright    "新しいウィンドウを右に開く


" vim-versions
nnoremap <silent><Space>uv  :<C-u>UniteVersions<CR>
let g:versions#type#svn#log#limit = 50
" 編集中ファイルが所属するリポジトリの変更点一覧を表示する
" nnoremap ,uvs :<C-u>UniteVersions status:!<CR>
" 編集中ファイルのログ一覧を表示する
" nnoremap ,uvl :<C-u>UniteVersions log:%<CR>

" yankround.vim
" nmap p <Plug>(yankround-p)
" nmap P <Plug>(yankround-P)
"
" nmap <C-n> <Plug>(yankround-next)
" nmap <C-m> <Plug>(yankround-prev)
" nnoremap <silent><SID>(ctrlp) :<C-u>CtrlP<CR>
" nmap <expr><C-p> yankround#is_active() ? "\<Plug>(yankround-prev)" : "<SID>(ctrlp)"


let g:lightline = {
       \ 'colorscheme': "solarized",
       \ 'mode_map': { 'c': 'NORMAL' },
       \ 'active': {
       \   'left': [ [ 'mode', 'paste' ],
       \             [ 'fugitive', 'filename', 'modified' ] ],
       \   'right': [ [ 'syntastic', 'lineinfo' ], [ 'percent' ],
       \            [ 'fileformat', 'fileencoding', 'filetype', 'charcode' ] ]
       \ },
       \ 'component_function': {
       \   'modified': 'LightLineModified',
       \   'readonly': 'LightLineReadonly',
       \   'fugitive': 'LightLineFugitive',
       \   'filename': 'LightLineFilename',
       \   'fileformat': 'LightLineFileformat',
       \   'filetype': 'LightLineFiletype',
       \   'fileencoding': 'LightLineFileencoding',
       \   'charcode': 'LightLineCharCode',
       \   'mode': 'LightLineMode',
       \ },
       \ 'separator': { 'left': "\ue0b0", 'right': "\ue0b2" },
       \ 'subseparator': { 'left': "\ue0b1", 'right': "\ue0b3" }
       \ }


function! LightLineModified()
  return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! LightLineReadonly()
  return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? '⭤' : ''
endfunction

function! LightLineFilename()
  return ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
        \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
        \  &ft == 'unite' ? unite#get_status_string() :
        \  &ft == 'vimshell' ? vimshell#get_status_string() :
        \ '' != expand('%:f') ? expand('%:f') : '[No Name]') .
        \ ('' != LightLineModified() ? ' ' . LightLineModified() : '')
endfunction

function! LightLineFugitive()
  return exists('*fugitive#head') ? fugitive#head() : ''
endfunction

function! LightLineFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightLineFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! LightLineFileencoding()
  return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! LightLineMode()
  return winwidth(0) > 60 ? lightline#mode() : ''
endfunction

function! LightLineCharCode()
  if winwidth('.') <= 70
    return ''
  endif

  " Get the output of :ascii
  redir => ascii
  silent! ascii
  redir END

  if match(ascii, 'NUL') != -1
    return 'NUL'
  endif

  " Zero pad hex values
  let nrformat = '0x%02x'

  let encoding = (&fenc == '' ? &enc : &fenc)

  if encoding == 'utf-8'
    " Zero pad with 4 zeroes in unicode files
    let nrformat = '0x%04x'
  endif

  " Get the character and the numeric value from the return value of :ascii
  " This matches the two first pieces of the return value, e.g.
  " "<F>  70" => char: 'F', nr: '70'
  let [str, char, nr; rest] = matchlist(ascii, '\v\<(.{-1,})\>\s*([0-9]+)')

  " Format the numeric value
  let nr = printf(nrformat, nr)

  return "'". char ."' ". nr
endfunction


let g:unite_force_overwrite_statusline = 0
let g:vimfiler_force_overwrite_statusline = 0
let g:vimshell_force_overwrite_statusline = 0


" inoremap <buffer> . .<C-R>=jedi#do_popup_on_dot() ? "\<lt>C-X>\<lt>C-O>\<lt>C-P>" : ""<CR>
" inoremap <buffer> . .<C-R>=jedi#complete_opened() ? "" : "\<lt>C-X>\<lt>C-O>\<lt>C-P>"<CR>

if !exists('g:neocomplete#omni_input_patterns')
        let g:neocomplete#omni_input_patterns = {}
endif
let g:neocomplete#omni_input_patterns.python = '\h\w*\|[^. \t]\.\w*'


" jedi-vim
" autocmd FileType python setlocal omnifunc=jedi#completions
" コマンドつぶし
" let g:jedi#rename_command = ""
" プレビュー画面非表示
autocmd FileType python setlocal completeopt-=preview
" popup_select_first が効かないことへの暫定対処
"let g:jedi#completions_enabled = 0
"let g:jedi#auto_vim_configuration = 0
"if !exists('g:neocomplete#force_omni_input_patterns')
"        let g:neocomplete#force_omni_input_patterns = {}
"endif
"let g:neocomplete#force_omni_input_patterns.python = '\%([^. \t]\.\|^\s*@\|^\s*from\s.\+import \|^\s*from \|^\s*import \)\w*'
"
"let g:jedi#show_call_signatures = 0


" ctrlp.vim
" let g:ctrlp_root_markers = [".svn/"]
let g:ctrlp_custom_ignore = {'file' : '\.pyc', 'dir': 'venv' }
" let g:ctrlp_match_func = {'match': 'cpsm#CtrlPMatch'} " cpsm

" ctrlsf.vim
let g:ctrlsf_ackprg = 'ag' 
let g:ctrlsf_auto_close = 0
nnoremap <Space><C-f> :<C-u>CtrlSF 

" submode.vim
call submode#enter_with('winsize', 'n', '', '<C-w>>', '<C-w>>')
call submode#enter_with('winsize', 'n', '', '<C-w><', '<C-w><')
call submode#enter_with('winsize', 'n', '', '<C-w>+', '<C-w>-')
call submode#enter_with('winsize', 'n', '', '<C-w>-', '<C-w>+')
call submode#map('winsize', 'n', '', '>', '<C-w>>')
call submode#map('winsize', 'n', '', '<', '<C-w><')
call submode#map('winsize', 'n', '', '+', '<C-w>-')
call submode#map('winsize', 'n', '', '-', '<C-w>+')


" clever-f.vim
" 大文字を入力した時のみ大文字小文字を区別
" let g:clever_f_smart_case = 1
" ';'で任意の記号にマッチ
" let g:clever_f_chars_match_any_signs = ';'

" yapf
autocmd FileType python nnoremap <leader>y :0,$!yapf<Cr>


" 文字コードの自動認識
if &encoding !=# 'utf-8'
  set encoding=japan
  set fileencoding=japan
endif
if has('iconv')
  let s:enc_euc = 'euc-jp'
  let s:enc_jis = 'iso-2022-jp'
  " iconvがeucJP-msに対応しているかをチェック
  if iconv("\x87\x64\x87\x6a", 'cp932', 'eucjp-ms') ==# "\xad\xc5\xad\xcb"
    let s:enc_euc = 'eucjp-ms'
    let s:enc_jis = 'iso-2022-jp-3'
  " iconvがJISX0213に対応しているかをチェック
  elseif iconv("\x87\x64\x87\x6a", 'cp932', 'euc-jisx0213') ==# "\xad\xc5\xad\xcb"
    let s:enc_euc = 'euc-jisx0213'
    let s:enc_jis = 'iso-2022-jp-3'
  endif
  " fileencodingsを構築
  if &encoding ==# 'utf-8'
    let s:fileencodings_default = &fileencodings
    let &fileencodings = s:enc_jis .','. s:enc_euc .',cp932'
    let &fileencodings = &fileencodings .','. s:fileencodings_default
    unlet s:fileencodings_default
  else
    let &fileencodings = &fileencodings .','. s:enc_jis
    set fileencodings+=utf-8,ucs-2le,ucs-2
    if &encoding =~# '^\(euc-jp\|euc-jisx0213\|eucjp-ms\)$'
      set fileencodings+=cp932
      set fileencodings-=euc-jp
      set fileencodings-=euc-jisx0213
      set fileencodings-=eucjp-ms
      let &encoding = s:enc_euc
      let &fileencoding = s:enc_euc
    else
      let &fileencodings = &fileencodings .','. s:enc_euc
    endif
  endif
  " 定数を処分
  unlet s:enc_euc
  unlet s:enc_jis
endif
" 日本語を含まない場合は fileencoding に encoding を使うようにする
if has('autocmd')
  function! AU_ReCheck_FENC()
    if &fileencoding =~# 'iso-2022-jp' && search("[^\x01-\x7e]", 'n') == 0
      let &fileencoding=&encoding
    endif
  endfunction
  autocmd BufReadPost * call AU_ReCheck_FENC()
endif
" 改行コードの自動認識
set fileformats=unix,dos,mac
" □とか○の文字があってもカーソル位置がずれないようにする
" if exists('&ambiwidth')
"   set ambiwidth=double
" endif
