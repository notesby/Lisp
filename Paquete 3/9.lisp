;;Construya una función que reciba como argumento una lista cualquiera y, como
;;respuesta, entregue una lista, con el mismo número de elementos de primer nivel, pero
;;que contiene un símbolo A si el elemento en la posición correspondiente es un átomo,
;;un símbolo L si el elemento correspondiente es una lista y un símbolo N si el
;;elemento en la posición correspondiente es una lista vacía.

(defun Tipos (lista)
	(cond ((= (length lista) 0) nil)
			((null (first lista))
	 			(cons 'N (Tipos (rest lista))))
			((atom (first lista))
	 			(cons 'A (Tipos (rest lista))))
			((listp (first lista))
	 			(cons 'L (Tipos (rest lista)))) ))

;;	(Tipos '( A B C (1 2) () 1 2))
;;>	(A A A L N A A)

;;	(Tipos '( NIL B C (1) A () 1i T ))
;;>	(N A A L A N A A)