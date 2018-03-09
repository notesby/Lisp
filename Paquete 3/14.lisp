;;Construya una función Implica con aridad indeterminada, que implemente el
;;operador lógico de la implicación.

(defun Implica (lista) 
	(if (null (rest lista))
		(first lista)
		(or (not (first lista)) (Implica (rest lista))) ))

;; (Implica '(T T NIL))
;;>	NIL

;;	(IMPLICA '(NIL T T))
;;>	T

;;	(IMPLICA '(NIL NIL NIL))
;;>	NIL