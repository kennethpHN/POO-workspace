# 006

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

# Sobre la ejecución de sistemas en la web

Para el desarrollo de sistemas en Webse requieren los siguientes elementos:
. La construcción de un componente **frontend** (i.e. interfaz que interactúa con el usuario), que se refiere a los elementos que se mostrarán visualmente en el lado del cliente (i.e. web browser). Los lenguajes que se deben aprender para la construcción del frontend son:
- HTML: HyperText Markup Language (Lenguaje de Marcas/Marcado de Hipertexto). Su propósito es definir la **estructura** de la página web. - CSS: Cascade Style Sheets (Hojas de Estilo en Cascada). Su propósito es definir el **estilo** de la página web.
• Javascript: Lenguaje de programación que es interpretado por el navegador web. Su propósito es definir el ** comportamiento** de la página web. . La construcción de un componente **backend** (la funcionalidad y la lógica del "negocio"), que se refiere a los elementos de Java (i.e. packages, classes, lógica) que pertenecen a nuestro proyecto.
. Permite distinguir, mediante un lenguaje de programación, los distintos casos de uso del sistema: e.g. autenticación de usuarios, roles o privilegios, etc.

Para consumir un recurso en la web es necesario indicarle al navegador web la ubicación del recurso a ejecutar. Esto se establece a través del URL (e.g. JSP, imagen, video, etc) para el recurso URI.

El servidor web de nuestra clase es Apache Tomcat 10 con version 10.0.23

La versión de Java para nuestra clase es Java 17 (LTS) mediante OPENJDK.