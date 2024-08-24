(map!
 :leader
  (
   "w" #'er/expand-region
   "s" #'paredit/splice-xesp
   "(" #'paredit-wrap-round
   "{" #'paredit-wrap-curly
   "[" #'paredit-wrap-square
   )
 )
(setq display-line-numbers-type 'relative)

(setq doom-theme
      'doom-ayu-mirage
      ;; 'doom-plain
      ;; 'doom-plain-dark
      ;; 'doom-spacegrey
      ;; 'doom-henna
      ;; 'doom-flatwhite
      ;; 'doom-wilmersdorf
      doom-font (font-spec
                 :family "Agave Nerd Font Mono"
                 :weight 'normal)
      )
