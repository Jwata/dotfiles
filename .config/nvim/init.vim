let g:python_host_prog='/Users/junji/.pyenv/versions/neovim-py2/bin/python'
let g:python3_host_prog='/Users/junji/.pyenv/versions/neovim-py3/bin/python'

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
call dein#add('Shougo/deoplete.nvim')
call dein#add('kana/vim-submode')
call dein#add('w0rp/ale')
call dein#add('itchyny/lightline.vim')
call dein#add('jiangmiao/auto-pairs')
call dein#add('tpope/vim-fugitive')

" Color schema
" call dein#add('fmoralesc/vim-vitamins')
call dein#add('morhetz/gruvbox')
call dein#add('shinchu/lightline-gruvbox.vim')

" Language server client
call dein#add('prabirshrestha/async.vim')
call dein#add('prabirshrestha/vim-lsp')

" Hakell
" call dein#add('eagletmt/ghcmod-vim')

" Javascript / alterJS
" call dein#add('kchmck/vim-coffee-script')

" Ruby
" call dein#add('thoughtbot/vim-rspec')

" Python
call dein#add('Vimjas/vim-python-pep8-indent')

" Golang
call dein#add('fatih/vim-go', {'build': "GoInstallBinaries"})
call dein#add('sebdah/vim-delve')
" call dein#add('zchee/deoplete-go', {'build': 'make'})

" Rust
" call dein#add('rust-lang/rust.vim')
" call dein#add('autozimu/LanguageClient-neovim', {'rev': 'binary-*-x86_64-unknown-linux-musl'})

" Type Script
call dein#add('HerringtonDarkholme/yats.vim')
call dein#add('mhartington/nvim-typescript', {'build': './install.sh'})

" Cucumber
" call dein#add('tpope/vim-cucumber')

" Floobits
call dein#add('floobits/floobits-neovim')

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
" {{{ denite.vim
let g:denite_enable_start_insert=1
let g:denite_source_file_mru_long_limit = 1000

call denite#custom#option('default', {
    \ 'split': 'floating',
    \ })

autocmd FileType denite call s:denite_my_settings()
function! s:denite_my_settings() abort
  nnoremap <silent><buffer><expr> <CR>
  \ denite#do_map('do_action')
  nnoremap <silent><buffer><expr> d
  \ denite#do_map('do_action', 'delete')
  nnoremap <silent><buffer><expr> p
  \ denite#do_map('do_action', 'preview')
  nnoremap <silent><buffer><expr> q
  \ denite#do_map('quit')
  nnoremap <silent><buffer><expr> i
  \ denite#do_map('open_filter_buffer')
  nnoremap <silent><buffer><expr> <Space>
  \ denite#do_map('toggle_select').'j'
endfunction
call denite#custom#filter('matcher_ignore_globs', 'ignore_globs',
     \ [ '.git/', 'vendor/', '*.min.*', 'images/', 'fonts/'])
call denite#custom#var('file/rec', 'command', ['rg', '--files',
  \ '--glob', '!spec/cassettes/'])
call denite#custom#var('grep', 'command', ['rg'])
call denite#custom#var('grep', 'default_opts', [
  \ '--vimgrep', '--no-heading',
  \ '--glob', '!spec/cassettes/'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', ['--regexp'])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])
call denite#custom#source('buffer', 'matchers', ['matcher/fuzzy', 'matcher/project_files'])
call denite#custom#source('file/rec', 'sorters', ['sorter/sublime'])


nnoremap [denite] <Nop>
nmap     <C-u> [denite]
noremap [denite]<C-f> :Denite file/rec<CR>
noremap [denite]<C-u> :Denite buffer file_mru<CR>
"noremap [denite]<C-g><C-g> :DeniteCursorWord grep -auto-action=preview -vertical-preview -buffer-name=search-buffer-denite<CR>
"noremap [denite]<C-v><C-v> :DeniteCursorWord vendor_grep -auto-action=preview -vertical-preview -buffer-name=search-buffer-denite<CR>
"noremap [denite]<C-g> :Denite grep -auto-action=preview -vertical-preview -buffer-name=search-buffer-denite<CR>
noremap [denite]<C-g><C-g> :DeniteCursorWord grep -auto-action=preview -vertical-preview<CR>
noremap [denite]<C-v><C-v> :DeniteCursorWord vendor_grep -auto-action=preview -vertical-preview<CR>
noremap [denite]<C-g> :Denite grep -auto-action=preview -vertical-preview<CR>
noremap [denite]<C-r> :Denite -resume<CR>
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
" {{{ deoplete
let g:deoplete#enable_at_startup = 1
set completeopt+=noselect
let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode'
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']
" }}}
" {{{ lightline
let g:lightline = {
\   'colorscheme': 'gruvbox',
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
" {{{ ale linter
let g:al_lint_on_text_changed = 'never'
let g:ale_lint_on_open = 1
let g:ale_linters = {
\   'python': ['flake8', 'pylint'],
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
\   'python': ['yapf', 'isort', 'autopep8'],
\   'go': ["gofmt", "goimports"],
\   'rust': ['rustfmt'],
\   'cpp': ['clang-format'],
\   'js': ['eslint']
\}
autocmd! BufRead,BufNewFile Dockerfile.* setfiletype dockerfile
" same shortcut with IntelliJ
nnoremap <C-A-l> :ALEFix<CR>
nnoremap <silent> gd :ALEGoToDefinition<CR>
" }}}
" {{{ ghcmod-vim
autocmd BufWritePost *.hs GhcModCheckAndLintAsync
" }}}
" {{{ color scheme
colorscheme gruvbox
set termguicolors
set background=dark
" }}}
" {{{ coffeescript / javascript
au BufRead,BufNewFile,BufReadPre *.coffee   set filetype=coffee
autocmd FileType coffee setlocal sw=2 sts=2 ts=2 et
" autocmd FileType javascript setlocal sw=4 sts=4 ts=4 et
" }}}
" {{{ LanguageClient_serverCommands
" Required for operations modifying multiple buffers like rename.
" set hidden
" let g:LanguageClient_serverCommands = {
"     \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
"     \ }
" nnoremap <F5> :call LanguageClient_contextMenu()<CR>
" " Or map each action separately
" nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
" nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
" nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>
" }}}
" {{{ vim-lsp
let g:lsp_log_verbose=1
let g:lsp_log_file=expand('~/.cache/tmp/vim-lsp.log')
" }}}
" {{{ python-language-server
let s:pyls_path = fnamemodify(g:python3_host_prog, ':h') . '/'. 'pyls'
if (executable('pyls'))
    au User lsp_setup call lsp#register_server({
  \ 'name': 'pyls',
  \ 'cmd': {server_info->[expand(s:pyls_path)]},
  \ 'whitelist': ['python']
  \ })
endif
" }}}
" {{{ nvim-typescript
let g:nvim_typescript#diagnostics_enable = 0
autocmd BufWrite *.ts,*.tsx TSGetDiagnostics
" }}}
" Goto Definition
autocmd filetype python nnoremap <silent> gd :LspDefinition<CR>

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

" TOOD: move to subdirectory
" mpc
au BufNewFile,BufRead *.mpc setf python
