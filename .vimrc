" plugins
call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-fugitive'
Plug 'vim-syntastic/syntastic'
Plug 'SirVer/ultisnips'
Plug 'tpope/vim-surround'
Plug 'raimondi/delimitmate'
Plug 'preservim/nerdcommenter'
Plug 'preservim/nerdtree'
Plug 'vim-scripts/vim-auto-save'
Plug 'lervag/vimtex'

call plug#end()


" basics
filetype plugin indent on
syntax on
set number
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
	noremap <D-9> <Esc>:tabn 9<CR>
	" Command-0 goes to the last tab
	noremap <D-0> <Esc>:tablast<CR>

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
	inoremap <D-9> <Esc>:tabn 9<CR>
	" Command-0 goes to the last tab
	inoremap <D-0> <Esc>:tablast<CR>
endif


" basic TeX settings
let g:tex_flavor="latex"
let g:tex_conceal='abmg'
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

" parentheses stuff (b/c it's laggy!!!)
" let g:vimtex_matchparen_enabled=0
" let g:vimtex_motion_matchparen=0
" let g:vimtex_delim_stopline=0
" let g:vimtex_delim_stopline=0
let g:loaded_matchparen=0


" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_mode_map = { 'passive_filetypes': ['tex'] }
let g:syntastic_tex_checkers = ['chktex']
" let g:syntastic_quiet_messages = { "type": "style" }


" Ultisnips
" let g:UltiSnipsExpandTrigger="<S-space>"
" let g:UltiSnipsJumpForwardTrigger="<tab>"
" let g:UltiSnipsJumpBackwardTrigger="<S-tab>"


" delimitMate
let delimitMate_expand_cr = 1
let delimitMate_expand_space = 1

" autocmd FileType tex let b:delimitMate_matchpairs = "(:),[:],{:}"
autocmd FileType tex,txt let b:delimitMate_matchpairs = ""
autocmd FileType tex let b:delimitMate_quotes = "$"
autocmd FileType tex let b:delimitMate_smart_matchpairs = '^\%(\w\|\!\|[£]\|[^[:space:][:punct:]]\)'

autocmd FileType snippets let b:loaded_delimitMate = 1

" NERDCommenter
let NERDSpaceDelims=1

" NERDTree
map <C-n> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1


" AutoSave
" let g:auto_save = 1
let g:auto_save_events=["InsertLeave", "TextChanged", "TextChangedI", "CursorHold", "CursorHoldI", "CompleteDone"]
