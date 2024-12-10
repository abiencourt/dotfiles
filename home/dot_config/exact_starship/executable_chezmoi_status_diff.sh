#!/bin/bash

output=""
status=$(chezmoi status -x scripts 2>&1)

[[ "$status" == *"warning:"* ]] && output="${output}" # Unlikely that a file is called "warning:"

sourceStatus=$(echo "$status" | cut -c 2)
destinationStatus=$(echo "$status" | cut -c 1)

# destination
[[ $(echo "$destinationStatus" | wc -l) -gt 0 ]] && output="${output}⇡"

# source
[[ $(echo "$sourceStatus" | wc -l) -gt 0 ]] && output="${output}⇣"

# modified
[[ ($sourceStatus == *'M'*) || ($destinationStatus == *'M'*) ]] && output="${output}!"

# added
[[ ($sourceStatus == *'A'*) || ($destinationStatus == *'A'*) ]] && output="${output}+"

# deleted
[[ ($sourceStatus == *'D'*) || ($destinationStatus == *'D'*) ]] && output="${output}✘"

# review scenarios based on https://starship.rs/config/#git-status

echo $output
