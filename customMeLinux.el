;;Referencias
;; https://github.com/munen/emacs.d/#convenience-functions-when-working-with-pdf-exports
;; https://github.com/ianpan870102/.personal-emacs.d/blob/master/init.el
;; https://protesilaos.com/dotemacs/
;; https://github.com/zamansky/dot-emacs

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


;;Keybindins
(global-set-key (kbd "C-x <down>") 'counsel-switch-buffer)
;; (global-set-key (kbd "C-c <C-down>") 'counsel-switch-buffer)
;; (global-set-key (kbd "C-c <C-up>") 'tab-switcher)

;; Ajustando google translate para la busqueda (backend) en Emacs Linux version 27.0
;; Solucion version actual google-translate 0.12-0:  https://github.com/atykhonov/google-translate/issues/52#issuecomment-727920888
(use-package google-translate
  :ensure t
  :custom
  (google-translate-backend-method 'curl)
  :config
  (defun google-translate--search-tkk () "Search TKK." (list 430675 2721866130)))



;; Activa las marcas de tiempo de undotree
;(setq undo-tree-visualizer-timestamps t)

(global-set-key [f9] 'linum-mode)
(global-set-key (kbd "s-c") 'clipboard-kill-ring-save)
(global-set-key (kbd "s-v") 'clipboard-yank)
(global-set-key (kbd "s-x") 'clipboard-kill-region)



;Custom faces 

(custom-set-faces
 '(tab-bar ((t (:inherit variable-pitch :family "Inconsolata")))) ;Si no tiene la fuente Inconsolata, usa la que tiene por defecto.
 )


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
