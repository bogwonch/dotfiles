(req-package rust-mode
  :require company-racer
  :mode (("\\.rs\\'" . rust-mode)))

(req-package company-racer
  :require company racer
  :mode (("\\.rs\\'" . rust-mode))
  :config (progn
	    (add-hook 'rust-mode-hook
		      '(lambda ()
			 (set (make-local-variable 'company-backends '(company-racer)))))))

(req-package racer
 :config (progn
	   (setq racer-cmd "~/.cargo/bin/racer"
		 racer-rust-src-path "~/Repos/github.com/rust-lang/rust/src")
	   (add-hook 'rust-mode-hook '(lambda () (racer-activate))))
 :mode (("\\.rs\\'" . rust-mode)))
