(use-package markdown-mode
  :mode ("\\.md\\'" . markdown-mode)
  :defer t
  :ensure t
  :init (progn
	  (setq markdown-open-command "emacsclient"
		markdown-asymmetric-header t
		markdown-enable-math t
		markdown-command "pandoc"))
  :config (progn
	    (add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))))
