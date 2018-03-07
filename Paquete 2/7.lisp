;;Defina una función Aplana que reciba como argumento una lista con elementos
;;anidados a cualquier nivel de profundidad y, como respuesta, entregue una lista
;;conteniendo los mismos elementos pero todos ellos al nivel principal de profundidad.

(defun Aplana (lista) 
	(let ( (result ()) (temp NIL) (lista-temp lista) ) 
			(do ((i 0 (+ i 1)))
				((>= i (length lista-temp)) result)
				(if (listp (setq temp (nth i lista-temp)))
					(setq lista-temp (append lista-temp temp) )
					(setq result (cons temp result)) ) )
			result ))

;;  (Aplana '( 1 2 ( 3 ( 4 ( 5 ) ) ) ( 6) ) )
;;> (5 4 6 3 2 1)