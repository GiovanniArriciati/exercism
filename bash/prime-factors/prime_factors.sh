#!/usr/bin/env bash

export primes=()
isprime_array() {
    local n=$1
    for p in ${primes[@]}; do
        if (( n % p == 0 )); then
            return 1
        fi
    done
    primes+=("$n")
    # echo "${primes[@]}"
    return 0
}

isprime() {
    local n=$1
    local i
    for (( i=2; i*i<=n; i++ )); do
        if (( n % i == 0 )); then
            return 1
        fi
    done
    return 0
}

main_with_primality_check() {
    local n=$1
    local output=()

    # Handle factor 2
    while [ $((n % 2)) -eq 0 ]; do
        output+=("2")
        n=$((n / 2))
    done   
    for ((i=3; i<=n; i+=2)); do
        if isprime_array "$i";then
            while (( n % i == 0 )); do
                output+=("$i")
                n=$((n / i))
            done
        fi
    done
    echo "${output[@]}"
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
        while ((n % i == 0)); do
            output+=("$i")
            n=$((n / i))
        done
    done
    if [ $n -gt 1 ]; then
        output+=("$n")
    fi
    echo "${output[@]}"
}

# main $@
main_with_primality_check $@