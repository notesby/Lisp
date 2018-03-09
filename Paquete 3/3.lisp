;;Modifique la función del ejercicio anterior para que se llame Termina-en y entregue
;;como respuesta una copia de la lista original pero que termina en la última ocurrencia
;;del elemento dado 

(defun Termina-en (elem lista)
  (cond ((null lista) lista)
	((eql (first (reverse lista)) elem) lista)
	(T (Termina-en elem (reverse (rest (reverse lista))) )) ))

;;	(Termina-en 3 '(1 2 3 4 5 6))
;;> (1 2 3)

;;	(Termina-en 3 '(1 2 3 4 3 6))
;;> (1 2 3 4 3)

;;(Termina-en 'A '( B C D A F G))
;;> (B C D A)