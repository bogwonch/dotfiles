(use-package python-mode
  :mode "\\.py\\'"
  :interpreter "python")

(use-package anaconda-mode
  :defer t
  :config (progn
	    (add-hook 'python-mode-hook 'anaconda-mode)
	    (add-hook 'python-mode-hook 'eldoc-mode)))

(use-package company-anaconda
  :defer t
  :config (progn
	    (eval-after-load "company"
	      '(progn
		 (add-to-list 'company-backends 'company-anaconda)))))
