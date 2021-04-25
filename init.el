; Initial configuration para ambos Linux and Windows
(setq custom-file "~/.emacs.d/initFileEmacs/customMeSettings.el")
(load custom-file)

;Cargar los package de un archivo org, compila los archivos org y lo convierte en .el, sera nuestro archivo principal.
(org-babel-load-file (expand-file-name "~/.emacs.d/initFileEmacs/dirCustomOrg/customMePackage.org"))

;; ----------------------------------------------------------------------
;; Ahora es turno de cargar el tema, este es un tema por defecto que viene integrado en el repositorio si es que no tienes un tema en particular.
;; Descomentarlo todas las partes del codigo de este fragmento encerrado si deseas usarlo.

;;(add-to-list 'custom-theme-load-path "~/.emacs.d/initFileEmacs/myThemes/fogus-personalizado")
;;(load-theme 'fogus t)

; Cargamos nuestra paleta de colores para nuestro tema en particular.
; Solo cuando es ejecutado windos-system (GUI), valor x or nil.

;; (if window-system
;;     (progn
;;       (setq custom-file "~/.emacs.d/initFileEmacs/customApariencia.el")
;;       (load custom-file)
;;     )    
;; )
;----------------------------------------------------------------------

;;----------------------------------------------------------------------
;; RECOMENDABLE mejor descargar los temas indivuales en github <https://github.com/GuillermoGAndres/Dijkstra-theme>  y despues solo cargarlos, ejemplos: 

(add-to-list 'custom-theme-load-path "~/Documents/projects/Liskov-theme")
(load-theme 'liskov t)
(if (eq (car custom-enabled-themes) 'liskov)
    (progn     
      (custom-set-faces
       ;;`(mode-line ((t (:box nil :foreground "#000000" :background "#B4B4B4"))))
       )
      (global-set-key [remap goto-line] 'goto-line-with-feedback)
      )
  )
;;(add-to-list 'custom-theme-load-path "~/Documents/projects/Hoare-theme")
;;(load-theme 'hoare t)

(add-to-list 'custom-theme-load-path "~/Documents/projects/Dijkstra-theme")
;(load-theme 'dijkstra t)
(load-theme 'dijkstra-dark t)
;(load-theme 'dijkstra-dark-blue t)

(if  (eq (car custom-enabled-themes) 'dijkstra)
    (progn
      (custom-set-faces
       ;;`(default ((t (:foreground "#F6F3E8" :weight semibold)))) ;; Mas blanco       
       )
      ;;(message "hola mundo")
      ;;(add-hook 'prog-mode-hook 'linum-mode)
      (global-set-key [remap goto-line] 'goto-line-with-feedback)
      ;;(add-hook 'prog-mode-hook 'display-line-numbers-mode)
    )
  )

(if  (eq (car custom-enabled-themes) 'dijkstra-dark)
    (progn
      (custom-set-faces
       ;;'(font-lock-keyword-face ((t (:weight bold)))) ; keyword;
       )
       (global-set-key [remap goto-line] 'goto-line-with-feedback)
    )
  )
;;(add-to-list 'custom-theme-load-path "~/Documents/projects/Turing-theme")
;;(load-theme 'turing t)

;;(add-to-list 'custom-theme-load-path "~/Documents/projects/Niklaus-theme")
;;(load-theme 'niklaus t)

;; ----------------------------------------------------------------------

;; Por si tengo que hacer una modificacion despues.
;(custom-set-faces
 ;;'(linum ((t (:inherit (shadow default) :background "#13182D" :foreground "#B3B3B3")))) ;Lineas grises
 ;;'(linum ((t (:inherit (shadow default) :background "#13182D" :foreground "#F0DFAF")))) ;Lineas amarillas
 ;;'(font-lock-comment-face ((t (:foreground "#EFFBFF")))) ; Comentarios de en linea blanco
 ;;'(font-lock-comment-face ((t (:foreground "#EB9490")))) ; Comentarios de en linea rojo claro

;) 
;; ------------------------------

;Plugins externos
;Cargando plugins externo esta es una manera mas elegante de hacerlo para cargarlo.
(add-to-list 'load-path "~/.emacs.d/initFileEmacs/pluginsUser")

;; Resize-frame
;; Ayuda a redimersionar las windows.
(load "resize-frame")

;; Narrow-indirect (Tiempo real)
;;Crea un buffer para editar una seccion de codigo en particular.
;(add-to-list 'load-path "~/.emacs.d/initFileEmacs/pluginsUser")
;(require 'narrow-indirect)
;;(load "narrow-indirect")

;;(define-key ctl-x-4-map "nd" #'ni-narrow-to-defun-indirect-other-window)
;;(define-key ctl-x-4-map "nn" #'ni-narrow-to-region-indirect-other-window)
;;(define-key ctl-x-4-map "np" #'ni-narrow-to-page-indirect-other-window)

;; Una mejora de narrow-indirect
(add-to-list 'load-path "~/.emacs.d/initFileEmacs/pluginsUser/fence-edit.el")
(require 'fence-edit)
(global-set-key (kbd "C-c '") 'fence-edit-code-region-with-mode)

;; --------------------------------------------------

;;Ajustamos nuestras configuraciones dependiendo de nuestro sistema operativo.
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
      (setq custom-file "~/.emacs.d/initFileEmacs/customMeLinux.el")
      (load custom-file)    
    )    
)

;; --------------------------------------------------

; Archivo donde se guardaran todas las personalizaciones, es un archivo auxiliar para observar los atributos.
(if (eq system-type 'windows-nt)
    (progn
      (setq custom-file "~/.emacs.d/initFileEmacs/pluginsUser/customFacesMeWindows.el")
      (load custom-file)
    )    
)

(if (eq system-type 'gnu/linux)
    (progn
      (setq custom-file "~/.emacs.d/initFileEmacs/pluginsUser/customFacesMeLinux.el")
      (load custom-file)
    )    
)

;; Enable command
(put 'narrow-to-region 'disabled nil)
