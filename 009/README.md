# 009

@author kenneth.pineda@unah.hn
@version 0.1.0
@date 2022/09/23

# Objetivo

Transporte de datos de una página JSP origen a una destino

# Ejercicio

Haciendo uso de los conocimientos, técnicas, nomenclatura y temáticas de POO, haga un programa **JSP(Java Server Pages)** que permita recibir el nombre y el número de teléfono de un usuario desde una página index.jsp, y mostrar en una página destino service.jsp, los datos recibidos.

# Análisis

- Se debe crear una página index.jsp, con un formulario donde se debe definir el METHOD y el ACTION, para enviar los datos hacia un service.jsp
- En el formulario debe existir 3 elementos, 2 inputs y un botón (submit).
- El input de nombre debe ser de tipo text.
- El input de número de teléfono puede ser de tipo text o de tipo number.
- Se aplicará un button type=submit, en lugar de un input type=submit, para aprender una nueva etiqueta de HTML5.
- Se debe replicar el uso del "request" como el objeto que permite leer los parámetros recibidos desde la petición HTTP enviada por index.jsp

# Validaciones

- Debido a que los datos que viajan de una pantalla **source** hacia una pantalla **destination** pueden estar mal escritos, se hace uso del conocimiento de validaciones, para verificar esta información antes de ser enviada (FrontEnd, Javascript) y antes de almacenarla después de ser recibida (BackEnd, Java).
- Para hacer validaciones se deberá utilizar los mecanismos de control de flujo del lenguaje (e.g if), en conjunto con REGEXP (Expresiones Regulares), es decir, comparación por patrones de texto.

