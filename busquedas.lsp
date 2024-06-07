; moises: Ordena una lista utilizando el algoritmo de Quicksort.
(defun quicksort (lista)
  (if (null lista)
      nil
      (let ((pivote (car lista)))
        (append (quicksort (remove-if-not (lambda (x) (< x pivote)) (cdr lista)))
                (list pivote)
                (quicksort (remove-if-not (lambda (x) (>= x pivote)) (cdr lista)))))))
