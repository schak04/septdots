#!/bin/bash

# 1. Launch Cava in a vertical split. 
# --no-response makes it trigger instantly without waiting for a returned value.
kitten @ launch --type=window --location=vsplit --no-response cava

# 2. Play the audio track inside the current Yazi pane headlessly
mpv --vid=no "$@"

# 3. Automatically close the adjacent Cava split once mpv exits
# This targeting matches any window in the current tab running 'cava'
kitten @ close-window --match "title:cava"
