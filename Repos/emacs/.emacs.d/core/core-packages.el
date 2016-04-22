(provide 'bogwonch-core/core-packages)

;; A whole bunch of stuff depends on evil so best to load it here
(req-package evil
  :diminish evil-mode
  :config
  (progn
    (evil-mode 1)))

(req-package evil-leader
  :require evil
  :config (global-evil-leader-mode))

;; Again Hydra is used a lot for menus
(req-package hydra)
