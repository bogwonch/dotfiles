(defconst bogwonch/config-dir "~/.emacs.d/config/")
(defconst bogwonch/core-dir "~/.emacs.d/core/")
(defconst bogwonch/packages-dir "~/.emacs.d/packages/")

(add-to-list 'load-path bogwonch/core-dir)
(add-to-list 'load-path bogwonch/packages-dir)

(require 'core/core (concat bogwonch/core-dir "core.el"))

