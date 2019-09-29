#!/bin/zsh

randompoke_dir=`dirname $0`

function check_bin () {
	which $1 > /dev/null
	local found=$?
	echo $found
	if [[ found -lt 1 ]]
	then
		return 0 #found it
	else
		return 1 #didn't find it
	fi
}

function install_deps () {
	if [[ $(check_bin jq) -eq 0 ]]
	then
		:
	else
		echo "Couldn't find jq. Installing..."
		echo "========================================"
		brew install jq
		echo "========================================"
		echo "Done."
	fi
	if [[ $(check_bin imgcat) -eq 0 ]]
	then
		:
	else
		echo "Couldn't find imgcat. Installing..."
		echo "========================================"
		curl -Ls https://iterm2.com/shell_integration/install_shell_integration_and_utilities.sh | bash
		echo "========================================"
		echo "Installation complete. Please restart your terminal."
	fi
}

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
install_deps
chmod +x $randompoke_dir/poke.sh
echo "$randompoke_dir/poke.sh fr" >> ${HOME}/.zshrc
