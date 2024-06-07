; cadena-a-palabras: Convierte una cadena en una lista de palabras.
(defun cadena-a-palabras (cadena)
  (split-sequence:split-sequence #\Space cadena))
