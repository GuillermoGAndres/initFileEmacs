; Initial configuration

(if (eq system-type 'windows-nt)
    (progn
      ;(message "Estas es un system Windows!")
      (setq custom-file "~/.emacs.d/initFileEmacs/customMeWindows.el")
      (load custom-file)

      ;Cargar package de un archivos org, compila los archivos org y lo convierte en .el, sera nuestro archivo principal
      (org-babel-load-file (expand-file-name "~/.emacs.d/initFileEmacs/dirCustomOrg/customMeWindowsORG.org"))
      
      )  
  (progn
    ;(message "Estas es un system Linux!")
    (setq custom-file "/home/guillermo/.emacs.d/emacs-configuration/customMe.el")
    (load custom-file)

    ;Cargar archivos org, compila los archivos org y lo convierte en .el, sera nuestro archivo principal
    ;(org-babel-load-file (expand-file-name "~/.emacs.d/emacs-configuration/dirCustomOrg/customMeORG.org"))
    
    )  
)


;Cargando un plugin externo esta es una manera mas elegante de hacerlo para cargarlo.
(add-to-list 'load-path "~/.emacs.d/initFileEmacs/pluginsUser")
(load "resize-frame")

; Ahora es turno de cargar los temas
(setq custom-file "~/.emacs.d/initFileEmacs/customApariencia.el")
(load custom-file)

; Archivo donde se guardaran todas las personalizaciones, es un archivo auxiliar para observar los atributos.
(setq custom-file "~/.emacs.d/initFileEmacs/pluginsUser/customFacesMe.el")
(load custom-file)




