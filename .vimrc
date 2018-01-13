syntax on
filetype plugin indent on
set term=gnome-256color
"set background=dark
set shell=/usr/bin/fish
set rnu
set number
set ruler
set nocompatible
set backspace=2
set tabstop=2
set shiftwidth=2
set showcmd
set wildignore=.svn,CVS,.git,.hg,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,*.pyc,*/.tox/*,*.egg-info/*,*/node_modules/*
set wildmenu
set rtp+=~/.fzf/
set autoread
set autowrite
set incsearch ignorecase smartcase hlsearch
set pastetoggle=<F10>
set fillchars=vert:┃
hi VertSplit ctermfg=DarkGray cterm=NONE
hi Visual ctermfg=Green ctermbg=Black

" netrw settings
map <C-n> :Vexplore<CR>
let g:netrw_liststyle = 3
let g:netrw_banner = 0
let g:netrw_browse_split = 4
let g:netrw_winsize = 25
let g:netrw_altv = 1
let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+:'

" fix meta-keys which generate <Esc>a .. <Esc>z
let c='a'
while c <= 'z'
	exec "set <A-".toupper(c).">=\e".c
	exec "imap \e".c." <A-".toupper(c).">"
	let c = nr2char(1+char2nr(c))
endw

execute pathogen#infect()

" airline
set laststatus=1
let g:airline_powerline_fonts = 1
let g:bufferline_echo = 0
let g:airline_theme='luna'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tmuxline#enabled = 1

" Wrap text instead of being on one line
set lbr

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_ruby_checkers=['mri']

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
set completefunc=syntaxcomplete#Complete
noremap <C-h> :set nohls<CR>
inoremap <Tab> <Esc>
vnoremap <Tab> <Esc>gV
nnoremap <Tab> <Esc>
inoremap <C-w> <Esc>:w<CR>
nnoremap <C-q> :q!<CR>
inoremap <C-q> <Esc>:wq<CR>
nnoremap <Space> :bn<CR>
nnoremap <BS> :bp<CR>

" Filetype mappings
autocmd FileType c set ts=4 sw=4 omnifunc=ccomplete#Complete
autocmd FileType ruby set omnifunc=rubycomplete#Complete

"Goyo and Limelight
"color name (:help cterm-colors) or ANSI code
let g:limelight_conceal_ctermfg = 240
let g:limelight_default_coefficient = 0.7
let g:limelight_paragraph_span = 1

autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

" helptags for plugins
helptags ~/.vim/bundle/vim-surround/doc
helptags ~/.vim/bundle/syntastic/doc
helptags ~/.vim/bundle/vim-ruby-minitest/doc
helptags ~/.vim/bundle/vim-commentary/doc
helptags ~/.vim/bundle/vim-airline/doc
