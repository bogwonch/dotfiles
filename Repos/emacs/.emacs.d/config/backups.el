;; Don't polute the filesystem
(custom-set-variables
 '(auto-save-file-name-transforms '((".*" "~/.emacs.d/autosaves/\\1" t)))
 '(backup-directory-alist '((".*" . "~/.emacs.d/backups"))))
(make-directory "~/.emacs.d/autosaves" t)
(make-directory "~/.emacs.d/backups" t)
