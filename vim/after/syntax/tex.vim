" New Math zone
call vimtex#syntax#core#new_region_math('tikzcd')
" TexNewMathZone was removed; use above instead
" call TexNewMathZone("Z","tikzcd",0)
" call TexNewMathZone("Z","align",0)
" call TexNewMathZone("Z","align*",0)

" asy syntax
syntax include @ASY after/syntax/asy.vim
syntax region asySnip matchgroup=Snip start="\\begin{asy}" end="\\end{asy}" contains=@ASY containedin=texPartZone,texChapterZone,texSectionZone,texSubSectionZone,texSubSubSectionZone,texDocZone
syntax region asySnip matchgroup=Snip start="\\begin{asydef}" end="\\end{asydef}" contains=@ASY containedin=texPartZone,texChapterZone,texSectionZone,texSubSectionZone,texSubSubSectionZone,texDocZone
hi link Snip PreProc

" listing syntax correction
syntax region texZone start="\\begin{lstlisting}" end="\\end{lstlisting}\|%stopzone\>"

" conceal some symbols because vimtex can't for some reason...
if has("gui_running")
	syntax match texMathSymbol "*" contained conceal cchar=∗
	syntax match texMathSymbol "\\\#" contained conceal cchar=#
endif

syntax spell toplevel
set spell
