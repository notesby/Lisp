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