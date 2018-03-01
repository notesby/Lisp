;; a) El quinto elemento de la lista (((1 2) 3) 4 (5 (6)) A (B C) D (E (F G))), sin usar la funci ón FIFTH.

(first (rest (rest (rest (rest '(((1 2) 3) 4 (5 (6)) A (B C) D (E (F G))))))))

;; b) El número de segundos que tiene el año bisiesto 2004.

(abs (- (encode-universal-time 0 0 0 1 1 2004)  (encode-universal-time 59 59 23 31 12 2004)))

;; c) Si el valor numérico asociado a la variable x es diferente de cero y además menor o igual que el valor asociado a la variable y.

(and (not (= x 0)) (<= x y))

;; d) Una lista con las dos soluciones reales de la ecuación 2x^2+7x+5=0

(list (/ (+ -7.0 (sqrt (- (expt 7 2) (* 4 2 5)))) (* 2 2)) (/ (- -7.0 (sqrt (- (expt 7 2) (* 4 2 5)))) (* 2 2)))