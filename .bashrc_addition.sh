alias sysmon="gnome-system-monitor"
alias md="mkdir"
alias cls="clear"
alias py="python3"
alias cleartrash="sudo rm -rf ~/.local/share/Trash/info/* ~/.local/share/Trash/files/*"
alias torrent=qbittorrent
alias eqzr=pulseaudio-equalizer-gtk
alias paint=kolourpaint
alias twtool=gnome-tweak-tool

cgidir="/usr/lib/cgi-bin"
wwwdir="/var/www/"
logdir="/var/log/apache2"
sitedir="/var/www/site"
ol="/home/alex/Документы/olimp/"
xbind=.xbindkeysrc
alias conns="sudo grep psk= /etc/NetworkManager/system-connections/*"

function he {
    $1 --help;
}
function h {
    $1 -h
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

