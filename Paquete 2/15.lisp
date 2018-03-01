;;Escriba una función Mult que recibe como argumento dos listas, conteniendo sublistas
;;numéricas, representando matrices. La función debe regresar la multiplicación de
;;las dos matrices si es que éstas son compatibles, en caso de no serlo debe regresar NIL.
 i j k
 0 0 0
 0 1 0
 0 0 1
 0 1 1
;; l1[i][j]*l2[j][k]+l1[i][j]*+l2[j][k] l1[i][j]*l2[j][k]+l1[i][k]*+l2[j][k]
;;
(defun Mult (lista1 lista2)
	(let (( (nfl1 (length lista1)) (ncl1 (length (first lista1))) (nfl2 (length lista2)) (ncl2 (length (first lista2))) )
		( if (= ncl1 nfl2)
			(loop for fila-ls1 from 0 to nfl1
				do ( loop for col-ls2 from 0 to ncl2
						do ( loop for col-ls1 from 0 to ncl1 
								do (* (nth fila-ls1 (nth col-ls1 lista1)) (nth col-ls1 (nth col-ls2 lista2))) )))
			(NIL) ))))