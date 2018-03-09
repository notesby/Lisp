;; 1)

;; [Collect, argumentos: un predicado y una lista. Recursiva] Devuelve una lista en
;; la cual se encuentran todos los elementos del argumento original para los
;; cuales se cumple el predicado del primer argumento.

(defun Collect (lista predicado)
		(cond	((null lista) nil )
				( (not (funcall predicado (first lista))) (Collect (rest lista) predicado))
				( T (cons (first lista) (Collect (rest lista) predicado) ) ) ))

;; (collect '( 1 2 3 a b c) #'numberp)
;;> (1 2 3)

;;	2)

;; [Palíndromo, argumento: una lista, Recursiva. Predicado] Si la lista recibida es un
;; palíndromo, regresa T; de lo contrario regresa NIL.

(defun Palíndromo (lista)
        (if (null lista)
            T
            (if (equal (first lista) (nth (- (length lista) 1) lista))
                (Palíndromo (reverse (rest (reverse (rest lista)))))
                NIL)))

;; (PALÍNDROMO '(a b c))
;;> NIL

;; (PALÍNDROMO '( a b c c b a))
;;>	T

;;	3)

;;[2Palindrome, argumento: una cadena, Recursiva, No destructiva] Entrega como
;;respuesta una cadena como la original, pero convertida en palíndromo (duplicándola
;;en orden inverso al final de sí misma).

(defun 2Palindrome(lista)
  (cond ((null lista) nil)
        (t (append (list (first lista)) (2Palindrome (rest lista)) (list (first lista))))))

;; (2palindrome '(a b))
;;> (A B B A)

;;	4)

;;[IterativePalindrome, Iterativa] Modifique la función del ejercicio anterior para
;;que opere de forma estrictamente iterativa.

(defun IterativePalindrome (lista) 
	(loop for el in lista 
		with temp = ()
		do (setq temp (append (list el) temp ))
		finally (return (append lista temp)) ))

;; (IterativePalindrome '(a b))
;;> (A B B A)

;; 5)

;;[ListRotate, argumentos: una cadena, un entero n y una de las dos llaves :right
;;o :left] Devuelve una lista, de la misma longitud que la original, pero rotada n
;;posiciones hacia la dirección indicada por el tercer argumento.

(defun ListRotate (cadena n &key ((:left l) NIL) ((:right r) NIL) ) 
	(cond (l (concatenate 'string (subseq cadena n (length cadena)) (subseq cadena 0 n) ))
		(T (concatenate 'string (subseq cadena (- (length cadena) n) (length cadena)) (subseq cadena 0 (- (length cadena) n) ) ))))

;; (listrotate "abcdefghi" 3 :left 1)
;;> "defghiabc"

;;	(listrotate "abcdefghi" 3 :right 1)
;;> "ghiabcdef"

;; 6)

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

;; 7)

;;[Combine, argumentos: una función func y una lista. Recursiva] Efecto igual al
;;operador reduce; combina todos los elementos de lista mediante la aplicación de la
;;función func.

(defun Combine (func lista)
		(cond	((null (rest lista)) (first lista) )
				( T (funcall func (first lista) (Combine func (rest lista)) ) ) ))

;; (Combine #'+ '(2 2 3 3))
;;> 10

;; 8)

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

;; 9)

;; 10)

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

;; 11)

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

;; 12)

;; 13)

;; 14)

;; 15)

;;[If-positive, Macro] Escriba una macro para una estructura algorítmica
;;condicional que evalúe una expresión numérica y tome acciones distintas en
;;caso de que la expresión evalúe en un número positivo y en caso contrario. La
;;sintaxis para uso de esta macro debe ser:
;;(if-positive <expresión>
;; :then-do <instrucciones>
;; …
;; :else-do <instrucciones>
;; …)



(defmacro If-positive (expr &key ((:then-do pos)) ((:else-do neg)))
			(let ( (c (gensym "cond-")) )
 				`(let* ( (,c ,expr) )
						(cond ((plusp ,c) ,pos)
								(T ,neg))) ))

;; (if-positive (+ 3 4) :then-do "positivo" :else-do "negativo")
;;> "positivo"