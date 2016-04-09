#! /usr/bin/env bash
# Installs all the dotfiles

dotfiles="${DOTFILES_REPO:-${HOME}/Dotfiles}"
logger="${dotfiles}/Scripts/lg"

# Test if stow is installed: if not error and exit
which stow 2>&1 >/dev/null
if [ $? -eq 1 ]; then
  $logger error "$(basename "${0}")" "couldn't find stow: install it and try again"
  exit 1
fi

# Install everything
for pkg_path in ${dotfiles}/Repos/*; do
  pkg="$(basename "${pkg_path}")"
  $logger info "${0}" "installing ${pkg}"
  stow -t "${HOME}" -d "${dotfiles}/Repos" --ignore README --restow "${pkg}"
  if [ $? -ne 0 ]; then
    $logger warn "$(basename "${0}")" "failed to install ${pkg}"
  fi
done


