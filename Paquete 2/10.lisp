;;Defina la función Suma-numérica que recibe como argumento una lista
;;cualquiera (no anidada), y como respuesta entrega la suma de exclusivamente aquellos
;;elementos de la lista que son numéricos.

(defun Suma-numérica (lista) 
	(loop for e in lista
		when (numberp e)
			sum e))

;; 	(Suma-numérica '(A B 1 2.0 D 2/4 3i))
;;>	3.5

;;	(Suma-numérica '(4.33 B 1 2.0 D 3/9))
;;>	7.6633334