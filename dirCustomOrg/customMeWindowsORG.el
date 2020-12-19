;(use-package exec-path-from-shell
;  :ensure t
;  :config (exec-path-from-shell-initialize))

; Quita el echo de shell
(defun my-shell-turn-echo-off ()
  (setq comint-process-echoes t))
(add-hook 'shell-mode-hook 'my-shell-turn-echo-off)

; Para que funcion C-d para kill terminal
(defun my-eshell-quit-or-delete-char (arg)
  (interactive "p")
  (if (and (eolp) (looking-back eshell-prompt-regexp))
      (eshell-life-is-too-much) ;; http://emacshorrors.com/post/life-is-too-much
    (delete-forward-char arg)))
(defun my-eshell-setup ()
  (define-key eshell-mode-map (kbd "C-d") 'my-eshell-quit-or-delete-char))

(add-hook 'eshell-mode-hook 'my-eshell-setup)

(use-package yasnippet
  :ensure t
  :init
  (yas-global-mode 1)
)

; Repositorio de snippets ya hechos.
(use-package yasnippet-snippets
  :ensure t
  )

(use-package helm
:ensure t
:init 
(helm-mode 1)
(progn (setq helm-buffers-fuzzy-matching t))
:bind
(("C-c h" . helm-command-prefix))
(("M-x" . helm-M-x))
(("C-c f" . helm-recentf))   ;; Add new key to recentf
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
  (("C-x C-f" . counsel-find-file))
  )

(use-package avy
  :ensure t
  :bind  
  (("C-c j" . avy-goto-word-or-subword-1))
  (("C-:" . avy-goto-line)))

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
  (("<C-return>" . company-complete))
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
:config
(setq neo-theme 'arrow)
(global-set-key [f9] 'neotree-toggle))

(use-package treemacs
  :ensure t
  :config
  (global-set-key [f12] 'treemacs)
  (global-set-key (kbd "C-c p") 'treemacs-add-project)
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
(("C-c C-<" . 'mc/mark-all-like-this))
(("C-c C-a" . mc/skip-to-previous-like-this))
(("C-M-<mouse-1>" . mc/add-cursor-on-click))
)

(use-package quickrun 
:ensure t
:bind ("C-c r" . quickrun))
