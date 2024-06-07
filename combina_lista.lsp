; combinaciones: Genera todas las combinaciones posibles de una lista.
(defun combinaciones (lista)
  (if (null lista)
      '(())
      (let ((resto (combinaciones (cdr lista))))
        (append resto (mapcar (lambda (x) (cons (car lista) x)) resto)))))
