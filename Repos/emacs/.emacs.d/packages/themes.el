(req-package material-theme
  :config (progn
	    (defconst bogwonch/theme/dark-theme 'material)
	    (defconst bogwonch/theme/light-theme 'material-light)

	    (load-theme bogwonch/theme/dark-theme t)))

