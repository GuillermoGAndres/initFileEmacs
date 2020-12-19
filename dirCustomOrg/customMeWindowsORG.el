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
