#!/bin/bash

export TERM="xterm-color"
export PATH="$PATH:$HOME/.local/bin:$HOME/.local/share/bin:$HOME/.cargo/bin/"
export EDITOR="nvim"
export CPATH="$HOME/.local/include"
export _JAVA_AWT_WM_NONREPARENTING=1
# export JAVA_TOOL_OPTIONS="-Dawt.useSystemAAFontSettings=on -Dsun.java2d.xrender=true -Dswing.aatext=true"
export SCRIPT="$HOME/.local/sh"
export BEMENU_OPTS="--fn 'monospace 11' --tb #3C6D71 --tf #cccccc --cb # 3C6D71 --cf #cccccc --nf #3C6D71 --hb #3C6D71 --hf #cccccc --sb #3C5371"

export LESS_TERMCAP_mb=$'\E[1;31m'     # begin blink
export LESS_TERMCAP_md=$'\E[1;36m'     # begin bold
export LESS_TERMCAP_me=$'\E[0m'        # reset bold/blink
export LESS_TERMCAP_so=$'\E[01;33m'    # begin reverse video
export LESS_TERMCAP_se=$'\E[0m'        # reset reverse video
export LESS_TERMCAP_us=$'\E[1;32m'     # begin underline
export LESS_TERMCAP_ue=$'\E[0m'        # reset underline

#startx  
#river
#Hyprland
sway --unsupported-gpu

