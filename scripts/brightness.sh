#!/bin/bash

full_out=""
full_out+=$(brightness show | awk -F'/' '{ printf("%.0f", ($1/$2)*100) };')
full_out+="%"

short_out=$full_out
colour_out=""

printf "%s\n%s\n%s\n" "$full_out" "$short_out" "$colour_out"
