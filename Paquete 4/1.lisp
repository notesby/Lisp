;; [Collect, argumentos: un predicado y una lista. Recursiva] Devuelve una lista en
;; la cual se encuentran todos los elementos del argumento original para los
;; cuales se cumple el predicado del primer argumento.

(defun Collect (lista predicado)
		(cond	((null lista) nil )
				( (not (funcall predicado (first lista))) (Collect (rest lista) predicado))
				( T (cons (first lista) (Collect (rest lista) predicado) ) ) ))

;; (collect '( 1 2 3 a b c) #'numberp)
;;> (1 2 3)