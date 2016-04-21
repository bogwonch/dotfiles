export LS_COLORS='no=00;37:fi=00:di=00;33:ln=04;36:pi=40;33:so=01;35:bd=40;33;01:'

if [ "$(uname)" = 'Darwin' ]; then
    alias ls='ls -G -p'
else
    alias ls='ls --color=auto -p'
fi
alias -s git='git clone --recursive'
