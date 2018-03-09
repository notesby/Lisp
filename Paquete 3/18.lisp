;;Defina una función recursiva Mapea que opere exactamente igual que la función
;;mapcar de Common Lisp.

(defun Mapea (function &rest args)
  (if (not (position nil args))
      (cons (apply function (mapcar 'first args))
	    (apply 'Mapea function
		   (mapcar 'rest args)))))

;; (Mapea #'(lambda (x) (list x (- x))) '(1 2 3) ) 
;;> ((1 -1) (2 -2) (3 -3))