#######################################################
# my functions and aliases
#############################
cgidir="/usr/lib/cgi-bin"
wwwdir="/var/www/"
logdir="/var/log/apache2"
sitedir="/var/www/site"
ol="/home/alex/Документы/olimp/"
xbind=.xbindkeysrc


alias sysmon="gnome-system-monitor"
alias md="mkdir"
alias cls="clear"
alias py="python3"
alias cleartrash="sudo rm -rf ~/.local/share/Trash/info/* ~/.local/share/Trash/files/*"
alias torrent=qbittorrent
alias eqzr=pulseaudio-equalizer-gtk
alias paint=kolourpaint
alias twtool=gnome-tweak-tool
alias filemgr="gksudo nautilus"
alias conns="sudo grep psk= /etc/NetworkManager/system-connections/*"
alias phototags=exiftool
alias colorlog="ccze -A <"
alias a2r="sudo service apache2 restart"
alias setupblth=gnome-file-share-properties
alias bluetooth=blueman-services
alias proxyset="sudo nano /etc/environment"
alias exif=exiftool
alias tcp="sudo tcpdump"

function wifi_reboot {
    pkill nm-applet
    nm-applet&
}

function prompt {
    #PS1="user@localhost:\w$ "
    PS1="\e[38;5;9muser\e[0m@\e[38;5;10mlocalhost\e[0m:\e[38;5;11m\w\e[0m$ "
}

function prompt2 {
    PS1='\033[01;34m\w\033[00m\$ '
}

function srchl {
    source-highlight -f esc256 -i $1
}

function srchl_sep {
    source-highlight -f esc256 -i $1 | less -R
}

function h {
    $1 --help;
}


function wthr {
    curl http://wttr.in/$1
} 

function f9 { # as f10
#    __f9_screen=
#    if [[ $__f9_screen ]]
#    then
#        __f9_cmd=on
#    else
        __f9_cmd=off
#    fi
    xset -display :0.0 dpms force $__f9_cmd
#    xset dpms force $__f9_cmd
}

function wifi {
    # $1 - name $2 - pass [not nessasry]
    sudo create_ap wlp1s0 wlp1s0 $1 $2
}
function wifiscan {
    sudo iw dev wlp1s0 scan
}


#######################################################
#
#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
#export SDKMAN_DIR="/home/alex/.sdkman"
#[[ -s "/home/alex/.sdkman/bin/sdkman-init.sh" ]] && source "/home/alex/.sdkman/bin/sdkman-init.sh"
