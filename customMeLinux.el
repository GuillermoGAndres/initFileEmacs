;;Referencias
;; https://github.com/munen/emacs.d/#convenience-functions-when-working-with-pdf-exports
;; https://github.com/SirPscl/emacs.d#pdf-tools
;; https://github.com/ianpan870102/.personal-emacs.d/blob/master/init.el
;; https://protesilaos.com/dotemacs/
;; https://github.com/zamansky/dot-emacs

;;------------------Configuracion Linux ------------------------
; Aumentar tamaño de letra, before config: 130
; (set-face-attribute 'default nil :height 140)
;;'(default ((t (:inherit nil :extend nil :stipple nil :background "white" :foreground "black" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight semi-bold :height 110 :width normal :foundry "ADBO" :family "Source Code Pro"))))
(set-face-attribute 'default nil :height 110) ;; Default

;; Modifica la letra y el tamanño.
;; Font definiva en mi distribucion
;;(set-face-attribute 'default nil :family "DejaVu Sans Mono") ; Si cursivas

(global-set-key (kbd "C-'") 'isearch-forward)
(global-set-key (kbd "C-x C-b") 'counsel-ibuffer)
(global-set-key (kbd "C-x <up>") 'counsel-imenu)
;; Seleccion una sola line C-S-n

;; --------------------------------------------------
;;Set default size windows
;(when window-system (set-frame-size (selected-frame) 117 31))
;(set-frame-position (selected-frame) 300 175) ;My ajustando posicion del frame.


;; Ajustando google translate para la busqueda (backend) en Emacs Linux version 27.0
;; Solucion version actual google-translate 0.12-0:  https://github.com/atykhonov/google-translate/issues/52#issuecomment-727920888
;(use-package google-translate
;  :ensure t
;  :custom
;  (google-translate-backend-method 'curl)
;  :config
;  (defun google-translate--search-tkk () "Search TKK." (list 430675 2721866130)))

;; Activa las marcas de tiempo de undotree
;(setq undo-tree-visualizer-timestamps t)

;;Solo funciona en linux
(defun my-split-window-below ()
  (interactive)
  (split-window-below)
  (other-window 1)
  ;;(counsel-find-file)
  (ibuffer)
  )

(defun my-split-window-right ()
  (interactive)
  (split-window-right)
  (other-window 1)
  ;;(find-file ".")
  ;;(counsel-find-file)
  (ibuffer)
  )

(global-set-key (kbd "C-x 2") 'my-split-window-below)
(global-set-key (kbd "C-x 3") 'my-split-window-right)

;Configura neotree para que sean iconos, porque tengo instalado icons.
;(use-package neotree
;  :config
;  (setq neo-theme 'icons)
;  )

;; For lisp, is mode for Common Lisp with more feactures
(use-package slime
  :ensure t
  :config
  (setq inferior-lisp-program "clisp")
  )

;; Disable confirm para ser ejecutado en org
(setq org-confirm-babel-evaluate nil)

;; org-babel Activate languages for org-mode
(org-babel-do-load-languages
 'org-babel-load-languages
 '(
   (lisp . t)
   )
 )

;; ctags
(defun create-tags ()
    "Create tags file."
    (interactive)
    (message "building project tags")
    (shell-command (concat "ctags -e -R --exclude=.git ."))
    ;;(visit-tags-table)
    (message "tags built successfully"))

(defun visit-tags-table ()
  (interactive)
  (xref-find-definitions "TAGS")
  (message "Load in tags table"))


(use-package skewer-mode
  :ensure t
  )
;; (add-hook 'js2-mode-hook 'skewer-mode)
;; (add-hook 'css-mode-hook 'skewer-css-mode)
;; (add-hook 'html-mode-hook 'skewer-html-mode)

;; Latex AUTEX mode
;;(use-package auctex)
;;(defun my-auctex-mode-hook ()
;;  (define-key LaTeX-mode-map (kbd "C-.") 'latex-close-block)
;;  )
;;(add-hook 'LaTeX-mode-hook 'my-auctex-mode-hook)

;;Custom faces 
;; M-x list-colors-display
;; M-x list-faces-display
;;(custom-set-faces
 ;'(tab-bar ((t (:inherit variable-pitch :family "Inconsolata")))) ;Si no tiene la fuente Inconsolata, usa la que tiene por defecto.
;; )



;----- Articulos que vi que me llamaron la atencion ------------
;https://codeandoando.com/emacs-como-entorno-de-desarrollo-para-python/
; Para que te recomiende el conjunto de funciones de un modulo en python sin descargar un plugin
; primero de debe de ejecutar con C-c C-p abrira la term en un buffer y ejecura tu codigo, haceindo eso
; company ya sabe que funciones tiene tu modulo.

; C-c C-c - Es un comando de ejecucion para varios modos, probar ese comando si se necesita.
