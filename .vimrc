scriptencoding utf-8
set nocompatible

if has('vim_starting')
  filetype plugin off
  filetype indent off
  execute 'set runtimepath+=' . expand('~/.vim/bundle/neobundle.vim')
endif
call neobundle#begin(expand('~/.vim/bundle/'))

NeoBundle 'kien/ctrlp.vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'Townk/vim-autoclose'
NeoBundle 'tpope/vim-rails'

call neobundle#end()

syntax on
filetype plugin on
filetype indent on

" SSH クライアントの設定によってはマウスが使える（putty だと最初からいける）
set mouse=n

set autoindent
set number
set incsearch
set showmatch
set smartindent
set tabstop=2
set expandtab
set shiftwidth=2
set hlsearch
set list
set listchars=tab:>-,eol:¬,trail:_
set clipboard=unnamedplus
set laststatus=2
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
set fileencodings=utf-8,cp932,euc-jp
set nostartofline

""""""""""""""""""""""""""""""
"挿入モード時、ステータスラインの色を変更
"""""""""""""""""""""""""""""""
let g:hi_insert = 'highlight StatusLine guifg=darkblue guibg=darkyellow gui=none ctermfg=blue ctermbg=yellow cterm=none'

if has('syntax')
  augroup InsertHook
      autocmd!
      autocmd InsertEnter * call s:StatusLine('Enter')
      autocmd InsertLeave * call s:StatusLine('Leave')
    augroup END
endif

let s:slhlcmd = ''
function! s:StatusLine(mode)
  if a:mode == 'Enter'
      silent! let s:slhlcmd = 'highlight ' . s:GetHighlight('StatusLine')
      silent exec g:hi_insert
    else
    highlight clear StatusLine
    silent exec s:slhlcmd
  endif
  endfunction

  function! s:GetHighlight(hi)
    redir => hl
  exec 'highlight '.a:hi
    redir END
  let hl = substitute(hl, '[\r\n]', '', 'g')
    let hl = substitute(hl, 'xxx', '', '')
  return hl
  endfunction

set clipboard=unnamed,autoselect

colorscheme molokai
