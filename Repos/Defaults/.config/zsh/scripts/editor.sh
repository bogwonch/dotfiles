vim="$(which nvim)"
if [ $? -eq 0 ]; then
  export EDITOR=nvim
  export VISUAL=nyaovim
else
  export EDITOR=vim
fi
