;;Defina una función recursiva Elimina que reciba como argumento una lista y un
;;número real n. La función debe entregar como resultado una copia de la lista original,
;;en la cual se hayan eliminado todos los elementos que no sean numéricos, así como
;;todos aquellos elementos numéricos que sean menores o iguales que n.

(defun Elimina (lista num)
	(cond ((null lista) nil)
			((not (numberp (first lista)))
	 			(Elimina (rest lista) num))
			((<= (first lista) num)
	 			(Elimina (rest lista) num))
			(T (cons (first lista)
		 		(Elimina (rest lista) num))) ))

;; (Elimina '( 1 2 3 A B C 6.0 1.1 2.3 4.4) 5.0)
;;> (6.0)