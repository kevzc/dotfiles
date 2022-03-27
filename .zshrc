# if command -v pyenv 1>/dev/null 2>&1; then
	# eval "$(pyenv init -)"
# fi

if [ -d ~/.texmf ]; then
	export TEXMFHOME=~/.texmf
fi

alias python='python3'
alias g++17='g++ -O2 -Wall -std=c++17'
alias g++14='g++ -O2 -Wall -std=c++14'
alias g++11='g++ -O2 -Wall -std=c++11'
alias g++98='g++ -O2 -Wall -std=c++98'
