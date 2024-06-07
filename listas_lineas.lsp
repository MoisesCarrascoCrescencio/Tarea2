; itm: Escribe una lista de líneas en un archivo.
(defun escribir-lineas (nombre-archivo lineas)
  (with-open-file (stream nombre-archivo :direction :output :if-exists :supersede)
    (loop for linea in lineas
          do (write-line linea stream))))
