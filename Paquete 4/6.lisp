;;[Max&Pos, argumento: un arreglo bidimensional conteniendo números reales.
;;Iterativa] Entrega una lista de asociación, de la forma
;;((c o l1 . ro w 1 ) (c o l2 . ro w 2 )… (c o l n . rown))
;;en la cual, cada asociación indica el renglón del arreglo en que se encuentra
;;el mayor valor de la columna correspondiente.

(defun Max&Pos (arreglo) 
	(cond ((and (not (arrayp arreglo)) (not (= (array-rank arreglo) 2))) nil)
			(T (let*	((dim (array-dimensions arreglo)) 
							(no-rows (- (first dim) 1)) 
							(no-cols (- (second dim) 1))) 
						(loop for i from 0 to no-rows
							with max-j = 0
							do (setq max-j 0)
							collect (loop for j from 0 to no-cols 
									do (when (> (aref arreglo i j) (aref arreglo i max-j) ) (setq max-j j))
									finally (return (cons max-j i)) )))) ))

;;  (setq a (make-array '(2 2) :initial-contents '((1 0)(0 1))))
;;  (setq b (make-array '(2 2) :initial-contents '((1 2)(3 4))))

;;	(MAX&POS a)
;;> ((0 . 0) (1 . 1))

;;  (MAX&POS b)
;;> ((1 . 0) (1 . 1))