;; Get rid of extraneous UI
(tool-bar-mode -1) 
(scroll-bar-mode -1)

;; Set the font
(let ((my-font "PragmataPro-13"))
  (eval `(progn
	   (add-to-list 'default-frame-alist '(font . ,my-font))
	   (set-face-attribute 'default t :font ,my-font))))
