" My (neo)vim config file
" basic configs
set number
set relativenumber
set hidden
set nobackup
set nowritebackup
set cursorline
set expandtab
set autoindent
set smartindent
set shiftwidth=2
set tabstop=2
set encoding=utf8
set updatetime=300

" Filetypes
autocmd FileType json syntax match Comment +\/\/.\+$+

" Native from VCR
set scrolloff=5
set colorcolumn=160
" Use rg when available when using :grep
if executable("rg")
  set grepprg=rg\ --vimgrep\ --no-heading
  set grepformat=%f:%l:%c:%m,%f:%l:%m
endif
" Set ctrl+n & ctrl+p for moving into :grep results
nnoremap <C-m> :cnext<cr>
nnoremap <C-l> :cprevious<cr>
" Set ctrl+j to move a line 1 line down
" Set ctrl+k to move a line 1 line up
"nnoremap <C-j> :m .+1<cr>
"nnoremap <C-k> :m .-2<cr>
"xnoremap <C-j> xp`[V`]
"xnoremap <C-k> xkP`[V`]
" Disable netrw banner
"let g:netrw_banner=0
let g:netrw_liststyle = 3

" vim-plug
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
" UI plugins
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'
Plug 'mhinz/vim-startify'
" Code plugins
Plug 'sheerun/vim-polyglot'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'dense-analysis/ale'
Plug 'pearofducks/ansible-vim'
call plug#end()

" Airline
set laststatus=2
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline_powerline_fonts = 1
let g:airline_statusline_ontop=0
"let g:airline_theme='base16_twilight'
let g:airline#extensions#tabline#formatter = 'default'

" doeplete
let g:deoplete#enable_at_startup = 1

" Ale
let g:ale_linters = {'python': ['flake8', 'pylint'], 'javascript': ['eslint'], 'ansible': ['ansible-lint']}
let g:ale_linters_explicit = 1
let g:ale_fixers = {'*': ['trim_whitespace'], 'javascript': ['prettier', 'eslint'], 'yaml': ['prettier']}
let g:ale_fix_on_save = 1
let g:ale_completion_enabled = 1
let g:ale_completion_autoimport = 1
set omnifunc=ale#completion#OmniFunc
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

" Ansible
let g:ansible_unindent_after_newline = 1
