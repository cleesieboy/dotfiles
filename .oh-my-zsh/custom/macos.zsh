if uname | grep "Darwin" ; then
    alias lsl="ls -lh"		            # long list
    alias lsa="ls -alStr" 	            # long list, sorted by ascending date  (i.e. last date last in list)
    alias ..='cd ..'            		# Go up one directory
    alias ...='cd ../..'        		# Go up two directories
    alias ....='cd ../../..'    		# And for good measure

    alias cp="cp -v"
    alias grep='grep --color=auto' 		# Always highlight grep search term
    alias ping='ping -c 5'      		# Pings with 5 packets, not unlimited
    alias df='df -Ph'            		# Disk free, in gigabytes, not bytes
    alias du='du -h -c'         		# Calculate total disk usage for a folder
    alias cf="find . | wc -l"		    # Calculate number of files in a folder
    alias more="less" 			        # Because really, why not?
    alias up="uptime"			        # How long have I been alive?
    alias rm="rm -i"			        # Prefer interactive rm
    alias free="free -h"			    # There are so many bytes!! Too many!! GET US OUT OF HERE!!
    alias psa="ps aux"			        # Show us a nice little list of the asshole processes hogging this machine.
    alias ts="tail -f /var/log/syslog"	# it was a most elusive fish!

    # replace some common unix-commands with other implementations
    alias top="htop"

    alias nh="ssh nethack43@nethack4.org"

    # tmux aliases
    alias tls='tmux ls'
    alias tnew='tmux new -s '
    alias ta='tmux a -t'
    alias tmux='tmux -2'

    alias vim='nvim'
    alias v='vim'

    # export VS Code path
    export PATH="$PATH:/Applications/Visual Studio Code - Insiders.app/Contents/Resources/app/bin"
    alias vs=\"/Applications/Visual\\ Studio\\ Code.app/contents/Resources/app/bin/code\"

    export BYOBU_PREFIX=/usr/local
fi
