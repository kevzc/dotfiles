" -------------
" |  PLUGINS  |
" -------------


call plug#begin('~/.vim/plugged')

" Completion
Plug 'SirVer/ultisnips'
Plug 'tpope/vim-surround'
Plug 'valloric/youcompleteme'

" Language
Plug 'preservim/nerdcommenter'
Plug 'lervag/vimtex'

" Integration
Plug 'tpope/vim-fugitive'
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ctrlpvim/ctrlp.vim'

" UI
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()


" ------------
" |  BASICS  |
" ------------


filetype plugin indent on
syntax on
set number
set wildmenu
set tabstop=4
set shiftwidth=4

set shellcmdflag=-ic	" use stuff from .zshrc

" puts cursor at previous location before closing
if has("autocmd")
	au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
endif

" because this is annoying
inoremap <C-j> <Nop>

" terminal: diff cursors for diff modes
if !has("gui_runing")
	let &t_SI.="\e[5 q"		"SI = INSERT mode
	let &t_SR.="\e[3 q"		"SR = REPLACE mode
	let &t_EI.="\e[1 q"		"EI = NORMAL mode (ELSE)
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

" if no python3 support, use pyenv
" set pythonthreedll=~/.pyenv/versions/3.8.5/bin/python
" set pythonthreehome=~/.pyenv/versions/3.8.5


" ----------------
" | APPEAREANCE  |
" ----------------


set guifont=Hack
set laststatus=2	" always have stausline
set noshowmode		" don't show mode

if has("gui_running")
	colorscheme solarized
	set background=dark

	let g:airline_theme='solarized'
	let g:airline_solarized_bg='dark'
	
	" font for arrows
	let g:airline_powerline_fonts=1

	" statusline
	let g:airline#extensions#wordcount#enabled=0	" no word count
	let g:airline_section_y=''						" no utf-8 stuff
	let g:airline_section_error=''					" remove error messages
	let g:airline_section_warning=''				" remove warnings
	let g:airline_detect_spell=0					" remove spell

	" tabline
	let g:airline#extensions#tabline#enabled=1					" enable
	let g:airline#extensions#tabline#show_tab_type=0			" remove tab/buffer labels
	let g:airline#extensions#tabline#show_close_button=0		" remove x
	let g:airline#extensions#tabline#overflow_marker='…'  		" overflow marker
	let airline#extensions#tabline#show_splits=0  				" remove double naming
	let g:airline#extensions#tabline#show_buffers=0  			" don't show open buffers
	let g:airline#extensions#tabline#formatter='unique_tail'	" remove file location in tab name
endif



" ------------
" |  VIMTEX  |
" ------------


let g:tex_flavor="latex"	" set default ft to *.tex

" conceal
" let g:tex_conceal='abmgs'
let g:vimtex_syntax_conceal={
			\ 'accents': 1,
			\ 'cites': 1,
			\ 'fancy': 1,
			\ 'greek': 1,
			\ 'math_bounds': 0,
			\ 'math_delimiters': 1,
			\ 'math_fracs': 1,
			\ 'math_super_sub': 1,
			\ 'math_symbols': 1,
			\ 'sections': 0,
			\ 'styles': 1,
			\}

" Use UltiSnips for macros
let g:vimtex_imaps_leader=';'
let g:vimtex_imaps_enabled=0

" folding
let g:vimtex_fold_enabled=1
let g:vimtex_fold_types={
			\ 'envs' : {
			\	'whitelist' : ['asy', 'comment', 'abstract', 'abstract*'],
			\ },
			\ 'markers' : {'enabled': 0},
			\ 'sections' : {'parse_levels': 1},
			\}

" skim pdf stuff
let g:vimtex_view_method='skim'
let g:vimtex_view_skim_activate=1
let g:vimtex_view_skim_reading_bar=1

" ignore warnings after compilation
let g:vimtex_quickfix_ignore_filters=[
			\ 'Marginpar on page',
			\ 'Overfull',
			\ 'Font',
			\ 'minitoc',
			\]

" parentheses stuff (b/c it's laggy!!!)
let g:loaded_matchparen=0
let g:vimtex_mappings_disable={
			\ 'i': [']]'],
			\}

" Prevent indenting \iff and &
let g:vimtex_indent_conditionals={
			\ 'open': '\v(\\newif)@<!\\if(f>|field|name|numequal|thenelse)@!',
			\ }
let g:vimtex_indent_on_ampersands=0

" vimtex_quickfix_latexlog is deprecated
" let g:vimtex_quickfix_latexlog = {
			" \ 'overfull' : 0,
			" \ 'font' : 0,
			" \ 'packages' : {
			" \   'minitoc' : 0,
			" \ },
			" \}
" let g:vimtex_quickfix_ignore_filters = [
		  " \ 'Package mdframed',
		  " \]

" Deprecated
" refresh status bar after compiling
" function! Callback_airline_refresh(status)
	" execute "AirlineRefresh"
" endfunction
" let g:vimtex_compiler_callback_hooks = ['Callback_airline_refresh']


" -------------------
" |  OTHER PLUGINS  |
" -------------------


" YCM
let g:ycm_key_list_select_completion=['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion=['<C-p>', '<Up>']
let g:ycm_filetype_blacklist={
      \ 'tagbar': 1,
      \ 'notes': 1,
      \ 'markdown': 1,
      \ 'netrw': 1,
      \ 'unite': 1,
      \ 'text': 1,
      \ 'vimwiki': 1,
      \ 'pandoc': 1,
      \ 'infolog': 1,
      \ 'leaderf': 1,
      \ 'mail': 1,
	  \ 'tex': 1
      \}
set completeopt-=preview
highlight SignColumn guibg=#006678


" NERDTree
nnoremap <silent> <C-n><C-n> :NERDTreeToggle<CR>
nnoremap <silent> <C-n><C-f> :NERDTreeFind<CR>
nnoremap <silent> <C-n><C-s> :NERDTreeFocus<CR>

let NERDTreeMinimalUI=1						" appearance
let NERDTreeDirArrows=1						" arrows
let NERDTreeIgnore=['\~$','\.DS_Store$']	" files to ignore
let NERDTreeQuitOnOpen=1					" quit when opening a file
let NERDTreeAutoDeleteBuffer=1				" Delete buffer if file deleted


" Ultisnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<C-j>"
let g:UltiSnipsJumpBackwardTrigger="<C-k>"


" vim-surround
autocmd FileType tex let b:surroundd_108="\\begin{\1environment: \1}\r\\end{\1\1}"		" 108 = l
autocmd FileType tex let b:surround_109="\\[ \r \\]"									" 109 = m


" NERDCommenter
let NERDSpaceDelims=1


" ctrlp
let g:ctrlp_cmd = 'CtrlPMRU'
