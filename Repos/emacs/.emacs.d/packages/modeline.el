(req-package spaceline
  :require powerline hydra
  :config (progn
	    (require 'spaceline-config)
	    (spaceline-emacs-theme)
	    (setq spaceline-highlight-face-func 'spaceline-highlight-face-evil-state
		  powerline-height 20
		  powerline-default-separator 'bar)

	    (defhydra hydra-modeline/powerline-separator (:color blue :hint t)
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
	      ("n" (setq powerline-default-separator 'nil) "none"))))
