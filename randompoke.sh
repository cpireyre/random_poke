echo "function print_poke () {
	curl -s https://pokeapi.co/api/v2/pokemon/$1 | jq .sprites.front_default | xargs curl -s | imgcat
}

function random_poke () {
	local poke=$((RANDOM % 386))
	print_poke $poke
}

random_poke" >> ~/.zshrc && zsh
