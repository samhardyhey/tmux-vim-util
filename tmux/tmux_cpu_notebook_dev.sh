#!/bin/sh
# new session, called dev, with  the first window named watch
tmux new-session -s 'tmux_cpu_notebook_dev' -n 'watch_notebook_server' -d

# htop within the top pane
tmux send-keys -t tmux_cpu_notebook_dev:watch_notebook_server 'htop' C-j

# gpu watch on the lower-left
tmux split-window -h
tmux send-keys -t 1 'jupyter notebook' C-j

# second window for bashing
tmux new-window 'bash'
tmux split-window -h

# return to first window
tmux select-window -t $tmux_cpu_notebook_dev:watch_notebook_server

# attach to the session
tmux -2 attach-session -d