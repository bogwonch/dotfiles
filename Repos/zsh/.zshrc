autoload -U compaudit compinit

# Load scripts from the config dir
zsh_config_dir="${HOME}/.config/zsh/scripts"
if [ -d "${zsh_config_dir}" ]; then
  for script in ${zsh_config_dir}/*.sh; do
    logger debug .zshrc "sourcing $(basename script)"
    source "${script}"
  done
else
  logger warn .zshrc "couldn't find config file directory: no personal setting will be loaded"
fi

