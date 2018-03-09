;;[StrCypher, argumentos: una cadena y otra cadena code de longitud 27 donde
;;cada posición corresponde a una letra del alfabeto (incluyendo la ñ)] Devuelve una
;;cadena en la que cada carácter del argumento original fue substituído por el indicado
;;en la posición correspondiente en la cadena code.

(defun StrCypher (str code)
	(loop for s across str
		with temp = (make-array 0 :element-type 'character :fill-pointer 0 :adjustable t)
		do (vector-push-extend (char code (- (char-int (char (string-upcase s) 0)) 65)) temp)
		finally (return temp) ))

;; (StrCypher (string "abc") (string "qwertyuiopasdfghjklñzxcvbnm"))
;;> "qwe"