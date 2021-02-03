set fish_greeting		# turn off intro message
set TERM "st"			# set terminal
set EDITOR "vim"		# set text editor
set BROWSER "firefox-esr"	# set browser to firefox-esr


# Custom function for line count
function line-count
	wc -l | string trim
end

# Custom function for listing installed programs
function count-installed
	apt list --installed | string trim
end

# Custom function for listing ram hogs
function memhogs
	ps axh -o cmd:15,%mem --sort=-%mem | head | string trim
end

# Custom function for listing cpu hogs
function cpuhogs
	ps axh -o cmd:15,%cpu --sort=-%cpu | head
end

# Function to find resolutions of monitors
function resolution
	 xrandr | grep \* | sed 's/59.95\*+//g'
end

# Function to print percent used hard drive space
function hdd
	df -h /home | grep /dev | awk '{print $3 "/" $5}'
end

### Abbreviations ###

abbr apti 'sudo apt install'
abbr aptinr 'sudo apt install --no-install-recommends'
abbr aptc 'sudo apt clean'
abbr aptu 'sudo apt update'
abbr aptr 'sudo apt remove'
abbr df 'df -h'
abbr free 'free -m'
abbr reboot 'sudo reboot'
abbr h 'cd ~/'
abbr c 'clear'
abbr .. 'cd ..'
abbr ... 'cd ../..'
abbr v 'vim'
abbr ll 'ls -l'
abbr la 'ls -A'
abbr ls. 'ls -A | egrep "^\."'
abbr q 'exit'
abbr d 'cd ~/Downloads'
abbr grep 'grep --color=auto'
abbr cp 'cp -i'
abbr mv 'mv -i'
abbr rm 'rm -i'
abbr .c 'cd ~/.config'
abbr pk 'sudo pkill'
abbr cdwm 'cd ~/suckless/dwm'
abbr cst 'cd ~/suckless/st'
