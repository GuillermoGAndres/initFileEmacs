; Initial configuration

(if (eq system-type 'windows-nt)
    (progn
      ;(message "Estas es un system Windows!")
      (setq custom-file "~/.emacs.d/initFileEmacs/customMeWindows.el")
      (load custom-file)

      ;Cargar package de un archivos org, compila los archivos org y lo convierte en .el, sera nuestro archivo principal
      ;(org-babel-load-file (expand-file-name "~/.emacs.d/initFileEmacs/dirCustomOrg/customMeWindowsORG.org"))
      
      )    
)

(if (eq system-type 'gnu/linux)
    (progn
      ;(message "Estas es un system Linux!")
      (setq custom-file "/home/guillermo/.emacs.d/initFileEmacs/customMeLinux.el")
      (load custom-file)
      ;Cargar archivos org, compila los archivos org y lo convierte en .el, sera nuestro archivo principal
      ;(org-babel-load-file (expand-file-name "~/.emacs.d/emacs-configuration/dirCustomOrg/customMeORG.org"))
    
    )    
)

;Carga todos los paquetees
(org-babel-load-file (expand-file-name "~/.emacs.d/initFileEmacs/dirCustomOrg/customMePackage.org"))


; Ahora es turno de cargar los temas
;Solo cuando es ejecutado windos-system (GUI), valor x or nil.
(if window-system
    (progn
      (setq custom-file "~/.emacs.d/initFileEmacs/customApariencia.el")
      (load custom-file)
    )    
)

;Plugins 
;Cargando un plugin externo esta es una manera mas elegante de hacerlo para cargarlo.
(add-to-list 'load-path "~/.emacs.d/initFileEmacs/pluginsUser")
(load "resize-frame")


; Archivo donde se guardaran todas las personalizaciones, es un archivo auxiliar para observar los atributos.
(setq custom-file "~/.emacs.d/initFileEmacs/pluginsUser/customFacesMe.el")
(load custom-file)


