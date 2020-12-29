; Initial configuration para ambos Linux and Windows
(setq custom-file "~/.emacs.d/initFileEmacs/customMeSettings.el")
(load custom-file)

;Cargar los package de un archivo org, compila los archivos org y lo convierte en .el, sera nuestro archivo principal.
(org-babel-load-file (expand-file-name "~/.emacs.d/initFileEmacs/dirCustomOrg/customMePackage.org"))


;Ahora es turno de cargar los temas, elegir el que mas te guste, son algunos temas por defectos que viene integrados en repositorio al descargarlos.
(add-to-list 'custom-theme-load-path "~/.emacs.d/initFileEmacs/myThemes/badger")
;(load-theme 'badger t)

(add-to-list 'custom-theme-load-path "~/.emacs.d/initFileEmacs/myThemes/dorsey-personalizado")
;(load-theme 'dorsey t)

(add-to-list 'custom-theme-load-path "~/.emacs.d/initFileEmacs/myThemes/fogus-personalizado")
(load-theme 'fogus t)

(add-to-list 'custom-theme-load-path "~/.emacs.d/initFileEmacs/myThemes/cool-theme")
;(load-theme 'cool t)
;;----------------------------------------------------------------------


;; RECOMENDABLE mejor descargar los temas indivuales en github <https://github.com/GuillermoGAndres/Dijkstra-theme>  y despues solo cargarlos ejemplo: 
;(add-to-list 'custom-theme-load-path "~/Documents/projects/Liskov-theme")
;(load-theme 'liskov t)

;(add-to-list 'custom-theme-load-path "~/Documents/projects/Hoare-theme")
;(load-theme 'hoare t)

;(add-to-list 'custom-theme-load-path "~/Documents/projects/Dijkstra-theme")
;(load-theme 'dijkstra t)
;(load-theme 'dijkstra-dark t)

;(add-to-list 'custom-theme-load-path "~/Documents/projects/Turing-theme")
;(load-theme 'turing t)
;; ----------------------------------------------------------------------


; Cargamos nuestra paleta de colores para nuestro tema en particular.
; Solo cuando es ejecutado windos-system (GUI), valor x or nil.
(if window-system
    (progn
      (setq custom-file "~/.emacs.d/initFileEmacs/customApariencia.el")
      (load custom-file)
    )    
)


;Ajustamos nuestras configuraciones dependiendo de nuestro sistema operativo.
(if (eq system-type 'windows-nt)
    (progn
      ;(message "Estas es un system Windows!")
      (setq custom-file "~/.emacs.d/initFileEmacs/customMeWindows.el")
      (load custom-file)
    )    
)

(if (eq system-type 'gnu/linux)
    (progn
      ;(message "Estas es un system Linux!")
      (setq custom-file "/home/guillermo/.emacs.d/initFileEmacs/customMeLinux.el")
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


