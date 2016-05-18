if [ -r "${HOME}/.Xresources" ]; then
  xrdb -I$HOME -load "${HOME}/.Xresources"
fi
