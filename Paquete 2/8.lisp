;;Escriba la función Diagonal que recibe como argumento una lista conteniendo m
;;sub-listas de n elementos cada una de ellas y que representa una matriz de m x n
;;elementos. Como respuesta, esta función debe devolver una lista conteniendo los
;;elementos en la diagonal principal de dicha matriz.

(defun Diagonal (lista) 
	(loop for m from 0 below (length lista)
			collect (nth m (nth m lista))  ))

;; (Diagonal '((1 2)(3 4)))
;; (1 4)