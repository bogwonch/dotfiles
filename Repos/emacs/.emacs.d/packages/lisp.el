;(req-package lispy)
;(req-package evil-lispy
;	     :diminish evil-lispy-mode
;	     :require lispy)

(dolist (hook '(emacs-lisp-mode-hook
		lisp-mode-hook
		lisp-interaction-mode-hook))
  (add-hook hook '(lambda ()
		    ;(lispy-mode 1)
		    ;(evil-lispy-mode)
		    (show-paren-mode))))
