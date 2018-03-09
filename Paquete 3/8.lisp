;;Escriba la función Diagonal que recibe como argumento una lista conteniendo m
;;sub-listas de n elementos cada una de ellas y que representa una matriz de m x n
;;elementos. Como respuesta, esta función debe devolver una lista conteniendo los
;;elementos en la diagonal principal de dicha matriz.

(defun diagonal(lista)
  (cond ((null lista) nil)
	(T (cons (first (first lista))
		 (diagonal
		  (mapcar 'rest (rest lista))))) ))

;; (Diagonal '((1 2)(3 4)))
;; (1 4)