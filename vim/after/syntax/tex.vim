" add envs to math zones (also needed for ultisnips)
call vimtex#syntax#core#new_env({
        \ 'name': 'tikzcd',
        \ 'starred': v:true,
        \ 'math': v:true,
        \ 'mtah_nextgroup': 'texTikzcdArg',
        \})
" call vimtex#syntax#core#new_arg('texTikzcdArg')

" listing syntax correction (actually needed, or things look bad)
syntax region texZone start="\\begin{lstlisting}" end="\\end{lstlisting}\|%stopzone\>"

" conceal some symbols because vimtex can't for some reason...
if has("gui_running")
	syntax match texMathSymbol "*" contained conceal cchar=∗
	syntax match texMathSymbol "\\\#" contained conceal cchar=#
endif

" spell (put this last, or else gets overridden by previous stuff)
syntax spell toplevel  " for imported tex files into a main one
set spell
