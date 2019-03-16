#!/bin/bash

# Behaviour:
# <battery percent>% icon dependent on charge etc.

function numToIcon {
	num=$(($1))
	if [[ $num -le 21 ]]; then
		echo ""
	fi
	if [[ $num -le 41 ]]; then
		echo ""
	fi
	if [[ $num -le 61 ]]; then
		echo ""
	fi
	if [[ $num -le 81 ]]; then
		echo ""
	fi
	if [[ $num -le 101 ]]; then
		echo ""
	fi
}

function printColour() {
	num=$(($1))
	if [[ $num -le 20 ]]; then
		echo "#FF2000"
	fi
	if [[ $num -le 40 ]]; then
		echo "#E8780C"
	fi
	if [[ $num -le 60 ]]; then
		echo "#FFC600"
	fi
	if [[ $num -le 80 ]]; then
		echo "#D1E80C"
	fi
	if [[ $num -le 100 ]]; then
		echo "#11FF0D"
	fi
}

percent="$(acpi --battery | awk '{print $4};' | sed 's/,\|%//g')"
battery_status="$(acpi --battery | awk '{print $3};' | sed 's/,//')"

output=""
colour=""
case $battery_status in
	Discharging) 
		output+="$(numToIcon $percent)"
		colour="$(printColour $percent)"
		;;
	Charging)
		output+=""
		;;
	Full)
		output+=""
		;;
	*)
		output+=""
		;;
esac

output+=" ${percent}%"

printf "%s\n%s\n%s\n" "$output" "$percent" "$colour"

test ${percent} -le 20 && exit 33 || exit 0

