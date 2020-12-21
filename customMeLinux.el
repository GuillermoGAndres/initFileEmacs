
;------------------Configuracion Linux ------------------------
;Configura neotree para que sean iconos, porque tengo instalado icons.
(setq neo-theme 'icons)

;Aumentar tamaño de letra, before config: 130
;(set-face-attribute 'default nil :height 140)

;Modifica la letra y el tamanño.
;(set-face-attribute 'default nil :family "Consolas" :height 110)
(set-face-attribute 'default nil :family "Droid Sans Mono" :height 135 :weight 'normal)

;Set default size windows
(when window-system (set-frame-size (selected-frame) 117 31))
(set-frame-position (selected-frame) 300 175) ;My ajustando posicion del frame.



;----- Articulos que vi que me llamaron la atencion ------------
;https://codeandoando.com/emacs-como-entorno-de-desarrollo-para-python/
; Para que te recomiende el conjunto de funciones de un modulo en python sin descargar un plugin
; primero de debe de ejecutar con C-c C-p abrira la term en un buffer y ejecura tu codigo, haceindo eso
; company ya sabe que funciones tiene tu modulo.


