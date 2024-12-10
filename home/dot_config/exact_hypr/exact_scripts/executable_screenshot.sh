#!/bin/bash
export GRIMBLAST_EDITOR="swappy -f" 

while [[ $# -gt 0 ]]; do
  case "$1" in
      -a|--area)
        grimblast edit area
      ;;
      -o|--output)
        grimblast edit output
      ;;
    *)
      echo "Unknown option: $1"
      exit 1
      ;;
  esac
  shift
done
