#!/bin/bash

# Get the list of window names with index, highlight the active window with a "*".
OUTPUT=$(tmux lsw -F '#{window_index}:#W#{?window_active,* ,}' | paste -sd ' ' -)

# Print the output without directly using tmux's display-message
tmux display-message  "$OUTPUT"

