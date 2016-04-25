(req-package company
  :require evil hydra helm
  :config (progn
	    (use-package company-shell)
	    (use-package company-quickhelp)
	    (use-package helm-company)
	    (global-company-mode)
	    (setq company-idle-delay 0.0
		  company-minimum-prefix-length 1)))

(req-package which-key
	     :config (progn
		       (which-key-mode)
		       (which-key-setup-side-window-right-bottom)))
