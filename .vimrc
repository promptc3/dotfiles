syntax on
filetype plugin indent on
set term=gnome-256color
set background=dark
set shell=/usr/bin/fish
set relativenumber
set number
set ruler
set nocompatible
set showcmd
set wildignore=.svn,CVS,.git,.hg,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,*.pyc,*/node_modules/*
set wildmenu
set rtp+=~/.fzf/
set autoread
set autowrite
set incsearch ignorecase smartcase hlsearch
set pastetoggle=<F10>
set fillchars=vert:┃
set noexpandtab
set omnifunc=syntaxcomplete#Complete
hi VertSplit ctermfg=DarkGray cterm=NONE
hi Visual ctermfg=Green ctermbg=Black

" fix meta-keys which generate <Esc>a .. <Esc>z
let c='a'
while c <= 'z'
  exec "set <M-".c.">=\e".c
  exec "imap \e".c." <M-".c.">"
  let c = nr2char(1+char2nr(c))
endw
inoremap <M-n> <C-n>
inoremap <M-l> <C-x><C-l>
inoremap <M-o> <C-x><C-o>

" netrw settings
map <C-n> :Vexplore<CR>
let g:netrw_liststyle = 3
let g:netrw_banner = 0
let g:netrw_browse_split = 4
let g:netrw_winsize = 25
let g:netrw_altv = 1
let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+:'

execute pathogen#infect()

" airline
set laststatus=1
let g:airline_powerline_fonts = 0
let g:bufferline_echo = 0
let g:airline_theme='zenburn'
let g:airline#extensions#tabline#enabled = 0
let g:airline#extensions#tmuxline#enabled = 1
let g:airline#extensions#ale#enabled = 1

" Wrap text instead of being on one line
set lbr

vmap <unique> <up>    <Plug>SchleppUp
vmap <unique> <down>  <Plug>SchleppDown
vmap <unique> <left>  <Plug>SchleppLeft
vmap <unique> <right> <Plug>SchleppRight
vmap <unique> D <Plug>SchleppDup
let g:Schlepp#reindent = 1
let g:Schlepp#trimWS = 1
let g:Schlepp#dupTrimWS = 1

let g:fzf_history_dir = '~/.local/share/fzf-history'
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --glob !.PlayOnLinux --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

map <C-p> :Rg<CR>
" custom mappings
noremap <C-h> :set nohls<CR>
inoremap <Tab> <Esc>
vnoremap <Tab> <Esc>gV
nnoremap <Tab> <Esc>
inoremap <C-w> <Esc>:w<CR>
nnoremap <C-q> :q!<CR>
inoremap <C-q> <Esc>:wq<CR>
nnoremap <Space> :bn<CR>
nnoremap <BS> :bp<CR>
inoremap <M-n> <C-x><C-n>
inoremap <A-l> <C-x><C-l>

" Filetype mappings
autocmd FileType c set ts=4 sw=4
autocmd FileType ruby set ts=2 sw=2 completefunc=syntaxcomplete#Complete

"Goyo and Limelight
"color name (:help cterm-colors) or ANSI code
let g:limelight_conceal_ctermfg = 240
let g:limelight_default_coefficient = 0.7
let g:limelight_paragraph_span = 1

"Notes
let g:notes_directories = ['~/Documents/notes/']
let g:notes_suffix = '.md'
let g:notes_title_sync = 'rename_file'
let g:notes_tab_indents = 0

" ALE
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 0
let g:ale_on_insert_leave = 1 
let g:ale_completion_enabled = 1
let g:ale_completion_max_suggestions = 5
let g:ale_set_highlights = 0
let g:ale_set_signs = 1

autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!
packloadall
silent! helptags ALL

" helptags for plugins
helptags ~/.vim/bundle/vim-surround/doc
