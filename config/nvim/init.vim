set number
set hls
set termguicolors
set showtabline=2
set background=dark

nnoremap ,t :tabe new<Enter>
nnoremap <c-h> gT
nnoremap <c-l> gt

" 英語キーボード用に;を:として扱う
nnoremap ; :

" カーソル行を強調表示しない
set nocursorline
" 挿入モードの時のみ、カーソル行をハイライトする
autocmd InsertEnter,InsertLeave * set cursorline!

"挿入・検索モードでIMEOFF"
set iminsert=0
set imsearch=0

" よく押し間違えるので q: を無効化
nnoremap q: <NOP>

" 検索文字列が小文字の場合は大文字小文字を区別なく検索する(noignorecase)
set ignorecase
" 検索文字列に大文字が含まれている場合は区別して検索する(nosmartcase)
set smartcase


call plug#begin('~/.local/share/nvim/plugged')
Plug 'ctrlpvim/ctrlp.vim'
Plug 'iCyMind/NeoSolarized'
Plug 'tpope/vim-fugitive'
Plug 'itchyny/lightline.vim'
Plug 'rhysd/clever-f.vim'
Plug 'Lokaltog/vim-easymotion'
call plug#end()

" easymotion
let g:EasyMotion_do_mapping = 0 "Disable default mappings
let g:EasyMotion_smartcase = 1
nmap s <Plug>(easymotion-s2)

" ctrlp
let g:ctrlp_show_hidden = 1
let g:ctrlp_custom_ignore = {'file' : '\.pyc', 'dir': 'node_modules' }

colorscheme NeoSolarized

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
