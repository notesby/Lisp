;; Defina un predicado RealNoCero? que reciba un argumento N y responda si su argumento es o no un número real diferente de cero.
(defun RealNoCero? (N)(and (realp N) (> N 0)))