; itm: Elimina caracteres no alfabéticos de una cadena.
(defun eliminar-no-alfabeticos (cadena)
  (coerce (remove-if-not #'alpha-char-p (coerce cadena 'list)) 'string))
