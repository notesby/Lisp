;;[Level, argumentos: una cadena y una lista anidada] Si cadena se encuentra en
;;lista, regresa el nivel de profundidad o anidamiento (comenzando en cero) en el que
;;se encontró; de lo contrario regresa NIL.

(defun Level (str lista)
		(cond ((null lista) 0)
				((listp (first lista)) (+ 1 (Level str (rest lista)) (Level str (first lista))) )
				((not (stringp (first lista))) (Level str (rest lista)))
				((and (stringp (first lista)) (string= str (first lista))) 1)
				(T  0) ) )

;; (Level (string "1") '( 1 2 8 ( 2 9 ( 3 10 ( 4 ( 5 ( "1")) ))) ) )
;;> 6