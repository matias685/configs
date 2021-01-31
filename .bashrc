#
# ~/.bashrc
#

# If not running interactively, don't do anything

# export defaults
export TERM='st-256color'
export EDITOR='vim'

[[ $- != *i* ]] && return

alias ls='exa'
alias ..='cd ..'


# better tab auto-complete
bind "set completion-ignore-case on"
# bind "set show-all-if-ambiguous on"

PS1='[\u@\h \W]\$ '

# pacman commands
alias pacsyu='doas pacman -Syu'				# update standard pkgs
alias parusyu='paru -Sua'				# update AUR pkgs
alias pacin='doas pacman -S'				# install standard pkgs
alias paruin='paru -S'					# install AUR pkgs
alias pacrm='doas pacman -Rns'				# remove standard pkgs
alias parurm='paru -Rns'				# remove AUR pkgs
alias unlock='doas rm /var/lib/pacman/db.lock'		# remove pacman lock
alias pacclean='doas pacman -Rns $(pacman -Qtdq)'	# remove orphans

# add flags
alias df='df -h'					# human readable
alias free='free -m'					# show sizes in MB
alias ll='exa -lah'					# list files
alias la='exa -a'					# show hidden files
alias myip='curl ipinfo.io/ip'				# show my ip
alias untar='tar -zxvf'					# extract tar

# programs
alias ff-nightly='/opt/firefox-nightly/firefox'		# open firefox nightly
alias pia='/opt/piavpn/bin/pia-client'			# open my vpn service

# get error messages from journalctl
alias jctl='journalctl -p 3 -xb'

# starship prompt
eval "$(starship init bash)"
