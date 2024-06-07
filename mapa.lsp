; mapa: Aplica una función a cada elemento de una lista.
(defun mapa (fn lista)
  (if (null lista)
      nil
      (cons (funcall fn (car lista)) (mapa fn (cdr lista)))))
