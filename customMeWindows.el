;----------- Archivo de configuracion para Windows------------------
; En este archivo podras sobreconfiguraciones para sus necesidades.

; Para que la primera vez que aparecen sea en tu directorio y no en donde guardaste emecs.
;;(setq default-directory "c:/Users/memoc/") ;; My laptop
(setq default-directory "c:/Users/Guillermo/") ;; My pc
;(message "%s" default-directory)

;Quita el sonido de la campana, muy tipico que suene en windows.
(setq visible-bell t) 

;;------------------- For my pc -------------------------------------
(set-face-attribute 'default nil :family "Consolas" :height 115) ;; My pc
(when window-system (set-frame-size (selected-frame) 118 28)) ;; Tamanio de la ventana
(set-frame-position (selected-frame) 140 70)  ;;Posicion de la ventana

;;------------------For my laptop-------------------------------------
;Modifica la letra y el tamanño.
;;(set-face-attribute 'default nil :family "Consolas" :height 130) ;; My laptop

;Set default size windows
; Ajustado para el tamaño de una laptop
;;(when window-system (set-frame-size (selected-frame) 118 28)) ;; Tamanio de la ventana
;;(set-frame-position (selected-frame) 140 70)  ;;Posicion de la ventana
;;--------------------------------------------------------


;Custom faces 
(custom-set-faces 
 '(tab-bar ((t (:inherit variable-pitch :family "Consolas")))) ;Si no tiene la fuente Inconsolata, usa la que tiene por defecto.
 ;;'(tab-bar ((t (:inherit variable-pitch :background "#000000" :foreground "#FFDAB5" :family "Consolas")))) ;Si no tiene la fuente Inconsolata, usa la que tiene por defecto.

)




