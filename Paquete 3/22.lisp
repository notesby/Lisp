;;Defina una función QSort que reciba como argumento único una lista e
;;implemente con ellos el algoritmo de ordenamiento Quick Sort, ignorando por
;;completo aquellos elementos de la lista original que no sean numéricos. La respuesta
;;de la función debe ser una lista con los elementos numéricos de la original ordenados
;;de forma ascendente.

(defun QSort (lista)
  	(if (null lista) nil
      	(let* 	((filtrada (remove-if-not #'numberp lista))
		     		(x (first filtrada))
		     		(r (rest filtrada))
		     		(fn (lambda (a) (< a x))))
				(append (QSort (remove-if-not fn r)) (list x)
				(QSort (remove-if fn r))))))

;; (QSort '( 3 4 1 5 6 1 8))
;;> (1 1 3 4 5 6 8)