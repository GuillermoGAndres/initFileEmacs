;;Referencias
;; https://github.com/munen/emacs.d/#convenience-functions-when-working-with-pdf-exports
;; https://github.com/SirPscl/emacs.d#pdf-tools
;; https://github.com/ianpan870102/.personal-emacs.d/blob/master/init.el
;; https://protesilaos.com/dotemacs/
;; https://github.com/zamansky/dot-emacs

;------------------Configuracion Linux ------------------------
; Aumentar tamaño de letra, before config: 130
; (set-face-attribute 'default nil :height 140)

; Modifica la letra y el tamanño.
;;(set-face-attribute 'default nil :family "Hack") ; Si cursivas
(set-face-attribute 'default nil :family "DejaVu Sans Mono") ; Si cursivas
;;(set-face-attribute 'default nil :family "DejaVu Sans Mono" :height 110 :weight 'normal) ; Si cursivas
;;(set-face-attribute 'default nil :family "Source Code Variable") ; Si hay cursivas
;;(set-face-attribute 'default nil :family "Monospace") ;;  hay cursivas
;;(set-face-attribute 'default nil :family "Monospace" :height 118) ;;  hay cursivas

;;(set-face-attribute 'default nil :family "Droid Sans Mono" :height 117) ; No cursivas
;;(set-face-attribute 'default nil :family "Inconsolata" :height 130 :weight 'normal) ;No cursivas
;;(set-face-attribute 'default nil :family "Consolas" :height 125 :weight 'normal) ; No cursivas
;;(set-face-attribute 'default nil :family "Noto Mono") ;No hay cursivas

(global-set-key (kbd "C-'") 'isearch-forward)

;; --------------------------------------------------
;Agregar numeros de lineas (Uno decide si usar linum-mode)
;@reference: https://emacs.stackexchange.com/questions/278/how-do-i-display-line-numbers-in-emacs-not-in-the-mode-line
;;(add-hook 'prog-mode-hook 'linum-mode)

;; Snippeta para aparecer los numeros de lineas solo cuando vayas con la funcion goto-line
;; Funciona bien si te gusta la configuracion sin numeros de lineas y solo las quieres ver cuando
;; tienes que ir a una de ellas.
;; (linum-mode -1) Funcion que desactivas los numeros de lineas.

(defun goto-line-with-feedback ()
  "Show line numbers temporarily, while prompting for the line number input"
  (interactive)
  (unwind-protect
      (progn
        (linum-mode 1)
        (goto-line (read-number "Goto line: ")))
    (linum-mode -1)))

(global-set-key [remap goto-line] 'goto-line-with-feedback)
;; --------------------------------------------------

;;Set default size windows
;(when window-system (set-frame-size (selected-frame) 117 31))
;(set-frame-position (selected-frame) 300 175) ;My ajustando posicion del frame.


;;Keybindins
;;(global-set-key (kbd "C-x <down>") 'counsel-switch-buffer)
;; (global-set-key (kbd "C-c <C-down>") 'counsel-switch-buffer)
;; (global-set-key (kbd "C-c <C-up>") 'tab-switcher)

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

;; Interceptan con algunos comandos del S.O
;; (global-set-key (kbd "s-v") 'clipboard-yank) 
;; (global-set-key (kbd "s-x") 'clipboard-kill-region)
;; (global-set-key (kbd "s-c") 'clipboard-kill-ring-save)

(global-set-key (kbd "C-S-v") 'clipboard-yank)
(global-set-key (kbd "C-S-c") 'clipboard-kill-ring-save)
(global-set-key (kbd "C-S-x") 'clipboard-kill-region)

;Custom faces 

;(custom-set-faces
 ;'(tab-bar ((t (:inherit variable-pitch :family "Inconsolata")))) ;Si no tiene la fuente Inconsolata, usa la que tiene por defecto.
; )

;Configura neotree para que sean iconos, porque tengo instalado icons.
;(use-package neotree
;  :config
;  (setq neo-theme 'icons)
;  )

;; Custom theme para web-mode Liskov-theme
;; (if  (eq (car custom-enabled-themes) 'liskov)
;;     (progn
;;       ;;(message "This message appears in the echo area Liskov-theme!")
;;       ;;For HTML
;;       (set-face-attribute 'web-mode-doctype-face nil :foreground "lightblue") ;turquoise , lightblue, PaleTurquoise
;;       (set-face-attribute 'web-mode-html-tag-face nil :foreground "#FFF8DC") ; amarillo
;;       ;;(set-face-attribute 'web-mode-html-tag-bracket-face nil :foreground "#EFFBFF") ;Color de los brackets
;;       (set-face-attribute 'web-mode-html-attr-name-face nil :foreground "#BCEDDE"); verde claro
;;       (set-face-attribute 'web-mode-html-attr-value-face nil :foreground "#CAB4CC"); morado
;;       ;;(set-face-attribute 'web-mode-html-attr-equal-face nil :foreground "green"); Color para el signo de igualdad
;;       ;;(set-face-attribute 'web-mode-html-tag-namespaced-face nil :foreground "green")
;;       ;;(set-face-attribute 'web-mode-html-tag-custom-face nil :foreground "green")
;;       )
;; )

;; Ejemplo para crear funciones
;;(defun set-frame-alpha (arg &optional active)
;;  (interactive "nEnter alpha value (1-100): \np")
;;  (let* ((elt (assoc 'alpha default-frame-alist))
;;         (old (frame-parameter nil 'alpha))
;;         (new (cond ((atom old)     `(,arg ,arg))
;;                    ((eql 1 active) `(,arg ,(cadr old)))
;;                    (t              `(,(car old) ,arg)))))
;;    (if elt (setcdr elt new) (push `(alpha ,@new) default-frame-alist))
;;    (set-frame-parameter nil 'alpha new)))
;;(global-set-key (kbd "s-t") 'set-frame-alpha)


;; (defun chmod-plus-w ()
;;   (interactive)
;;   (shell-command-to-string (concat "chmod +w " (buffer-file-name (current-buffer))))
;;   (revert-buffer))


;; (defun delete-surrounded-parens ()
;;   (interactive)
;;   (let ((beginning (region-beginning))
;;         (end (region-end)))
;;     (cond ((not (eq (char-after beginning) ?\())
;;            (error "Character at region-begin is not an open-parenthesis"))
;;           ((not (eq (char-before end) ?\)))
;;            (error "Character at region-end is not a close-parenthesis"))
;;           ((save-excursion
;;              (goto-char beginning)
;;              (forward-sexp)
;;              (not (eq (point) end)))
;;            (error "Those parentheses are not matched"))
;;           (t (save-excursion
;;                (goto-char end)
;;                (delete-backward-char 1)
;;                (goto-char beginning)
;;                (delete-char 1))))))


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

;; For lisp, is mode for Common Lisp with more feactures
(use-package slime
  :ensure t
  :config
  (setq inferior-lisp-program "clisp")
  )

;; Disable confirm 
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

;; Adjusment paragrapg with C-q
(setq-default fill-column 80)


;; M-x list-colors-display
;; M-x list-faces-display

;;(custom-set-faces
;; '(font-lock-builtin-face ((t (:foreground "#A4D1F2" )))) ; Comentarios de en linea blanco
;; )

;----------------Company-web
;;(define-key web-mode-map (kbd "C-.") 'html-close-element)

;; you may key bind, for example for web-mode:
;; (define-key web-mode-map (kbd "C-'") 'company-web-html)
;; ;Only use company-mode with company-web-html in web-mode

;; you may key bind, for example for web-mode:
;;(define-key web-mode-map (kbd "C-'") 'company-web-html)


;;Tern (Intelling Javascript Tooling)
(add-to-list 'load-path "~/.emacs.d/plugins/tern/emacs/")
(autoload 'tern-mode "tern.el" nil t)

;; Para auto-complete plugin
;;(eval-after-load 'tern
;;   '(progn
;;      (require 'tern-auto-complete)
;;      (tern-ac-setup)))


;; Company-web (Ayudara para auto completado)
;;(add-to-list 'load-path "~/.emacs.d/plugins/company-tern/company-tern.el")
;; Se tuvo que instalar todas las dependencias.
(add-to-list 'load-path "~/.emacs.d/plugins/company-tern/")
(require 'company-tern)

;;(add-to-list 'company-backends 'company-tern)
;;(use-package tern
;;  :ensure t
;;  :config
;;  (progn
;;    (autoload 'tern-mode "tern.el" nil t)
;;    ;;(add-hook 'js-mode-hook (lambda () (tern-mode t)))
;;    ;;(add-hook 'js2-mode-hook (lambda () (tern-mode t)))
;;    )
;;  )
;;
;;(use-package dash-functional
;;  :ensure t)



;; Custom theme para web-mode Liskov-theme
;;For HTML
;;(set-face-attribute 'web-mode-doctype-face nil :foreground "lightblue") ;turquoise , lightblue, PaleTurquoise
;;(set-face-attribute 'web-mode-html-tag-face nil :foreground "#FFF8DC") ; amarillo
;;(set-face-attribute 'web-mode-html-tag-bracket-face nil :foreground "#EFFBFF") ;Color de los brackets
;;(set-face-attribute 'web-mode-html-attr-name-face nil :foreground "#BCEDDE"); verde claro
;;(set-face-attribute 'web-mode-html-attr-value-face nil :foreground "#CAB4CC"); morado
;;(set-face-attribute 'web-mode-html-attr-equal-face nil :foreground "green"); Color para el signo de igualdad
;;(set-face-attribute 'web-mode-html-tag-namespaced-face nil :foreground "green")
;;(set-face-attribute 'web-mode-html-tag-custom-face nil :foreground "green")


;(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.

 ;;'(rainbow-delimiters-depth-2-face ((t (:inherit rainbow-delimiters-base-face :foreground "#4184d1"))))
 ;;'(rainbow-delimiters-depth-3-face ((t (:inherit rainbow-delimiters-base-face :foreground "#f09835"))))
 ;;'(rainbow-delimiters-depth-4-face ((t (:inherit rainbow-delimiters-base-face :foreground "#7fe069"))))
 ;;'(rainbow-delimiters-depth-5-face ((t (:inherit rainbow-delimiters-base-face :foreground "#e8e048"))))
 
 ;;'(font-lock-comment-face ((t (:foreground "#EC9F6F" :slant italic)))) ; Comentarios de linea naranja fuerte #EC9F6F o #F6AD80
 
 ;`(region ((t (:foreground "#EFFBFF" :background "#1b3552")))) ;; Region azul 
 ;`(region ((t (:foreground "#ffffff" :background "#525252")))) ;; Regio gris


 ;;'(font-lock-comment-face ((t (:foreground "#add8e6" :slant italic)))) ; Comentarios azul claro

 ;`(default ((t (:weight semibold :foreground "#F6F3E8")))) 
 ;;`(default ((t (:weight semibold))))

   ;;----------------------JS2-mode------------------------------------
   ;;'(js2-function-call ((t (:foreground "#FFF8DC")))) ; amarillo claro
   ;;'(js2-object-property ((t (:foreground "#FFF8DC")))) ;amarillo claro
   ;;'(js2-external-variable ((t (:foreground "#F4B3A0")))) ; naranja
   ;;'(js2-error ((t (:foreground "#f05666")))) ;; rojo claro
   ;;'(js2-warning ((t (:underline "#EB9490")))) ;; rojo
   ;;'(js2-error ((t (:foreground "#ed5f70" :slant italic :weight semi-bold))))
   ;;'(js2-warning ((t (:underline (:color "#EB9490" :style wave) :slant italic))))
;)

(if  (eq (car custom-enabled-themes) 'liskov)
    (progn
      (custom-set-faces
       `(default ((t (:weight semibold)))) ;; other white: #d6d6d6 or #F6F3E8
       ;;'(font-lock-keyword-face ((t (:foreground "#E9DCA7" :weight bold)))) ; keyword; #E9DCA7 or #FFF8DC
       '(font-lock-keyword-face ((t (:weight bold)))) ; keyword;
       ;;'(web-mode-html-tag-face ((t (:foreground "#FFF8DC")))); amarillo
       )
      ;;(message "hola mundo")
    )
)

;;(use-package ivy-rich
;;:ensure t
;;;:config
;;;(ivy-rich-mode 1)
;;)

;;(use-package ivy-rich
;;  :hook (ivy-mode . ivy-rich-mode)
;;  :custom (ivy-rich-path-style 'abbrev)
;;  :config
;;  (ivy-rich-modify-columns
;;   'ivy-switch-buffer
;;   '((ivy-rich-switch-buffer-size (:align right))
;;     (ivy-rich-switch-buffer-major-mode (:width 10 :face error)))))

;;(use-package focus
;;:ensure t
;;)

;; Painful head
;;(setq slime-contribs '(slime-js)) ;; Solo si instalaste npm -g swang-js
;;(add-to-list 'load-path "~//usr/local/lib/node_modules/swank-js")
;;(require 'slime-js)

;; (global-set-key [f5] 'slime-js-reload)
;; (add-hook 'js2-mode-hook
;;           (lambda ()
;;             (slime-js-minor-mode 1)))
;;

(use-package skewer-mode
  :ensure t
  )

;; (add-hook 'js2-mode-hook 'skewer-mode)
;; (add-hook 'css-mode-hook 'skewer-css-mode)
;; (add-hook 'html-mode-hook 'skewer-html-mode)

(use-package impatient-mode
  :ensure t
  )

;:(global-set-key (kbd "C-c C-o") 'browse-url-of-file)
