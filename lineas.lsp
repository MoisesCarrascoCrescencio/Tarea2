; leer-lineas: Lee todas las líneas de un archivo.
(defun leer-lineas (nombre-archivo)
  (with-open-file (stream nombre-archivo)
    (loop for linea = (read-line stream nil)
          while linea collect linea)))
