;; Defina una función Recombina que reciba como argumento una lista de la
;; forma ((A . x) (B . y) (C . z)), donde A, B y C son átomos simbólicos, mientras
;; que x, y y z son números. Como respuesta, la función debe entregar otra lista
;; con la siguiente estructura: ( ((x y) . A) ((y z) . C) ((z y x) . B) )
(defun Recombina (&key ((:lista-no-propia lnp))) 
	(if (and (listp lnp) 
			(and (symbolp (first (first lnp))) (numberp (rest (first lnp)))) 
			(and (symbolp (first (second lnp))) (numberp (rest (second lnp)))) 
			(and (symbolp (first (third lnp))) (numberp (rest (third lnp))))) 
		(list (cons (list (rest (first lnp)) (rest (second lnp))) (first (first lnp))) 
				(cons (list (rest (second lnp)) (rest (third lnp))) (first (third lnp))) 
				(cons (list (rest (third lnp)) (rest (second lnp)) (rest (first lnp))) (first (second lnp)))) 
		nil ))
;;ejemplo: (Recombina :lista-no-propia '((Z . 2)(X . 3)(C . 4)))