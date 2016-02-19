fg () { find . -type f -exec grep -H "$*" {} \; }
mkcd () { mkdir -p "$*"; cd "$*"  }
fg () { find . -type f -exec grep -H "$*" {} \; }


