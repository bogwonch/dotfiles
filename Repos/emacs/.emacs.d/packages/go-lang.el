(req-package go-mode
  :mode ("\\.go\\'" . go-mode)
  :init (progn
          (require 'go-mode-autoloads))
  :config (progn
            (add-hook 'before-save-hook 'gofmt-before-save)))

(req-package company-go
  :require company go-mode
  :config (progn
            (add-hook 'go-mode-hook (lambda ()
                                      (set (make-local-variable 'company-backends) '(company-go))
                                      (company-mode)))))

(req-package go-eldoc
  :require go-mode
  :config (add-hook 'go-mode-hook 'go-eldoc-setup))
