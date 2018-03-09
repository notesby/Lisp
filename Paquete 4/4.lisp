;;[IterativePalindrome, Iterativa] Modifique la función del ejercicio anterior para
;;que opere de forma estrictamente iterativa.

(defun IterativePalindrome (lista) 
	(loop for el in lista 
		with temp = ()
		do (setq temp (append (list el) temp ))
		finally (return (append lista temp)) ))

;; (IterativePalindrome '(a b))
;;> (A B B A)