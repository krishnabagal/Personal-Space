#-------------------
# Personnal Space
#-------------------

export PATH=$PATH:/usr/lib/nagios/plugins/
export PATH=$PATH:/usr/lib/nagios/plugins/libexec/
export GREP_COLOR='0;35'
export GREP_OPTIONS='--color=auto'
alias cp='cp -apvri'
alias mv='mv -v'
alias df='df -Th'
alias h='history'
alias ..2="cd ../.."
alias ..3="cd ../../.."
alias ..4="cd ../../../.."
alias ..5="cd ../../../../.."
alias nc="nc -v -w 5"
alias pwd="pwd -P"
alias cls="clear"
alias ssh="ssh -v"
who=`/usr/bin/whoami`
date=`date +%d%m%Y`

PS1="|\[\e[34m\]\A:\[\e[32m\]\h:\[\e[33m\]:\[\e[36m\]\u:\[\e[35m\]\w:\[\e[31m\]\$?\[\e[0m\]:>> "

kbtomb()
{
        echo $1 | awk '{ size = $1 / 1024 / 1024 ; print size "MB" }'
}

whatmypubIP()
{
        /usr/bin/dig +short myip.opendns.com @resolver1.opendns.com
}

whatmypvtIP()
{
        /usr/bin/curl -s ifconfig.me/forwarded
}

cpf()
{
        if [ ! -d "/home/$who/backup" ]; 
        then
                echo -e "\t\tBackup directory is missing.."
                mkdir -vp /home/$who/backup
        fi

        /bin/cp -v $1 /home/$who/backup/$1-$date.bak
}

function extract()
{
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)   tar xvjf $1     ;;
            *.tar.gz)    tar xvzf $1     ;;
            *.bz2)       bunzip2 $1      ;;
            *.rar)       unrar x $1      ;;
            *.gz)        gunzip $1       ;;
            *.tar)       tar xvf $1      ;;
            *.tbz2)      tar xvjf $1     ;;
            *.tgz)       tar xvzf $1     ;;
            *.zip)       unzip $1        ;;
            *.Z)         uncompress $1   ;;
            *.7z)        7z x $1         ;;
            *)           echo "'$1' cannot be extracted via extract" ;;
        esac
    else
        echo "'$1' is not a valid file!"
    fi
}

genpas() {
        local l=$1
        [ "$l" == "" ] && l=16
        tr -dc A-Za-z0-9_ < /dev/urandom | head -c ${l} | xargs
}
