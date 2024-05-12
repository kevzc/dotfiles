" disable fullscreen in touchbar
" this only works when put at the start of file,
" so leave this here for now...
if has("gui_macvim")
	let g:macvim_default_touchbar_fullscreen=0
endif


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

" Appearance
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
set conceallevel=2
" tabs
set tabstop=4
set shiftwidth=4
autocmd FileType c setlocal expandtab

" use stuff from .zshrc
set shellcmdflag=-ic

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
" |  APPEARANCE  |
" ----------------
set guifont=Hack\ Regular:h13
set laststatus=2	" always have stausline
set noshowmode		" don't show mode

if has("gui_running")
	colorscheme solarized
	set background=light

	let g:airline_theme='solarized'
	let g:airline_solarized_bg='light'
	
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

" disable annoying settings
let g:vimtex_imaps_leader=';'
let g:vimtex_imaps_enabled=0
let g:vimtex_mappings_disable={
			\ 'i': [']]'],
			\}
let g:loaded_matchparen=0	" disable matching parentheses (b/c very laggy!!!)

" conceal
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
let g:vimtex_syntax_custom_cmds = [
			\ {'name': 'NN', 'mathmode': 1, 'concealchar': 'ℕ'},
			\ {'name': 'ZZ', 'mathmode': 1, 'concealchar': 'ℤ'},
			\ {'name': 'QQ', 'mathmode': 1, 'concealchar': 'ℚ'},
			\ {'name': 'RR', 'mathmode': 1, 'concealchar': 'ℝ'},
			\ {'name': 'CC', 'mathmode': 1, 'concealchar': 'ℂ'},
			\ {'name': 'half', 'mathmode': 1, 'concealchar': '½'},
			\ {'name': 'lto', 'mathmode': 1, 'concealchar': '→'},
			\ {'name': 'from', 'mathmode': 1, 'concealchar': '←'},
			\ {'name': 'lfrom', 'mathmode': 1, 'concealchar': '←'},
			\ {'name': 'injto', 'mathmode': 1, 'concealchar': '↪'},
			\ {'name': 'linjto', 'mathmode': 1, 'concealchar': '↪'},
			\ {'name': 'surjto', 'mathmode': 1, 'concealchar': '↠'},
			\ {'name': 'lsurjto', 'mathmode': 1, 'concealchar': '↠'},
			\ {'name': 'bij', 'mathmode': 1, 'concealchar': '↔'},
			\ {'name': 'lbij', 'mathmode': 1, 'concealchar': '↔'},
			\ {'name': 'lmapsto', 'mathmode': 1, 'concealchar': '↦'},
			\ {'name': 'mapsfrom', 'mathmode': 1, 'concealchar': '↤'},
			\ {'name': 'lmapsfrom', 'mathmode': 1, 'concealchar': '↤'},
			\ {'name': 'vocab', 'conceal': 1, 'argstyle': 'boldital'},
			\ {'name': 'bin', 'conceal': 1, 'argstyle': 'bold'},
			\]


" folds
let g:vimtex_fold_enabled=1
let g:vimtex_fold_types={
	\ 'envs' : {
	\	'whitelist' : ['asy', 'comment', 'abstract', 'abstract*', 'proof', 'subproof', 'axis'],
	\ },
	\ 'markers' : {'enabled' : 0},
	\ 'sections' : {'parse_levels' : 1},
	\ 'cmd_single' : {'enabled' : 0},
	\ 'cmd_multi' : {'enabled' : 0},
	\}

" skim pdf set-up
let g:vimtex_view_method='skim'
let g:vimtex_view_skim_activate=1
let g:vimtex_view_skim_reading_bar=1

" ignore certain warnings
let g:vimtex_quickfix_ignore_filters=[
			\ 'Marginpar on page',
			\ 'Overfull',
			\ 'Font',
			\ 'minitoc',
			\ 'mdframed',
			\]

" disable some indenting
let g:vimtex_indent_on_ampersands=0
let g:vimtex_indent_ignored_envs=[
			\ 'document',
			\ 'frame',
			\ 'lstlisting',
			\]
" note: close_indented --> no auto-indenting after close indenting
" let g:vimtex_indent_delims={
			" \ 'open' : ['{'],
			" \ 'close' : ['}'],
			" \ 'close_indented' : 0,
			" \ 'include_modified_math' : 1,
			" \}
" do not indent \iff
let g:vimtex_indent_conditionals={
			\ 'open': '\v(\\newif)@<!\\if(f>|field|name|numequal|thenelse)@!',
			\}



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
	  \ 'tex': 1,
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

let NERDTreeNaturalSort=1					" Natural sorting for files with numbers


" Ultisnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<C-j>"
let g:UltiSnipsJumpBackwardTrigger="<C-k>"


" vim-surround
autocmd FileType tex let b:surround_108="\\begin{\1environment: \1}\r\\end{\1\1}"		" 108 = l
autocmd FileType tex let b:surround_109="\\[ \r \\]"									" 109 = m


" NERDCommenter
let NERDSpaceDelims=1


" ctrlp
let g:ctrlp_cmd='CtrlPMRU'

" ocaml
set rtp^="/Users/kevinchen/.opam/cs3110-2023fa/share/ocp-indent/vim"
