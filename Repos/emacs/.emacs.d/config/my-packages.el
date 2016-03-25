(provide 'my-packages)

;; load the package manager
(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

;; Use-Package lets us conditionally load packages.
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)

;; Load all the files in the packages directory
(defvar my-packages-dir "~/.emacs.d/packages/")
(mapcar (lambda (f)
	  (load-file (concat my-packages-dir f)))
	(directory-files "~/.emacs.d/packages" nil ".*\.el$"))

