fg () { find . -type f -exec grep -H "$*" {} \; }
mkcd () { mkdir -p "$*"; cd "$*"  }
alias api="sudo apt-get install "
alias aps="sudo apt-cache search "
alias es="env|grep -i "

