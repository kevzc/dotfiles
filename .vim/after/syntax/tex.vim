" New Math zone
call TexNewMathZone("Z","diagram",0)
call TexNewMathZone("Z","tikzcd",0)
call TexNewMathZone("Z","align",0)
call TexNewMathZone("Z","align*",0)

" asy syntax
syntax include @ASY after/syntax/asy.vim
syntax region asySnip matchgroup=Snip start="\\begin{asy}" end="\\end{asy}" contains=@ASY containedin=texPartZone,texChapterZone,texSectionZone,texSubSectionZone,texSubSubSectionZone,texDocZone
syntax region asySnip matchgroup=Snip start="\\begin{asydef}" end="\\end{asydef}" contains=@ASY containedin=texPartZone,texChapterZone,texSectionZone,texSubSectionZone,texSubSubSectionZone,texDocZone
hi link Snip PreProc

" conceal
set conceallevel=2
"let g:tex_subscripts="[0-9]"
"let g:tex_supersciprts="[0-9]"

if has("gui_running")
	" greek letters
	fun! s:Greek(group,pat,cchar)
		exe 'syn match '.a:group." '".a:pat."' contained conceal cchar=".a:cchar
	endfun
	call s:Greek('texGreek','\\varphi\>','φ')
	call s:Greek('texGreek','\\phi\>','ϕ')
	syntax match texMathSymbol "\\eps\>" contained conceal cchar=ε
	
	" sets
	syntax match texMathSymbol "\\NN\>" contained conceal cchar=ℕ
	syntax match texMathSymbol "\\ZZ\>" contained conceal cchar=ℤ
	syntax match texMathSymbol "\\QQ\>" contained conceal cchar=ℚ
	syntax match texMathSymbol "\\RR\>" contained conceal cchar=ℝ
	syntax match texMathSymbol "\\CC\>" contained conceal cchar=ℂ
	
	" delimiters
	syntax match texMathSymbol "\\langle\>" contained conceal cchar=⟨
	syntax match texMathSymbol "\\rangle\>" contained conceal cchar=⟩
	syntax match texMathSymbol "\\left\\langle\>" contained conceal cchar=⟨
	syntax match texMathSymbol "\\right\\rangle\>" contained conceal cchar=⟩
	syntax match texMathSymbol "\\left<" contained conceal cchar=⟨
	syntax match texMathSymbol "\\right>" contained conceal cchar=⟩
	syntax match texMathSymbol "\\left|\>" contained conceal cchar=|
	syntax match texMathSymbol "\\right|\>" contained conceal cchar=|

	" other symbols
	syntax match texMathSymbol "\\half\>" contained conceal cchar=½
	syntax match texMathSymbol "*" contained conceal cchar=∗
	syntax match texMathSymbol "\\\#" contained conceal cchar=#
	syntax match texMathSymbol "\\colon\>" contained conceal cchar=:
	syntax match texMathSymbol "\\mid\>" contained conceal cchar=|
	
	" defining \inv = ^{-1}
	syntax match Minus contained "\\i" conceal cchar=⁻
	syntax match One contained "nv" conceal cchar=¹
	syntax match MinusOne "\\inv\>" containedin=texStatement contains=Minus,One
	
	" arrows
	syntax match texMathSymbol "\\lto\>" conceal cchar=→
	syntax match texMathSymbol "\\from\>" conceal cchar=←
	syntax match texMathSymbol "\\lfrom" conceal cchar=←
	syntax match texMathSymbol "\\injto\>" conceal cchar=↪
	syntax match texMathSymbol "\\linjto\>" conceal cchar=↪
	syntax match texMathSymbol "\\surjto\>" conceal cchar=↠
	syntax match texMathSymbol "\\lsurjto\>" conceal cchar=↠
	syntax match texMathSymbol "\\bij\>" conceal cchar=↔
	syntax match texMathSymbol "\\lbij\>" conceal cchar=↔
	syntax match texMathSymbol "\\lmapsto\>" conceal cchar=↦
	syntax match texMathSymbol "\\mapsfrom\>" conceal cchar=↤
	syntax match texMathSymbol "\\lmapsfrom\>" conceal cchar=↤
endif

" put spelling after conceal or else it won't work
set spell
syntax spell toplevel
