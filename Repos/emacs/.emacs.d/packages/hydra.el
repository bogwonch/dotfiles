(use-package hydra
  :ensure t)

(defhydra hydra-zoom ()
  "zoom"
  ("+" text-scale-increase "in")
  ("-" text-scale-decrease "out"))

(defhydra hydra-eval ()
  "evaluation"
  ("l" eval-last-sexp "last expression")
  ("b" eval-buffer "buffer")
  (":" eval-expression "expression"))

(defhydra hydra-text ()
  "text commands"
  ("z" hydra-zoom/body "zoom text"))

(evil-leader/set-key "t" 'hydra-text/body)
(evil-leader/set-key "x" 'hydra-eval/body)
