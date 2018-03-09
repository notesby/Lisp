;;[MatMult, argumentos dos arreglos m1 y m2 de dos dimensiones y conteniendo
;;valores numéricos] Averigua si las matrices son compatibles y, en caso de serlo,
;;regresa otra matriz (un arreglo de dos dimensiones) con la multiplicación de m1 y
;;m2.

(defun MatMult (m1 m2)
	(let* ( (m1-size (array-dimensions m1)) 
			(m2-size (array-dimensions m2)) 
			(nfl1 (first m1-size)) 
			(ncl1 (second m1-size)) 
			(ncl2 (second m2-size))  )
		( cond 
			( (or (not (= (first m1-size) (first m2-size))) (not (= (first m1-size) (second m2-size)))) nil)
			( T
			(loop for fila-ls1 from 0 to (- nfl1 1)
				collect ( loop for col-ls2 from 0 to (- ncl2 1)
						collect ( loop for col-ls1 from 0 to (- ncl1 1) 
								with n1 = NIL
								with n2 = NIL
								do (setq n1 (aref m1 fila-ls1 col-ls1))
								do (setq n2 (aref m2 col-ls1 col-ls2))
								;do ( print (list (list fila-ls1 col-ls2 col-ls1) n1 '* n2))
								sum (* n1 n2 ) ))))
			 )))

;;  (setq a (make-array '(2 2) :initial-contents '((1 0)(0 1))))
;;  (setq b (make-array '(2 2) :initial-contents '((1 2)(3 4))))
;;	(MatMult a b)
;;> ((1 2) (3 4))