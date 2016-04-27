(provide 'bogwonch-core/load-packages)

;; If you really don't want something loaded then blacklist it
(defconst bogwonch/blacklisted-packages
  '())

;; Load everything
(mapcar (lambda (f)
	  (if (not (member f bogwonch/blacklisted-packages))
	      (unwind-protect
		  (let (retval)
		    (condition-case exception
			(setq retval (load-file (concat bogwonch/packages-dir f)))
		      (message (format "failed to load '%s': %s" f exception)))))))
	(directory-files bogwonch/packages-dir nil ".*\.el$"))

(req-package-finish)
