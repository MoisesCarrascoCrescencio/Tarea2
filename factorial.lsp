; moises: Calcula el factorial de un número.
(defun factorial (n)
  (if (<= n 1)
      1
      (* n (factorial (- n 1)))))
