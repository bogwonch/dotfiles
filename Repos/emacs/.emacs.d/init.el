(tool-bar-mode -1)
;; Font
(let ((my-font "PragmataPro-13"))
  (eval `(progn
	   (add-to-list 'default-frame-alist '(font . ,my-font))
	   (set-face-attribute 'default t :font ,my-font))))

;; Don't polute filesystem
(custom-set-variables
 '(auto-save-file-name-transforms '((".*" "~/.emacs.d/autosaves/\\1" t)))
 '(backup-directory-alist '((".*" . "~/.emacs.d/backups"))))
(make-directory "~/.emacs.d/autosaves" t)
(make-directory "~/.emacs.d/backups" t)

;; Package management
(require 'package)
(add-to-list 'package-archives
                          '("melpa" . "https://melpa.org/packages/"))
(when (< emacs-major-version 24)
      (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize)

(if (not (package-installed-p 'use-package))
    (progn
      (package-refresh-contents)
      (package-install 'use-package)))
(require 'use-package)
(require 'diminish)                ;; if you use :diminish
(require 'bind-key)                ;; if you use any :bind varian

(setq use-package-always-ensure t) ; always install all emacs packages

;; Lispy
(use-package lispy)
(load-file "~/.emacs.d/local/evil-lispy/evil-lispy.el")
(dolist (hook '(emacs-lisp-mode-hook
		lisp-mode-hook
		lisp-interaction-mode-hook))
  (add-hook hook '(lambda ()
		    (lispy-mode)
		    (evil-lispy-mode)
		    (show-paren-mode))))

;; Evil mode
(use-package evil
  :config
  (evil-mode 1))

(use-package evil-leader
  :config
  ;(evil-leader/set-leader "<SPC>")
  (global-evil-leader-mode))

(use-package org
  :config (progn
	    (use-package evil-org)
	    (use-package org-ref)
	    (add-hook
	     'org-mode-hook
	     '(lambda ()
		(org-indent-mode 1)))))

;; Material theme
(use-package material-theme
  :config
  (load-theme 'material t))

;; Appearance
(scroll-bar-mode -1)

;; Hydra
(use-package hydra)

(define-key evil-normal-state-map (kbd "<SPC>") 'hydra-space/body)
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
  ("p" hydra-powerline-separator/body "change powerline separator"))

(defhydra hydra-powerline-separator (:color blue :hint t)
  "powerline separators"
  ("A" (setq powerline-default-separator 'alternate) "alternate")
  ("a" (setq powerline-default-separator 'arrow) "arrow")
  ("f" (setq powerline-default-separator 'arrow-fade) "arrow-fade")
  ("|" (setq powerline-default-separator 'bar) "bar")
  ("b" (setq powerline-default-separator 'box) "box")
  ("[" (setq powerline-default-separator 'brace) "brace")
  ("B" (setq powerline-default-separator 'butt) "butt")
  ("c" (setq powerline-default-separator 'chamfer) "chamfer")
  ("C" (setq powerline-default-separator 'contour) "contour")
  ("(" (setq powerline-default-separator 'curve) "curve")
  (")" (setq powerline-default-separator 'rounded) "rounded")
  ("]" (setq powerline-default-separator 'roundstub) "roundstub")
  ("/" (setq powerline-default-separator 'slant) "slant")
  ("w" (setq powerline-default-separator 'wave) "wave")
  ("z" (setq powerline-default-separator 'zigzag) "zigzag")
  ("u" (setq powerline-default-separator 'utf-8) "utf-8")
  ("n" (setq powerline-default-separator 'nil) "none"))

;(evil-leader/set-key "<SPC>" 'hydra-space/body)

;; Markdown mode
(use-package markdown-mode
  :mode (("\\.md\\'" . markdown-mode)
	 ("\\.markdown\\'" . markdown-mode)))

;; Swiper and Ivy
(use-package helm)

;; Company-mode completion
(use-package company
  :config (progn
	    (use-package company-shell)
	    (use-package company-quickhelp)
	    (use-package helm-company)
	    (global-company-mode)
	    (setq company-idle-delay 0.0
		  company-minimum-prefix-length 1)
	    (define-key evil-insert-state-map (kbd "C-n") 'company-complete-common-or-cycle)
	    (define-key company-active-map (kbd "C-n") 'company-complete-common-or-cycle)
	    (define-key evil-insert-state-map (kbd "C-p") 'company-complete-common-or-cycle-backward)
	    (define-key company-active-map (kbd "C-p") 'company-complete-common-or-cycle-backward)))

(defhydra hydra-company (:color blue :hint t)
  "auto completion"
  ("C-f" company-files "file completion")
  ("C-/" helm-company "complete in menu"))
(define-key evil-insert-state-map (kbd "C-x") 'hydra-company/body)
(define-key company-active-map (kbd "C-x") 'hydra-company/body)

;; Rust
(use-package rust-mode
  :mode (("\\.rs\\'" . rust-mode))
  :config (progn
	    (use-package racer)
	    (use-package company-racer)
	    (use-package rust-mode)
	    (setq racer-cmd "~/.cargo/bin/racer"
		  racer-rust-src-path "~/Repos/github.com/rust-lang/rust/src")
	    (add-hook 'rust-mode-hook '(lambda ()
					 (racer-activate)
					 (set (make-local-variable 'company-backends) '(company-racer))))))

;; Prettier prompt
(use-package spaceline
  :config (progn
	    (use-package powerline)
	    (require 'spaceline-config)
	    (spaceline-emacs-theme)
	    (setq spaceline-highlight-face-func 'spaceline-highlight-face-evil-state
		  powerline-height 20
		  powerline-default-separator 'bar)))
