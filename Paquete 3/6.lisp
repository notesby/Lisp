;;Escriba la función Conteo que recibe como argumento una lista cualquiera y, como
;;respuesta, entregue una celda de construcción cuya primera parte contiene el conteo de
;;elementos numéricos de la lista original y cuya segunda parte contiene el conteo de
;;sublistas contenidas en la lista original.

(defun Conteo (lista)
  	(cond 	((null lista) (cons 0 0))
			((numberp (first lista))
				(cons (+ (first (Conteo (rest lista))) 1)
		      		(rest (Conteo (rest lista)))))
			((listp (first lista))
	 			(cons (first (Conteo (rest lista)))
	       			(+ (rest (Conteo (rest lista))) 1)))
			(T (cons 0 0)) ))

;; 	(Conteo '( 1 2 3 ( 4 5) (6 7)))
;;> (3 . 2)