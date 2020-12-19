;------------------------------Themes----------------------------------
; Para conocer los colores de la sintaxis es: list-face-display

;Ese theme tambien me gusto
(add-to-list 'custom-theme-load-path "~/.emacs.d/initFileEmacs/myThemes/badger")
;(load-theme 'badger t)

(add-to-list 'custom-theme-load-path "~/.emacs.d/initFileEmacs/myThemes/dorsey-personalizado")
;(load-theme 'dorsey t)

(add-to-list 'custom-theme-load-path "~/.emacs.d/initFileEmacs/myThemes/fogus-personalizado")
(load-theme 'fogus t)

;Se debe de descargar si los quieren utilizar esto se tienes que instalar de MELPA o solo cargar el paquete.
;(add-to-list 'custom-theme-load-path "/home/guillermo/.emacs.d/themes/darkburn-theme")
;(load-theme 'darkburn t)
;(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/challenger-deep-theme")
;(load-theme 'challenger-deep t)
; Me gusto este thema, se ve bien python, html, javaScript, helm-mode, dired-mode
;(add-to-list 'custom-theme-load-path "/home/guillermo/.emacs.d/themes/dream-theme")

;fogus or dorsey, 
;(add-to-list 'custom-theme-load-path "~/.emacs.d/emacs-configuration/myThemes/dorsey-original")

;(load-theme 'dream t)
;(set-background-color "#1D1F21") ; Tono mas suave. newgro
;Instalando emacs color themes.
;(load-theme 'dorsey t)
;Este tema tambien esta chido.
;(load-theme 'sanityinc-tomorrow-night t)
; Buen tema para archivos editar archivos java.
;(load-theme 'junio)
;Instaldo desde MELPA doom-emacs
;(load-theme 'doom-city-lights t)

;Emacs-color-themes package , themas que me gustaron
;-Dorsey ;Color suave
;-Junio
;-Hickey ;Color suave
;-Fogus ; Me gusto su powerline azul
;Granger ; Me gusto powerline morado-azul
;(load-theme ' t)

;Probando themes
;(add-to-list 'custom-theme-load-path "/home/guillermo/.emacs.d/themes/aanila")
;(add-to-list 'custom-theme-load-path "/home/guillermo/.emacs.d/themes/emacs-abyss-theme")
;(add-to-list 'custom-theme-load-path "/home/guillermo/.emacs.d/themes/emacs-snazzy")
;(add-to-list 'custom-theme-load-path "/home/guillermo/.emacs.d/themes/dakrone-theme") ; Me gusta su color de letra
;(add-to-list 'custom-theme-load-path "/home/guillermo/.emacs.d/themes/ColorAreNice")
;(load-theme 'base16-default-dark t) ;Desintalar paquete, genera muchos themes.
;(load-theme 'aanila' t)
;(add-to-list 'custom-theme-load-path "/home/guillermo/.emacs.d/themes/avk-emacs-themes")
;(load-theme 'avk-darkblue-white' t)
;(load-theme 'avk-darkblue-yellow' t)

;----------------------Personalizar numbers --------------------------------
;Lineas amarillas que me gustado:  #F0DFAF
;foreground - color de la lineas
;Example
;(set-face-foreground 'linum "#F0DFAF") 

;(custom-set-faces ;Desactivar cuando desea cambiarlos
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
; '(linum ((t (:inherit (shadow default) :background "#171717" :foreground "#F0DFAF")))) ; badger.
; '(linum ((t (:inherit (shadow default) :background "#212121" :foreground "#F0DFAF")))) ; dorsey
; '(linum ((t (:inherit (shadow default) :background "#1B182C" :foreground "#F0DFAF")))) ;challenger-deep
; '(linum ((t (:inherit (shadow default) :background "#191935" :foreground "#F0DFAF")))) ;darkburn 
; '(linum ((t (:inherit (shadow default) :background "#1D252C" :foreground "#B5B54A")))) ;city-light
; '(linum ((t (:inherit (shadow default) :background "#1D1F21" :foreground "#F0DFAF")))) ; dream con oscuro claro.
; '(linum ((t (:inherit (shadow default) :background "#0D0E14" :foreground "#F0DFAF")))) ; dream normal.
; '(linum ((t (:inherit (shadow default) :background "#120312" :foreground "#F0DFAF")))) ; juno.
 ; Activar las configuracion solo cuando sea el tema dreams para company
 ;; '(company-preview ((t (:background "#373B41" :foreground "wheat"))))
 ;; '(company-preview-common ((t (:inherit company-preview :foreground "wheat"))))
 ;; '(company-tooltip-common ((t (:foreground "#8ABEB7")))) ;Color de las letras en coincidencia en pop
 ;; '(company-tooltip-selection ((t (:background "#7B7B7B")))) ;Color de seleccion resaltado.
 ;; '(company-tooltip ((t (:background "#373B41" :foreground "#C5C8C6")))) ;Color fondo y letra
 ;; '(company-scrollbar-bg ((t (:background "#282A2E")))) ;Color de scrollbar
 ;; '(company-scrollbar-fg ((t (:background "#373B41"))))

; )

; AJustando el padding de los numeros
;(setq linum-format "%3d") ; Only with dorsey.
;(setq linum-format "%4d") ; Only with dorsey.

;Cambiar el color de la franja de los numeros (fringe)
;(set-face-attribute 'fringe nil :background "#171717") ; badger
;(set-face-attribute 'fringe nil :background "#1D252C") ; City-light
;(set-face-attribute 'fringe nil :background "#1D1F21") ; dream con tema un tema oscuro claro

;(setq-default left-fringe-width 20)

;Example
; (set-face-attribute 'fringe nil :background "blue")
; (add-to-list 'default-frame-alist '(left-fringe . 10))
; (add-to-list 'default-frame-alist '(right-fringe . 10))
;(set-face-attribute 'line-number nil :background "gray96" :foreground "gray42")
;(set-face-attribute 'line-number-current-line nil :foreground "gray6")

;Padding de los numeros.
; https://stackoverflow.com/questions/21861491/how-to-add-padding-to-emacs-nw-linum-mode
;(setq linum-format "%2d")
;; (setq-default left-fringe-width  10)
;; (setq-default right-fringe-width  0)
;; (set-face-attribute 'fringe nil :background "black")

;(setq linum-format "%4d \u2502 ")

;--------------------------------------------------------------------------
;Example de un if.
;; (if (or (eq (car custom-enabled-themes) 'junio) (eq (car custom-enabled-themes) 'dream))
;;     (message "This message appears in the echo area!")
;;     )

; Company pop-up
(if (or (eq (car custom-enabled-themes) 'badger) (eq (car custom-enabled-themes) 'dream))
    (custom-set-faces
     '(company-preview ((t (:background "#373B41" :foreground "wheat"))))
     '(company-preview-common ((t (:inherit company-preview :foreground "wheat"))))
     '(company-tooltip-common ((t (:foreground "#5D6EA3")))) ;Color de las letras en coincidencia en pop
     '(company-tooltip-selection ((t (:background "#7B7B7B")))) ;Color de seleccion resaltado.
     '(company-tooltip ((t (:background "#1D1F21" :foreground "#C5C8C6")))) ;Color fondo y letra
     '(company-scrollbar-bg ((t (:background "#282A2E")))) ;Color de scrollbar
     '(company-scrollbar-fg ((t (:background "#373B41"))))
    ) 
  ;else
    ;(message "This message appears in the echo area!")  
)

; #8ABEB7 verde letra-commun - verder claro
; #373B41 fondo tiltop letra #C5C8C6 , negro con letras semigrise
; #282A2E bg scrollbar ; negro
; #373B41 fg scroo ; gris claro
; #969896 resaltado ; gris 
; #373B41 marcado regin.
;(set-face-background 'region "#373B41") ; Modifica region 
; #506272 ; Me gusta ese azul.


;Theme badger
(if  (eq (car custom-enabled-themes) 'badger) 
    (progn
      (custom-set-faces
       '(company-tooltip-common ((t (:foreground "#F28B86")))) ;Color de las letras en coincidencia en pop
       '(helm-source-header ((t (:extend t :foreground "#F28B86" :weight bold))))
       '(helm-match ((t (:extend t :foreground "#F28B86"))))
       '(helm-selection ((t (:extend t :background "gray37" :distant-foreground "black"))))
       '(company-tooltip-annotation ((t (:foreground "#C5C8C6"))))
       '(linum ((t (:inherit (shadow default) :background "#171717" :foreground "#F0DFAF")))) ; badger.

       '(font-lock-type-face ((t (:foreground "#F0DFAF")))) ; Clases y types amarillas
       '(font-lock-constant-face ((t (:foreground "#F0DFAF")))) ;Contastantes amarillas
       '(font-lock-string-face ((t (:foreground "#D1907F")))) ;Cadenas naranjas
       '(font-lock-variable-name-face ((t (:foreground "#F6F3E8")))) ;Parametros color normales a la letra.
       '(font-lock-function-name-face ((t (:foreground "#F28B86")))) ;metodos color salmon
       '(font-lock-doc-face ((t (:foreground "#86B187")))) ;Dosting verde 
       
       )
      (set-face-background 'region "gray37") ;Adecuado para theme badger
      (set-face-attribute 'fringe nil :background "#171717") ; badger      
   )
)


(if (or (eq (car custom-enabled-themes) 'dorsey) (eq (car custom-enabled-themes) 'fogus))
    (progn
      (custom-set-faces
       '(font-lock-type-face ((t (:foreground "#F0DFAF")))) ; Clases y types amarillas
       '(font-lock-constant-face ((t (:foreground "#F0DFAF")))) ;Contastantes amarillas
       '(font-lock-string-face ((t (:foreground "#D1907F")))) ;Cadenas naranjas
       '(font-lock-variable-name-face ((t (:foreground "#9FB3C2")))) ;Color verde chido #8AB8A2 or gris #9FB3C2, para los nombre de los tipos.
       ;'(font-lock-function-name-face ((t (:foreground "#F28B86")))) ;metodos color salmon para las funcines
       ;'(font-lock-function-name-face ((t (:foreground "#C7AF3F")))) ; o Amarillo super chido tambien para las funciones
       '(font-lock-function-name-face ((t (:foreground "#FAFFDB")))) ;metodos for python color amarillo para las funcines
       '(font-lock-doc-face ((t (:foreground "#86B187")))) ;Docsting gris chido #9FB3C2 or verde chido #8AB8A2 o verde  #86B187 un poco nitido.
       '(font-lock-keyword-face ((t (:foreground "#8AC6F2" :weight normal)))) ;Color azul muy chido.

       ;Company
       '(company-preview ((t (:background "#373B41" :foreground "wheat"))))
       '(company-preview-common ((t (:inherit company-preview :foreground "wheat"))))
       '(company-tooltip-common ((t (:foreground "#F0DFAF")))) ;Color de las letras en coincidencia en pop
       '(company-tooltip-selection ((t (:background "#7B7B7B")))) ;Color de seleccion resaltado.
       '(company-tooltip ((t (:background "#1D1F21" :foreground "#C5C8C6")))) ;Color fondo y letra
       '(company-scrollbar-bg ((t (:background "#282A2E")))) ;Color de scrollbar
       '(company-scrollbar-fg ((t (:background "#373B41"))))
       ;Helm
       '(helm-source-header ((t (:extend t :foreground "#F0DFAF" :weight bold))))
       '(helm-match ((t (:extend t :foreground "#F0DFAF"))))
       '(helm-selection ((t (:extend t :background "gray37" :distant-foreground "black"))))
       
       '(linum ((t (:inherit (shadow default) :background "#13182D" :foreground "#F0DFAF"))))
       
       )
            
      (set-face-background 'region "gray37") 
      (set-face-attribute 'fringe nil :background "#13182D")
      ;(set-background-color "#13182D") ; Buen background color azul marino, me gusto, tambien el negro del tema esta muy padre.
   )
)


; #FAFFDB Ese amrillo me gusta amariilo
; #9FB3C2 Es como un gris azul, me gusta el colot 
;(set-background-color "#13182D") ; Buen background color azul marino, me gusto
;(set-background-color "#171717") ; Background black de Badger.
; #ABABAC Griss de las lineas. #797B83
; #212121 black dorsey se ve bien negro.

;; (if  (eq (car custom-enabled-themes) 'dorsey)
;;     (progn
;;       (setq linum-format "%2d") ;Es que deja mucho padding a la izquierda
;;       )
;; )

(if  (eq (car custom-enabled-themes) 'fogus)
    (progn
      (custom-set-faces       
       '(linum ((t (:inherit (shadow default) :background "#14191F" :foreground "#F0DFAF"))))       
       )
      (set-face-attribute 'fringe nil :background "#14191F")
    )
)


;Theme junio
;; (if  (eq (car custom-enabled-themes) 'junio) 
;;     ;(message "This message appears in the echo area!")
;;     (set-cursor-color "orange")
;; )


;(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.

; )

;------------------------------------------------------

