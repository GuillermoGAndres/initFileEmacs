;; Initial configuration para ambos Linux and Windows
(setq custom-file "~/.emacs.d/initFileEmacs/customMeSettings.el")
(load custom-file)

;; Cargar los package de un archivo org, compila los archivos org y lo convierte en .el, sera nuestro archivo principal.
(org-babel-load-file (expand-file-name "~/.emacs.d/initFileEmacs/dirCustomOrg/customMePackage.org"))

;; ----------------------------------------------------------------------
;; Ahora es turno de cargar el tema, este es un tema por defecto que viene integrado en el repositorio si es que no tienes un tema en particular.
;; Descomentarlo todas las partes del codigo de este fragmento encerrado si deseas usarlo.

;;(add-to-list 'custom-theme-load-path "~/.emacs.d/initFileEmacs/myThemes/fogus-personalizado")
;;(load-theme 'fogus t)

;; Cargamos nuestra paleta de colores para nuestro tema en particular.
;; Solo cuando es ejecutado windos-system (GUI), valor x or nil.

;; (if window-system
;;     (progn
;;       (setq custom-file "~/.emacs.d/initFileEmacs/customApariencia.el")
;;       (load custom-file)
;;     )
;; )
;;----------------------------------------------------------------------

;;----------------------------------------------------------------------
;; RECOMENDABLE mejor descargar los temas indivuales en github <https://github.com/GuillermoGAndres/Dijkstra-theme>  y despues solo cargarlos, ejemplos:

;; (add-to-list 'custom-theme-load-path "~/Documents/projects/Liskov-theme")
;; (load-theme 'liskov t)

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
;;(load-theme 'dijkstra t)
;; (load-theme 'dijkstra-dark t)
;; (load-theme 'dijkstra-dark-blue t) ;; I like this theme

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

;; Church-theme
(add-to-list 'custom-theme-load-path "~/Documents/projects/Church-theme")
(load-theme 'church t)

;; Dracula-theme
;; (add-to-list 'custom-theme-load-path "~/.emacs.d/themes/dracula-theme")
;; (load-theme 'dracula t)

;; Flatland-theme
;; (add-to-list 'custom-theme-load-path "~/.emacs.d/themes/flatland-theme")
;; (load-theme 'flatland t)

;; Monokai-theme
;; (add-to-list 'custom-theme-load-path "~/.emacs.d/themes/monokai-theme")
;; (load-theme 'monokai t)

;; Molokai-theme
;; (add-to-list 'custom-theme-load-path "~/.emacs.d/themes/molokai-theme")
;; (load-theme 'molokai t)

;; Noctilux-theme
;; (add-to-list 'custom-theme-load-path "~/.emacs.d/themes/noctilux-theme")
;; (load-theme 'noctilux t)

;; (add-to-list 'custom-theme-load-path "~/.emacs.d/themes/doom-gruvbox")
;; (load-theme 'doom-gruvbox t)

;; Significa que es el tema por defecto de emacs ;ver colores M-x list-faces-display
;;(add-to-list 'load-path "~/.emacs.d/initFileEmacs/myThemes/themebydefault/themebydefault.el")
(if  (eq (car custom-enabled-themes) 'nil)
    (progn
      (custom-set-faces
       ;;`(default ((t (:foreground "#F6F3E8" :weight semibold)))) ;; Mas blanco
       ;; Dired
       '(minibuffer-prompt ((t (:foreground "dark slate blue"))))
       ;; ---------------- Code Highlighting ----------------------------------------------

       ;; Builtin-faces
       ;;'(font-lock-builtin-face ((t (:foreground "dark slate blue")))) ;

       ;; Comments
       '(font-lock-comment-face ((t (:foreground "Firebrick" :slant italic)))) ;

       ;; Constant
       ;;'(font-lock-constant-face ((t (:foreground "dark cyan")))) ;Constantes: naranja claro

       ;;Doctring
       ;;'(font-lock-doc-face ((t (:foreground "VioletRed4")))) ;Docsting blanco

       ;; Function names
       '(font-lock-function-name-face ((t (:foreground "#3c4fb2")))) ;Funcion names:  azul

       ;; Keywords
       ;;'(font-lock-keyword-face ((t (:foreground "Purple")))) ; keyword;  amariilas :weight semibold

       ;; Preprocessor
       ;;'(font-lock-preprocessor-face ((t (:foreground "dark slate blue"))))

       ;; Strings
       ;;'(font-lock-string-face ((t (:foreground "VioletRed4")))) ;Cadenas; moradas

       ;; Variables
       ;;'(font-lock-variable-name-face ((t (:foreground "sienna")))) ;Color: verde claro
       ;;'(font-lock-type-face ((t (:foreground "ForestGreen")))) ; Clases y types:  naranjas

       ;; Warning
       ;;'(font-lock-warning-face ((t (:foreground ""))))

       ;;fringe
       '(fringe ((t (:background "#ffffff"))))

       ;; show-parent-match
       '(show-paren-match ((t (:foreground "#1ead05"))))


       ;;----------------- Diredfl -----------------------------
       '(diredfl-date-time ((t (:foreground "dark slate blue"))))
       '(diredfl-dir-heading ((t (:foreground "ForestGreen"))))
       '(diredfl-dir-name ((t (:foreground  "sienna" ))))
       '(diredfl-dir-priv ((t (:foreground "dark cyan"))))
       '(diredfl-exec-priv ((t (:foreground "#D1907F"))))
       '(diredfl-file-name ((t nil)))
       '(diredfl-file-suffix ((t (:inherit diredfl-file-name))))
       '(diredfl-no-priv ((t nil)))
       '(diredfl-number ((t (:foreground "VioletRed4"))))
       '(diredfl-read-priv ((t (:foreground "ForestGreen"))))
       '(diredfl-symlink ((t (:foreground "dark cyan"))))
       '(diredfl-write-priv ((t (:foreground "dark slate blue"))))

       ;;--------------------Web mode --------------------
       '(web-mode-doctype-face ((t (:foreground "#3c4fb2")))) ;turquoise , lightblue, PaleTurquoise
       '(web-mode-html-tag-face ((t (:foreground "ForestGreen"))));
       ;;'(web-mode-html-tag-face ((t (:foreground "#EFFBFF"))));Color de los brackets
       '(web-mode-html-attr-name-face ((t (:foreground "dark slate blue")))) ;verde claro
       '(web-mode-html-attr-value-face ((t (:foreground "VioletRed4")))) ;morado
       '(web-mode-comment-face ((t (:foreground "sienna" :slant italic)))) ;; Color blanco

       ;;----------------------JS2-mode------------------------------------
       ;; '(js2-function-call ((t (:foreground "#FFF8DC")))) ; amarillo claro
       ;; '(js2-object-property ((t (:foreground "#FFF8DC")))) ;amarillo claro
       ;; '(js2-external-variable ((t (:foreground "#F4B3A0")))) ; naranja
       ;;'(js2-error ((t (:foreground "#f05666")))) ;; rojo claro
       ;;'(js2-warning ((t (:underline "#EB9490")))) ;; rojo
       ;; '(js2-error ((t (:foreground "#ed5f70" :slant italic :weight semi-bold))))
       ;; '(js2-warning ((t (:underline (:color "#EB9490" :style wave) :slant italic))))
       ;; '(js2-function-param ((t (:foreground "#d6d6d6")))) ;; color de la letra normal

       )
      ;;(message "hola mundo")
      ;;(add-hook 'prog-mode-hook 'linum-mode)
      (global-set-key [remap goto-line] 'goto-line-with-feedback)
      ;;(add-hook 'prog-mode-hook 'display-line-numbers-mode)
      )
  )


;; ----------------------------------------------------------------------

;; Por si tengo que hacer una modificacion despues.
;;(custom-set-faces
;;'(linum ((t (:inherit (shadow default) :background "#13182D" :foreground "#B3B3B3")))) ;Lineas grises
;;'(linum ((t (:inherit (shadow default) :background "#13182D" :foreground "#F0DFAF")))) ;Lineas amarillas
;;'(font-lock-comment-face ((t (:foreground "#EFFBFF")))) ; Comentarios de en linea blanco
;;'(font-lock-comment-face ((t (:foreground "#EB9490")))) ; Comentarios de en linea rojo claro

                                        ;)
;; ------------------------------

;;Plugins externos
;;Cargando plugins externo esta es una manera mas elegante de hacerlo para cargarlo.
(add-to-list 'load-path "~/.emacs.d/initFileEmacs/pluginsUser")

;; Resize-frame
;; Ayuda a redimersionar las windows.
(load "resize-frame")

;; https://github.com/elbeno/dotemacs/blob/master/.emacs.d/site-lisp/cpp-auto-include.el
(load "cpp-auto-include")

;; Narrow-indirect (Tiempo real)
;;Crea un buffer para editar una seccion de codigo en particular.
;; (add-to-list 'load-path "~/.emacs.d/initFileEmacs/pluginsUser")
;; (require 'narrow-indirect)
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
      ;;(message "Estas es un system Windows!")
      (setq custom-file "~/.emacs.d/initFileEmacs/customMeWindows.el")
      (load custom-file)
      )
  )

(if (eq system-type 'gnu/linux)
    (progn
      ;;(message "Estas es un system Linux!")
      (setq custom-file "~/.emacs.d/initFileEmacs/customMeLinux.el")
      (load custom-file)
      )
  )

;; --------------------------------------------------

;; Archivo donde se guardaran todas las personalizaciones, es un archivo auxiliar para observar los atributos.
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

;; Para no modificar el package.org , para ver los colores en un cierto modo
;;(add-to-list 'auto-mode-alist '("\\.html\\'" . html-mode))

(provide 'init)

;;; init.el ends here
