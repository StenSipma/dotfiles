sinknumber=$(pactl list sinks short | awk '{print $1 " : " $2};' | sed 's/bluez_sink.*$/Bluetooth/; s/alsa_output.*$/Laptop/;' | rofi -dmenu -only-match -theme Arc-Dark-Custom| awk '{print $1};') 

export SELECTED_SINK=$sinknumber
