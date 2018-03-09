;;Defina una función Aplana que reciba como argumento una lista con elementos
;;anidados a cualquier nivel de profundidad y, como respuesta, entregue una lista
;;conteniendo los mismos elementos pero todos ellos al nivel principal de profundidad.

(defun Aplana (lista)
  (when (consp lista)
    (let ((el (first lista)) (ls (rest lista)))
    	(append (if (consp el) (Aplana el)
                	(list el))
            	(Aplana ls)))))

;;  (Aplana '( 1 2 ( 3 ( 4 ( 5 ) ) ) ( 6) ) )
;;> (1 2 3 4 5 6)