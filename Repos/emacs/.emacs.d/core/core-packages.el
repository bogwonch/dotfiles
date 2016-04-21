(provide 'bogwonch-core/core-packages)

;; A whole bunch of stuff depends on evil so best to load it here
(use-package evil
  :diminish evil-mode
  :config
  (progn
    (evil-mode 1)))

(use-package evil-leader
  :config (global-evil-leader-mode))
;; Again Hydra is used a lot for menus
(use-package hydra)
