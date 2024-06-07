; longitud-lista: Calcula la longitud de una lista.
(defun longitud-lista (lista)
  (if (null lista)
      0
      (+ 1 (longitud-lista (cdr lista)))))
