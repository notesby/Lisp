;;Escriba una función Filtra-vocales que reciba como argumento una lista (con
;;elementos de cualquier tipo y anidada a cualquier nivel de profundidad) y, como
;;respuesta entregue una copia de la lista argumento en la cual se han removido las letras
;;vocales (tanto mayúsculas como minúsculas).

(defun Vocal(elem)
	(or (eq elem #\a)
		(eq elem #\e)
		(eq elem #\i)
		(eq elem #\o)
		(eq elem #\u)
		(eq elem #\A)
		(eq elem #\E)
		(eq elem #\I)
		(eq elem #\O)
		(eq elem #\U)
		(eq elem 'a)
		(eq elem 'e)
		(eq elem 'i)
		(eq elem 'o)
		(eq elem 'u)))

(defun Filtra-vocales(lista)
	(cond ((null lista) nil)
			((Vocal (first lista))
	 			(Filtra-vocales (rest lista)))
			((listp (first lista))
	 			(cons (Filtra-vocales (first lista))
	       				(Filtra-vocales (rest lista)) ))
			(T (cons (first lista)
		 			(Filtra-vocales (rest lista)))) ))

;;	(Filtra-vocales '( a b c (#\e f g) #\h (#\i j o #\p (1 2 3 #\u)) ))
;;> (B C (F G) #\h (J #\p (1 2 3)))