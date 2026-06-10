#!/usr/bin/env bash

SOURCE_URL='https://raw.githubusercontent.com/github/gemoji/master/db/emoji.json'
EMOJIS_FILE="$HOME/.data/emojis"


json_to_text() {
    text="$(echo "$1" | jq -r '.[] | "\(.emoji) \(.description) - \(.category)"')"
    echo "$text"
}   

fetch_json() {
    local json
    json=$(curl -f -s "$SOURCE_URL" 2>&1)
    
    if [[ $? -ne 0 ]] || [[ -z "$json" ]];then
        return 1
    fi

    echo "$json"

    return 0
}

get() {
    echo "$(cat "$EMOJIS_FILE")"
}

save() {
    echo "$1" > "$EMOJIS_FILE"
}

if [[ ! -f $EMOJIS_FILE ]];then
    json="$(fetch_json)"
    
    if [[ $? -ne 0 ]];then
        notify-send "Can't load emojis"
        exit 1
    fi

    text="$(json_to_text "$json")"
    save "$text"
fi

selected="$(get | fuzzel -d)"

if [[ ! -z "$selected" ]];then
    wl-copy "$(echo "$selected" | grep -Po '^\X')"
fi
