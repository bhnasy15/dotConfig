# If not running interactively, don't do anything
[[ $- != *i* ]] && return

[[ $DISPLAY ]] && shopt -s checkwinsize

HISTFILESIZE=4444
HISTFILE=$HOME/.config/bash_history
IGNOREEOF=1
set -o vi
bind "set keymap vi"
bind "set editing-mode vi"
bind "set show-mode-in-prompt on"
bind "set vi-cmd-mode-string \"\1\e[2 q\2\""
bind "set vi-ins-mode-string \"\1\e[6 q\2\""
bind "set bell-style visible"
bind "set completion-ignore-case on"
bind -x '"\C-l": clear'

# alias
alias ls='ls -h --color=auto'
alias ll='ls -go'
alias la='ls -A'

alias v='nvim'
alias vf='vifm'

alias grep='grep --color=auto'

alias diff='diff --color=auto'

alias ip='ip --color=auto'

alias batc='cat /sys/class/power_supply/BAT0/capacity'
alias bats='cat /sys/class/power_supply/BAT0/status'

alias py='python3'
alias info='info --vi-keys'

PROMPT_COMMAND='RETURN_VALUE=`RT=$?; [ $RT -ne 0 ] && echo $RT`'
PS1='\[\e[1;31m\]$RETURN_VALUE\[\e[0m\] \W \[\e[1;32m\]\$\[\e[0m\] '

# completion
[ -r /usr/share/bash-completion/bash_completion ] && . /usr/share/bash-completion/bash_completion
complete -D -F _completion_loader -o bashdefault -o default

osc7_cwd() {
    local strlen=${#PWD}
    local encoded=""
    local pos c o
    for (( pos=0; pos<strlen; pos++ )); do
        c=${PWD:$pos:1}
        case "$c" in
            [-/:_.!\'\(\)~[:alnum:]] ) o="${c}" ;;
            * ) printf -v o '%%%02X' "'${c}" ;;
        esac
        encoded+="${o}"
    done
    printf '\e7;file://%s%s\e\\' "${HOSTNAME}" "${encoded}"
}
export LD_PRELOAD="$HOME/.local/lib/stderred/libstderred.so"

