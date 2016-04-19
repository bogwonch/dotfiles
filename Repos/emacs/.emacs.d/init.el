(tool-bar-mode -1)
;; Font
(let ((my-font "PragmataPro-13"))
  (eval `(progn
	   (add-to-list 'default-frame-alist '(font . ,my-font))
	   (set-face-attribute 'default t :font ,my-font))))

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

;; Evil mode
(use-package evil
  :config
  (evil-mode 1))

(use-package evil-leader
  :config
  ;(evil-leader/set-leader "<SPC>")
  (global-evil-leader-mode))

(use-package evil-org)

;; Material theme
(use-package material-theme
  :config
  (load-theme 'material t))

;; Appearance
(scroll-bar-mode -1)

;; Hydra
(use-package hydra)

(defhydra hydra-space (:color blue :hint t)
  "command"
  ("t" hydra-text/body "change text properties")
  (":" helm-M-x "run command"))
(define-key evil-normal-state-map (kbd "<SPC>") 'hydra-space/body)

(defhydra hydra-zoom (:color blue :hint t)
  "zoom"
  ("+" text-scale-increase "in")
  ("-" text-scale-decrease "out"))

(defhydra hydra-text (:color blue :hint t)
  "text manipulation"
  ("z" hydra-zoom/body "change text size"))

;(evil-leader/set-key "<SPC>" 'hydra-space/body)

;; Markdown mode
(use-package markdown-mode
  :mode (("\\.md\\'" . markdown-mode)
	 ("\\.markdown\\'" . markdown-mode)))

;; Swiper and Ivy
(use-package helm)

;(use-package counsel
;  :config
;  (progn
;    (setq counsel-find-file-at-point t)))
