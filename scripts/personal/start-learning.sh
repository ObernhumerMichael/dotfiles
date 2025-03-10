#!/bin/bash

# To use the script execute the following line
# ln -s $(pwd)/start-learning.sh ~/.local/bin/start-learning

SESH="learning"

tmux has-session -t $SESH 2>/dev/null

if [ $? != 0 ]; then
  cd $HOME/repos/learning/

  tmux new-session -d -s learning 
  tmux send-keys "nvim" C-m

  tmux new-window -n support
  tmux send-keys "find ./ -name '*.md'| entr ./build.sh /_ " C-m
  tmux split-window -h
  tmux send-keys "o ./books/make_it_stick/notes.pdf" C-m
  tmux split-window -v
  tmux send-keys "firefox" C-m

  tmux select-window -t 0 
  tmux attach-session -t learning
else
  echo "Session is already running."
fi

