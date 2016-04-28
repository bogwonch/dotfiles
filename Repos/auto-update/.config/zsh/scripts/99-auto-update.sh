#! /bin/sh
# Checks the dotfiles are up to date

TIMESTAMP_FILE="${DOTFILES_HOME}/.timestamp"
UPDATE_INTERVAL=$(( 60 * 60 * 12 )) # How long between updates (12 hours)

function main {
    if [ ! -r "${TIMESTAMP_FILE}" ]; then
        lg d dotfiles-auto-update timestamp does not exist
        update_dotfiles
    elif [ -r "${TIMESTAMP_FILE}" ]; then
        local timestamp=$(head -n1 "${TIMESTAMP_FILE}")
        local current_time="$(date +%s)"
        if [ $(( ${current_time} - ${timestamp} )) -gt ${UPDATE_INTERVAL} ]; then
            lg d dotfiles-auto-update timestamp out of date
            update_dotfiles
        fi 
    fi
}

function update_dotfiles {
    lg i dotfiles-auto-update updating dotfiles
    cd "${DOTFILES_HOME}"
    git stash
    git pull --rebase
    git stash apply
    "${DOTFILES_HOME}/Scripts/install.sh"
    cd ~
    date +%s >"${TIMESTAMP_FILE}"
}

main
