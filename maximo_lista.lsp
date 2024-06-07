; itm: Encuentra el máximo valor en una lista.
(defun max-lista (lista)
  (if (null (cdr lista))
      (car lista)
      (max (car lista) (max-lista (cdr lista)))))
