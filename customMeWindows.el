;----------- Archivo de configuracion para Windows------------------
; En este archivo podras sobreconfiguraciones para sus necesidades.

; Para que la primera vez que aparecen sea en tu directorio y no en donde guardaste emecs.
(setq default-directory "c:/Users/memoc/")
;(message "%s" default-directory)

;Quita el sonido de la campana, muy tipico que suene en windows.
(setq visible-bell t) 

;Modifica la letra y el tamanño.
(set-face-attribute 'default nil :family "Consolas" :height 130)

;Set default size windows
; Ajustado para el tamaño de una laptop
(when window-system (set-frame-size (selected-frame) 118 28))
(set-frame-position (selected-frame) 140 70) ;My ajustando posicion del frame.


;Custom faces 
(custom-set-faces
 '(tab-bar ((t (:inherit variable-pitch :background "#000000" :foreground "#FFDAB5" :family "Consolas")))) ;Si no tiene la fuente Inconsolata, usa la que tiene por defecto.
 )




