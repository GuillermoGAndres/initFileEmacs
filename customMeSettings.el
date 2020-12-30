; Referencias

(setq user-full-name "Guillermo Andres")
(setq user-mail-address "memocampeon35@gmail.com")
;; Create a variable to indicate where emacs's configuration is installed
(setq EMACS_DIR "~/.emacs.d/")

;---------------------------Paquetes de Melpa--------------------------------
; install the melpa repository
(require 'package)
(setq package-archives '(                          
                         ("melpa"     . "http://melpa.org/packages/")
			             ("elpa" . "https://elpa.typefo.com/packages/")
                         ("melpa-stable" . "https://stable.melpa.org/packages/")
			             ;;("elpa"       . "http://elpa.gnu.org/packages/")
			             ;;("org"       . "http://orgmode.org/elpa/")
                         ;;("marmalade" . "http://marmalade-repo.org/packages/")
 						 ))
(package-initialize)
;(package-refresh-contents) ; Actualiza los paquetes cada vez que entres.

; Use package, si no esta instalado lo instala automaticamente y si lo esta refresca los paquetes.
;; Bootstrap 'usepackage
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; Enable use-package
;http://cachestocaches.com/2015/8/getting-started-use-package/
(eval-when-compile
  (require 'use-package))
(require 'bind-key)

;----------------------------Mi configuracion--------------------------------------------------  

;; Longer whitespace, otherwise syntax highlighting is limited to default column
(setq whitespace-line-column 1000) 
; Ajusta el parrafo del buffer scratch.
(setq initial-scratch-message "")

;; Enable soft-wrap
;; (global-visual-line-mode 1)

;; Maintain a list of recent files opened
(recentf-mode 1)            
(setq recentf-max-saved-items 50)

;; Move all the backup files to specific cache directory
;; This way you won't have annoying temporary files starting with ~(tilde) in each directory
;; Following setting will move temporary files to specific folders inside cache directory in EMACS_DIR

(setq user-cache-directory (concat EMACS_DIR "cache"))
(setq backup-directory-alist `(("." . ,(expand-file-name "backups" user-cache-directory)))
      url-history-file (expand-file-name "url/history" user-cache-directory)
      auto-save-list-file-prefix (expand-file-name "auto-save-list/.saves-" user-cache-directory)
      projectile-known-projects-file (expand-file-name "projectile-bookmarks.eld" user-cache-directory))

; Coding specific setting
;; Automatically add ending brackets and braces
;(electric-pair-mode 1)

; Tiempo de echo.
(setq echo-keystrokes 0.3)

(set-language-environment "UTF-8")

;I like having the clock. 
;(display-time-mode 1)

;Most programming languages I work with prefer spaces over tabs
(setq-default indent-tabs-mode nil)

;; Make sure tab-width is 4 and not 8
(setq-default tab-width 4)

;Let’s disable questions about theme loading while we’re at it.
(setq custom-safe-themes t)

; Con esto no envuelve las lineas
(setq-default truncate-lines t)
;M-x toggle-truncate-lines
;if your lines wrap hard at the right-hand edge of the window,
;M-x visual-line-mode

;Commet y descommet
(global-set-key (kbd "C-;") 'comment-or-uncomment-region)

;Inicializ Emacs server para sea mas rapido abrir archivos desde la terminal
;emacsclient file.java // By example
;(server-start) ;Ya no sera necesario con el plugin zsh emacs.

;Control-Alt-n Encuentra su otro parentesis
;C-M-n forward-sexp or C-M right
;C-M-b backward-sexp or C-M left
;(global-set-key (kbd "C-c n") 'forward-sexp)
;(global-set-key (kbd "C-c b") 'backward-sexp)

;Aumentar tamaño de letra, before config: 130
;(set-face-attribute 'default nil :height 140)

;Agregar numeros de lineas
;@reference: https://emacs.stackexchange.com/questions/278/how-do-i-display-line-numbers-in-emacs-not-in-the-mode-line
(add-hook 'prog-mode-hook 'linum-mode)

;@see: https://www.emacswiki.org/emacs/ShowParenMode
;Matches parentesis
(show-paren-mode 1)

;Ocultar tool bar 
(tool-bar-mode -1)
(menu-bar-mode -1) 
;Destacar la línea actual
;(global-hl-line-mode +1)
;Pava ver menu bar solo cuando es ejecutado windos-system (GUI)
;(if window-system
;    (menu-bar-mode 1)
; )

;Don't show intro
(setq inhibit-startup-message t)

;Better answer
(fset 'yes-or-no-p 'y-or-n-p)
; Enable autopair in all buffers
(electric-pair-mode) 

; Alias de C-g para quitar command.
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

;Refresf buffer
(global-set-key [f5] 'revert-buffer)
;Evoid confirmation
;(global-set-key [f5] (lambda () (interactive) (revert-buffer nil t)))

(global-set-key (kbd "C-c <C-left>")  'windmove-left)
(global-set-key (kbd "C-c <C-right>") 'windmove-right)
(global-set-key (kbd "C-c <C-up>")    'windmove-up)
(global-set-key (kbd "C-c <C-down>")  'windmove-down)

(global-set-key (kbd "C-x C-b") 'ibuffer)

(global-set-key (kbd "C-c C-g") 'goto-line)

(global-set-key (kbd "C-c c") 'compile)

(add-hook 'markdown-mode-hook  'visual-line-mode)
(add-hook 'text-mode-hook  'visual-line-mode)
(add-hook 'org-mode  'visual-line-mode)
(add-hook 'web-mode-hook  'visual-line-mode)

(global-set-key (kbd "C-x <C-right>") 'tab-next)
(global-set-key (kbd "C-x <C-left>") 'tab-previous)
(global-set-key (kbd "C-M-:") 'eval-region)


;----------------Notas-------------------------------------------------------------------------
; No se te olvide que cada vez que haces una configuracion o instalas un paquete , se configurara
; en el archivo pluginsuser/customFacesMe.el tienes que limpiarlo si cambias de tema, ya que se quedaran
; guardados las configuraciones del tema anterior, esto solo si tiene tiene informacion el archivo customFacesme.el


