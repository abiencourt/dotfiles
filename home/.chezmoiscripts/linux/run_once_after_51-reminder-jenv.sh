#!/bin/bash

echo "----- start: 51-reminder-jenv.sh -----"

echo "Enabling export plugin for jenv..."
eval "$(jenv init -)"
jenv enable-plugin export
jenv enable-plugin maven

echo "Adding JDK 17 to jenv..."
jenv add $HOMEBREW_PREFIX/opt/openjdk@17

chezmoi_warnings+=("/!\ Restart shell for jenv to set JAVA_HOME /!\ ")

echo "----- end: 51-reminder-jenv.sh -----"
