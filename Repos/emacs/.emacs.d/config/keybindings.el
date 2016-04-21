(defhydra hydra-space (:color blue :hint t)
  "command"
  ("T" hydra-theme/body "change theme properties")
  (":" helm-M-x "run command"))

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

;; Global power menu
(define-key evil-normal-state-map (kbd "<SPC>") 'hydra-space/body)

;; Completion commands
(define-key evil-insert-state-map
  (kbd "C-n") 'company-complete-common-or-cycle)
(define-key evil-insert-state-map
  (kbd "C-p") 'company-complete-common-or-cycle-backward)
(define-key evil-insert-state-map
  (kbd "C-x") 'hydra-completion/body)
