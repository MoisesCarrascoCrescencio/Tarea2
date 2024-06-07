; moises: Genera todas las permutaciones posibles de una lista.
(defun permutaciones (lista)
  (if (null lista)
      '(())
      (apply #'append
             (mapcar (lambda (x)
                       (mapcar (lambda (perm)
                                 (cons x perm))
                               (permutaciones (remove x lista))))
                     lista))))
