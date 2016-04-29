if [ -r "${HOME}/.Xresources" ]; then
  xrdb -load "${HOME}/.Xresources"
fi
