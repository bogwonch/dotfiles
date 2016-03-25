(use-package which-key
  :ensure t
  :config (progn
	    (which-key-mode)
	    (which-key-setup-side-window-right-bottom)
	    (setq which-key-idle-delay 0.4)))
