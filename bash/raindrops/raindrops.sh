#!/usr/bin/env bash

main_v1 () {
  local output=""
  is_div3=$(( $1 % 3))
  is_div5=$(( $1 % 5))
  is_div7=$(( $1 % 7))
  if [ $is_div3 -eq 0 ]; then
    output+="Pling"
  fi
  if [ $is_div5 -eq 0 ]; then
    output+="Plang"
  fi
  if [ $is_div7 -eq 0 ]; then
    output+="Plong"
  fi
  if [ -z "$output" ]; then
    output+=$1
  fi
  echo $output
}

main () {
    if [ $# -ne 1 ]; then
        echo "Usage: $0 <number>" >&2
        return 1
    fi
    local result=""
    local result+=$(is_div $1 3 "Pling")
    local result+=$(is_div $1 5 "Plang")
    local result+=$(is_div $1 7 "Plong")
    if [ -z $result ]; then
        echo $1
    else
        echo $result
    fi
}

is_div () {
  local num=$1
  local div=$2
  local word=$3
  if (( num % div == 0 )); then
    echo -n "$word"
  fi
}

# call main with all of the positional arguments
main "$@"
