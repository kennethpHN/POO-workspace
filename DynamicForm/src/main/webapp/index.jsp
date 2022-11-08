<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="author" content="kenneth.pineda@unah.edu.hn">
		<meta name="version" content="0.1.1">
		<meta name="author" content="2022-02-17">
		<title>Creación dinámica de títulos y párrafos</title>
	</head>
	<body>
		<form id="dynamicForm" method="POST" action="service.jsp">
			<section id="dynamicSection">
			<!-- Los input y textarea dinámicos a crear, se les debe definir un NAME, para su recepción en la página destino -->
			</section> <!-- Sección Dinámica -->
			<hr> <!-- Horizontal row -->
			<section>
				<!-- Los inputs estaticos de tipo boton, no requieren un NAME,
				ya no es necesario que transporten informacion hacia service.jsp,
				por lo que se espera que tengan un identificado ID, para  poder asignarles
				los eventos necesarios dentro de esta pagina. -->
				<!-- Los ID permiten identificar a los elementos unicos/individuales.
				Los CLASS permiten identificar a agrupamientos de elementos -->
				<input id="addTitleButton" Class="button" type="button" value="Agregar Titulo">
				<input id="addParagraphButton" Class="button" type="button" value="Agregar Parrafo">
				<input id="sendButton" Class="button" type="button" value="Enviar">
			</section> <!-- Seccion estatica -->
		</form>
		
		<script src="assets/js/Counter.js"></script>
		<script src="assets/js/DynamicForm.js"></script>
		<script src="assets/js/Main.js"></script>
	</body>
</html>