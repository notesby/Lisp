;;[sin usar ELT ni POSITION] Defina una función ElemInPos que reciba tres
;;argumentos: elem, lista y pos. La función debe devolver T si elem está en la
;;posición pos de lista, NIL si no lo está.

(defun ElemInPos (elem lista pos)
  (cond ((null lista) nil)
	((and (= pos 0)
	      (eql elem (first lista)) T))
	(T (ElemInPos elem (rest lista) (- pos 1))) ))

;; ejemplo: (ElemInPos 3 '(1 2 3) 2) 
;;> T
;; (ElemInPos 3 '(1 2 3) 3)
;;> NIL