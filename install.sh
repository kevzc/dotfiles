#!/bin/sh

# creates a bunch of symlinks to $HOME
# shamlessly stolen from here:
#	https://github.com/paulirish/dotfiles/blob/master/symlink-setup.sh


print_success() {
    # Print output in green
    printf "\e[0;32m  [✔] $1\e[0m\n"
}

print_error() {
    # Print output in red
    printf "\e[0;31m  [✖] $1 $2\e[0m\n"
}

print_result() {
    [ $1 -eq 0 ] \
        && print_success "$2" \
        || print_error "$2"

    [ "$3" == "true" ] && [ $1 -ne 0 ] \
        && exit
}

execute() {
    $1 &> /dev/null
    print_result $? "${2:-$1}"
}

print_question() {
    # Print output in yellow
    printf "\e[0;33m  [?] $1\e[0m"
}

ask_for_confirmation() {
    print_question "$1 (y/n) "
    read -n 1
    printf "\n"
}

answer_is_yes() {
    [[ "$REPLY" =~ ^[Yy]$ ]] \
        && return 0 \
        || return 1
}


# ---------------------- #
# symlinking starts here #
# ---------------------- #


main() {
	local dotfiles=$(find . -maxdepth 1 -not -name '.*' -not -name '*.sh' -not -name '*.md' | sed 's/^\.\///g' | sort)

	local i=""
	local sourceFile=""
	local targetFile=""

	for i in ${dotfiles[@]}; do
		sourceFile="$(pwd)/$i"
		
		if [ ${i:0:1} == "." ]; then
			targetFile="$HOME/$i"
		else
			targetFile="$HOME/.$i"
		fi

		if [ -e "$targetFile" ]; then
			# readlink = checks sym link
			if [ "$(readlink "$targetFile")" != "$sourceFile" ]; then
				ask_for_confirmation "'$targetFile' already exists, do you want to overwrite it?"
				if answer_is_yes; then
					rm -rf "$targetFile"
					execute "ln -fs $sourceFile $targetFile" "$sourceFile → $targetFile"
				else
					print_error "$sourceFile → $targetFile"
				fi
			else
				print_success "$sourceFile → $targetFile"
			fi
		else
			execute "ln -fs $sourceFile $targetFile" "$sourceFile → $targetFile"
		fi
	done
}

main
