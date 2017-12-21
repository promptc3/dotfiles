syntax on
set t_Co=256
set background=dark
set shell=/usr/bin/fish
filetype indent plugin on
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
set tildeop
set cindent
execute pathogen#infect()

" nerdtree
map <C-n> :NERDTreeToggle<CR>

" airline
set laststatus=2
let g:airline_powerline_fonts = 1
let g:bufferline_echo = 0
let g:airline_theme='minimalist'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tmuxline#enabled = 1
set noshowmode

" Case insensitive search
set ic

" Higlhight search
set nohls

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

runtime plugin/dragvisuals.vim

vmap  <expr>  <LEFT>   DVB_Drag('left')
vmap  <expr>  <RIGHT>  DVB_Drag('right')
vmap  <expr>  <DOWN>   DVB_Drag('down')
vmap  <expr>  <UP>     DVB_Drag('up')
vmap  <expr>  D        DVB_Duplicate()
" Remove any introduced trailing whitespace after moving...
let g:DVB_TrimWS = 1

" Fuzzy File Finder(Not CtrlP)
let g:fzf_history_dir = '~/.local/share/fzf-history'
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --glob !.PlayOnLinux --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

map <C-p> :Rg<CR>

" custom mappings
set completefunc=synatxcomplete#Complete
noremap <C-h> :set nohls<CR>
inoremap <Tab> <Esc>
vnoremap <Tab> <Esc>gV
nnoremap <Tab> <Esc>
noremap <C-b> :bnext<CR>
au VimEnter * silent !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Alt_L'
au VimLeave * silent !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Caps_Lock'
" helptags for plugins
helptags ~/.vim/bundle/vim-surround/doc
helptags ~/.vim/bundle/nerdtree/doc
helptags ~/.vim/bundle/syntastic/doc
helptags ~/.vim/bundle/tmuxline.vim/doc
helptags ~/.vim/bundle/vim-ruby-minitest/doc
