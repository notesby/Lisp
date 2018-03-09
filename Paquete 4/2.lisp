;; [Palíndromo, argumento: una lista, Recursiva. Predicado] Si la lista recibida es un
;; palíndromo, regresa T; de lo contrario regresa NIL.

(defun Palíndromo (lista)
        (if (null lista)
            T
            (if (equal (first lista) (nth (- (length lista) 1) lista))
                (Palíndromo (reverse (rest (reverse (rest lista)))))
                NIL)))

;; (PALÍNDROMO '(a b c))
;;> NIL

;; (PALÍNDROMO '( a b c c b a))
;;>	T