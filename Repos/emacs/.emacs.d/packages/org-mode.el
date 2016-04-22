(add-hook 'org-mode-hook
	  '(lambda ()
	     (org-indent-mode 1)
	     (org-toggle-pretty-entities)))
(req-package org
  :mode ("\\.org\\'" . org-mode))
(req-package org-ref :require org)
(req-package evil-org
  :require org evil)
