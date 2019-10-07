#!/bin/sh
# new session, called tmux_cpu_notebook_dev, with the first window named watch_notebook_server
tmux new-session -s 'tmux_cpu_notebook_dev' -n 'watch_notebook_server' -d

# htop within the left pane
tmux send-keys -t tmux_cpu_notebook_dev:watch_notebook_server 'htop' C-j

# jupyter notebook server on the right pane
tmux split-window -h
tmux send-keys -t 1 'jupyter notebook' C-j

# second window with split panes for bash/whatever
tmux new-window 'bash'
tmux split-window -h

# return to first window
tmux select-window -t $tmux_cpu_notebook_dev:watch_notebook_server

# attach to the session
tmux -2 attach-session -d
