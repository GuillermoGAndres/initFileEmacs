;;; ------------------Configuracion Linux ------------------------
;;; Comentary: Configuracion de Linux

;; List of font favorite:
;; (set-frame-font "JetBrains Mono" nil t)
;; Font definiva en mi distribucion (Detault Default Linux: Source Code Pro)
;; (set-face-attribute 'default nil :height 110) ;; Default Source Code Pro

;; Aumentamos font-size:16 == :height 151 y oscuremos la letra debido a que cuando es
;; semi-bold el color blanco suele remarcarse más, colores elegidos #eaeaea or #d0d0d0 or #e0e0e0 (gris)

;; Reajustamos font 1 primera forma
;; (set-frame-font "Cascadia Code" nil t) ;; Existe un reset en weight por defecto de la font.
;; (custom-set-faces
;;  '(default ((t (:foundry "SAJA" :height 151 )))))

;; Font Configuration 2 forma ----------------------------------------------------------
(set-face-attribute 'default nil :font "Cascadia Code" :height 151)


;; Set the fixed pitch face (Sirve para las parte de code en org mode)
;; (set-face-attribute 'fixed-pitch nil :font "Fira Code Retina" :height 140)
(set-face-attribute 'fixed-pitch nil :font "Cascadia Code" :height 145)

;; Set the variable pitch face (for writting prose insted of code)
(set-face-attribute 'variable-pitch nil :font "Cantarell" :height 151 :weight 'regular)
;; (variable-pitch-mode) ;; Con esto cambias la fuente con Cantarell

;; ------------------------------------------------------------------
;;'(default ((t (:family "Cascadia Code" :foundry "SAJA" :slant normal :weight semi-bold :height 151 :width normal))))
;;'(default ((t (:family "Source Code Pro" :foundry "ADBO"  :slant normal :weight semi-bold :height 110 :width normal ))))
;;(set-face-attribute 'default nil :family "JetBrains Mono")  ;; No funciona deber ser set-frame-font

;; Lista de todos los atributor que pueder  modificar
;; (:inherit nil
;;              :extend nil
;;              :stipple nil
;;              :background "white"
;;              :foreground "black"
;;              :inverse-video nil
;;              :box nil
;;              :strike-through nil
;;              :overline nil
;;              :underline nil
;;              :slant normal
;;              :weight semi-bold
;;              :height 110
;;              :width normal
;;              :foundry "ADBO"
;;              :family "Source Code Pro"))

;; Ajuste  monitor 24"
(when window-system (set-frame-size (selected-frame) 101 35)) ;; Tamanio de la ventana
(set-frame-position (selected-frame) 325 140)  ;; Posicion de la ventana

(global-set-key (kbd "C-'") 'isearch-forward)
(global-set-key (kbd "C-x C-b") 'counsel-ibuffer)
(global-set-key (kbd "C-x <up>") 'counsel-imenu)
;; Seleccion una sola line C-S-n

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
   (python . t)
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



;; Posiblemente no lo encuentre en Melpa, sino en Melpa stable, ver list packages y volver
;; a evaluar use-package nuevamente y cargara.
(use-package dashboard
  :ensure t
  :if (display-graphic-p)
  :config
  (dashboard-setup-startup-hook))

;;(setq dashboard-footer-messages '("😈 Happy hacking!"))
(setq dashboard-items '((recents  . 5)
                        (bookmarks . 5)
                        (projects . 5)))
;;----------------------------------------------------
;; Ejemplo de como escribir global keys:
;;(global-set-key (kbd "C-S-M") 'counsel-flycheck)

;; Cosas que me gustaria probar para desarrollo:
;; (add-hook 'prog-mode-hook 'display-line-numbers-mode)
;;(global-hl-line-mode +1)
(add-hook 'prog-mode-hook 'hl-line-mode)

;; f string literal python , python mode y tambien funciona con Elpy

(defconst brace-regexp
  "[^{]{[^{}]*}")
(defconst python-f-string-regexp
  "f\\('.*?[^\\]'\\|\".*?[^\\]\"\\)")
(defun python-f-string-font-lock-find (limit)
  (while (re-search-forward python-f-string-regexp limit t)
    (put-text-property (match-beginning 0) (match-end 0)
                       'face 'font-lock-string-face)
    (let ((start (match-beginning 0)))
      (while (re-search-backward brace-regexp start t)
        (put-text-property (1+ (match-beginning 0)) (match-end 0)
                           'face 'font-lock-regexp-grouping-backslash))))
  nil)
;; font-lock-type-face or font-lock-regexp-grouping-backslash

(with-eval-after-load 'python
  (font-lock-add-keywords
   'python-mode
   `((python-f-string-font-lock-find))
   'append))

;; https://emacs.stackexchange.com/questions/39283/how-to-syntax-highlight-python-f-strings-so-uses-regular-code-colors

;; https://www.wm.ax/an-emacs-macro-to-simplify-debugging-with-python-f-strings.html

;; Search google:
;; Formatted string literals python emacs
;; How to syntax highlight Python f-strings so {…} uses regular code colors?
;; Formatted string literals python emacs
;; Formatted string literals emacs

;; ------------------------------------------------------------

(use-package all-the-icons
  :ensure t)

;; Configura neotree para que sean iconos, porque tengo instalado icons.
(use-package neotree
 :config
 (setq neo-theme 'icons)
 )

;; (use-package doom-modeline
;;   :ensure t
;;   :init (doom-modeline-mode 1))


;; Vamos tratar de instalar elpy manualmente, primero descargamos dependencias
;; Company
;; highlight-indentation
;; pyvenv
;; yasnippet
;; s
(use-package highlight-indentation
  :ensure t)

(use-package s
  :ensure t)

(use-package pyvenv
  :ensure t)

(add-to-list 'load-path "~/.emacs.d/initFileEmacs/plugins/elpy")
(load "elpy")
(load "elpy-rpc")
(load "elpy-shell")
(load "elpy-profile")
(load "elpy-refactor")
(load "elpy-django")
(elpy-enable) ;; Enable Elpy in all future Python buffers.

(add-to-list 'load-path "~/.emacs.d/initFileEmacs/plugins/key-chord")
(require 'key-chord)
(key-chord-mode 1)
(key-chord-define-global "dd"  'kill-whole-line)
(key-chord-define-global "cc"  'copy-line)
(key-chord-define-global "cv"  'clipboard-yank)

;; https://emacs.stackexchange.com/questions/2347/kill-or-copy-current-line-with-minimal-keystrokes
;; https://stackoverflow.com/questions/88399/how-do-i-duplicate-a-whole-line-in-emacs
;; https://lists.gnu.org/archive/html/help-gnu-emacs/2010-12/msg01183.html


(add-hook 'prog-mode-hook 'auto-fill-mode) ;; Rompe las lineas cuando son muy grandes.

;; -------------------- Configuracion para org-mode --------------------
(setq use-package-always-ensure t) ;; Con esto ya no sera necesarop poner :ensure t

(defun efs/org-mode-setup ()
  (org-indent-mode)
  (variable-pitch-mode 1)
  (visual-line-mode 1))

(defun efs/org-font-setup ()
  ;; Replace list hyphen with dot
  (font-lock-add-keywords 'org-mode
                          '(("^ *\\([-]\\) "
                             (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•")))))))

(use-package org
  :hook (org-mode . efs/org-mode-setup)
  :config
  (setq org-ellipsis " ▾"
        org-hide-emphasis-markers t) ;; con esto ocula lo * para word bold
  (efs/org-font-setup))

(use-package org-bullets
  :after org
  :hook (org-mode . org-bullets-mode)
  :custom
  (org-bullets-bullet-list '("●" "○" "◉" "○" "●" "○" "●")))

;; Set faces for heading levels
(dolist (face '((org-level-1 . 1.1)
                (org-level-2 . 1.05)
                (org-level-3 . 1.0)
                (org-level-4 . 1.0)
                (org-level-5 . 1.1)
                (org-level-6 . 1.1)
                (org-level-7 . 1.1)
                (org-level-8 . 1.1)))
  (set-face-attribute (car face) nil :font "Cantarell" :weight 'medium :height (cdr face)))

(custom-set-faces
 ;; '(org-level-1 ((t (:foreground "")))) ;; amarillo
 '(org-level-2 ((t (:foreground "#a6c673")))) ;; verde
 ;; '(org-level-3 ((t (:foreground "")))) ;; azul 
 )
;; Ensure that anything that should be fixed-pitch in Org files appears that way
;; M-x describe face : para ver los nombre de los colores
(set-face-attribute 'org-block nil :foreground nil :inherit 'fixed-pitch)
(set-face-attribute 'org-code nil   :inherit '(shadow fixed-pitch))
(set-face-attribute 'org-table nil   :inherit '(shadow fixed-pitch))
(set-face-attribute 'org-verbatim nil :inherit '(shadow fixed-pitch))
(set-face-attribute 'org-special-keyword nil :inherit '(font-lock-comment-face fixed-pitch))
(set-face-attribute 'org-meta-line nil :inherit '(font-lock-comment-face fixed-pitch))
(set-face-attribute 'org-checkbox nil :inherit 'fixed-pitch)

;; set the image to a third of the width of the screen.
(setq org-image-actual-width (/ (display-pixel-width) 3))

(defun efs/org-mode-visual-fill ()
  (setq visual-fill-column-width 100
        visual-fill-column-center-text t)
  (visual-fill-column-mode 1))

;; Muy bien modo reading or writen con orgmode or markdown, se parece a
;; jetbrains zen mode o se puede adaptar para que lo sean
(use-package visual-fill-column
  :hook (org-mode . efs/org-mode-visual-fill))


;;----------projectile ---------
;; Como ya lo tengo descargado solo es cuestion de activarlo y probarlo
(projectile-mode +1)

;;------------------------------------
;; Cundo quiera poner lines number
;; (column-number-mode) ;; se veria (3,4) en mode line
; (global-display-line-numbers-mode t)

;; Disable line numbers for some modes
(dolist (mode '(org-mode-hook
                term-mode-hook
                shell-mode-hook
                eshell-mode-hook))
  (add-hook mode (lambda ()
                   (display-line-numbers-mode 0)
                   (hl-line-mode 0)
                   )))
;; ----------------------------------------

;; ivy no instala counsel, se debe instalar a parte
(use-package ivy
  :diminish  
  :bind (:map ivy-minibuffer-map
         ("TAB" . ivy-alt-done)	
         ("C-l" . ivy-alt-done)
         ("C-j" . ivy-next-line)
         ("C-k" . ivy-previous-line)
	 :map ivy-switch-buffer-map
	 ("C-j" . ivy-next-line)
         ("C-k" . ivy-previous-line)
         ("C-l" . ivy-done)
         ("C-d" . ivy-switch-buffer-kill))
  )
;; Use the :init keyword to execute code before a package is loaded.
;; Similarly, :config can be used to execute code after a package is loaded

;; Una vez instalado counsel, se puede instalar ivy-rich, ademas tambien instala swiper
;; Con M-o te da un menu de opciones en counse-M-x
(use-package counsel
  :bind (("M-x" . counsel-M-x)
         ;;("C-x b" . counsel-ibuffer)
         ;;("C-x C-f" . counsel-find-file)
         ;;:map minibuffer-local-map
         ;;("C-r" . 'counsel-minibuffer-history)
	 ))

;; Funciona cuando es activado counsel-M-x fuction
(use-package ivy-rich
  :init
  (ivy-rich-mode 1))

;; evil-mode
(define-key evil-insert-state-map (kbd "C-g") 'evil-normal-state)
;;(define-key evil-insert-state-map (kbd "C-h") 'evil-delete-backward-char-and-join)

(global-set-key (kbd "C-x M-t") 'counsel-load-theme)
(global-set-key (kbd "C-M-k") 'counsel-switch-buffer)
(global-set-key (kbd "C-M-j") 'counsel-ibuffer)

(global-set-key (kbd "C-M-l") 'next-buffer)
(global-set-key (kbd "C-M-h") 'previous-buffer)

(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

(nyan-mode)

;; eshell mode prompt
(load "~/.emacs.d/initFileEmacs/modes/mo-eshell.el")

;;(global-set-key [remap goto-line] 'goto-line-with-feedback)
(global-set-key [remap describe-function] 'counsel-describe-function)
(global-set-key [remap describe-variable] 'counsel-describe-variable)

;; (use-package helpful
;;   :custom
;;   (counsel-describe-function-function #'helpful-callable)
;;   (counsel-describe-variable-function #'helpful-variable)
;;   :bind
;;   ([remap describe-function] . counsel-describe-function)
;;   ([remap describe-command] . helpful-command)
;;   ([remap describe-variable] . counsel-describe-variable)
;;   ([remap describe-key] . helpful-key))


;;
;; (provide 'customMeLinux)

;;; customMelinux.el ends here

;;Referencias
;; https://github.com/munen/emacs.d/#convenience-functions-when-working-with-pdf-exports
;; https://github.com/SirPscl/emacs.d#pdf-tools
;; https://github.com/ianpan870102/.personal-emacs.d/blob/master/init.el
;; https://protesilaos.com/dotemacs/
;; https://github.com/zamansky/dot-emacs


;; @reading list see interesting (https://github.com/birkenfeld/.emacs.d)

;; https://github.com/birkenfeld/.emacs.d/blob/master/setup/general.el (creador cpython)
;; https://github.com/xenodium/dotsies/tree/main/emacs
;; https://xenodium.com/emacs-dwim-do-what-i-mean/
;; https://github.com/angrybacon/dotemacs/blob/master/dotemacs.org
;; https://github.com/daviwil/dotfiles/blob/master/Emacs.org#eshell (craf)
;; https://config.daviwil.com/emacs


;; https://www.reddit.com/r/emacs/comments/6ftm3x/share_your_modeline_customization/
;; https://www.reddit.com/r/emacs/comments/c5mel4/what_mode_line_do_you_use_and_why/
;; https://www.masteringemacs.org/article/hiding-replacing-modeline-strings
;; https://lists.gnu.org/archive/html/emacs-devel/2010-03/msg00523.html

;; https://github.com/xenodium/dotsies/blob/main/README.org.res/emacs.png
;; https://github.com/xenodium/dotsies/blob/main/emacs/features/fe-eshell.el
;; https://github.com/xenodium/dotsies/blob/main/emacs/ar/ar-eshell-config.el


;; C-s-i  (org-shifttab &optional ARG) collapse or S-tab
;; Variables utiles
;; (insert (current-time-string))
;; (insert (format-time-string "%d/%m/%Y"))
;; (file-name-base (or (buffer-file-name) (buffer-name)))
;; (format-time-string "%d/%m/%Y")
;; (user-full-name)
;; (smtpmail-user-mail-address)
