#if [ -n "$(zsh --version)" ]; then
if [ -f "/usr/bin/zsh" ]; then
   exec /usr/bin/zsh -l
else
   source $HOME/.bashrc
fi
