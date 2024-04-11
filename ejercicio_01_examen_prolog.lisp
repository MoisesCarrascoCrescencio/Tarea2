(defun sumar-N-enteros (x)
  (if (= x 0)
      0
      (+ x (sumar-N-enteros (- x 1)))))

(print(sumar-N-enteros 5))