;;Escriba una función Filtra-vocales que reciba como argumento una lista (con
;;elementos de cualquier tipo y anidada a cualquier nivel de profundidad) y, como
;;respuesta entregue una copia de la lista argumento en la cual se han removido las letras
;;vocales (tanto mayúsculas como minúsculas).

(defun Filtra-vocales (lista)
  (when (consp lista)
    (let ((el (first lista)) (ls (rest lista)))
      (append  (if (consp el) (Filtra-vocales el)
                 (if (not (or (eq el #\a)
								(eq el #\e)
								(eq el #\i)
								(eq el #\o)
								(eq el #\u)
								(eq el #\A)
								(eq el #\E)
								(eq el #\I)
								(eq el #\O)
								(eq el #\U)
								(eq el 'a)
								(eq el 'e)
								(eq el 'i)
								(eq el 'o)
								(eq el 'u))) 
                 				(list el)))
               (Filtra-vocales ls)) )))