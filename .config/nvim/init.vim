" {{{ Dein
if &compatible
  set nocompatible
endif
set runtimepath+=/Users/junji/.cache/dein/repos/github.com/Shougo/dein.vim
call dein#begin('/Users/junji/.cache/dein')
call dein#add('Shougo/dein.vim')
call dein#add('Shougo/denite.nvim')
call dein#add('Shougo/neomru.vim')
call dein#add('Shougo/vimproc.vim', {'build' : 'make'})
let g:python3_host_prog = '/usr/local/var/pyenv/shims/python'
" call dein#add('Shougo/deoplete.nvim')
" call deoplete#enable()
call dein#add('vim-syntastic/syntastic')
call dein#add('itchyny/lightline.vim')
call dein#add('kana/vim-submode')
call dein#add('fmoralesc/vim-vitamins')
call dein#add('tpope/vim-fugitive')
call dein#add('jiangmiao/auto-pairs')

" Hakell
call dein#add('eagletmt/ghcmod-vim')

" Javascript / alterJS
call dein#add('kchmck/vim-coffee-script')

" Ruby
call dein#add('thoughtbot/vim-rspec')

call dein#end()
filetype plugin indent on
syntax enable

if dein#check_install()
  call dein#install()
endif
" }}}

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
" highligh
highlight Folded ctermbg=LightGrey ctermfg=Black gui=bold term=standout guibg=Grey30 guifg=Grey80
highlight FoldColumn ctermbg=LightGrey ctermfg=Black gui=bold term=standout guibg=Grey guifg=DarkBlue
set cursorline
highlight CursorLine ctermbg=black
" highlight PopUp Menu
hi Pmenu ctermbg=0
hi PmenuSel ctermbg=4
hi PmenuSbar ctermbg=2
hi PmenuThumb ctermfg=3
"" listchars
highlight SpecialKey cterm=NONE ctermfg=Cyan "guifg=7
highlight JpSpace cterm=underline ctermfg=Cyan "guifg=7
" }}}

" Plugin and settings
" {{{ denite.vim
let g:denite_enable_start_insert=1
let g:denite_source_file_mru_long_limit = 1000
let g:denite_data_directory = '/Volumes/RamDisk/.unite'
" call denite#custom#filter('matcher_ignore_globs', 'ignore_globs',
"      \ [ '.git/', 'vendor/', '*.min.*', 'images/', 'fonts/'])
call denite#custom#var('file_rec', 'command', ['rg', '--files',
  \ '--glob', '!vendor/',
  \ '--glob', '!spec/cassettes/'])
call denite#custom#var('grep', 'command', ['rg'])
call denite#custom#var('grep', 'default_opts', ['--vimgrep', '--no-heading',
  \ '--glob', '!vendor/',
  \ '--glob', '!spec/cassettes/'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', ['--regexp'])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])


nnoremap [denite] <Nop>
nmap     <C-u> [denite]
noremap [denite]<C-f> :Denite file_rec<CR>
noremap [denite]<C-u> :Denite buffer file_mru<CR>
noremap [denite]<C-g><C-g> :DeniteCursorWord grep -auto-preview -vertical-preview -buffer-name=search-buffer-denite<CR>
noremap [denite]<C-g> :Denite grep -auto-preview -vertical-preview -buffer-name=search-buffer-denite<CR>
noremap [denite]<C-r> :Denite -resume -buffer-name=search-buffer-denite<CR>
call denite#custom#map(
      \ 'insert',
      \ '<C-j>',
      \ '<denite:move_to_next_line>',
      \ 'noremap'
      \)
call denite#custom#map(
      \ 'insert',
      \ '<C-k>',
      \ '<denite:move_to_previous_line>',
      \ 'noremap'
      \)
" }}}
" {{{ syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_mode_map = { 'mode': 'active',
      \ 'active_filetypes': [],
      \ 'passive_filetypes': ['scss', 'html'] }
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers=['eslint']
let g:syntastic_javascript_eslint_exe='$(npm bin)/eslint'

noremap <C-S><C-S> :SyntasticCheck<CR>
" }}}
" {{{ lightline
let g:lightline = {
\   'colorscheme': 'wombat',
\ }
set laststatus=2
" }}}
" {{{ vim-submode
call submode#enter_with('winsize', 'n', '', '<C-w>>', '<C-w>>')
call submode#enter_with('winsize', 'n', '', '<C-w><', '<C-w><')
call submode#enter_with('winsize', 'n', '', '<C-w>+', '<C-w>-')
call submode#enter_with('winsize', 'n', '', '<C-w>-', '<C-w>+')
call submode#map('winsize', 'n', '', '>', '<C-w>>')
call submode#map('winsize', 'n', '', '<', '<C-w><')
call submode#map('winsize', 'n', '', '+', '<C-w>-')
call submode#map('winsize', 'n', '', '-', '<C-w>+')
" }}}
" {{{ ghcmod-vim
autocmd BufWritePost *.hs GhcModCheckAndLintAsync
" }}}
" {{{ color scheme
set termguicolors
colorscheme vitamins
" }}}
" {{{ coffeescript / javascript
au BufRead,BufNewFile,BufReadPre *.coffee   set filetype=coffee
autocmd FileType coffee setlocal sw=2 sts=2 ts=2 et
" autocmd FileType javascript setlocal sw=4 sts=4 ts=4 et
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
