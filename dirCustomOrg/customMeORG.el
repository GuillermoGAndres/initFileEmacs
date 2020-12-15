;Automatizar mis plugins para que se instalen solos si no los tengo.
;; (use-package yasnippet :config (yas-global-mode))
;; (use-package yasnippet-snippets :ensure t)

;yasnippet
(add-to-list 'load-path
              "~/.emacs.d/plugins/yasnippet")
(require 'yasnippet)
(yas-global-mode 1)

;Define word (Search a dictionary wordnik)
(global-set-key (kbd "C-c d") 'define-word-at-point)
(global-set-key (kbd "C-c D") 'define-word)

; Google translate
;(setq google-translate-default-source-language "auto")  ; Auto detect language.
(setq google-translate-default-source-language "en")  ; Auto detect language.
(setq google-translate-default-target-language "es")    ; Set your target language.
;Binding or shortcuts
(global-set-key (kbd "C-c t") 'google-translate-at-point)
(global-set-key (kbd "C-c T") 'google-translate-query-translate)

;Reverse translate
(global-set-key (kbd "C-c r") 'google-translate-at-point-reverse)
(global-set-key (kbd "C-c R") 'google-translate-query-translate-reverse)

; Corrector ortografico  ( spell checker )
(setq-default ispell-program-name "aspell")
	
(setq ispell-dictionary "english")

;M $ :Check and correct spelling of the word at point (ispell-word). If the region is active, do it for all words in the region instead.
;M-x ispell : Check and correct spelling of all words in the buffer. If the region is active, do it for all words in the region instead. 
;M-x flyspell-prog-mode : Enable Flyspell mode for comments and strings only. 
;M-x flyspell-mode : Enable Flyspell mode, which highlights all misspelled words. 

;Flyspell comes with a mode to check comments and strings in programming modes. Just type M-x flyspell-prog-mode or add it to your mode hooks
  ;; (add-hook 'c++-mode-hook
  ;;         (lambda ()
  ;;           (flyspell-prog-mode)
  ;;           ; ...
  ;;           ))

(add-hook 'LaTeX-mode-hook 'flyspell-mode) ;start flyspell-mode
;(add-hook 'c++-mode-hook 'flyspell-prog-mode)

(use-package rainbow-delimiters
:ensure t
:defer t
:config
(add-hook 'prog-mode-hook #'prog-delimiters-mode))

;; (use-package flycheck :ensure t :init (global-flycheck-mode))

;(add-hook 'c-mode-hook 'flycheck-mode)
;(add-hook 'c++-mode-hook 'flycheck-mode)
;(add-hook 'java-mode-hook 'flycheck-mode)

;Use impatient-mode
;M-x httpd-start
;M-x impatient-mode
;http://localhost:8080/imp/

;Previuw markdown
(defun markdown-html (buffer)
  (princ (with-current-buffer buffer
    (format "<!DOCTYPE html><html><title>Impatient Markdown</title><xmp theme=\"united\" style=\"display:none;\"> %s  </xmp><script src=\"http://strapdownjs.com/v/0.2/strapdown.js\"></script></html>" (buffer-substring-no-properties (point-min) (point-max))))
  (current-buffer)))

;Tell impatient mode to use it: M-x imp-set-user-filter RET markdown-html RET
;https://stackoverflow.com/questions/36183071/how-can-i-preview-markdown-in-emacs-in-real-time/36189456
;https://blog.bitsandbobs.net/blog/emacs-markdown-live-preview/

;; (defun my-markdown-preview ()
;;   "Preview markdown."
;;   (interactive)
;;   (httpd-start)
;;   (impatient-mode)
;;   (imp-set-user-filter "markdown-html")
;;   )

(add-hook 'markdown-mode-hook  'visual-line-mode)
(add-hook 'text-mode-hook  'visual-line-mode)
(add-hook 'org-mode  'visual-line-mode)
(add-hook 'web-mode-hook  'visual-line-mode)

; Lo instale previmanete con melpa.
(require 'multiple-cursors)

(global-set-key (kbd "C-c C-m") 'mc/edit-lines)

(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)
(global-set-key (kbd "C-c C-a") 'mc/skip-to-previous-like-this)
(global-set-key (kbd "C-M-<mouse-1>") 'mc/add-cursor-on-click)

(use-package quickrun 
:ensure t
:bind ("C-c r" . quickrun))

;@refernce
;https://github.com/neppramod/java_emacs/blob/master/emacs-configuration.org
;Solo funciona con la version reciente de java 11, asi tienes que cambiar tu java8 a java 11
;ensure t - Signigica que use-package ira a buscar el paquete si no tienes descargado.

(use-package lsp-mode
:ensure t
;; :hook (
;;    (lsp-mode . lsp-enable-which-key-integration)
;;    (java-mode . #'lsp-deferred)
;; )
:init (setq 
    ;; lsp-keymap-prefix "C-c l"              ; this is for which-key integration documentation, need to use lsp-mode-map
    ;; lsp-enable-file-watchers nil
    read-process-output-max (* 1024 1024)  ; 1 mb
    lsp-completion-provider :capf
    lsp-idle-delay 0.500
)
:config 
    ;; (setq lsp-intelephense-multi-root nil) ; don't scan unnecessary projects
    ;; (with-eval-after-load 'lsp-intelephense
    ;; (setf (lsp--client-multi-root (gethash 'iph lsp-clients)) nil))
	;; (define-key lsp-mode-map (kbd "C-c l") lsp-command-map)
	(global-set-key (kbd "C-c l") 'helm-lsp-code-actions)
)

(use-package lsp-java 
:ensure t
;; :config (add-hook 'java-mode-hook 'lsp)
)

(use-package treemacs
  :ensure t
  :config
  (global-set-key [f12] 'treemacs)
  (global-set-key (kbd "C-c p") 'treemacs-add-project)
)

;Compila any file 
(global-set-key (kbd "C-c c") 'compile)

;MUestro los numeros a color
(add-hook 'prog-mode-hook 'highlight-numbers-mode)
;(hes-mode)

; Configuracion para que muestre las secuencias de escape a color.
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

;Modifica los espacion 4 for C/C++
(defun my-c++-mode-hook ()
  (setq c-basic-offset 4)
  (c-set-offset 'substatement-open 0))
(add-hook 'c++-mode-hook 'my-c++-mode-hook)
(add-hook 'c-mode-hook 'my-c++-mode-hook)

;(add-to-list 'company-backends 'company-c-headers)

;progn me parece es para agrupar varias sentencias ene un if.

;Set default size windows
(if (display-graphic-p)
    (progn
      (setq initial-frame-alist
            '(
              (tool-bar-lines . 0)
              (width . 117) ; chars
              (height . 31) ; lines
              ;(background-color . "#1D1F21") ;Tono mas suave para dream.
              ))
      (setq default-frame-alist
            '(
              (tool-bar-lines . 0)
              (width . 117)
              (height . 31)
              ;(background-color . "#1D1F21")
              ))
      (set-frame-position (selected-frame) 300 175) ;My ajustando posicion del frame.
      )
  (progn
    (setq initial-frame-alist '( (tool-bar-lines . 0)))
    (setq default-frame-alist '( (tool-bar-lines . 0))))
)

; Para que agarre el color en nw, es decir, terminal
; Reference: https://emacs.stackexchange.com/questions/47452/why-doesnt-set-background-color-work-in-my-init-file
(if (eq window-system 'nil)    
     (add-to-list 'default-frame-alist '(background-color . "#1D1F21"))     
  )



; Puedes mostrar los coloser con M-x list-colors-display
; Y ajustar la franje del marcado con:
;(set-face-background 'region "#7f7f7f") ;Adecuado para theme dream in terminal.

; Example how install plugins.
;; (add-to-list 'load-path "/home/guillermo/.emacs.d/plugins/powerline/")
;; (require 'powerline) ; or (load 'file)
;; (powerline-default-theme)
;; (set-cursor-color "orange")
;; (set-background-color "#000000")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(sublime-themes default-text-scale color-theme-sanityinc-tomorrow helm-lsp quickrun company-bootstrap doom-modeline multiple-cursors flymd company-box company-quickhelp mode-icons yasnippet-snippets which-key web-mode use-package rainbow-delimiters projectile nyan-mode neotree magit lsp-java langtool kaolin-themes impatient-mode highlight-numbers highlight-escape-sequences helm google-translate flycheck exec-path-from-shell emmet-mode eglot dumb-jump doom-themes define-word dashboard counsel company-web company-c-headers all-the-icons ac-html-csswatcher ac-html ac-clang ac-capf ac-c-headers)))
