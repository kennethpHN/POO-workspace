# 003

@author kenneth.pineda@unah.hn
@version 0.1.0
@date 2022/09/13

# Problema

Se carece de un sistema de matricula.

# Solución

Se requiere plantear un análisis orientado a objetos y un diseño orientado a objetos, de un sistema de matricula que involucre a estudiantes, docentes y asignaturas.

# Análisis Orientado a Objetos

Como parte del hallazgo de elemtnos positivos y negativos para resolver la problemática, se lista un aserie de objetos que están involucrados en el escenario planteado.

- Ciudadano. Documentado (DNI, nombre(s) y apellido(s)), fecha de nacimiento, lugar de origen (Departamento y municipio), lugar de origen (Departamento y municipio de residencia)...
- Estudiante. El estudiante debe ser un ciudadano.
- Docente. EL docente debe ser un ciudadano.
- Asignatura. Posee caracteristicas como ser: nombre código, sílabo.
-AsignaturaSeccion. Este objeto que representa una sección de una asignatura. Las características que posee una sección son: código|número de sección, hora de inicio, una hora final, docente asignado, listado de estudiantes (estructura de datos - e.g LinkedList) y pertenece a una asignatura.
- SistemaMatricula. Este objeto representa todo el sistema y contiene a todas las secciones disponibles (estructura de datos - e.g. LinkedList).