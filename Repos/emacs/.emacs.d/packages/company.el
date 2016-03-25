(use-package company
  :ensure t
  :config (progn
	    (setq company-idle-delay 0)
	    (company-mode 1)
	    (add-hook 'after-init-hook 'global-company-mode)))
