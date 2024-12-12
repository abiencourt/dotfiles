#!/bin/sh

# exit immediately if lpass is already in $PATH
type lpass >/dev/null 2>&1 && exit

case "$(uname -s)" in
Linux)
    brew install lastpass-cli
    lpass login --trust biencourt.adrien@live.fr
    ;;

*)
    echo "unsupported OS"
    exit 1
    ;;
esac
