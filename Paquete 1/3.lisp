;; a)
;; (cdar '((one two) three four))) ;; asi es como viene en el archivo
;;  Evaluation aborted on #<SB-INT:SIMPLE-READER-ERROR "unmatched close parenthesis" {1371E9A1}>.
(cdar '((one two) three four ))
;; quitandole un parentesis regresa:
;; (TWO)

;; b)
(append (cons '(eva lisa) '(karl sven)) '(eva lisa) '(karl sven))
;; ((EVA LISA) KARL SVEN EVA LISA KARL SVEN)

;; c)
(subst 'gitan 'birgitta '(eva birgitta lisa birgitta karin))
;; (EVA GITAN LISA GITAN KARIN)

;; d)
(remove 'sven '(eva sven lisa sven anna))
;; (EVA LISA ANNA)

;; e)
(butlast '(karl adam nilsson gregg alisson vilma) 3)
;; (KARL ADAM NILSSON)

;; f)
(nth 2 '(a b c d e))
;; C

;; g)
(nthcdr 2 '(a b c d e))
;; (C D E)

;; h)
(intersection '(a b c) '(x b z c))
;; (C B)

;; i)
(cdadar '(((((1 2 3) z) y) (x 4)) 7 8 (a b c (5 (6 7 8)))))
;; (4)