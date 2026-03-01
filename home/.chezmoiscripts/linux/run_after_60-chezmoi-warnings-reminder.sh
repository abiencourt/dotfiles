#!/bin/bash

echo "----- start: 60-chezmoi-warnings-reminder.sh -----"

if [[ -f /tmp/chezmoi_warnings.log ]]; then
  tput bold; tput setaf 3
  echo "⚠️  Warnings Recap:"
  tput sgr0
  tput setaf 3
  cat /tmp/chezmoi_warnings.log
  tput sgr0
  rm /tmp/chezmoi_warnings.log
else
  echo "No chezmoi warnings to display"
fi

echo "----- end: 60-chezmoi-warnings-reminder.sh -----"
