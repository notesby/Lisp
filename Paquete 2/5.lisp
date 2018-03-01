;;Modifique la función del inciso anterior para que entregue en la lista de respuesta el
;;último elemento de la lista que sea un número real mayor o igual que cero y el número
;;de veces que dicho elemento se repite en toda la lista.

(defun Ultimo-real (lista) 
	(loop for i downfrom (length lista) to 0 
			with real = NIL 
			with e
			do (setq e (nth i lista))
			when (and (not (null real)) (= e real))
				count e into contador
			when (and (null real) (realp e) (>= e 0)) 
				do (setq real e)
			finally (return (list real contador))))

;;	(Ultimo-real '( 1 2.0 3 4 2.0 A))
;;> (2.0 1)

;;	(Ultimo-real '( 1 2.0 3 2.0 2.0 1i))
;;>	(2.0 2)