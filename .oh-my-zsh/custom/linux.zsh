#if uname  | grep "Linux"; then
  # add /usr/games so root can run fortune on linux w/o giving a path.
  PATH=/usr/games:$PATH

  alias cd="builtin cd" # alias to make sure we use builtin version when sudo'ing
  alias ls="ls --color=auto"		    # a bit of color to lighten the mood
#  alias lsl="ls -lh"		        # long list
#  alias lsa="ls -alh" 	            # long list, all files
  alias lss="ls -alhStr"            # long lost, all files, sorted descending date
  alias ..='cd ..'            		# Go up one directory
  alias ...='cd ../..'        		# Go up two directories
  alias ....='cd ../../..'    		# And for good measure

  alias cp="cp -v"
  alias grep='grep --color=auto' 		# Always highlight grep search term
  alias ping='ping -c 5'      		# Pings with 5 packets, not unlimited
  alias df='df -h'            		# Disk free, in gigabytes, not bytes
  alias du='du -h -c'         		# Calculate total disk usage for a folder
  alias cf="find . | wc -l"		    # Calculate number of files in a folder
  alias more="less" 			        # Because really, why not?
  alias up="uptime"			        # How long have I been alive?
  alias rm="rm -i"			        # Prefer interactive rm
  alias free="free -h"			    # There are so many bytes!! Too many!! GET US OUT OF HERE!!
  alias psa="ps -aux"			        # Show us a nice little list of the asshole processes hogging this machine.
  alias ts="tail -f /var/log/syslog"	# it was a most elusive fish!
  alias iotop='iotop -d3 -P -o'
  alias t='top'
  alias pgrep='ps aux | grep -i '
  alias sysgrep='cat /var/log/syslog | grep -i '
  alias psgrep='ps -aux | grep -i '
  alias systail='tail -f /var/log/syslog'
  # aptitude
  alias au="aptitude update"
  alias af="aptitude full-upgrade"
  alias as="aptitude search"
  alias auaf="aptitude update; aptitude full-upgrade"

  # make extended globbing a bit easier
  alias lsg="printf '%s\n'"

  # replace some common unix-commands with other implementations
  alias top="htop"
  alias it="iotop"
  alias iptraf='iptraf-ng'

  alias -g H='| head'
  alias -g T='| tail'
  alias -g G='| grep'
  alias -g L="| less"
  alias c='cat'

  # we use isc-dhcp-server, not busybox/udhcpd, alias dupleases to cat lease-file
  alias dumpleases="cat /var/lib/dhcp/dhcpd.leases"

  # v is is for vim is for nvim
  alias vim='nvim'
  alias v='vim'

  # get external ip
  alias extip="curl icanhazip.com"

  # tmux aliases
  alias tls='tmux ls'
  alias tnew='tmux new -s '
  alias ta='tmux a -t'
  alias tmux='tmux -2'

  alias iostat='iostat -m'

  # print humanly readable timestamps
  alias dmesg='dmesg -e'

  # unrar
  alias urt='unrar t *.rar'
  alias url='unrar l *.rar'
  alias ure='unrar e *.rar'

  # added space after sudo to allow for aliases
  alias sudo='sudo '

  # thefuck
  alias f='fuck'
 
  # becuase it's longer?
  alias help='man'

  alias tf='tail -fn25 '

  alias fd='find . -type d -name '
  alias ff='find . -type f -name '

  alias sql='mysql'

  # waste a few hours playing the game of games..
  alias nh="ssh nethack43@nethack4.org"

  # run snapper-gui via sux to allow it to run as root but still open x
  alias snapper-gui='sux root snapper-gui'

  # golang
  export GOPATH="$HOME/.golang"

  # use byobu instead of callong screen directly
  alias screen='byobu'
  export BYOBU_PREFIX=/usr
  export BYOBU_CONFIG_DIR=~/.byobu

  export TERM="xterm-256color"
#fi

