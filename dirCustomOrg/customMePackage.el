; Quita el echo de shell
(defun my-shell-turn-echo-off ()
  (setq comint-process-echoes t))
(add-hook 'shell-mode-hook 'my-shell-turn-echo-off)

(use-package yasnippet
  :ensure t
  :config
  (setq yas-snippet-dirs
        '(
          "~/.emacs.d/initFileEmacs/snippets"
          ))
  ;; Modo en general (Modo mayor)
  ;;(yas-global-mode 1)
  ;; Para un modo en expecifico (modo menor)
  (yas-reload-all)
  (add-hook 'c-mode-hook #'yas-minor-mode)
  (add-hook 'c++-mode-hook #'yas-minor-mode)
  (add-hook 'java-mode-hook #'yas-minor-mode)
  (add-hook 'org-mode-hook #'yas-minor-mode)
  (add-hook 'python-mode-hook #'yas-minor-mode)
  ;; (add-hook 'prog-mode-hook #'yas-minor-mode)  
)

; Repositorio de snippets ya hechos, bueno si estas iniciando.
;;(use-package yasnippet-snippets
;;  :ensure t
;;  )

(use-package helm
:ensure t
:init 
(helm-mode 1)
(progn (setq helm-buffers-fuzzy-matching t))
:bind
(("C-c h" . helm-command-prefix))
(("M-x" . helm-M-x))
(("C-c f" . helm-find-files))   
;;(([s-f10] . helm-recentf))   ;; Add new key to recentf
(([M-f9] . helm-buffers-list))   
(("M-y" . helm-show-kill-ring))
(("C-s" . helm-occur))
(([f10] . 'helm-semantic-or-imenu))
(("C-c g" . helm-grep-do-git-grep)))  ;; Search using grep in a git project

(use-package helm-descbinds
:ensure t
:bind ("C-h b" . helm-descbinds))

(use-package which-key 
:ensure t 
:init
(which-key-mode)
)

(use-package ivy
  :ensure t  
  )

(use-package counsel
  :ensure t  
  :bind
  (("C-x b" . counsel-switch-buffer))
  (("C-x <down>" . counsel-switch-buffer))
  (("C-x C-f" . counsel-find-file))
  )

(use-package avy
  :ensure t
  :bind  
  ;;(("M-g f" . avy-goto-line))
  (("C-:" . avy-goto-char)))

(use-package popwin
  :ensure t
  :init
  (popwin-mode 1)
)

(use-package company
  :ensure t
  :config
  (setq company-idle-delay 0.2)
  (setq company-show-numbers t)
  (setq company-tooltip-limit 10)
  (setq company-minimum-prefix-length 2)
  (setq company-tooltip-align-annotations t)
  ;; invert the navigation direction if the the completion popup-isearch-match
  ;; is displayed on top (happens near the bottom of windows)
  (setq company-tooltip-flip-when-above t)
  (global-company-mode)
  :bind
  ;(("<C-return>" . company-complete))
  (("<C-M-return>" . company-complete))
)

(use-package company-quickhelp
  :ensure t
  :config
  (company-quickhelp-mode)
)

(use-package highlight-numbers
:ensure t
:init
(add-hook 'prog-mode-hook 'highlight-numbers-mode) 
)

(use-package neotree
  :ensure t
  :bind (([M-f12] . neotree-toggle))    
  :config
  (setq neo-theme 'arrow)
  ;(global-set-key [f9] 'neotree-toggle)

  )

(use-package treemacs
  :ensure t
  ;:config
  ;;(global-set-key [f12] 'treemacs)
  ;;(global-set-key (kbd "C-x t a") 'treemacs-add-project-to-workspace)
  ;; (global-set-key (kbd "C-c p") 'treemacs-add-project)
  :bind
  (:map global-map
        ([f12]   . treemacs)
        ("C-x t a"   . treemacs-add-project-to-workspace)
        )
)

(use-package rainbow-delimiters
:ensure t
)

(use-package multiple-cursors
   :ensure t
   :bind 
   (("C-c C-m" . mc/edit-lines))
   (("C->" . mc/mark-next-like-this))
   (("C-<" . mc/mark-previous-like-this))
   (("<M-S-down>" . mc/mark-next-like-this)) ;; no funciona bien con org mode
   (("<M-S-up>" . mc/mark-previous-like-this)) ;; por tambien active las de arriba
   (("C-S-l" . 'mc/mark-all-dwim))
   ;;(("C-c C-<" . 'mc/mark-all-like-this))
   ;;(("C-c C-a" . mc/skip-to-previous-like-this))
   (("C-M-}" . mc/skip-to-next-like-this))
   (("C-M-{" . mc/skip-to-previous-like-this))
   (("s-}" . mc/unmark-previous-like-this))
   (("s-{" . mc/unmark-next-like-this))
   ;;(("C-c C-M-{" . mc/mark-all-dwim))
   (("C-c C-M-}" . mc/mark-all-in-region))
   (("C-M-<mouse-1>" . mc/add-cursor-on-click))    
   (("C-c C-r" . mc/mark-sgml-tag-pair))
   )

(use-package quickrun 
:ensure t
:bind (:map prog-mode-map ("<f5>" . 'quickrun)))

;Modifica los espacion 4 for C/C++
(defun my-c++-mode-hook ()
  (setq c-basic-offset 4)
  (c-set-offset 'substatement-open 0))
(add-hook 'c++-mode-hook 'my-c++-mode-hook)
(add-hook 'c-mode-hook 'my-c++-mode-hook)

;Agrega color a la s secuencas de escape
(defface my-backslash-escape-backslash-face
  '((t :inherit font-lock-regexp-grouping-backslash))
  "Face for the back-slash component of a back-slash escape."
  :group 'font-lock-faces)

(defface my-backslash-escape-char-face
  '((t :inherit font-lock-regexp-grouping-construct))
  "Face for the charcter component of a back-slash escape."
  :group 'font-lock-faces)

(defface my-format-code-format-face
  '((t :inherit font-lock-regexp-grouping-backslash))
  "Face for the % component of a printf format code."
  :group 'font-lock-faces)

(defface my-format-code-directive-face
  '((t :inherit font-lock-regexp-grouping-construct))
  "Face for the directive component of a printf format code."
  :group 'font-lock-faces)


(font-lock-add-keywords 'c-mode
   '(("\\(\\\\\\)." 1 'my-backslash-escape-backslash-face prepend)
     ("\\\\\\(.\\)" 1 'my-backslash-escape-char-face      prepend)
     ("\\(%\\)."    1 'my-format-code-format-face         prepend)
     ("%\\(.\\)"    1 'my-format-code-directive-face      prepend)))

(font-lock-add-keywords 'java-mode
   '(("\\(\\\\\\)." 1 'my-backslash-escape-backslash-face prepend)
     ("\\\\\\(.\\)" 1 'my-backslash-escape-char-face      prepend)
     ("\\(%\\)."    1 'my-format-code-format-face         prepend)
     ("%\\(.\\)"    1 'my-format-code-directive-face      prepend)))

(font-lock-add-keywords 'c++mode
   '(("\\(\\\\\\)." 1 'my-backslash-escape-backslash-face prepend)
     ("\\\\\\(.\\)" 1 'my-backslash-escape-char-face      prepend)
     ("\\(%\\)."    1 'my-format-code-format-face         prepend)
     ("%\\(.\\)"    1 'my-format-code-directive-face      prepend)))

(use-package nyan-mode
  :ensure t
  ;;:config
  ;;(nyan-mode)
)

(use-package company-c-headers
:ensure t
:config 
(add-to-list 'company-backends 'company-c-headers)
)

(use-package projectile
  :ensure t
  ;;:init
  ;;(projectile-mode +1)
  ;; :bind (:map projectile-mode-map
  ;;             ("s-p" . projectile-command-map)
  ;;             ("C-c p" . projectile-command-map)              
  ;;             )
  :bind-keymap
  ("C-c p" . projectile-command-map)              
  ("s-p" . projectile-command-map)
  :bind
  (([f7] . projectile-mode))    
  :config
  (setq projectile-completion-system 'ivy)
)

(use-package counsel-projectile
:ensure t  
)

;;(use-package ivy-posframe
;;  :ensure t
;;  :config
;;  (setq ivy-posframe-display-functions-alist '((t . ivy-posframe-display)))
;;  (ivy-posframe-mode 1)
;;
;;  (setq ivy-posframe-display-functions-alist
;;        '(
;;          ;;(swiper          . ivy-posframe-display-at-point)
;;          ;;(counsel-M-x     . ivy-posframe-display-at-window-bottom-left)
;;          ;;(counsel-find-file . ivy-posframe-display-at-window-center)
;;          (ivy-switch-buffer . ivy-posframe-display) ; enlaza a counsel-switch-buffer
;;          )
;;  ) 
;;  
;;)

;; Utiliza expresiones regulares para encontrar los buffers.
(use-package "window"
  :ensure nil
  :init
  (setq display-buffer-alist
        '(
          ;; bottom buffer (NOT side window)          
          ;;("\\*helm M-x*"
          ;;(display-buffer-at-bottom))                               
          ;;("\\*helm occur*"
          ;;(display-buffer-at-bottom))

          ; Expresion ragular para cualquier buffer que tenga como nombre helm
          ("\\*helm*"
          (display-buffer-at-bottom))

          ("\\magit: [A-Z]"
          (display-buffer-at-bottom))           

          ("\\Narrowed [A-Z]"
          (display-buffer-at-bottom))

          ("\\quickrun"
          (display-buffer-at-bottom))

          ;;("\\*tex-shell"
          ;;(display-buffer-in-side-window)          
          ;;(window-width . 0.30)
          ;;(side . right))            

          )        
   )
)

(use-package magit
  :ensure t  
)

(use-package python
  :ensure nil
  :init
  (setq python-indent-offset 4)
  :mode ("\\.py\\'" . python-mode)
  :interpreter ("python" . python-mode)
  ;:config
  ;(setq python-shell-interpreter "python3")
)

(use-package web-mode
  :ensure t
  :mode (
         ("\\.html?\\'" . web-mode)
         ("\\.css\\'"   . web-mode)
         ("\\.php\\'"   . web-mode)
         ;;("\\.js\\'"    . web-mode)
         ;;("\\.tsx?\\'"  . web-mode)
         ;;("\\.json\\'"  . web-mode)
         )
  :config
  (defun html-close-element ()
    (interactive)
    (web-mode-element-close)
    (indent-region (point-min) (point-max))
    (open-line-below)
    )

  ;; Selecciona el contenido de la etiqueta
  (defun select-tag-content-element ()
    (interactive)
    (web-mode-tag-previous)
    (web-mode-tag-end)
    (set-mark-command (push-mark))
    (web-mode-tag-next)
    )


  (defun my-web-mode-hook ()
    "Hooks for Web mode."
    (setq web-mode-markup-indent-offset 2)
    ;; HTML
    (setq web-mode-markup-indent-offset 2)
    ;; CSS
    (setq web-mode-css-indent-offset 2)
    ;; Script/code offset indentation (for JavaScript, Java, PHP, Ruby, Go, VBScript, Python, etc.)
    (setq web-mode-code-indent-offset 2)
    ;;(setq web-mode-content-types-alist '(("jsx" . "\\.js[x]?\\'")))

    ;; Example: (define-key web-mode-map (kbd "C-c n") 'web-mode-buffer-indent)
    ;; (define-key web-mode-map (kbd "C-c C-r") 'mc/mark-sgml-tag-pair) como es web mode no sabe indentificar etiquetas como sgml-mode (aqui no funciona).

    (define-key web-mode-map (kbd "C-,") 'html-close-element)
    (define-key web-mode-map (kbd "C-c C-o") 'browse-url-of-file)

    ;; Select content element
    (define-key web-mode-map (kbd "C-c o") 'select-tag-content-element)
    ;; Definiendo tambien con Prefijos C-c C-e
    (define-key web-mode-map (kbd "C-c C-e C-c") 'select-tag-content-element)
    ;;(define-key web-mode-map (kbd "C-c C-e o") 'select-tag-content-element)


    ;;Company backends
    ;; https://github.com/company-mode/company-mode/issues/839
    (set (make-local-variable 'company-backends)
         '(company-css company-web-html company-yasnippet company-files company-capf company-dabbrev-code))
    )

  (add-hook 'web-mode-hook  'my-web-mode-hook)

  )

(use-package emmet-mode
  :ensure t
  :hook ((html-mode       . emmet-mode)
         (css-mode        . emmet-mode)
         (web-mode        . emmet-mode)
         ;; (sgml-mode       . emmet-mode) ;Auto-start on any markup modes
         ;; (js-mode         . emmet-mode)
         ;; (js-jsx-mode     . emmet-mode) ; Tiene que ver con react
         ;; (typescript-mode . emmet-mode)
         )
  :config
  ;;(setq emmet-insert-flash-time 0.001) ; effectively disabling it
  (define-key emmet-mode-keymap (kbd "<C-return>") 'open-line-below)
  (define-key emmet-mode-keymap (kbd "C-.") 'emmet-expand-line)

  )

(use-package company-web
  :ensure t
  :config

  (defun my-web-mode-hook ()
    "Hook for `web-mode'."
    (set (make-local-variable 'company-backends)
         '(company-css company-web-html company-yasnippet company-files))

    ;; manual autocomplete
    (define-key web-mode-map (kbd "M-RET") 'company-complete)

    ;; Enable JavaScript completion between <script>...</script> etc.
    (advice-add 'company-tern :before
                #'(lambda (&rest _)
                    (if (equal major-mode 'web-mode)
                        (let ((web-mode-cur-language
                               (web-mode-language-at-pos)))
                          (if (or (string= web-mode-cur-language "javascript")
                                  (string= web-mode-cur-language "jsx"))
                              (unless tern-mode (tern-mode))
                            (if tern-mode (tern-mode -1)))))))

    )

  (add-hook 'web-mode-hook 'my-web-mode-hook)  

)

(use-package google-translate
  :ensure t
  :bind 
  (("C-c t" . google-translate-at-point))
  (("C-c T" . google-translate-query-translate))
  (("C-c r" . google-translate-at-point-reverse))
  (("C-c R" . google-translate-query-translate-reverse))
  :init
  ;;(setq google-translate-default-source-language "auto")  ; Auto detect language.
  (setq google-translate-default-source-language "en")  ; Auto detect language.
  (setq google-translate-default-target-language "es")    ; Set your target language.

  )

(use-package expand-region
  :ensure t
  :config
  ;(global-set-key (kbd "C-=") 'er/expand-region)
  (global-set-key (kbd "C-@") 'er/expand-region)
  (global-set-key (kbd "s-SPC") 'er/expand-region)
  )

(use-package undo-tree
  :ensure t
  :bind  (([f6] . global-undo-tree-mode))    
  ;; :init
  ;; (global-undo-tree-mode)
  )

(use-package diminish
  :ensure t  
  )

(diminish 'ivy-posframe-mode)
(diminish 'which-key-mode)
;;(diminish 'yas-minor-mode)
;;(diminish 'projectile-mode)
(diminish 'eldoc-mode)                              
;;(diminish 'helm-mode)

(use-package visual-regexp
  :ensure t
  :config
  (define-key global-map (kbd "C-%") 'vr/replace)
  (define-key global-map (kbd "M-%") 'vr/query-replace)
  (define-key global-map (kbd "C-c m") 'vr/mc-mark)
  )

(use-package js2-mode
  :ensure t
  :mode
   (("\\.js\\'" . js2-mode))
  )

;; (use-package skewer-mode
;;   :ensure t
;;   )

;; (use-package js-comint
;;   :ensure t
;; )

(use-package impatient-mode
  :ensure t
  )

;; Colourful columns.
(use-package diredfl
  :ensure t
  :config
  (diredfl-global-mode 1))

;; Descripcion de los commit en dired-mode
(use-package dired-git-info
    :ensure t
    :bind (:map dired-mode-map
                (")" . dired-git-info-mode)))

(use-package evil
  :ensure t
  :config
  (evil-mode 1)
  )

(use-package undo-fu
  :ensure t
  :config
  (global-undo-tree-mode -1)
  (define-key evil-normal-state-map "u" 'undo-fu-only-undo)
  (define-key evil-normal-state-map "\C-r" 'undo-fu-only-redo))
