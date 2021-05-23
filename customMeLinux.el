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
;; (set-face-attribute 'default nil :height 110) ;; Default Source Code Pro
(set-face-attribute 'default nil :height 130) ;; Default Source Code Pro

;; Ajuste para mi monitor
;; Ajuste 1
;(when window-system (set-frame-size (selected-frame) 84 34)) ;; Tamanio de la ventana
;(set-frame-position (selected-frame) 240 40)  ;;Posicion de la ventana

;; Ajuste 2
;(when window-system (set-frame-size (selected-frame) 98 26)) ;; Tamanio de la ventana cuando height:90
(when window-system (set-frame-size (selected-frame) 85 21)) ;; Tamanio de la ventana height:130
(set-frame-position (selected-frame) 220 97)  ;;Posicion de la ventana

;; Modifica la letra y el tamanño.
;; Font definiva en mi distribucion (Detault Default Linux: Source Code Pro)
;;(set-face-attribute 'default nil :family "DejaVu Sans Mono") ; Si cursivas
;;(set-face-attribute 'default nil :family "JetBrains Mono") 

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


;;-------------------------- Auto complete---------------------------------
;;(ac-config-default)

;; Auto complete for web-mode
;; (defun setup-ac-for-html ()
;;   ;; Require ac-haml since we are setup haml auto completion
;;   (require 'ac-html)
;;   ;; Require default data provider if you want to use
;;   (require 'ac-html-default-data-provider)
;;   ;; Enable data providers,
;;   ;; currently only default data provider available
;;   (ac-html-enable-data-provider 'ac-html-default-data-provider)
;;   ;; Let ac-haml do some setup
;;   (ac-html-setup)
;;   ;; Set your ac-source
;;   (setq ac-sources '(ac-source-html-tag
;;                      ac-source-html-attr
;;                      ac-source-html-attrv))
;;   ;; Enable auto complete mode
;;   (auto-complete-mode)
;;   (add-to-list 'web-mode-ac-sources-alist
;;              '("html" . (ac-source-html-tag
;;                          ac-source-html-attr
;;                          ac-source-html-attrv)))
;;   )
;;(add-hook 'web-mode-hook 'setup-ac-for-html)

;; La configuracion anterior solo agrega como backend etiquelas html y no el completado de
;; palabras repetidas, para se necesitara agregar ac-source-xxx 

;; Recursos para entender ac-sources que seria el equivalente company-backend el autocompletado
;; de company para modificar el comportamiento de ciertos buffers.

;; https://www.reddit.com/r/emacs/comments/2vxojf/acsources_changes_across_different_modes/
;; https://github.com/auto-complete/auto-complete/issues/486
;; https://stackoverflow.com/questions/15520447/emacs24-auto-complete-error-void-variable-ac-source-c
;;https://gist.github.com/bmnn/8149899
;; https://www.google.com/search?client=firefox-b-d&q=ac-source-words-in-same-mode-buffers
;; https://emacs.stackexchange.com/questions/35754/exactly-what-are-those-auto-complete-sources
;; https://emacs.stackexchange.com/questions/26122/how-do-i-make-emacs-find-ac-source-pycomplete
;; https://emacs.stackexchange.com/questions/18982/how-do-i-make-auto-complete-enabled-by-default

;; Company
;; https://emacs.stackexchange.com/questions/55230/help-setting-up-company-mode-autocompletion-of-html-css-files
;; company-capf is the backend which should interface to mode's completion support in emacs versions >= 26

;;----------------------------------------------------
;; For php company and autocomplete, funciona para web mode, checar cuando se necesite agregar mas
;; funcionalidades al autocompletado como palabras claves de php
;; https://github.com/xcwen/ac-php#company-mode

;;---------Test for new plugins for my org config (read inits of others)-----
;;https://www.reddit.com/r/emacs/comments/nbzz8x/emacs_as_java_ide/
;; https://github.com/ianpan870102/.wsl-emacs.d/blob/master/init.el

;;https://github.com/ianpan870102/.macOS-emacs.d/blob/master/init.el
;; https://github.com/kipcd/dotfiles/blob/main/emacs/.emacs.default/init.el
;; https://github.com/iocanel/emacs.d


;;https://github.com/emacsorphanage/cpp-auto-include
;https://github.com/quark-zju/vim-cpp-auto-include
;; (use-package cpp-auto-include ; Copyright (C) 2015 by Syohei Yoshida / Ben Deane
;;   :ensure t
;;   :bind (:map c++-mode-map ("C-c i" . 'cpp-auto-include)))
;; Un fork mejorado
;; https://github.com/elbeno/dotemacs/blob/master/.emacs.d/site-lisp/cpp-auto-include.el
(define-key c++-mode-map (kbd "C-c i") 'cpp-auto-include/ensure-includes-for-current-line)
(define-key c++-mode-map (kbd "C-c o") 'cpp-auto-include/ensure-includes-for-file)

;; https://www.stroustrup.com/bs_faq2.html
;; Para CC-mode utilizar C-c C-a para activar auto semicolon and auto newline (c,c++, java)
(use-package cc-vars
  :ensure nil
  :config
  (setq c-default-style '((java-mode . "java")
                          ;;(awk-mode  . "awk")
                          (c++-mode  . "stroustrup")
                          (c-mode    . "cc-mode")
                          ;;(other     . "k&r")
                          ))
  ;;(setq-default c-basic-offset 4)
  )


;; line-number-mode : muestra L1 en la barrita modeline
;;   (setq line-number-mode t) ;; para activar
;; column-number-mode  : muestra (1, 3) en la barrita modeline
;; (setq column-number-mode t

;; https://kb.iu.edu/d/abuf
;; https://www.gnu.org/software/emacs/manual/html_node/efaq/Displaying-the-current-line-or-column.html
;; https://www.gnu.org/software/emacs/manual/html_node/elisp/Mode-Line-Format.html

;;(menu-bar-mode -1)

;; Flycheck utiliza dependiendo el lenguaje una herramienta para checar los errores
;; https://emacs.stackexchange.com/questions/tagged/flycheck
(use-package flycheck
  :ensure t
  :hook ((prog-mode . flycheck-mode))
  :config
  (define-key flycheck-mode-map (kbd "C-S-M") 'counsel-flycheck)
  (define-key flycheck-mode-map (kbd "<f8>") #'flycheck-next-error)
  (define-key flycheck-mode-map (kbd "C-<f8>") #'flycheck-previous-error)
  ;(define-key flycheck-mode-map (kbd "C-<f8>") #'flycheck-list-errors)
  )
;;(global-set-key (kbd "C-S-M") 'counsel-flycheck)

(setq frame-title-format '("Emacs " emacs-version))
(provide 'customMeLinux)

;;; customMelinux.el ends here
