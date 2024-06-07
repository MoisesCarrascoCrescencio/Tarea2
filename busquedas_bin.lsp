; itm: Realiza una búsqueda binaria en una lista ordenada.
(defun busqueda-binaria (lista elem)
  (let ((medio (/ (length lista) 2)))
    (cond ((null lista) nil)
          ((= (nth medio lista) elem) medio)
          ((< elem (nth medio lista))
           (busqueda-binaria (subseq lista 0 medio) elem))
          (t
           (let ((resultado (busqueda-binaria (subseq lista (+ medio 1)) elem)))
             (if resultado (+ medio 1 resultado) nil))))))
