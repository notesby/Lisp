;;Construya una función Filtra-múltiplos que reciba como argumentos una lista y un
;;número entero. Como respuesta debe entregar una copia de la lista argumento en la
;;cual se han removido todos los múltiplos del entero recibido.

( defun Filtra-múltiplos (lista el)
	(cond ( (null lista) nil )
 	( (= (mod (first lista) el) 0 ) (Filtra-múltiplos (rest lista) el) )
 	( T (cons (first lista) (Filtra-múltiplos (rest lista) el) ) ) ))

;; (Filtra-múltiplos '(1 2 3 4 5) 2)
;;> (1 3 5)