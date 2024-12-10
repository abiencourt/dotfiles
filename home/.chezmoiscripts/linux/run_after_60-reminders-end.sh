#!/bin/bash

echo "----- start: 60-reminder-end.sh -----"

if declare -p chezmoi_warnings &> /dev/null; then
  for chezmoi_warning in "${chezmoi_warnings[@]}"; do
    echo "$chezmoi_warning"
  done
else
  echo "No chezmoi warnings to display"
fi

echo "----- end: 60-reminder-end.sh -----"
