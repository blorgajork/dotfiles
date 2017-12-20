#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return



alias ls='ls --color=auto'
#PS1='\u@\h \e[0m\]\W\[\e[0;31m\$\e[0m\]'


# Custom bash prompt via kirsle.net/wizards/ps1.html
#export PS1="\[$(tput bold)\]\[$(tput setaf 4)\][\u\[$(tput setaf 7)\]\[$(tput sgr0)\]@\[$(tput setaf 4)\]\[$(tput bold)\]\h\[$(tput setaf 7)\] \W\[$(tput setaf 4)\]]\[$(tput setaf 1)\]\\$ \[$(tput sgr0)\]"

alias fehbg='feh --bg-fill'
alias fehbgR='feh --bg-fill --randomize'
alias fehbgX='feh --bg-fill --no-xinerama'

alias mpvA='mpv --no-video'
alias mpvV='mpv --no-audio'

alias mntAndroid='jmtpfs ~/mnt'
alias umountAndroid='fusermount -u ~/mnt'


alias cmatrix='cmatrix -bau 4 -C blue'

PROMPT_COMMAND=''
#PS1='\[\e[0m\]\u\[\e[0;31m\]\$\[\e[0m\] '

# Last command > WM Title
trap 'echo -ne "\033]0;$BASH_COMMAND\007"' DEBUG

if [ "$TERM" = "linux" ]; then
    _SEDCMD='s/.*\*color\([0-9]\{1,\}\).*#\([0-9a-fA-F]\{6\}\).*/\1 \2/p'
    for i in $(sed -n "$_SEDCMD" $HOME/.Xresources | awk '$1 < 16 {printf "\\e]P%X%s", $1, $2}'); do
        echo -en "$i"
    done
    clear
fi
