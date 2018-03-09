;;[2Palindrome, argumento: una cadena, Recursiva, No destructiva] Entrega como
;;respuesta una cadena como la original, pero convertida en palíndromo (duplicándola
;;en orden inverso al final de sí misma).

(defun 2Palindrome(lista)
  (cond ((null lista) nil)
        (t (append (list (first lista)) (2Palindrome (rest lista)) (list (first lista))))))

;; (2palindrome '(a b))
;;> (A B B A)