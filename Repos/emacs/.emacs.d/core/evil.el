(provide 'bogwonch-core/core-packages)

;; A whole bunch of stuff depends on evil so best to load it here
(use-package evil
  :diminish evil-mode
  :config
  (progn
    (use-package evil-leader
      :config (global-evil-leader-mode))
    (evil-mode 1)))
