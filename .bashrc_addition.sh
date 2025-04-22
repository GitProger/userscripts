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
alias hwid="cat /etc/machine-id"
alias packlist="apt-mark showmanual"
alias clearswap="sudo swapoff -a && sudo swapon -a"
alias mfix="sudo update-grub" # mouse fix on ubuntu 20.04
alias pls="pulseaudio -k"
alias psl='cat /var/log/syslog* | grep -i "`LC_ALL=en_US.utf8 date +"%b %d"`.*pulseaudio"'
alias KILL="sudo kill -9"
alias gitdef="git add . && git commit -m upd && git push"
alias boop="play -q -V0 -n synth trim 0 0.1 vol 1" # sox
alias notif="notify-send -u critical -c " # notif $theme $text
alias g=git

alias ..="cd .."
alias ...="cd ../.."

alias nst="nvidia-settings"
alias sud="sudo echo -n"
alias neo="neofetch"
alias rl="rlwrap"
alias msg="notify-send -u critical"

alias lisp="rlwrap sbcl" #clisp
alias lispr="sbcl --script"
alias clj="clojure"
alias lisp1="rlwrap guile" #scheme #scm
alias lispp="rlwrap picolisp"

alias hs=ghc
alias hsi=ghci
alias oc="rlwrap ocaml"

alias cf=/home/alex/go/src/github.com/xalanq/cf-tool/cf-tool
export GOPATH=/home/alex/go
alias goi="rlwrap /home/alex/go/bin/yaegi"

alias golint="$GOPATH/bin/golangci-lint"

function lookup {
   grep -Rnw $1 -e $2
}

alias temp=sensors

#alias protoc=$GOPATH/bin/protoc-gen-go
#alias fly=/home/alex/.fly/bin/fly

function twu {
  twitch api get users -q login=$1
}

alias java8=/usr/lib/jvm/java-8-openjdk-amd64/jre/bin/java
alias java11=/usr/lib/jvm/java-11-openjdk-amd64/bin/java
alias java17=/usr/lib/jvm/java-17-openjdk-amd64/bin/java
alias java21=/usr/bin/java

#alias vcpkg=/opt/vcpkg/vcpkg

alias dotheyreallyknowcpp="cat \`find | grep -E '\.(cpp|h|c)'\` | grep -E '(typename|delete|new |_ptr)'"
#cat $(find | grep -E '\.(cpp|h|c)') | grep -E '(typename|delete|new|_ptr)'

alias viu=/home/alex/.cargo/bin/viu


alias tcp129="sudo bash -c 'echo 129 > /proc/sys/net/ipv4/ip_default_ttl'"


function red { echo -e "\033[31;1m$@\033[0;m" ; }
function green { echo -e "\033[32;1m$@\033[0;m" ; }
function yellow { echo -e "\033[33;1m$@\033[0;m" ; }
function blue { echo -e "\033[36;1m$@\033[0;m" ; }
function rred { echo -e "\033[31;3m$@\033[0;m" ; }
function ggreen { echo -e "\033[32;3m$@\033[0;m" ; }
function yyellow { echo -e "\033[33;3m$@\033[0;m" ; }
function bblue { echo -e "\033[36;3m$@\033[0;m" ; }

function tmppw {
    echo "Use pwgen for real accs"
    echo -n $1 | md5sum | sha256sum | head -c 16
    echo
}


function wifi_reboot {
    pkill nm-applet
    nm-applet&
}

function prompt {
    #PS1="user@localhost:\w$ "
    PS1="\e[1;32m\u\e[0m@\e[1;31mlocalhost\e[0m:\e[1;34m\w\e[0m$ "
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
    $@ --help;
}

function upgrade {
    echo "apt update"
    sudo apt update
    echo "apt upgrade"
    sudo apt upgrade
    echo "snap refresh"
    sudo snap refresh
}

function md5    { echo -n $1 | md5sum; }
function sha1   { echo -n $1 | sha1sum; }
function sha256 { echo -n $1 | sha256sum; }
function sha512 { echo -n $1 | sha512sum; }

function swap() {
    local tempfile=tmp.$$.$RANDOM
    mv "$1" $tempfile && mv "$2" "$1" && mv $tempfile "$2"
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
    sudo create_ap wlp0s20f3 wlp0s20f3 $1 $2
}
function wifiscan {
    sudo iw dev wlp0s20f3 scan
}

function out {
    if [[ -d "$1" ]]; then # dir
        ls "$@"
    else # file
        cat "$@"
    fi
}

function clear_history_used {
  echo > ~/.local/share/recently-used.xbel
}

#arp ip nmap lsof netstat ss

###################################################################################


PATH="/home/alex/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/alex/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/alex/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/alex/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/alex/perl5"; export PERL_MM_OPT;

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
alias godoc=/home/alex/go/bin/godoc

[ -f "/home/alex/.ghcup/env" ] && . "/home/alex/.ghcup/env" # ghcup-env
