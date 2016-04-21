(provide 'bogwonch-core/load-config)

(mapcar (lambda (f)
	  (unwind-protect
	      (let (retval)
		(condition-case exception
		    (setq retval (load-file (concat bogwonch/config-dir f)))
		  (message (format "failed to load '%s': %s" f exception))))))
	(directory-files bogwonch/config-dir nil ".*\.el$"))
