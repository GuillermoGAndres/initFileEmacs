; Referencias https://protesilaos.com/dotemacs/
(use-package "window"
  :ensure nil
  :init
  (setq display-buffer-alist
        '(
          ;; bottom side window          
          ;; ("\\*.*\\([^E]eshell\\|shell\\|v?term\\).*"
          ;; (display-buffer-in-side-window)  ; in-side-windows significa que no se puede partir mas.
          ;; (window-height . 0.40)
          ;; (side . bottom)
          ;; (slot . -1) ; Significa las colocaciones, -1 es derecha, 0 en medio, 1 a la izquierda.          
          ;; )

          ;; bottom buffer (NOT side window)          
          ("\\*helm M-x*"
           (display-buffer-at-bottom) 
           )
          
          ;; right side window
          ("\\*Faces\\*"
           (display-buffer-in-side-window)
                                        ;(window-width . 0.40)
           (side . right)
           (slot . 0)          

           ;; left side window
           ("\\*Help.*"
            (display-buffer-in-side-window)
                                        ;(window-width . 0.20)       ; See the :hook
            (side . left)
            (slot . 0)
                                        ;(window-parameters . ((no-other-window . t))) ;Hace que no sea seleccionable
            )

           ;; top side window
           ("\\*Messages.*"
            (display-buffer-in-side-window)
            (window-height . 0.16)
            (side . top)
            (slot . 1)
            (window-parameters . ((no-other-window . t))))           
           )
          
          )
        
        )
  )
