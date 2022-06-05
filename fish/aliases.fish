# apps
alias yt='yt-dlp'
alias yta="yt -x --audio-format mp3 -f 'bestaudio'"
alias lf='lfub'
alias v='vim'

# Adding verbosity
alias cp='cp -v'
alias rm='rm -v'
alias mv='mv -v'
alias mkd='mkdir -pv'

# mkdir+cd together!!
function mkcd
    mkdir -p -- $argv &&
        cd -- $argv
end

# ls stuff
alias ls='ls -pq --color=always --group-directories-first'
alias la='ls -a --color=always --group-directories-first'
alias ll='ls -lhpq --color=always --group-directories-first'
alias lla='ls -lah --color=always --group-directories-first'
alias l.='ls -a | egrep "^\."'

# suckless
alias mki='sudo make install'

# SystemD <3
alias sys="sudo systemctl"
alias syst="sudo systemctl status"
alias usys="systemctl --user"
alias usyst="systemctl --user status"
alias jrn="sudo journalctl"
alias ujrn="journalctl --user"

# Colorz!!
alias grep="grep --color=auto"
alias diff="diff --color=auto"
alias ccat="highlight --out-format=ansi"

# Editor
if set -q EDITOR
    alias e="$EDITOR"
end
alias _e="sudo -e"

# package management
alias aud='doas apt update'
alias apg='doas apt upgrade'
alias as='apt search'
alias ar='doas apt remove'
alias aar='doas apt autoremove'

# source fish config
alias sfc='source ~/.config/fish/config.fish'