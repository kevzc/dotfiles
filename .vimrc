" {{{1 plugins

call plug#begin('~/.vim/plugged')

" Commands and Snippets
Plug 'SirVer/ultisnips'
Plug 'tpope/vim-surround'

" Language
" Plug 'vim-syntastic/syntastic'
Plug 'preservim/nerdcommenter'
Plug 'lervag/vimtex'

" Integration
Plug 'tpope/vim-fugitive'
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

" UI
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Other
" Plug 'Konfekt/FastFold'
Plug 'vim-scripts/vim-auto-save'

call plug#end()

" }}}1

" {{{1 basics

filetype plugin indent on
syntax on
set number
set wildmenu

set tabstop=4
set shiftwidth=4

set guifont=Hack

" puts cursor where left off after reopenning
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
endif

" appearance
if has("gui_running")
	set background=dark
	colorscheme solarized
else
	" set background=light
	" colorscheme solarized
	let &t_SI.="\e[5 q" "SI = INSERT mode
	let &t_SR.="\e[3 q" "SR = REPLACE mode
	let &t_EI.="\e[1 q" "EI = NORMAL mode (ELSE)
endif

" tabs for macvim
if has("gui_macvim")
	noremap <C-Tab> <Esc>:tabnext<CR>
	noremap <C-S-Tab> <Esc>:tabprev<CR>

	noremap <D-1> <Esc>:tabn 1<CR>
	noremap <D-2> <Esc>:tabn 2<CR>
	noremap <D-3> <Esc>:tabn 3<CR>
	noremap <D-4> <Esc>:tabn 4<CR>
	noremap <D-5> <Esc>:tabn 5<CR>
	noremap <D-6> <Esc>:tabn 6<CR>
	noremap <D-7> <Esc>:tabn 7<CR>
	noremap <D-8> <Esc>:tabn 8<CR>
	noremap <D-9> <Esc>:tablast<CR>

	" for insert mode
	inoremap <C-Tab> <Esc>:tabnext<CR>
	inoremap <C-S-Tab> <Esc>:tabprev<CR>

	inoremap <D-1> <Esc>:tabn 1<CR>
	inoremap <D-2> <Esc>:tabn 2<CR>
	inoremap <D-3> <Esc>:tabn 3<CR>
	inoremap <D-4> <Esc>:tabn 4<CR>
	inoremap <D-5> <Esc>:tabn 5<CR>
	inoremap <D-6> <Esc>:tabn 6<CR>
	inoremap <D-7> <Esc>:tabn 7<CR>
	inoremap <D-8> <Esc>:tabn 8<CR>
	inoremap <D-9> <Esc>:tablast<CR>
endif

" }}}1

" {{{1 configure plugins

" {{{2 vim-airline

" basic
set laststatus=2
set noshowmode

if has("gui_running")
	let g:airline_theme='solarized'
	let g:airline_solarized_bg='dark'
endif

" font for arrows
let g:airline_powerline_fonts=1

" status line
let g:airline#extensions#wordcount#enabled=0  " no word count
let g:airline_section_y=''  " no utf-8 stuff
let g:airline_section_error='' " remove error messages
let g:airline_section_warning=''  " remove warnings
let g:airline_detect_spell=0  " remove spell

" tabline
let g:airline#extensions#tabline#enabled=1  " enable
let g:airline#extensions#tabline#show_tab_type=0  " remove tab/buffer labels
let g:airline#extensions#tabline#show_close_button=0  " remove x
let g:airline#extensions#tabline#overflow_marker='…'  " overflow marker
let airline#extensions#tabline#show_splits=0  " remove double naming
let g:airline#extensions#tabline#show_buffers=0  " don't show open buffers
let g:airline#extensions#tabline#formatter='unique_tail'  " remove file location in tab name

" }}}2

" {{{2 vimtex
" basic tex settings
let g:tex_flavor="latex"
let g:tex_conceal='abmgs'
let g:vimtex_imaps_leader=';'

" folding
let g:vimtex_fold_enabled=1
let g:vimtex_fold_types={
			\ 'envs' : {
			\	'whitelist' : ['asy', 'comment'],
			\ },
			\ 'markers' : {'enabled': 0},
			\ 'sections' : {'parse_levels': 1},
			\}

" skim pdf stuff
let g:vimtex_view_method='skim'
let g:vimtex_view_skim_activate=1
let g:vimtex_view_skim_reading_bar=1

" ignore warnings after compilation
let g:vimtex_quickfix_latexlog = {
			\ 'overfull' : 0,
			\ 'font' : 0,
			\ 'packages' : {
			\   'minitoc' : 0,
			\ },
			\}

" parentheses stuff (b/c it's laggy!!!)
let g:loaded_matchparen=0

" refresh status bar after compiling
function! Callback_airline_refresh(status)
	execute "AirlineRefresh"
endfunction
let g:vimtex_compiler_callback_hooks = ['Callback_airline_refresh']

" }}}2

" {{{2 Surround

autocmd FileType tex let b:surround_109 = "\\[ \r \\]"
autocmd FileType tex let b:surroundd_108 = "\\begin{\1environment: \1}\r\\end{\1\1}"

" }}}2

" {{{2 NERDCommenter

let NERDSpaceDelims=1

" }}}2

" {{{2 NERDTree

" opening
nnoremap <silent> <C-n> :NERDTreeToggle<CR>
nnoremap <silent> <Leader>n :NERDTreeFocus<CR>

" what to show
let NERDTreeMinimalUI=1
let NERDTreeDirArrows=1

" what to ignore
let NERDTreeIgnore=['\~$', '\.DS_Store$']

" Quit when opening a file
let NERDTreeQuitOnOpen=1

" Delete buffer if file deleted
let NERDTreeAutoDeleteBuffer = 1

" }}}2

" {{{2 AutoSave

" let g:auto_save = 1
let g:auto_save_events=["InsertLeave", "TextChanged", "TextChangedI", "CursorHold", "CursorHoldI", "CompleteDone"]

" }}}2

" }}}1
