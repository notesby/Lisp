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