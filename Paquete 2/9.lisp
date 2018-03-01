;;Construya una función que reciba como argumento una lista cualquiera y, como
;;respuesta, entregue una lista, con el mismo número de elementos de primer nivel, pero
;;que contiene un símbolo A si el elemento en la posición correspondiente es un átomo,
;;un símbolo L si el elemento correspondiente es una lista y un símbolo N si el
;;elemento en la posición correspondiente es una lista vacía.

(defun Tipos (lista) 
	(loop for e in lista with tipo = NIL
		when (atom e)
			do (setq tipo 'A )
		when (listp e)
			do (setq tipo 'L )
		when (and (listp e) (null e))
			do (setq tipo 'N )
		collect tipo ))

;;	(Tipos '( A B C (1 2) () 1 2))
;;>	(A A A L N A A)

;;	(Tipos '( NIL B C (1) A () 1i T ))
;;>	(N A A L A N A A)