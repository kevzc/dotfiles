" {{{1 plugins

call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-fugitive'
" Plug 'vim-syntastic/syntastic'
Plug 'SirVer/ultisnips'
Plug 'tpope/vim-surround'
" Plug 'raimondi/delimitmate'
Plug 'preservim/nerdcommenter'
Plug 'preservim/nerdtree'
Plug 'vim-scripts/vim-auto-save'
Plug 'lervag/vimtex'
" Plug 'itchyny/lightline.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()

" }}}1

" {{{1 basics

filetype plugin indent on
syntax on
set relativenumber
set wildmenu

set tabstop=4
set shiftwidth=4

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
	" Press Ctrl-Tab to switch between open tabs (like browser tabs) to
	" the right side. Ctrl-Shift-Tab goes the other way.
	noremap <C-Tab> <Esc>:tabnext<CR>
	noremap <C-S-Tab> <Esc>:tabprev<CR>

	" Switch to specific tab numbers with Command-number
	noremap <D-1> <Esc>:tabn 1<CR>
	noremap <D-2> <Esc>:tabn 2<CR>
	noremap <D-3> <Esc>:tabn 3<CR>
	noremap <D-4> <Esc>:tabn 4<CR>
	noremap <D-5> <Esc>:tabn 5<CR>
	noremap <D-6> <Esc>:tabn 6<CR>
	noremap <D-7> <Esc>:tabn 7<CR>
	noremap <D-8> <Esc>:tabn 8<CR>
	" last tab
	noremap <D-9> <Esc>:tablast<CR>

	" same but for insert mode
	inoremap <C-Tab> <Esc>:tabnext<CR>
	inoremap <C-S-Tab> <Esc>:tabprev<CR>

	" Switch to specific tab numbers with Command-number
	inoremap <D-1> <Esc>:tabn 1<CR>
	inoremap <D-2> <Esc>:tabn 2<CR>
	inoremap <D-3> <Esc>:tabn 3<CR>
	inoremap <D-4> <Esc>:tabn 4<CR>
	inoremap <D-5> <Esc>:tabn 5<CR>
	inoremap <D-6> <Esc>:tabn 6<CR>
	inoremap <D-7> <Esc>:tabn 7<CR>
	inoremap <D-8> <Esc>:tabn 8<CR>
	" last tab
	inoremap <D-9> <Esc>:tablast<CR>
endif

" basic tex stuff
let g:tex_flavor="latex"
let g:tex_conceal='abmgs'
let g:vimtex_imaps_leader=';'

" }}}1

" {{{1 configure plugins

" " {{{2 lightline.vim

" " always display status line
" set laststatus=2

" " do not show mode
" set noshowmode

" " define lightline configuration
" let g:lightline = {
			" \ 'colorscheme': 'solarized',
			" \ }

" " define function to toggle solarized theme
" " change background and update lightline color scheme
" function! ToggleSolarizedTheme()
	" let &background = ( &background == "dark"? "light" : "dark" )
	" if exists("g:lightline")
		" runtime autoload/lightline/colorscheme/solarized.vim
		" call lightline#colorscheme()
	" endif
" endfunction

" " map F12 to ToggleSolarizedTheme() function
" map <F12> :call ToggleSolarizedTheme()<CR>

" "}}}2

" {{{2 vim-airline

" basic
set laststatus=2
set noshowmode
let g:airline_theme='solarized'
let g:airline_solarized_bg='dark'

" font for arrows
set guifont=Hack
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

" }}}2

" {{{2 vimtex
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

" parentheses stuff (b/c it's laggy!!!)
" let g:vimtex_matchparen_enabled=0
" let g:vimtex_motion_matchparen=0
" let g:vimtex_delim_stopline=0
" let g:vimtex_delim_stopline=0
let g:loaded_matchparen=0

" }}}2

" {{{2 Syntastic

" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

" let g:syntastic_always_populate_loc_list=1
" let g:syntastic_auto_loc_list=1
" let g:syntastic_check_on_open=1
" let g:syntastic_check_on_wq=0

" let g:syntastic_mode_map={'passive_filetypes': ['tex']}
" let g:syntastic_tex_checkers=['chktex']
" " let g:syntastic_quiet_messages = { "type": "style" }

" }}}2

" {{{2 Ultisnips

" let g:UltiSnipsExpandTrigger="<S-space>"
" let g:UltiSnipsJumpForwardTrigger="<tab>"
" let g:UltiSnipsJumpBackwardTrigger="<S-tab>"

" }}}2

" {{{2 delimitMate

" let delimitMate_blacklist=['cpp', 'java', 'py', 'tex']
" if index(delimitMate_blacklist, &filetype) == -1
" let delimitMate_offByDefault=1
" endif

" autocmd FileType tex let b:delimitMate_matchpairs=""
" autocmd FileType tex let b:delimitMate_quotes="$"
" autocmd FileType tex let b:delimitMate_smart_matchpairs='^\%(\w\|\!\|[£]\|[^[:space:][:punct:]]\)'

" " expanding options
" let delimitMate_expand_cr=1
" let delimitMate_expand_space=1

" }}}2

" {{{2 NERDCommenter

let NERDSpaceDelims=1

" }}}2

" {{{2 NERDTree

map <C-n> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1

" }}}2

" {{{2 AutoSave

" let g:auto_save = 1
let g:auto_save_events=["InsertLeave", "TextChanged", "TextChangedI", "CursorHold", "CursorHoldI", "CompleteDone"]

" }}}2

" }}}1
