alias sysmon="gnome-system-monitor"
alias md="mkdir"
alias cls="clear"
alias py="python3"
alias cleartrash="sudo rm -rf ~/.local/share/Trash/info/* ~/.local/share/Trash/files/*"
alias torrent=qbittorrent
alias eqzr=pulseaudio-equalizer-gtk
alias paint=kolourpaint

cgidir="/usr/lib/cgi-bin"
wwwdir="/var/www/"
logdir="/var/log/apache2"
sitedir="/var/www/site"
ol="/home/alex/Документы/olimp/valid/"
xbind=.xbindkeysrc

function he {
    $1 --help;
}
function h {
    $1 -h
}

function whtr {
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

