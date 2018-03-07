;;Escriba una función Filtra-vocales que reciba como argumento una lista (con
;;elementos de cualquier tipo y anidada a cualquier nivel de profundidad) y, como
;;respuesta entregue una copia de la lista argumento en la cual se han removido las letras
;;vocales (tanto mayúsculas como minúsculas).

(defun Filtra-vocales (lista) 
	(let ( (result ()) (temp NIL) (lista-temp lista) ) 
			(do ((i 0 (+ i 1)))
				((>= i (length lista-temp)) result)
				(if (listp (setq temp (nth i lista-temp)))
					(setq lista-temp (append lista-temp temp) )
					(if (not (or (eq temp #\a)
								(eq temp #\e)
								(eq temp #\i)
								(eq temp #\o)
								(eq temp #\u)
								(eq temp #\A)
								(eq temp #\E)
								(eq temp #\I)
								(eq temp #\O)
								(eq temp #\U)
								(eq temp 'a)
								(eq temp 'e)
								(eq temp 'i)
								(eq temp 'o)
								(eq temp 'u)) ) 
						(setq result (cons temp result)) ) ) )
			result ))

;; (Filtra-vocales '( a b c (#\e f g) #\h (#\i j o #\p (1 2 3 #\u)) ))
;;> (3 2 1 #\p J G F #\h C B)