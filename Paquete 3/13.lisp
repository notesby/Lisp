;;Defina la función Celdas que recibe como argumento una lista (con elementos de
;;cualquier tipo y anidada a cualquier nivel de profundidad) y, como respuesta entrega el
;;número de celdas de construcción que contiene la representación interna de la lista
;;argumento.

(defun Celdas (lista)
  	(cond 	((null lista) 0)
			((listp (first lista)) 
					(+ 1 (Celdas (first lista)) (Celdas (rest lista))))
			(T (+ 1 (Celdas (rest lista)))) ))

;; (celdas '( 1 2 (3)))
;;> 4