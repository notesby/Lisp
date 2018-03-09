;;[Combine, argumentos: una función func y una lista. Recursiva] Efecto igual al
;;operador reduce; combina todos los elementos de lista mediante la aplicación de la
;;función func.

(defun Combine (func lista)
		(cond	((null (rest lista)) (first lista) )
				( T (funcall func (first lista) (Combine func (rest lista)) ) ) ))

;; (Combine #'+ '(2 2 3 3))
;;> 10