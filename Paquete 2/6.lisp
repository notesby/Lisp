;;Escriba la función Conteo que recibe como argumento una lista cualquiera y, como
;;respuesta, entregue una celda de construcción cuya primera parte contiene el conteo de
;;elementos numéricos de la lista original y cuya segunda parte contiene el conteo de
;;sublistas contenidas en la lista original.

(defun Conteo (lista) 
	(loop for e in lista 
		when (numberp e)
			count e into conteo-numeros
		when (listp e)
			count e into conteo-sublistas
		finally (return (cons conteo-numeros conteo-sublistas)) ))

;; 	(conteo '(( A B) 1 A ( 2 3) 4 5))
;;> (3 . 2)

;;	(conteo '((a) (b) (c) 1 2 (3) 4 ))
;;>	(3 . 4)