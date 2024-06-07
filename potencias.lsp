; moises: Calcula la potencia de un número.
(defun potencia (base exponente)
  (if (= exponente 0)
      1
      (* base (potencia base (- exponente 1)))))
