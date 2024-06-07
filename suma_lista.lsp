; itm: Suma los elementos de una lista.
(defun suma-lista (lista)
  (if (null lista)
      0
      (+ (car lista) (suma-lista (cdr lista)))))
