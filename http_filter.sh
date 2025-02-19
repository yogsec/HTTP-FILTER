#!/bin/bash

VERSION="HTTP FILTER v1.0 | Designed By YogSec"
HEADER="HTTP FILTER | Designed By YogSec"

display_help() {
    echo -e "\e[1;32m$HEADER\e[0m"
    echo "Usage: $0 [options]"
    echo "Options:"
    echo "  -h              Show this help message"
    echo "  -v              Show version information"
    echo "  -l <file>       Process a list of URLs from a file"
    echo "  -d <url>        Check a single URL"
    exit 0
}

display_version() {
    echo -e "\e[1;34m$VERSION\e[0m"
    exit 0
}

process_list() {
    INPUT_FILE=$1
    OUTPUT_DIR="${INPUT_FILE%.*}_responses"
    mkdir -p "$OUTPUT_DIR"

    process_url() {
        url=$1
        response=$(curl -s -o /dev/null -w "%{http_code}" --max-time 10 "$url")
        if [ "$response" == "000" ]; then
            echo "$url" >> "$OUTPUT_DIR/failed.txt"
            echo -e "\e[1;31m[FAILED] $url\e[0m"
        else
            echo "$url" >> "$OUTPUT_DIR/$response.txt"
            echo -e "\e[1;32m[$response] $url\e[0m"
        fi
    }

    export -f process_url
    export OUTPUT_DIR

    cat "$INPUT_FILE" | xargs -P 10 -I {} bash -c 'process_url "$@"' _ {}
}

check_single_url() {
    url=$1
    response=$(curl -s -o /dev/null -w "%{http_code}" --max-time 10 "$url")
    if [ "$response" == "000" ]; then
        echo -e "\e[1;31m[FAILED] $url\e[0m"
    else
        echo -e "\e[1;32m[$response] $url\e[0m"
    fi
}

if [ $# -eq 0 ]; then
    display_help
fi

while getopts ":hvl:d:" opt; do
    case $opt in
        h)
            display_help
            ;;
        v)
            display_version
            ;;
        l)
            process_list "$OPTARG"
            ;;
        d)
            check_single_url "$OPTARG"
            ;;
        *)
            echo "Invalid option: -$OPTARG" >&2
            display_help
            ;;
    esac
done
