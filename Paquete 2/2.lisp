;;Escriba la función Inicio-en que recibe como argumentos una lista y un elemento
;;cualquiera. La función debe entregar como respuesta una copia de la lista original pero
;;comenzando con la primera ocurrencia del elemento dado en la lista original.

(defun Inicio-en (el lista) 
	(loop for e in lista with acumula = NIL 
		when (or (eq acumula T) (setq acumula (eq el e))) 
		collect e ))

;;	(Inicio-en 3 '(1 2 3 4 5 6))
;;> (3 4 5 6)

;;	(Inicio-en 3 '(1 2 3 4 3 6))
;;> (3 4 3 6)

;;(Inicio-en 'A '( B C D A F G))
;; (A F G)