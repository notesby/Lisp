;;Construya una función Filtra-múltiplos que reciba como argumentos una lista y un
;;número entero. Como respuesta debe entregar una copia de la lista argumento en la
;;cual se han removido todos los múltiplos del entero recibido. 

(defun Filtra-múltiplos (lista n) 
	(if (integerp n) 
		(loop for e in lista 
			unless (and (numberp e)(= (mod e n) 0))
				collect e ) ))

;; 	(Filtra-múltiplos '(1 2 3 4 5) 2)
;;> (1 3 5)

;;	(Filtra-múltiplos '(A 2 B 4 X) 2)
;;>	(A B X)