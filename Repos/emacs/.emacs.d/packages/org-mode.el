(req-package org
  :mode ("\\.org\\'" . org-mode)
  :config (progn
	    (setq org-src-fontify-natively t)))
		  
	    

(req-package org-ref :require org)

(req-package evil-org
  :require org evil)

(req-package deft
  :config (progn
	    (setq deft-directory "~/Dropbox/Notes"
		  deft-extension "org"
		  deft-text-mode 'org-mode
		  deft-use-filename-as-title t)))

(add-hook 'org-mode-hook
	  '(lambda ()
	     (org-indent-mode 1)
	     (org-toggle-pretty-entities)
	     (org-babel-do-load-languages
	        'org-babel-load-languages
		'((dot		. t)
		  (sh		. t)
		  (python	. t)
		  (emacs-lisp	. t)
		  (haskell	. t)
		  (ruby		. t))))) 



