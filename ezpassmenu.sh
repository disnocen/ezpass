#! /bin/bash


term=st
arg=-e

case $1 in
    p|P|pass|password)
        $term $arg bash -c "
            echo 'copying..'
            pass show $(find $HOME/.password-store | dmenu -m 0 -l 7 | sed s,\.gpg$,,| sed s,\/home\/disnocen\/\.password-store\/,,)|head -n1|xsel -b
        "
        ;;
    u|U|user)
        $term $arg bash -c "
            echo 'copying..'
            pass show $(find $HOME/.password-store | dmenu -m 0 -l 7 | sed s,\.gpg$,,| sed s,\/home\/disnocen\/\.password-store\/,,)|head -n2|tail -n1|sed s/login\:\ //|xsel -b
        "
        ;;
    *)
        $term $arg bash -c "
            echo 'either choose pass or user'
            sleep 3
        "
            ;;
esac
#pass show "$site"|head -n2|tail -n1|sed s/login\:\ //|xclip -selection clipboard
# case $1 in
#     u|U|user)
#         st -e sh -c 'user=$(pass show "$site"|head -n2|tail -n1|sed s/login\:\ //)'
#         xsetroot -name $user
#         #$term $arg sh -c "echo -n $user | xsel -b"
#         st -e sh -c "echo -n $user | xsel -b"
#         ;;
#     p|P|pass|password)
#         st -e "pass show -c \"$site\""
#         ;;
#     *)
#         exit 0
#         ;;
# esac

# sleep .5
# ans=$(echo 'Yes
# No'|dmenu -m 0 -p 'Continue?')
# if [ $ans == 'Yes' ];then
#     pass show -c "$site"
# fi
# zenity --info --text "USERNAME copied to clipboard. Press any key to continue..." 
# 
# pass show -c "$site"
# zenity --info --text "PASSWORD copied to clipboard. Press any key to continue..." 
