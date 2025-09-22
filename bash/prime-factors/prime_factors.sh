#!/usr/bin/env bash

isprime() {
    local n=$1
    for (( i=2; i*i<=n; i++ )); do
        if (( n % i == 0 )); then
        return 1
        fi
    done
    return 0
}

main() {
    local n=$1
    local output=()
    # Handle factor 2
    while [ $((n % 2)) -eq 0 ]; do
        output+=("2")
        n=$((n / 2))
    done    
    # Handle odd factors
    for ((i=3; i*i<=n; i+=2)); do
            output+=("$i")
            n=$((n / i))
        done
    done
    if [ $n -gt 1 ]; then
        output+=("$n")
    fi
    echo "${output[@]}"
}

main $@