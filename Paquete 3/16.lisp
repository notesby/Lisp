;;Defina una función recursiva Cambia que reciba como argumento una lista y dos
;;elementos elem1, elem2. Como respuesta, la función debe entregar otra lista
;;parecida a la original, pero donde todas las ocurrencias de elem1 se substituyeron por
;;elem2.

(defun Cambia (lista elem1 elem2)
	(cond 	((null lista) nil)
			((eql (first lista) elem1)
	 			(cons elem2
	       		(Cambia (rest lista) elem1 elem2)))
			(T (cons (first lista)
		 		(Cambia (rest lista) elem1 elem2))) ))

;; (Cambia '( 1 2 3 4 3 5) 3 6 )
;;> (1 2 6 4 6 5)