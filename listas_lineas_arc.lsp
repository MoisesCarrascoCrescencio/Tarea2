; contar-lineas: Cuenta el número de líneas en un archivo.
(defun contar-lineas (nombre-archivo)
  (with-open-file (stream nombre-archivo)
    (loop for linea = (read-line stream nil)
          while linea
          count linea)))
