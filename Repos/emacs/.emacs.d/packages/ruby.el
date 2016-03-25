(use-package rubocop
  :ensure t
  :mode "\\.rb'"
  :config (progn
	    (rubocop-mode)))

(use-package bundler :ensure t :defer t)
