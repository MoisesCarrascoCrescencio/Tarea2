; moises: Filtra los elementos de una lista según un predicado.
(defun filtra (pred lista)
  (cond ((null lista) nil)
        ((funcall pred (car lista))
         (cons (car lista) (filtra pred (cdr lista))))
        (t (filtra pred (cdr lista)))))
