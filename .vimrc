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
set wildmenu
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
set hls

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


helptags ~/.vim/bundle/vim-surround/doc
helptags ~/.vim/bundle/nerdtree/doc
helptags ~/.vim/bundle/syntastic/doc
" custom mappings
noremap <C-h> :set nohls<CR>
inoremap <Tab> <Esc>
vnoremap <Tab> <Esc>
let mapleader="|"
nnoremap <leader>d :NERDTree /home/heliumk/Documents<CR>
vnoremap <leader>d :NERDTree /home/heliumk/Documents<CR>
nnoremap <leader>p :NERDTree /home/heliumk/Documents/sim_lab/pointers<CR>
vnoremap <leader>p :NERDTree /home/heliumk/Documents/sim_lab/pointers<CR>
inoremap <M-l> <Left>
inoremap <M-h> <Right>
inoremap <M-j> <Down>
inoremap <M-k> <Up>
