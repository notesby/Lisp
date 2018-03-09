;;Modifique la función del inciso anterior para que entregue en la lista de respuesta el
;;último elemento de la lista que sea un número real mayor o igual que cero y el número
;;de veces que dicho elemento se repite en toda la lista.

(defun Repeticiones (elem lista)
	(cond ((null lista) 0)
			((eql (first lista) elem)
	 			(+ 1 (Repeticiones elem (rest lista))) )
			(T (+ 0 (Repeticiones elem (rest lista)))) ))


(defun Ultimo-real (lista)
	(setq lista (reverse lista))
		(cond ((null lista) nil)
				((and (realp (first lista)) (>= (first lista) 0))
	 				(list (first lista)
	       			(- (Repeticiones (first lista) lista) 1)) )
				(T (Ultimo-real (reverse (rest lista)))) )
  )

;;	(Ultimo-real '( 1 2.0 3 4 2.0 A))
;;> (2.0 1)

;;	(Ultimo-real '( 1 2.0 3 2.0 2.0 1i))
;;>	(2.0 2)