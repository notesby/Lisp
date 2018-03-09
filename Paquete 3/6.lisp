;;Escriba la función Conteo que recibe como argumento una lista cualquiera y, como
;;respuesta, entregue una celda de construcción cuya primera parte contiene el conteo de
;;elementos numéricos de la lista original y cuya segunda parte contiene el conteo de
;;sublistas contenidas en la lista original.

(defun Conteo (lista) 
	(cond ((numberp (first lista)) (list 1 0))
			((listp (first lista)) (list 0 1)) 
			(T (cons (first (Conteo(rest lista))) (second (Conteo(rest lista))))) ))