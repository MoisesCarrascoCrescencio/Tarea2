; itm: Aplana una lista de listas en una sola lista.
(defun aplanar (lista)
  (cond ((null lista) nil)
        ((atom (car lista)) (cons (car lista) (aplanar (cdr lista))))
        (t (append (aplanar (car lista)) (aplanar (cdr lista))))))
