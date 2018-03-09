;;[ListRotate, argumentos: una cadena, un entero n y una de las dos llaves :right
;;o :left] Devuelve una lista, de la misma longitud que la original, pero rotada n
;;posiciones hacia la dirección indicada por el tercer argumento.

(defun ListRotate (cadena n &key ((:left l) NIL) ((:right r) NIL) ) 
	(cond (l (concatenate 'string (subseq cadena n (length cadena)) (subseq cadena 0 n) ))
		(T (concatenate 'string (subseq cadena (- (length cadena) n) (length cadena)) (subseq cadena 0 (- (length cadena) n) ) ))))

;; (listrotate "abcdefghi" 3 :left 1)
;;> "defghiabc"

;;	(listrotate "abcdefghi" 3 :right 1)
;;> "ghiabcdef"