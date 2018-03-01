;;Modifique la función del ejercicio anterior para que se llame Termina-en y entregue
;;como respuesta una copia de la lista original pero que termina en la última ocurrencia
;;del elemento dado 

(defun Termina-en (el lista) 
	(reverse (loop for i downfrom (length lista) to 0 
			with acumula = NIL 
			when (or (eq acumula T) (setq acumula (eq el (nth i lista)))) 
			collect (nth i lista))))

;;	(Termina-en 3 '(1 2 3 4 5 6))
;;> (1 2 3)

;;	(Termina-en 3 '(1 2 3 4 3 6))
;;> (1 2 3 4 3)

;;(Termina-en 'A '( B C D A F G))
;;> (B C D A)