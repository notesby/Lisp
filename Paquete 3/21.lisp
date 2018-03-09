;;Defina una función recursiva PegaYCambia que reciba como argumento dos listas
;;lista1 lista2 y dos elementos elem1, elem2. Como respuesta, la función debe
;;entregar una lista donde concatene las dos listas originales, pero substituyendo todas
;;las ocurrencias (en ambas listas) de elem1 por elem2.

(defun PegaYCambia(list1 list2 elem1 elem2)
	(cond ((and (null list1) (null list2)) nil)
			((null list1)
	 			(PegaYCambia list2 nil elem1 elem2))
			((eql (first list1) elem1)
	 			(cons elem2
	       			(PegaYCambia (rest list1) list2 elem1 elem2)))
			(T (cons (first list1)
		 		(PegaYCambia (rest list1) list2 elem1 elem2))) ))


;;	(PegaYCambia '( 1 2 3) '( 2 3 4) 2 8)
;;> (1 8 3 8 3 4)