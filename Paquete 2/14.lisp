;;Construya una función Implica con aridad indeterminada, que implemente el
;;operador lógico de la implicación.

(defun Implica (&rest lista) 
	(if (>= (length lista) 2 )
		(loop for i from 1 to (- (length lista) 1)
				with A = (nth 0 lista)
				with B
				do (setq B (nth i lista))
				while (typep B 'boolean) 
					do (setq A (or (not A) B))
				finally (return A) )))

;; (Implica T T NIL)
;;>	NIL

;;	(IMPLICA NIL T T)
;;>	T

;;	(IMPLICA NIL NIL NIL)
;;>	NIL