#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}"  )" && pwd  )"
source "$CURRENT_DIR/helpers.sh"

crypto_ticker_name=$(get_tmux_option "@ticker_eth" )
main() {
       get_eth
}

get_eth()
{
    value=$(curl -s "https://api.cryptonator.com/api/ticker/$crypto_ticker_name" | sed -E 's/.*"price":"?([^,"]*)"?.*/\1/')

    if [[ ! -z "$value" ]]; then
        printf "${crypto_ticker_name}: %'.3f" $value
    fi
}

main

