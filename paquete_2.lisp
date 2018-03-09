;; 1)

;;[sin usar ELT ni POSITION] Defina una función ElemInPos que reciba tres
;;argumentos: elem, lista y pos. La función debe devolver T si elem está en la
;;posición pos de lista, NIL si no lo está.

(defun ElemInPos (elem lista pos) ;pos es la posicion contando desde 0
	(and (listp lista) 
		 (not (null lista)) 
		 (< pos (length lista))
		 (>= pos 0 ) 
		 (eql (nth pos lista) elem )))

;; ejemplo: (ElemInPos 3 '(1 2 3) 2) 
;;> T
;; (ElemInPos 3 '(1 2 3) 3)
;;> NIL

;; 2)

;;Escriba la función Inicio-en que recibe como argumentos una lista y un elemento
;;cualquiera. La función debe entregar como respuesta una copia de la lista original pero
;;comenzando con la primera ocurrencia del elemento dado en la lista original.

(defun Inicio-en (el lista) 
	(loop for e in lista with acumula = NIL 
		when (or (eq acumula T) (setq acumula (eq el e))) 
		collect e ))

;;	(Inicio-en 3 '(1 2 3 4 5 6))
;;> (3 4 5 6)

;;	(Inicio-en 3 '(1 2 3 4 3 6))
;;> (3 4 3 6)

;;(Inicio-en 'A '( B C D A F G))
;; (A F G)

;; 3)

;;Modifique la función del ejercicio anterior para que se llame Termina-en y entregue
;;como respuesta una copia de la lista original pero que termina en la última ocurrencia
;;del elemento dado 

(defun Termina-en (el lista) 
	(reverse (loop for i downfrom (length lista) to 0 
			with acumula = NIL 
			when (or (eq acumula T) (setq acumula (eq el (nth i lista)))) 
			collect (nth i lista))))

;;	(Termina-en 3 '(1 2 3 4 5 6))
;;> (1 2 3)

;;	(Termina-en 3 '(1 2 3 4 3 6))
;;> (1 2 3 4 3)

;;(Termina-en 'A '( B C D A F G))
;;> (B C D A)

;; 4)

;;Construya una función Primer-impar que reciba como argumento una lista y como
;;respuesta entregue otra lista conteniendo el primer elemento de la lista original que
;;sea un número impar y la posición (índice) donde se encuentra.

(defun Primer-impar (lista) 
	(loop for i from 0 to (length lista) 
			for e in lista with encontrado = NIL
			until (setq encontrado (and (numberp e) (= (mod e 2) 1)))
			finally (if encontrado (return (list e i)) (return NIL) )))

;; (Primer-impar '( 1 2 3 4 5 6))
;; (1 0)

;; (Primer-impar '( 2 4 6 1 3 5))
;; (1 3)

;; 5)

;;Modifique la función del inciso anterior para que entregue en la lista de respuesta el
;;último elemento de la lista que sea un número real mayor o igual que cero y el número
;;de veces que dicho elemento se repite en toda la lista.

(defun Ultimo-real (lista) 
	(loop for i downfrom (length lista) to 0 
			with real = NIL 
			with e
			do (setq e (nth i lista))
			when (and (not (null real)) (= e real))
				count e into contador
			when (and (null real) (realp e) (>= e 0)) 
				do (setq real e)
			finally (return (list real contador))))

;;	(Ultimo-real '( 1 2.0 3 4 2.0 A))
;;> (2.0 1)

;;	(Ultimo-real '( 1 2.0 3 2.0 2.0 1i))
;;>	(2.0 2)

;; 6)

;;Escriba la función Conteo que recibe como argumento una lista cualquiera y, como
;;respuesta, entregue una celda de construcción cuya primera parte contiene el conteo de
;;elementos numéricos de la lista original y cuya segunda parte contiene el conteo de
;;sublistas contenidas en la lista original.

(defun Conteo (lista) 
	(loop for e in lista 
		when (numberp e)
			count e into conteo-numeros
		when (listp e)
			count e into conteo-sublistas
		finally (return (cons conteo-numeros conteo-sublistas)) ))

;; 	(conteo '(( A B) 1 A ( 2 3) 4 5))
;;> (3 . 2)

;;	(conteo '((a) (b) (c) 1 2 (3) 4 ))
;;>	(3 . 4)

;; 7)

;;Defina una función Aplana que reciba como argumento una lista con elementos
;;anidados a cualquier nivel de profundidad y, como respuesta, entregue una lista
;;conteniendo los mismos elementos pero todos ellos al nivel principal de profundidad.

(defun Aplana (lista) 
	(let ( (result ()) (temp NIL) (lista-temp lista) ) 
			(do ((i 0 (+ i 1)))
				((>= i (length lista-temp)) result)
				(if (listp (setq temp (nth i lista-temp)))
					(setq lista-temp (append lista-temp temp) )
					(setq result (cons temp result)) ) )
			result ))

;;  (Aplana '( 1 2 ( 3 ( 4 ( 5 ) ) ) ( 6) ) )
;;> (5 4 6 3 2 1)

;; 8)

;;Escriba la función Diagonal que recibe como argumento una lista conteniendo m
;;sub-listas de n elementos cada una de ellas y que representa una matriz de m x n
;;elementos. Como respuesta, esta función debe devolver una lista conteniendo los
;;elementos en la diagonal principal de dicha matriz.

(defun Diagonal (lista) 
	(loop for m from 0 below (length lista)
			collect (nth m (nth m lista))  ))

;; (Diagonal '((1 2)(3 4)))
;; (1 4)

;; 9)

;;Construya una función que reciba como argumento una lista cualquiera y, como
;;respuesta, entregue una lista, con el mismo número de elementos de primer nivel, pero
;;que contiene un símbolo A si el elemento en la posición correspondiente es un átomo,
;;un símbolo L si el elemento correspondiente es una lista y un símbolo N si el
;;elemento en la posición correspondiente es una lista vacía.

(defun Tipos (lista) 
	(loop for e in lista with tipo = NIL
		when (atom e)
			do (setq tipo 'A )
		when (listp e)
			do (setq tipo 'L )
		when (and (listp e) (null e))
			do (setq tipo 'N )
		collect tipo ))

;;	(Tipos '( A B C (1 2) () 1 2))
;;>	(A A A L N A A)

;;	(Tipos '( NIL B C (1) A () 1i T ))
;;>	(N A A L A N A A)

;; 10)

;;Defina la función Suma-numérica que recibe como argumento una lista
;;cualquiera (no anidada), y como respuesta entrega la suma de exclusivamente aquellos
;;elementos de la lista que son numéricos.

(defun Suma-numérica (lista) 
	(loop for e in lista
		when (numberp e)
			sum e))

;; 	(Suma-numérica '(A B 1 2.0 D 2/4 3i))
;;>	3.5

;;	(Suma-numérica '(4.33 B 1 2.0 D 3/9))
;;>	7.6633334

;; 11)

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

;; 12)

;;Construya una función Filtra-múltiplos que reciba como argumentos una lista y un
;;número entero. Como respuesta debe entregar una copia de la lista argumento en la
;;cual se han removido todos los múltiplos del entero recibido. 

(defun Filtra-múltiplos (lista n) 
	(if (integerp n) 
		(loop for e in lista 
			unless (and (numberp e)(= (mod e n) 0))
				collect e ) ))

;; 	(Filtra-múltiplos '(1 2 3 4 5) 2)
;;> (1 3 5)

;;	(Filtra-múltiplos '(A 2 B 4 X) 2)
;;>	(A B X)

;; 13)

;;Defina la función Celdas que recibe como argumento una lista (con elementos de
;;cualquier tipo y anidada a cualquier nivel de profundidad) y, como respuesta entrega el
;;número de celdas de construcción que contiene la representación interna de la lista
;;argumento.

(defun Celdas (lista) 
	(let ( (result 0) (temp NIL) (lista-temp lista) ) 
			(do ((i 0 (+ i 1)))
				((>= i (length lista-temp)) result)
				(if (listp (setq temp (nth i lista-temp)))
					(setq lista-temp (append lista-temp temp) )
					(setq result (+ result 1)) ) )
			result ))

;; (Celdas '(1 (2 4 (5 6) (7 8)) 3))
;;> 8

;; 14)

;;Construya una función Implica con aridad indeterminada, que implemente el
;;operador lógico de la implicación.

(defun Implica (&rest lista) 
	(if (>= (length lista) 2 )
		(loop for i from 1 to (- (length lista) 1)
				with A = (nth 0 lista)
				with B
				do (setq B (nth i lista))
				while (typep B 'boolean) 
					do (setq A (or (not A) B))
				finally (return A) )))

;; (Implica T T NIL)
;;>	NIL

;;	(IMPLICA NIL T T)
;;>	T

;;	(IMPLICA NIL NIL NIL)
;;>	NIL

;; 15)

;;Escriba una función Mult que recibe como argumento dos listas, conteniendo sublistas
;;numéricas, representando matrices. La función debe regresar la multiplicación de
;;las dos matrices si es que éstas son compatibles, en caso de no serlo debe regresar NIL.

(defun Mult (lista1 lista2)
	(let ( (nfl1 (length lista1)) (ncl1 (length (first lista1))) (nfl2 (length lista2)) (ncl2 (length (first lista2))) )
		( if (= ncl1 nfl2)
			(loop for fila-ls1 from 0 to (- nfl1 1)
				collect ( loop for col-ls2 from 0 to (- ncl2 1)
						collect ( loop for col-ls1 from 0 to (- ncl1 1) 
								with n1 = NIL
								with n2 = NIL
								do (setq n1 (nth col-ls1 (nth fila-ls1 lista1)))
								do (setq n2 (nth col-ls2 (nth col-ls1 lista2)))
								;do ( print (list (list fila-ls1 col-ls2 col-ls1) n1 '* n2))
								sum (* n1 n2 ) )))
			 )))

;; (mult '((1 0)(0 1)) '((1 2)(3 4)))
;;> ((1 2) (3 4))

;; (mult '((1 2)(3 4)) '((1 2)(3 4)))
;;> ((7 10) (15 22))
