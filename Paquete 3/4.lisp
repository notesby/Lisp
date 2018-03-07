;;Construya una función Primer-impar que reciba como argumento una lista y como
;;respuesta entregue otra lista conteniendo el primer elemento de la lista original que
;;sea un número impar y la posición (índice) donde se encuentra.

(defun Primer-impar (lista) 
		(if (and (numberp (first lista)) (= (mod (first lista) 2) 1))
	 		(list (first lista) (position (first lista) lista))
	 		(let ( (temp (Primer-impar (rest lista))) )
	 				(list (first temp) (+ (second temp) 1 ) ) ))) 

;; (Primer-impar '( 1 2 3 4 5 6))
;; (1 0)

;; (Primer-impar '( 2 4 6 1 3 5))
;; (1 3)