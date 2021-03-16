

;; Font de pruebas
;;(set-face-attribute 'default nil :family "Hack") ; Si cursivas
;;(set-face-attribute 'default nil :family "DejaVu Sans Mono" :height 110 :weight 'normal) ; Si cursivas
;;(set-face-attribute 'default nil :family "Source Code Variable") ; Si hay cursivas
;;(set-face-attribute 'default nil :family "Monospace") ;;  hay cursivas
;;(set-face-attribute 'default nil :family "Monospace" :height 118) ;;  hay cursivas

;;(set-face-attribute 'default nil :family "Droid Sans Mono" :height 117) ; No cursivas
;;(set-face-attribute 'default nil :family "Inconsolata" :height 130 :weight 'normal) ;No cursivas
;;(set-face-attribute 'default nil :family "Consolas" :height 125 :weight 'normal) ; No cursivas
;;(set-face-attribute 'default nil :family "Noto Mono") ;No hay cursivas


;; --------------------------------------------------
;Agregar numeros de lineas (Uno decide si usar linum-mode)
;@reference: https://emacs.stackexchange.com/questions/278/how-do-i-display-line-numbers-in-emacs-not-in-the-mode-line
;;(add-hook 'prog-mode-hook 'linum-mode)

;; Snippeta para aparecer los numeros de lineas solo cuando vayas con la funcion goto-line
;; Funciona bien si te gusta la configuracion sin numeros de lineas y solo las quieres ver cuando
;; tienes que ir a una de ellas.
;; (linum-mode -1) Funcion que desactivas los numeros de lineas.

;;Keybindins
;;(global-set-key (kbd "C-x <down>") 'counsel-switch-buffer)
;; (global-set-key (kbd "C-c <C-down>") 'counsel-switch-buffer)
;; (global-set-key (kbd "C-c <C-up>") 'tab-switcher)

;; Interceptan con algunos comandos del S.O
;; (global-set-key (kbd "s-v") 'clipboard-yank) 
;; (global-set-key (kbd "s-x") 'clipboard-kill-region)
;; (global-set-key (kbd "s-c") 'clipboard-kill-ring-save)


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



;;Tern (Intelling Javascript Tooling)
;;(add-to-list 'load-path "~/.emacs.d/plugins/tern/emacs/")
;;(autoload 'tern-mode "tern.el" nil t)

;; Para auto-complete plugin
;;(eval-after-load 'tern
;;   '(progn
;;      (require 'tern-auto-complete)
;;      (tern-ac-setup)))


;; Company-web (Ayudara para auto completado)
;;(add-to-list 'load-path "~/.emacs.d/plugins/company-tern/company-tern.el")
;; Se tuvo que instalar todas las dependencias.
;;(add-to-list 'load-path "~/.emacs.d/plugins/company-tern/")
;;(require 'company-tern)

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



;;M-x list-faces-display
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
;;)


;;(use-package ivy-rich
;;:ensure t
;;;:config
;;;(ivy-rich-mode 1)
;;)

;;(use-package focus
;;:ensure t
;;)



;;(global-set-key (kbd "C-c C-o") 'browse-url-of-file)



(if  (eq (car custom-enabled-themes) 'liskov)
    (progn
      (custom-set-faces
       `(default ((t (:weight semibold)))) ;; other white: #d6d6d6 or #F6F3E8
       ;;'(font-lock-keyword-face ((t (:foreground "#E9DCA7" :weight bold)))) ; keyword; #E9DCA7 or #FFF8DC
       '(font-lock-keyword-face ((t (:weight bold)))) ; keyword;
       ;;'(web-mode-html-tag-face ((t (:foreground "#FFF8DC")))); amarillo
       )
      ;;(message "hola mundo")
      (global-set-key [remap goto-line] 'goto-line-with-feedback)
    )
  ;;(message "else")
)

(if  (eq (car custom-enabled-themes) 'dijkstra)
    (progn
      (custom-set-faces
       ;;`(default ((t (:foreground "#F6F3E8" :weight semibold)))) ;; Mas blanco
       )
      ;;(message "hola mundo")
      ;;(add-hook 'prog-mode-hook 'linum-mode)
      (add-hook 'prog-mode-hook 'display-line-numbers-mode)
    )
  )


;; Seleccion una sola line C-S-n
;;https://emacs.stackexchange.com/questions/15033/how-to-mark-current-line-and-move-cursor-to-next-line
;; highlight-current-line (display-line-numbers) ;;Emacs 26 and later.
;; https://stackoverflow.com/questions/59103537/highlight-the-current-line-number-for-the-active-buffer-in-nlinum-mode
;; https://github.com/tom-tan/hlinum-mode

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(diredfl-date-time ((t (:foreground "#b8c4d7"))))
 '(diredfl-dir-heading ((t (:foreground "#ceeca4"))))
 '(diredfl-dir-name ((t (:foreground "#F0DFAF"))))
 '(diredfl-dir-priv ((t (:foreground "#96e7e5"))))
 '(diredfl-exec-priv ((t (:foreground "#D1907F"))))
 '(diredfl-file-name ((t nil)))
 '(diredfl-file-suffix ((t (:inherit diredfl-file-name))))
 '(diredfl-no-priv ((t nil)))
 '(diredfl-number ((t (:foreground "#F0DFAF"))))
 '(diredfl-read-priv ((t (:foreground "#ceeca4"))))
 '(diredfl-symlink ((t (:foreground "#96e7e5"))))
 '(diredfl-write-priv ((t (:foreground "#F0DFAF"))))
 '(font-lock-keyword-face ((t (:weight bold)))))
