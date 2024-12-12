#!/bin/sh

# exit immediately if lpass is already in $PATH
type lpass >/dev/null 2>&1 && exit

case "$(uname -s)" in
Linux)
    echo "Setting up LastPass..."
    brew install lastpass-cli
    echo "Enter your LastPass email address: "
    read -r email
    lpass login --trust "$email"

    ;;

*)
    echo "unsupported OS"
    exit 1
    ;;
esac
