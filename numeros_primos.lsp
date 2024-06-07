; itm: Genera una lista de números primos hasta un número dado.
(defun es-primo (n)
  (if (< n 2)
      nil
      (loop for i from 2 to (sqrt n) never (zerop (mod n i)))))

(defun primos-hasta (n)
  (remove-if-not #'es-primo (loop for i from 2 to n collect i)))
