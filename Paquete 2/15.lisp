;;Escriba una función Mult que recibe como argumento dos listas, conteniendo sublistas
;;numéricas, representando matrices. La función debe regresar la multiplicación de
;;las dos matrices si es que éstas son compatibles, en caso de no serlo debe regresar NIL.

(defun Mult (lista1 lista2)
	(let ( (nfl1 (length lista1)) (ncl1 (length (first lista1))) (nfl2 (length lista2)) (ncl2 (length (first lista2))) )
		( if (= ncl1 nfl2)
			(loop for fila-ls1 from 0 to (- nfl1 1)
				collect ( loop for col-ls2 from 0 to (- ncl2 1)
						collect ( loop for col-ls1 from 0 to (- ncl1 1) 
								with n1 = NIL
								with n2 = NIL
								do (setq n1 (nth col-ls1 (nth fila-ls1 lista1)))
								do (setq n2 (nth col-ls2 (nth col-ls1 lista2)))
								;do ( print (list (list fila-ls1 col-ls2 col-ls1) n1 '* n2))
								sum (* n1 n2 ) )))
			 )))

;; (mult '((1 0)(0 1)) '((1 2)(3 4)))
;;> ((1 2) (3 4))

;; (mult '((1 2)(3 4)) '((1 2)(3 4)))
;;> ((7 10) (15 22))