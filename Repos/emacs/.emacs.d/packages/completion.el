(req-package company
  :require evil hydra helm
  :config (progn
	    (use-package company-shell)
	    (use-package company-quickhelp)
	    (use-package helm-company)
	    (global-company-mode)
	    (setq company-idle-delay 0.0
		  company-minimum-prefix-length 1)))

(req-package ido-ubiquitous
  :require ido
  :config (ido-ubiquitous-mode 1))

(req-package ido
  :config (progn
	    (setq ido-enable-flex-matching t)
	    (setq ido-everywhere t)
	    (ido-mode 1)))
