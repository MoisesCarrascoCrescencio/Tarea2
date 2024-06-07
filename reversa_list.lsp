; itm: Invierte los elementos de una lista.
(defun reversa-lista (lista)
  (if (null lista)
      nil
      (append (reversa-lista (cdr lista)) (list (car lista)))))
