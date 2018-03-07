;;Defina la función Celdas que recibe como argumento una lista (con elementos de
;;cualquier tipo y anidada a cualquier nivel de profundidad) y, como respuesta entrega el
;;número de celdas de construcción que contiene la representación interna de la lista
;;argumento.

(defun Celdas (lista) 
	(let ( (result 0) (temp NIL) (lista-temp lista) ) 
			(do ((i 0 (+ i 1)))
				((>= i (length lista-temp)) result)
				(if (listp (setq temp (nth i lista-temp)))
					(setq lista-temp (append lista-temp temp) )
					(setq result (+ result 1)) ) )
			result ))

;; (Celdas '(1 (2 4 (5 6) (7 8)) 3))
;;> 8