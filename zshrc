# if command -v pyenv 1>/dev/null 2>&1; then
	# eval "$(pyenv init -)"
# fi

if [ -d ~/.texmf ]; then
	export TEXMFHOME=~/.texmf
fi

alias python='python3'
alias g++17='g++ -std=c++17 -O2 -Wall'
alias g++14='g++ -std=c++14 -O2 -Wall'
alias g++11='g++ -std=c++11 -O2 -Wall'
alias g++98='g++ -std=c++98 -O2 -Wall'

# opam configuration
[[ ! -r ~/.opam/opam-init/init.zsh ]] || source ~/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null