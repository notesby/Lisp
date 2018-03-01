;;Construya una funci ón Analiza, con argumento X, que responda una lista con los valores de verdad correspondientes a las respuestas a 
;;las siguientes preguntas: ¿es X un átomo?, ¿es X un n úmero?, ¿es X una lista? , ¿es X una celda de construcción? y ¿es X una lista vacía?
(defun Analiza (X) (list (atom X) (numberp X) (listp X) (consp X) (and (listp X) (null X))))