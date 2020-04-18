let g:python_host_prog='/Users/junji/.pyenv/versions/neovim-py2/bin/python'
let g:python3_host_prog='/Users/junji/.pyenv/versions/neovim-py3/bin/python'

" {{{ Plug
call plug#begin('~/.local/share/nvim/plugged')
Plug 'junegunn/vim-plug'

" color schema/statusline
Plug 'morhetz/gruvbox'
Plug 'itchyny/lightline.vim'
Plug 'shinchu/lightline-gruvbox.vim'

" Programming help
Plug 'jiangmiao/auto-pairs'
Plug 'tmhedberg/SimpylFold'
Plug 'dense-analysis/ale'

" fzf
Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install --all'}
Plug 'junegunn/fzf.vim'

" Work space
Plug 'thaerkh/vim-workspace'

" Type script
Plug 'HerringtonDarkholme/yats.vim'

" Language server
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
" Autocompletion 
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
call plug#end()
" }}}
filetype plugin indent on
syntax on

" Basics
" global setting {{{
set nocompatible
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,euc-jp,iso-2022-jp,sjis
"set fileencoding=japan
set ambiwidth=double
set wildmenu
set noswapfile
set expandtab
set mouse=a
set ts=2 sw=2 sts=2
let g:current_tab=2
" }}}
" display {{{
syntax on
let loaded_matchparen = 1
set number ruler
set showmode
set title
set ruler
set showmatch
set nowrap
"" to be fast response
set ttyfast
set lazyredraw

"" fold
set foldmethod=marker foldmarker={{{,}}}
if has("autocmd")
  autocmd BufNewFile,BufRead *.tpl
  \ set foldmethod=marker foldmarker=<<<,>>>
endif

set listchars=tab:>-,trail:-,nbsp:%,extends:>,precedes:<
au BufRead,BufNew * match JpSpace /　/
set list
" }}}
" programing help {{{
set smartindent
set backspace=indent,eol,start
set ignorecase
set smartcase
set wrapscan
set noincsearch
set hlsearch
" }}}
" {{{ colors / highlight
""  highligh
" highlight Folded ctermbg=LightGrey ctermfg=Black gui=bold term=standout guibg=Grey30 guifg=Grey80
" highlight FoldColumn ctermbg=LightGrey ctermfg=Black gui=bold term=standout guibg=Grey guifg=DarkBlue
set cursorline
" highlight CursorLine ctermbg=black
"" highlight PopUp Menu
" hi Pmenu ctermbg=0
" hi PmenuSel ctermbg=4
" hi PmenuSbar ctermbg=2
" hi PmenuThumb ctermfg=3
"" listchars
highlight SpecialKey cterm=NONE ctermfg=Cyan "guifg=7
highlight JpSpace cterm=underline ctermfg=Cyan "guifg=7
" }}}
" Terminal emulator {{{
autocmd BufWinEnter,WinEnter term://* startinsert
set shell=/usr/local/bin/zsh
nnoremap <C-t><C-t> :vsp term:///usr/local/bin/zsh<CR>
tnoremap <ESC> <C-\><C-n>
tnoremap <C-q> <C-\><C-n>:q<CR>
tnoremap <A-h> <C-\><C-N><C-w>h
tnoremap <A-j> <C-\><C-N><C-w>j
tnoremap <A-k> <C-\><C-N><C-w>k
tnoremap <A-l> <C-\><C-N><C-w>l
inoremap <A-h> <C-\><C-N><C-w>h
inoremap <A-j> <C-\><C-N><C-w>j
inoremap <A-k> <C-\><C-N><C-w>k
inoremap <A-l> <C-\><C-N><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l
" }}}

