" vim-plug {{{
call plug#begin('~/.vim/bundle')
Plug 'skywind3000/vim-terminal-help'
" Vim for markdown, text etc
Plug 'reedes/vim-pencil'
" Graphviz Plugin
Plug 'liuchengxu/graphviz.vim',{'for':'dot'}
" Surround with anything
Plug 'tpope/vim-surround'

" View git commits of lines under the cursor
Plug 'rhysd/git-messenger.vim'

" Align text block with gl<Character>
Plug 'tommcdo/vim-lion'

" FZF
Plug '~/.fzf'
Plug 'junegunn/fzf.vim'

" Colors
Plug 'morhetz/gruvbox'
Plug 'w0ng/vim-hybrid'
Plug 'nightsense/snow'
Plug 'arcticicestudio/nord-vim'
Plug 'nightsense/cosmic_latte'
Plug 'junegunn/seoul256.vim'

" Many Things
Plug '~/.vim/bundle/coc.nvim-release', {'branch': 'release'}

" Shows colors like -> #00F
Plug '~/.vim/bundle/colorizer'

" Provide Database access to many dbms
Plug '~/.vim/bundle/dbext.vim'

" Distraction free typing
Plug 'junegunn/goyo.vim', {'for': 'markdown'}
Plug 'junegunn/limelight.vim', {'for': 'markdown'}
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

" Vim Airline
Plug '~/.vim/bundle/vim-airline'

" Airline Integration and Tmux
Plug '~/.vim/bundle/tmuxline.vim'

" Snippet Support
Plug '~/.vim/bundle/UltiSnips'
Plug '~/.vim/bundle/vim-snippets'

" Comment/Uncomment
Plug '~/.vim/bundle/vim-commentary'

" Add end to def automatically
Plug '~/.vim/bundle/vim-endwise', {'for': ['crystal','elixir','ruby','vim']}

" Git Support
Plug 'tpope/vim-fugitive'

" Ruby Support
Plug '~/.vim/bundle/vim-ruby', {'for': 'ruby'}
Plug '~/.vim/bundle/vim-ruby-minitest', {'for': 'ruby'}

" Maintain a wiki/todos etc in Vim
Plug '~/.vim/bundle/vimwiki'

" Auto Correct like smartphone keyboards
Plug '~/.vim/bundle/vim-you-autocorrect', {'for': ['markdown','text','tex']}
call plug#end()
" end vim plug }}}

" Basic Settings {{{
set rtp+=~/.fzf
set textwidth=80
set relativenumber
set number
set ruler
set showcmd
set nowrap
set wildignore=.svn,CVS,.git,.hg,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,*.pyc,*/node_modules/*
set wildmenu
set autoread
set autowrite
set incsearch ignorecase smartcase hlsearch
set pastetoggle=<F10>
set fillchars=vert:┃
set noexpandtab
set background=dark

" fix meta-keys which generate <Esc>a .. <Esc>z
if !has('nvim')
	let c='a'
	while c <= 'z'
		exec "set <M-".c.">=\e".c
		exec "imap \e".c." <M-".c.">"
		let c = nr2char(1+char2nr(c))
	endw
endif

colorscheme gruvbox
" End Basic Settings }}}

" Custom mappings {{{
"
" Turn off highlight
noremap  <Leader>hl :set nohls<CR>
" Necessity
inoremap <Leader><Leader> <Esc>
vnoremap <Leader><Leader> <Esc>gV
nnoremap <Leader><Leader> <Esc>
" Move around Buffer
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
nnoremap <Space> :bnext<CR>
nnoremap <BS> :bprevious<CR>
nnoremap <Del> :bdelete<CR>
" Map autocompletion
inoremap <M-n> <C-x><C-n>
inoremap <A-n> <C-x><C-n>
inoremap <M-l> <C-x><C-l>
inoremap <A-l> <C-x><C-l>
inoremap <M-o> <C-x><C-o>
inoremap <A-o> <C-x><C-o>
" write file with sudo
cmap w!! w !sudo tee % >/dev/null
" End Custom mappings}}}

" Filetype Settings {{{
"
" Ruby
autocmd FileType ruby set ts=2 sw=2

" HTML
autocmd FileType html set ts=4 sw=4

"LaTex
let g:tex_conceal="ads"
autocmd FileType tex nnoremap <Leader>ll :!pdflatex %<CR><CR>
autocmd FileType tex nnoremap <Leader>bb :!bibtex %:r<CR><CR>

"CPP
let $CXX='g++'
let $CXXFLAGS='-Wall -Werror -g'
autocmd FileType cpp nnoremap <Leader>ll :make %<<CR>

"C
let $CFLAGS='-Wall -Werror -g'
autocmd FileType c nnoremap <Leader>ll :make %<<CR>
autocmd FileType c nnoremap <Leader>ts :!tmux send-keys -t 1 "cc " % Enter<CR>
autocmd FileType c nnoremap <Leader>lm :make <CR>
autocmd FileType c set ts=4 sw=4

"Python
autocmd FileType py nnoremap <Leader>ll :!python2.7 %<CR>

packloadall
silent! helptags ALL

" End Filetype settings }}}

" Plugin Settings {{{
"
"Goyo and Limelight
"color name (:help cterm-colors) or ANSI code
let g:limelight_conceal_ctermfg = 240
let g:limelight_default_coefficient = 0.7
let g:limelight_paragraph_span = 1

" airline
let g:airline_powerline_fonts = 0
let g:airline_theme='gruvbox'
let g:bufferline_echo = 0
let g:airline#extensions#tmuxline#enabled = 1
let g:airline#extensions#tmuxline#snapshot_file = "~/.tmux-statusline-colors.conf"
let g:tmuxline_powerline_separators = 0


"Ultisnips
let g:UltiSnipsExpandTrigger="<S-Tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetDirectories=["UltiSnips"]

" Coc.nvim
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"

" FZF
let g:fzf_colors =
  \ { 'fg':    ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }
nnoremap <Leader>ff :Files<CR>

" End Plugin Settings }}}

" Open Config Files {{{
"
" Edit the .bashrc"
nmap <silent> <leader>eb :e ~/.bashrc<CR>
" Edit the .vimrc"
nmap <silent> <leader>ev :e ~/.vimrc<CR>
" Edit the .gitconfig"
nmap <silent> <leader>eg :e ~/.gitconfig<CR>
" Edit the .tmux.conf"
nmap <silent> <leader>et :e ~/.tmux.conf<CR>
" Open a scratch file
nmap <silent> <leader>eh :e ~/scratch.txt<CR>
" }}}
