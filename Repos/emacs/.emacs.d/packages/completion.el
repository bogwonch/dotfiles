(req-package company
  :require evil hydra helm
  :config (progn
	    (use-package company-shell)
	    (use-package company-quickhelp)
	    (use-package helm-company)
	    (global-company-mode)
	    (setq company-idle-delay 0.0
		  company-minimum-prefix-length 1)))
