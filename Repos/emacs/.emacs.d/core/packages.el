(provide 'bogwonch-core/packages)

;; Set up emacs package management
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

;; Install use-package for saner package management
(if (not (package-installed-p 'req-package))
  (progn
    (package-refresh-contents)
    (package-install 'req-package)))
(require 'req-package)
(require 'diminish) ; used to hide which packages from the mode-line with :diminish
(require 'bind-key) ; used for :bind and its variants

;; Please install everything at the first opportunity
(setq use-package-always-ensure t)

