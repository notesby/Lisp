; 1)

;;[sin usar ELT ni POSITION] Defina una función ElemInPos que reciba tres
;;argumentos: elem, lista y pos. La función debe devolver T si elem está en la
;;posición pos de lista, NIL si no lo está.

(defun ElemInPos (elem lista pos)
  (cond ((null lista) nil)
	((and (= pos 0)
	      (eql elem (first lista)) T))
	(T (ElemInPos elem (rest lista) (- pos 1))) ))

;; ejemplo: (ElemInPos 3 '(1 2 3) 2) 
;;> T
;; (ElemInPos 3 '(1 2 3) 3)
;;> NIL

; 2)

;;Escriba la función Inicio-en que recibe como argumentos una lista y un elemento
;;cualquiera. La función debe entregar como respuesta una copia de la lista original pero
;;comenzando con la primera ocurrencia del elemento dado en la lista original.

(defun Inicio-en (el lista) 
	(if (eq (first lista) el )
	 	lista
	 	(Inicio-en el (rest lista)) ) )

;;	(Inicio-en 3 '(1 2 3 4 5 6))
;;> (3 4 5 6)

;;	(Inicio-en 3 '(1 2 3 4 3 6))
;;> (3 4 3 6)

;;	(Inicio-en 'A '( B C D A F G))
;; (A F G)

; 3)

;;Modifique la función del ejercicio anterior para que se llame Termina-en y entregue
;;como respuesta una copia de la lista original pero que termina en la última ocurrencia
;;del elemento dado 

(defun Termina-en (elem lista)
  (cond ((null lista) lista)
	((eql (first (reverse lista)) elem) lista)
	(T (Termina-en elem (reverse (rest (reverse lista))) )) ))

;;	(Termina-en 3 '(1 2 3 4 5 6))
;;> (1 2 3)

;;	(Termina-en 3 '(1 2 3 4 3 6))
;;> (1 2 3 4 3)

;;(Termina-en 'A '( B C D A F G))
;;> (B C D A)

; 4)

;;Construya una función Primer-impar que reciba como argumento una lista y como
;;respuesta entregue otra lista conteniendo el primer elemento de la lista original que
;;sea un número impar y la posición (índice) donde se encuentra.

(defun Primer-impar (lista) 
		(if (and (numberp (first lista)) (= (mod (first lista) 2) 1))
	 		(list (first lista) (position (first lista) lista))
	 		(let ( (temp (Primer-impar (rest lista))) )
	 				(list (first temp) (+ (second temp) 1 ) ) ))) 

;; (Primer-impar '( 1 2 3 4 5 6))
;; (1 0)

;; (Primer-impar '( 2 4 6 1 3 5))
;; (1 3)

; 5)

;;Modifique la función del inciso anterior para que entregue en la lista de respuesta el
;;último elemento de la lista que sea un número real mayor o igual que cero y el número
;;de veces que dicho elemento se repite en toda la lista.

(defun Repeticiones (elem lista)
	(cond ((null lista) 0)
			((eql (first lista) elem)
	 			(+ 1 (Repeticiones elem (rest lista))) )
			(T (+ 0 (Repeticiones elem (rest lista)))) ))


(defun Ultimo-real (lista)
	(setq lista (reverse lista))
		(cond ((null lista) nil)
				((and (realp (first lista)) (>= (first lista) 0))
	 				(list (first lista)
	       			(- (Repeticiones (first lista) lista) 1)) )
				(T (Ultimo-real (reverse (rest lista)))) )
  )

;;	(Ultimo-real '( 1 2.0 3 4 2.0 A))
;;> (2.0 1)

;;	(Ultimo-real '( 1 2.0 3 2.0 2.0 1i))
;;>	(2.0 2)


; 6)

;;Escriba la función Conteo que recibe como argumento una lista cualquiera y, como
;;respuesta, entregue una celda de construcción cuya primera parte contiene el conteo de
;;elementos numéricos de la lista original y cuya segunda parte contiene el conteo de
;;sublistas contenidas en la lista original.

(defun Conteo (lista)
  	(cond 	((null lista) (cons 0 0))
			((numberp (first lista))
				(cons (+ (first (Conteo (rest lista))) 1)
		      		(rest (Conteo (rest lista)))))
			((listp (first lista))
	 			(cons (first (Conteo (rest lista)))
	       			(+ (rest (Conteo (rest lista))) 1)))
			(T (cons 0 0)) ))

;; 	(Conteo '( 1 2 3 ( 4 5) (6 7)))
;;> (3 . 2)

; 7)

;;Defina una función Aplana que reciba como argumento una lista con elementos
;;anidados a cualquier nivel de profundidad y, como respuesta, entregue una lista
;;conteniendo los mismos elementos pero todos ellos al nivel principal de profundidad.

(defun Aplana (lista)
  (when (consp lista)
    (let ((el (first lista)) (ls (rest lista)))
    	(append (if (consp el) (Aplana el)
                	(list el))
            	(Aplana ls)))))

;;  (Aplana '( 1 2 ( 3 ( 4 ( 5 ) ) ) ( 6) ) )
;;> (1 2 3 4 5 6)


; 8) 

;;Escriba la función Diagonal que recibe como argumento una lista conteniendo m
;;sub-listas de n elementos cada una de ellas y que representa una matriz de m x n
;;elementos. Como respuesta, esta función debe devolver una lista conteniendo los
;;elementos en la diagonal principal de dicha matriz.

(defun Diagonal (lista)
  (cond ((null lista) nil)
	(T (cons (first (first lista))
		 (Diagonal
		  (mapcar 'rest (rest lista))))) ))

;; (Diagonal '((1 2)(3 4)))
;; (1 4)


; 9)

;;Construya una función que reciba como argumento una lista cualquiera y, como
;;respuesta, entregue una lista, con el mismo número de elementos de primer nivel, pero
;;que contiene un símbolo A si el elemento en la posición correspondiente es un átomo,
;;un símbolo L si el elemento correspondiente es una lista y un símbolo N si el
;;elemento en la posición correspondiente es una lista vacía.

(defun Tipos (lista)
	(cond ((= (length lista) 0) nil)
			((null (first lista))
	 			(cons 'N (Tipos (rest lista))))
			((atom (first lista))
	 			(cons 'A (Tipos (rest lista))))
			((listp (first lista))
	 			(cons 'L (Tipos (rest lista)))) ))

;;	(Tipos '( A B C (1 2) () 1 2))
;;>	(A A A L N A A)

;;	(Tipos '( NIL B C (1) A () 1i T ))
;;>	(N A A L A N A A)


; 10)

;;Defina la función Suma-numérica que recibe como argumento una lista
;;cualquiera (no anidada), y como respuesta entrega la suma de exclusivamente aquellos
;;elementos de la lista que son numéricos.

(defun Suma-numérica (lista)
	(cond ((null lista) 0)
			((numberp (first lista))
	 			(+ (first lista) (suma-numerica (rest lista))))
			(T (suma-numerica (rest lista))) ))

;; 	(Suma-numérica '(A B 1 2.0 D 2/4 3i))
;;>	3.5

;;	(Suma-numérica '(4.33 B 1 2.0 D 3/9))
;;>	7.663333


; 11)

;;Escriba una función Filtra-vocales que reciba como argumento una lista (con
;;elementos de cualquier tipo y anidada a cualquier nivel de profundidad) y, como
;;respuesta entregue una copia de la lista argumento en la cual se han removido las letras
;;vocales (tanto mayúsculas como minúsculas).

(defun Vocal(elem)
	(or (eq elem #\a)
		(eq elem #\e)
		(eq elem #\i)
		(eq elem #\o)
		(eq elem #\u)
		(eq elem #\A)
		(eq elem #\E)
		(eq elem #\I)
		(eq elem #\O)
		(eq elem #\U)
		(eq elem 'a)
		(eq elem 'e)
		(eq elem 'i)
		(eq elem 'o)
		(eq elem 'u)))

(defun Filtra-vocales(lista)
	(cond ((null lista) nil)
			((Vocal (first lista))
	 			(Filtra-vocales (rest lista)))
			((listp (first lista))
	 			(cons (Filtra-vocales (first lista))
	       				(Filtra-vocales (rest lista)) ))
			(T (cons (first lista)
		 			(Filtra-vocales (rest lista)))) ))

;;	(Filtra-vocales '( a b c (#\e f g) #\h (#\i j o #\p (1 2 3 #\u)) ))
;;> (B C (F G) #\h (J #\p (1 2 3)))


; 12)

;;Construya una función Filtra-múltiplos que reciba como argumentos una lista y un
;;número entero. Como respuesta debe entregar una copia de la lista argumento en la
;;cual se han removido todos los múltiplos del entero recibido.

( defun Filtra-múltiplos (lista el)
	(cond ( (null lista) nil )
 	( (= (mod (first lista) el) 0 ) (Filtra-múltiplos (rest lista) el) )
 	( T (cons (first lista) (Filtra-múltiplos (rest lista) el) ) ) ))

;; (Filtra-múltiplos '(1 2 3 4 5) 2)
;;> (1 3 5)


; 13)

;;Defina la función Celdas que recibe como argumento una lista (con elementos de
;;cualquier tipo y anidada a cualquier nivel de profundidad) y, como respuesta entrega el
;;número de celdas de construcción que contiene la representación interna de la lista
;;argumento.

(defun Celdas (lista)
  	(cond 	((null lista) 0)
			((listp (first lista)) 
					(+ 1 (Celdas (first lista)) (Celdas (rest lista))))
			(T (+ 1 (Celdas (rest lista)))) ))

;; (celdas '( 1 2 (3)))
;;> 4


; 14) 

;;Construya una función Implica con aridad indeterminada, que implemente el
;;operador lógico de la implicación.

(defun Implica (lista) 
	(if (null (rest lista))
		(first lista)
		(or (not (first lista)) (Implica (rest lista))) ))

;; (Implica '(T T NIL))
;;>	NIL

;;	(IMPLICA '(NIL T T))
;;>	T

;;	(IMPLICA '(NIL NIL NIL))
;;>	NIL

; 15)

; 16)

;;Defina una función recursiva Cambia que reciba como argumento una lista y dos
;;elementos elem1, elem2. Como respuesta, la función debe entregar otra lista
;;parecida a la original, pero donde todas las ocurrencias de elem1 se substituyeron por
;;elem2.

(defun Cambia (lista elem1 elem2)
	(cond 	((null lista) nil)
			((eql (first lista) elem1)
	 			(cons elem2
	       		(Cambia (rest lista) elem1 elem2)))
			(T (cons (first lista)
		 		(Cambia (rest lista) elem1 elem2))) ))

;; (Cambia '( 1 2 3 4 3 5) 3 6 )
;;> (1 2 6 4 6 5)


; 17)

;;En el URL http://www.cliki.net/fibonacci se presentan diversas implementaciones
;;para los números de Fibonacci. Implemente TODAS las opciones que ahí se presentan
;;y compare su desempeño con time para el argumento 50

; Naive recursive computation of the nth element of the Fibonacci sequence
(defun fib (n)
  (if (< n 2) n
      (+ (fib (1- n)) (fib (- n 2)))))
; Performance= 769,629,128,192 processor cycles


; Tail-recursive computation of the nth element of the Fibonacci sequence
(defun fib (n)
  (labels ((fib-aux (n f1 f2)
                    (if (zerop n) f1
                      (fib-aux (1- n) f2 (+ f1 f2)))))
          (fib-aux n 0 1)))
; Performance= 4,480 processor cycles


; loop-based iterative computation of the nth element of the Fibonacci sequence
(defun fib (n)
  (loop for f1 = 0 then f2
        and f2 = 1 then (+ f1 f2)
        repeat n finally (return f1)))
; Ṕerformance= 5,574 processor cycles


; do-based iterative computation of the nth element of the Fibonacci sequence
(defun fib (n)
  (do ((i n (1- i))
       (f1 0 f2)
       (f2 1 (+ f1 f2)))
      ((= i 0) f1)))
; Performance= 4,944 processor cycles



; CPS computation of the nth element of the Fibonacci sequence
(defun fib (n)
  (labels ((fib-aux (n k)
	     (if (zerop n)
		 (funcall k 0 1)
		 (fib-aux (1- n) (lambda (x y)
				   (funcall k y (+ x y)))))))
    (fib-aux n #'(lambda (a b) a))))
; Performance= 6,231 processor cycles


(defun fib (n)
   (labels ((fib2 (n)
                 (cond ((= n 0)
                        (values 1 0))
                       (t
                        (multiple-value-bind (val prev-val)
                                             (fib2 (- n 1))
                           (values (+ val prev-val)
                                   val))))))
     (nth-value 0 (fib2 n))))
; Performance= 5,720 processor cycles


; Successive squaring method from SICP
(defun fib (n)
  (labels ((fib-aux (a b p q count)
                    (cond ((= count 0) b)
                          ((evenp count)
                           (fib-aux a
                                    b
                                    (+ (* p p) (* q q))
                                    (+ (* q q) (* 2 p q))
                                    (/ count 2)))
                          (t (fib-aux (+ (* b q) (* a q) (* a p))
                                      (+ (* b p) (* a q))
                                      p
                                      q
                                      (- count 1))))))
    (fib-aux 1 0 0 1 n)))
; Performance= 11,644 processor cycles



(defun fib (n)
  (if (< n 2) n
    (if (oddp n) 
      (let ((k (/ (1+ n) 2)))
        (+ (expt (fib k) 2) (expt (fib (1- k)) 2)))
      (let* ((k (/ n 2)) (fk (fib k)))
        (* (+ (* 2 (fib (1- k))) fk) fk)))))
; Performance= 52,167 processor cycles


; Taken from Winston's Lisp, 3rd edition, this is a tail-recursive version, w/o an auxiliary function
(defun fib (n &optional (i 1) (previous-month 0) (this-month 1)) 
 (if (<= n i)
      this-month
      (fib n (+ 1 i) this-month (+ this-month previous-month))))
; Performance= 5,394 processor cycles


;;;Original code by Arnold Schoenhage, 
;;;translated to Scheme by Bradley J. Lucier (2004), 
;;;and adapted to Common Lisp by Nicolas Neuss.
(defun fast-fib-pair (n)
  "Returns f_n f_{n+1}."
  (case n
    ((0) (values 0 1))
    ((1) (values 1 1))
    (t (let ((m (floor n 2)))
         (multiple-value-bind (f_m f_m+1)
             (fast-fib-pair m)
           (let ((f_m^2   (* f_m f_m))
                 (f_m+1^2 (* f_m+1 f_m+1)))
             (if (evenp n)
                 (values (- (* 2 f_m+1^2)
                            (* 3 f_m^2)
                            (if (oddp m) -2 2))
                         (+ f_m^2 f_m+1^2))
                 (values (+ f_m^2 f_m+1^2)
                         (- (* 3 f_m+1^2)
                            (* 2 f_m^2)
                            (if (oddp m) -2 2))))))))))
; Performance= 8,403 processor cycles


;; Fibonacci - Binet's Formula
(defun fib (n)
  (* (/ 1 (sqrt 5))
     (- (expt (/ (+ 1 (sqrt 5)) 2) n)
	(expt (/ (- 1 (sqrt 5)) 2) n))))
; Performance= 48,408 processor cycles


(defun fib (n)
  (/ (- (expt (/ (+ 1 (sqrt 5)) 2) n)
        (expt (/ (- 1 (sqrt 5)) 2) n))
     (sqrt 5)))
; Performance= 16,200 processor cycles


; 18)

;;Defina una función recursiva Mapea que opere exactamente igual que la función
;;mapcar de Common Lisp.

(defun Mapea (function &rest args)
  (if (not (position nil args))
      (cons (apply function (mapcar 'first args))
	    (apply 'Mapea function
		   (mapcar 'rest args)))))

;; (Mapea #'(lambda (x) (list x (- x))) '(1 2 3) ) 
;;> ((1 -1) (2 -2) (3 -3))


; 19)

;;Defina una función Aplana que reciba como argumento una lista con elementos
;;anidados a cualquier nivel de profundidad y, como respuesta, entregue una lista
;;conteniendo los mismos elementos pero todos ellos al nivel principal de profundidad.

(defun Aplana (lista)
  (when (consp lista)
    (let ((el (first lista)) (ls (rest lista)))
    	(append (if (consp el) (Aplana el)
                	(list el))
            	(Aplana ls)))))

;;  (Aplana '( 1 2 ( 3 ( 4 ( 5 ) ) ) ( 6) ) )
;;> (1 2 3 4 5 6)

; 20) 

;;Defina una función recursiva Elimina que reciba como argumento una lista y un
;;número real n. La función debe entregar como resultado una copia de la lista original,
;;en la cual se hayan eliminado todos los elementos que no sean numéricos, así como
;;todos aquellos elementos numéricos que sean menores o iguales que n.

(defun Elimina (lista num)
	(cond ((null lista) nil)
			((not (numberp (first lista)))
	 			(Elimina (rest lista) num))
			((<= (first lista) num)
	 			(Elimina (rest lista) num))
			(T (cons (first lista)
		 		(Elimina (rest lista) num))) ))

;; (Elimina '( 1 2 3 A B C 6.0 1.1 2.3 4.4) 5.0)
;;> (6.0)


; 21)

;;Defina una función recursiva PegaYCambia que reciba como argumento dos listas
;;lista1 lista2 y dos elementos elem1, elem2. Como respuesta, la función debe
;;entregar una lista donde concatene las dos listas originales, pero substituyendo todas
;;las ocurrencias (en ambas listas) de elem1 por elem2.

(defun PegaYCambia(list1 list2 elem1 elem2)
	(cond ((and (null list1) (null list2)) nil)
			((null list1)
	 			(PegaYCambia list2 nil elem1 elem2))
			((eql (first list1) elem1)
	 			(cons elem2
	       			(PegaYCambia (rest list1) list2 elem1 elem2)))
			(T (cons (first list1)
		 		(PegaYCambia (rest list1) list2 elem1 elem2))) ))


;;	(PegaYCambia '( 1 2 3) '( 2 3 4) 2 8)
;;> (1 8 3 8 3 4)

; 22) 

;;Defina una función QSort que reciba como argumento único una lista e
;;implemente con ellos el algoritmo de ordenamiento Quick Sort, ignorando por
;;completo aquellos elementos de la lista original que no sean numéricos. La respuesta
;;de la función debe ser una lista con los elementos numéricos de la original ordenados
;;de forma ascendente.

(defun QSort (lista)
  	(if (null lista) nil
      	(let* 	((filtrada (remove-if-not #'numberp lista))
		     		(x (first filtrada))
		     		(r (rest filtrada))
		     		(fn (lambda (a) (< a x))))
				(append (QSort (remove-if-not fn r)) (list x)
				(QSort (remove-if fn r))))))

;; (QSort '( 3 4 1 5 6 1 8))
;;> (1 1 3 4 5 6 8)
