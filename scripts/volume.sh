#!/bin/bash

if [[ $BLOCK_BUTTON == "1" ]]; then
	volume set-sink
fi

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
