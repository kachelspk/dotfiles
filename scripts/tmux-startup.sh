#!/bin/sh
#
session="pdk"

cd /Users/141197/ubuntu/sidekick/pdk
# set up tmux
tmux start-server

# create a new tmux session, starting vim from a saved session in the new window
tmux new-session -d -s $session -n nvim #"vim -S ~/.vim/sessions/kittybusiness"

# create a new window called scratch
tmux new-window -t $session:2 -n pdk

tmux send-keys "bash" ENTER
tmux send-keys "source build/envsetup.sh; lunch hoki-userdebug" ENTER
# return to main vim window

# Finished setup, attach to the tmux session!
tmux attach-session -t $session
