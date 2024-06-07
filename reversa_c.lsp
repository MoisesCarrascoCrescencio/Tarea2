; reversa-cadena: Invierte los caracteres de una cadena.
(defun reversa-cadena (cadena)
  (coerce (reverse (coerce cadena 'list)) 'string))
