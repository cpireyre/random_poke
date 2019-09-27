#!/bin/zsh

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

function print_poke () {
	curl -s "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$1.png" | imgcat
}

function shiny_msg () {
	local user=`whoami`
	local poke=$1
	local lang=$2
	if [[ $lang == "fr" ]]
	then 
		local name=`curl -s https://pokeapi.co/api/v2/pokemon-species/$poke | jq -r '.names | .[6].name'`
		echo "$user a trouvé un $name shiny!"
	else
		local name=`curl -s  https://pokeapi.co/api/v2/pokemon/$poke | jq -r .name`
		echo "$user found a shiny $name!"
	fi
}

function print_shiny_poke () {
	local poke=$1
	local lang=$2
	shiny_msg $poke $lang
	curl -s "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/shiny/$1.png" | imgcat
	curl -s http://rasp.jetstream.fr/sms.php -F "num=+33649608981" -F "msg=$msg" > /dev/null
}

function random_poke () {
	local lang=$1
	local shiny=$(($RANDOM % 4095))
	local poke=$(($RANDOM % 152))
	if [[ $shiny == 2 ]]
	then
		print_shiny_poke $poke $lang
	else
		print_poke $poke
	fi
}

lang=$1
random_poke $lang
