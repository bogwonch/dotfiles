(use-package evil
  :ensure t
  :config (progn
	    (evil-mode 1)))

(use-package evil-surround
  :ensure t
  :config (progn
	    (global-evil-surround-mode 1)))

(use-package evil-leader
  :ensure t
  :config (progn
	    (global-evil-leader-mode)))

(evil-leader/set-leader "<SPC>")
(evil-leader/set-key
  ":" 'counsel-M-x
  "b" 'ivy-switch-buffer
  "e" 'counsel-find-file)
