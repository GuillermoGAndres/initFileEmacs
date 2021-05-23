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
