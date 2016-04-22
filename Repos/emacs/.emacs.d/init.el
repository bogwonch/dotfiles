
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(defconst bogwonch/config-dir "~/.emacs.d/config/")
(defconst bogwonch/core-dir "~/.emacs.d/core/")
(defconst bogwonch/packages-dir "~/.emacs.d/packages/")

(add-to-list 'load-path bogwonch/core-dir)
(add-to-list 'load-path bogwonch/packages-dir)

(require 'core/core (concat bogwonch/core-dir "core.el"))

