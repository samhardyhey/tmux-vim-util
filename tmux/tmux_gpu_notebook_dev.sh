#!/bin/sh
# new session, called tmux_gpu_notebook_dev, with  the first window named watch_notebook_server
tmux new-session -s 'tmux_gpu_notebook_dev' -n 'watch_notebook_server' -d

# htop within the top-left pane
tmux send-keys -t tmux_gpu_notebook_dev:watch_notebook_server 'htop' C-j

# nvidia-smi gpu watch on the lower-left pane
tmux split-window -v
tmux send-keys -t 1 'watch -n 0.5 nvidia-smi' C-j

# notebook server on the right
tmux split-window -h
tmux send-keys -t 2 'jupyter notebook' C-j

# second window for bash/whatever
tmux new-window 'bash'
tmux split-window -h

# return to first window
tmux select-window -t $tmux_gpu_notebook_dev:watch_notebook_server

# attach to the session
tmux -2 attach-session -d