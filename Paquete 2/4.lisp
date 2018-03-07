;;Construya una función Primer-impar que reciba como argumento una lista y como
;;respuesta entregue otra lista conteniendo el primer elemento de la lista original que
;;sea un número impar y la posición (índice) donde se encuentra.

(defun Primer-impar (lista) 
	(loop for i from 0 to (length lista) 
			for e in lista with encontrado = NIL
			until (setq encontrado (and (numberp e) (= (mod e 2) 1)))
			finally (if encontrado (return (list e i)) (return NIL) )))

;; (Primer-impar '( 1 2 3 4 5 6))
;; (1 0)

;; (Primer-impar '( 2 4 6 1 3 5))
;; (1 3)