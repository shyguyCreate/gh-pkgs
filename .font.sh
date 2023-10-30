#!/bin/sh

install_font()
{
    printf "Begin %s installation..." "$program_name"

    #Install fonts globally
    find "$1" -maxdepth 1 -mindepth 1 -type f -name "$2" -exec sudo cp '{}' "$installDir" \;

    [ -d "$installDir" ] && [ -n "$(ls "$installDir")" ] && printf "Finished\n" || printf "Failed\n"
}