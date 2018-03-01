;;[sin usar ELT ni POSITION] Defina una función ElemInPos que reciba tres
;;argumentos: elem, lista y pos. La función debe devolver T si elem está en la
;;posición pos de lista, NIL si no lo está.

(defun ElemInPos (elem lista pos) ;pos es la posicion contando desde 0
	(and (listp lista) 
		 (not (null lista)) 
		 (< pos (length lista))
		 (>= pos 0 ) 
		 (eql (nth pos lista) elem )))

;; ejemplo: (ElemInPos 3 '(1 2 3) 2) 
;;> T
;; (ElemInPos 3 '(1 2 3) 3)
;;> NIL