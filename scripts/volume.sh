#!/bin/bash

case $BLOCK_BUTTON in
	1) volume set-sink;;
	4) volume up;;
	5) volume down;;
esac

full_out=""
if [[ "$(volume show-muted)" == "no" ]]; then
	full_out+=" "
else
	full_out+=" "
fi

full_out+="$(volume show)%"

short_out=$full_out
colour_out=""
printf "%s\n%s\n%s\n" "$full_out" "$short_out" "$colour_out"
