# Credits
The page setup and style used in `kev.sty` was pretty much copied from
[evan.sty](https://github.com/vEnhance/dotfiles/blob/master/texmf/tex/latex/evan/evan.sty).
In fact, I used his package as practice for writing my own custom package.
Probably the only thing I added was the macros that I have used over the years.

# Quickstart
The page setup requires the document class `scrartcl`.
This means the preamble should look like this:
```
\documentclass{scrartcl}
\usepackage[fancy]{kev}
```
For beamer presentations, use `\usepackage[beamer]{kev}`.