" Plugin and settings
" {{{ fzf
nnoremap [fzf] <Nop>
nmap     <C-u> [fzf]
noremap [fzf]<C-u> :History<CR>
noremap [fzf]<C-f> :FZF<CR>
"command! -bang -nargs=* Rg
"  \ call fzf#vim#grep(
"  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
"  \   <bang>0 ? fzf#vim#with_preview('up:60%')
"  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
"  \   <bang>0)
noremap [fzf]<C-g> :Rg<CR>
command! -bang -nargs=* RgCursorWord
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(expand('<cword>')), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)
noremap [fzf]<C-g><C-g> :RgCursorWord<CR>
" }}}
" {{{ lightline
let g:lightline = {
\   'colorscheme': 'gruvbox',
\ }
set laststatus=2
" }}}
" {{{ ale linter
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_open = 1
let g:ale_linters = {
\   'python': ['flake8', 'autopep8'],
\   'yaml': ['yamllint'],
\   'dockerfile': ['hadolint'],
\   'go': ['gometalinter'],
\   'rust': ['rustfmt', 'rls'],
\   'cpp': ['clang', 'clangcheck', 'clangd', 'clangtidy', 'cppcheck'],
\   'js': ['eslint']
\}
let g:ale_go_gometalinter_options = '--fast'
let g:ale_go_gofmt_options = '-s'
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'python': ['yapf', 'isort', 'autopep8', 'black'],
\   'go': ["gofmt", "goimports"],
\   'rust': ['rustfmt'],
\   'cpp': ['clang-format'],
\   'js': ['eslint']
\}
autocmd! BufRead,BufNewFile Dockerfile.* setfiletype dockerfile
" same shortcut with IntelliJ
" nnoremap <C-A-l> :ALEFix<CR>
nnoremap <silent> gd :ALEGoToDefinition<CR>

let g:ale_python_flake8_executable = g:python3_host_prog
let g:ale_python_flake8_options = '-m flake8'
let g:ale_python_autopep8_executable = g:python3_host_prog
let g:ale_python_autopep8_options = '-m autopep8'
let g:ale_python_isort_executable = g:python3_host_prog
let g:ale_python_isort_options = '-m isort'
let g:ale_python_black_executable = g:python3_host_prog
let g:ale_python_black_options = '-m black'
let g:ale_python_yapf_executable = g:python3_host_prog
let g:ale_python_yapf_options = '-m yapf'
" }}}
" {{{ color scheme
colorscheme gruvbox
set termguicolors
set background=dark
" }}}
" {{{ Language Server and Autocompletion
nnoremap <C-A-l> :LspDocumentFormat<CR>
" }}}
" {{{ Work space
" let g:workspace_autosave_always = 1
let g:workspace_session_directory = $HOME . '/.vim/sessions/'
" }}}

" Project setting
" {{{ Load .vimrc.local if exists
augroup vimrc-local
  autocmd!
  autocmd BufNewFile,BufReadPost * call s:vimrc_local(expand('<afile>:p:h'))
augroup END

function! s:vimrc_local(loc)
  let files = findfile('.vimrc.local', escape(a:loc, ' ') . ';', -1)
  for i in reverse(filter(files, 'filereadable(v:val)'))
    source `=i`
  endfor
endfunction
" }}}

" Other key bindings and scripts
" {{{ basic
set timeout timeoutlen=300 ttimeoutlen=10

inoremap <C-C> <Esc>

inoremap <C-B> <Left>
inoremap <C-N> <Down>
inoremap <C-P> <Up>
inoremap <C-F> <Right>

"inoremap "" ""<Left>
"inoremap '' ''<Left>
"inoremap ( ()<Left>
"inoremap { {}<Left>
"inoremap [ []<Left>
inoremap <> <><Left>

nnoremap [TABCMD] <nop>
nmap t [TABCMD]
nnoremap <silent> [TABCMD]f :<c-u>tabfirst<cr>
nnoremap <silent> [TABCMD]l :<c-u>tablast<cr>
nnoremap <silent> [TABCMD]n :<c-u>tabnext<cr>
nnoremap <silent> [TABCMD]N :<c-u>tabNext<cr>
nnoremap <silent> [TABCMD]] :<c-u>tabnext<cr>
nnoremap <silent> [TABCMD]p :<c-u>tabprevious<cr>
nnoremap <silent> [TABCMD][ :<c-u>tabprevious<cr>
nnoremap <silent> [TABCMD]e :<c-u>tabedit<cr>
nnoremap <silent> [TABCMD]w :<c-u>tabclose<cr>
nnoremap <silent> [TABCMD]o :<c-u>tabonly<cr>
nnoremap <silent> [TABCMD]s :<c-u>tabs<cr>

noremap <C-u><C-q> :wqa!<CR>
noremap <C-V><C-P> :vsp<CR>
noremap <C-E> :e ./<CR>
" }}}
" {{{ save cursor position when end edit
if has("autocmd")
    autocmd BufReadPost *
    \ if line("'\"") > 0 && line ("'\"") <= line("$") |
    \    exe "normal! g'\"" |
    \ endif
endif
" }}}
" {{{ don't stop cursor at beging of line and end of line
set nosplitright
set whichwrap=b,s,h,l,<,>,~,[,]
set showcmd
" }}}
" {{{ share clipboard
set clipboard&
set clipboard^=unnamedplus
" }}}
