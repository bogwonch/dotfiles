(defhydra hydra-space (:color blue :hint t)
  "command"
  ("a" hydra-applications/body "applications")
  ("c" hydra-compilation/body "compilation")
  ("T" hydra-theme/body "change theme properties")
  (":" helm-M-x "run command")
  ("f" helm-for-files "find file")
  ("b" helm-buffers-list "find buffer"))

(defhydra hydra-compilation (:color blue :hint t)
  ("r" helm-flycheck "show errors"))

(defhydra hydra-zoom (:color blue :hint t)
  "zoom"
  ("+" text-scale-increase "in")
  ("-" text-scale-decrease "out"))

(defhydra hydra-theme (:color blue :hint t)
  "text manipulation"
  ("z" hydra-zoom/body "change text size")
  ("p" hydra-modeline/powerline-separator/body "change powerline separator"))

(defhydra hydra-completion (:color blue :hint t)
	      "auto completion"
	      ("C-f" company-files "file completion")
	      ("C-/" helm-company "complete in menu"))

(defhydra hydra-applications (:color blue :hint t)
	  "applications"
	  ("n" deft "note taking with Deft"))

;; Global power menu
(define-key evil-normal-state-map (kbd "<SPC>") 'hydra-space/body)

;; Completion commands
(define-key evil-insert-state-map
  (kbd "C-n") 'company-complete-common-or-cycle)
(define-key evil-insert-state-map
  (kbd "C-p") 'company-complete-common-or-cycle-backward)
(define-key evil-insert-state-map
  (kbd "C-x") 'hydra-completion/body)
