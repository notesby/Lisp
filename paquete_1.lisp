;;1)

;; a) El quinto elemento de la lista (((1 2) 3) 4 (5 (6)) A (B C) D (E (F G))), sin usar la funci ón FIFTH.

(first (rest (rest (rest (rest '(((1 2) 3) 4 (5 (6)) A (B C) D (E (F G))))))))

;; b) El número de segundos que tiene el año bisiesto 2004.

(abs (- (encode-universal-time 0 0 0 1 1 2004)  (encode-universal-time 59 59 23 31 12 2004)))

;; c) Si el valor numérico asociado a la variable x es diferente de cero y además menor o igual que el valor asociado a la variable y.

(and (not (= x 0)) (<= x y))

;; d) Una lista con las dos soluciones reales de la ecuación 2x^2+7x+5=0

(list (/ (+ -7.0 (sqrt (- (expt 7 2) (* 4 2 5)))) (* 2 2)) (/ (- -7.0 (sqrt (- (expt 7 2) (* 4 2 5)))) (* 2 2)))

;;2)

;;  a)
(+ (* 2 4) (- 6 8))

;;	b)
(/ (+ 5 (+ -3 4)) (+ 6 (/ 2 5)))

;;	c)
(sqrt (/ (+ (* -1 (- -4 (/ 3 8))) 1.4502) (expt -1 (expt (- 3 5) (/ 1 3)))))

;;	d)
(expt (/ (expt (/ 65.402 (sqrt -1)) 1/5 ) 0.17 ) 1/7 )

;;3)

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

;;4)

;; Defina una función Recombina que reciba como argumento una lista de la
;; forma ((A . x) (B . y) (C . z)), donde A, B y C son átomos simbólicos, mientras
;; que x, y y z son números. Como respuesta, la función debe entregar otra lista
;; con la siguiente estructura: ( ((x y) . A) ((y z) . C) ((z y x) . B) )
(defun Recombina (&key ((:lista-no-propia lnp))) 
	(if (and (listp lnp) 
			(and (symbolp (first (first lnp))) (numberp (rest (first lnp)))) 
			(and (symbolp (first (second lnp))) (numberp (rest (second lnp)))) 
			(and (symbolp (first (third lnp))) (numberp (rest (third lnp))))) 
		(list (cons (list (rest (first lnp)) (rest (second lnp))) (first (first lnp))) 
				(cons (list (rest (second lnp)) (rest (third lnp))) (first (third lnp))) 
				(cons (list (rest (third lnp)) (rest (second lnp)) (rest (first lnp))) (first (second lnp)))) 
		nil ))
;;ejemplo: (Recombina :lista-no-propia '((Z . 2)(X . 3)(C . 4)))

;;5)

;; Defina un predicado RealNoCero? que reciba un argumento N y responda si su argumento es o no un número real diferente de cero.
(defun RealNoCero? (N)(and (realp N) (> N 0)))

;;6)

;;Construya una funci ón Analiza, con argumento X, que responda una lista con los valores de verdad correspondientes a las respuestas a 
;;las siguientes preguntas: ¿es X un átomo?, ¿es X un n úmero?, ¿es X una lista? , ¿es X una celda de construcción? y ¿es X una lista vacía?
(defun Analiza (X) (list (atom X) (numberp X) (listp X) (consp X) (and (listp X) (null X))))