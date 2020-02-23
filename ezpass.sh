#! /bin/bash


site=$(find $HOME/.password-store | fzf | sed s,\.gpg$,,| sed s,\/home\/disnocen\/\.password-store\/,,)

pass show "$site"|head -n2|tail -n1|sed s/login\:\ //|xclip -selection clipboard
echo "USERNAME copied to clipboard"

read -n1 -r -p "Press any key to continue..." key

pass show -c "$site"
echo PASSWORD copied to clipboard"
