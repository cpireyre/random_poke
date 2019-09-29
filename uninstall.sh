#!/bin/bash

echo "Uninstalling. Thanks for playing."

brew uninstall jq
bash rm_shell_integration.sh
sed -i -e '/poke\.sh/d' ~/.zshrc
