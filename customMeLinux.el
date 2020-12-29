;;Referencias
;;https://github.com/ianpan870102/.personal-emacs.d/blob/master/init.el
;;https://protesilaos.com/dotemacs/

;------------------Configuracion Linux ------------------------
;Configura neotree para que sean iconos, porque tengo instalado icons.
(setq neo-theme 'icons)

;Aumentar tamaño de letra, before config: 130
;(set-face-attribute 'default nil :height 140)

;Modifica la letra y el tamanño.
;(set-face-attribute 'default nil :family "Consolas" :height 155)
;(set-face-attribute 'default nil :family "Droid Sans Mono" :height 135 :weight 'normal)
(set-face-attribute 'default nil :family "Inconsolata" :height 155 :weight 'normal)

;Set default size windows
(when window-system (set-frame-size (selected-frame) 117 31))
(set-frame-position (selected-frame) 300 175) ;My ajustando posicion del frame.


;Keybindins
(global-set-key (kbd "s-SPC") 'counsel-switch-buffer)
(global-set-key (kbd "C-x <down>") 'counsel-switch-buffer)
;; (global-set-key (kbd "C-c <C-down>") 'counsel-switch-buffer)
;; (global-set-key (kbd "C-x <C-down>") 'counsel-switch-buffer)
;; (global-set-key (kbd "C-c <C-right>") 'tab-next)
;; (global-set-key (kbd "C-c <C-left>") 'tab-previous)
;; (global-set-key (kbd "C-c <C-up>") 'tab-switcher)


;Custom faces 

(custom-set-faces
 '(tab-bar ((t (:inherit variable-pitch :family "Inconsolata")))) ;Si no tiene la fuente Inconsolata, usa la que tiene por defecto.
 )


;Test propiedades
;; (custom-set-faces
;;  '(font-lock-function-name-face ((t (:foreground "#F0DFAF")))) ; Metodos
;;  '(font-lock-variable-name-face ((t (:foreground "#e9967a")))) ; Nombres de las variables.
;; )


;----- Articulos que vi que me llamaron la atencion ------------
;https://codeandoando.com/emacs-como-entorno-de-desarrollo-para-python/
; Para que te recomiende el conjunto de funciones de un modulo en python sin descargar un plugin
; primero de debe de ejecutar con C-c C-p abrira la term en un buffer y ejecura tu codigo, haceindo eso
; company ya sabe que funciones tiene tu modulo.

; C-c C-c - Es un comando de ejecucion para varios modos, probar ese comando si se necesita.
