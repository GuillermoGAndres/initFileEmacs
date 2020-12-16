; Initial configuration
(setq custom-file "/home/guillermo/.emacs.d/emacs-configuration/customMe.el")
(load custom-file)

;Cargar archivos org, compila los archivos org y lo convierte en .el, sera nuestro archivo principal
;(org-babel-load-file (expand-file-name "~/.emacs.d/emacs-configuration/dirCustomOrg/customMeORG.org"))

; Plugins by users.
;(setq custom-file "~/.emacs.d/emacs-configuration/pluginsUser/resize-frame.el")
;(load custom-file)

;Creo que esta es una manera mas elegante de hacerlo que la anterior.
(add-to-list 'load-path "~/.emacs.d/emacs-configuration/pluginsUser/")
(load "resize-frame")

; Este configuracion al final para que se guraden mis configuracion custom en este archivo.
(setq custom-file "~/.emacs.d/emacs-configuration/customApariencia.el")
(load custom-file)

(setq custom-file "~/.emacs.d/emacs-configuration/pluginsUser/customFacesMe.el")
(load custom-file)


