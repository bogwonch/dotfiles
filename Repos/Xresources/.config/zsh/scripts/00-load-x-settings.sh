which xrdb 2>&1 >/dev/null
if [ $? -eq 0 ]; then
	if [ -r "${HOME}/.Xresources" ]; then
		xrdb -I$HOME -load "${HOME}/.Xresources"
	fi
fi
