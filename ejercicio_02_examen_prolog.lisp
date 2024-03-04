(defun suma-N-numeros-pares (numero)
  (if (<= numero 2)
      2
      (if (evenp numero)
          (+ numero (suma-N-numeros-pares (- numero 2)))
          (suma-N-numeros-pares (- numero 1)))))

(print (suma-N-numeros-pares 10))
