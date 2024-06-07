; moises: Calcula el n-ésimo número de Fibonacci.
(defun fibonacci (n)
  (if (<= n 1)
      n
      (+ (fibonacci (- n 1)) (fibonacci (- n 2)))))
