(setq custom-file "~/.emacs.d/emacs-configuration/customMe.el")
(load custom-file)

; Plugins by user.
;(setq custom-file "~/.emacs.d/emacs-configuration/pluginsUser/resize-frame.el")
;(load custom-file)

;Creo que esta es una manera mas elegante de hacerlo que la anterior.
(add-to-list 'load-path "~/.emacs.d/emacs-configuration/pluginsUser/")
(load "resize-frame")

; Este configuracion al final para que se guraden mis configuracion custom en este archivo.
(setq custom-file "~/.emacs.d/emacs-configuration/pluginsUser/customFacesMe.el")
(load custom-file)


