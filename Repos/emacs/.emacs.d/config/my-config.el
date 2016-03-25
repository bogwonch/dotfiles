(provide 'my-config)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; appearance
(scroll-bar-mode 0)
(tool-bar-mode 0)
(menu-bar-mode 0)
(fringe-mode 0)
  
;; backups
(defvar my-backup-directory (concat user-emacs-directory "backups"))
(if (not (file-exists-p my-backup-directory))
    (make-directory my-backup-directory))
(setq backup-directory-alist `(("." . ,my-backup-directory)))
(setq make-backup-files t  ; backup files the first time they're saved
      backup-by-copying t  ; don't clobber symlinks
      version-control t    ; version numbers for backups
      delete-old-versions t ; delete excess backups
      kept-old-versions 5
      kept-new-versions 9
      auto-save-default t
      auto-save-timeout 20
      auto-save-interval 200)
(setq create-lockfiles nil)

;; fonts
(defvar my-font "PragmataPro-11")
(add-to-list 'default-frame-alist `(font . ,my-font))
(set-face-attribute 'default t :font my-font)
(set-frame-font my-font nil t)

;; mac settings
(setq mac-option-key-is-meta t
      mac-option-modifier 'meta)
