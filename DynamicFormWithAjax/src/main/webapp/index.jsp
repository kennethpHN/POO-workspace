<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="author" content="kenneth.pineda@unah.edu.hn">
		<meta name="version" content="0.1.1">
		<title>Creación dinámica de títulos y párrafos (async)</title>
		<link rel ="stylesheet" href="assets/css/style.css">
		
	</head>
	<body>
		<div>
			<section id="dynamicSection">
			</section>
			<hr>
			<section>
				<input id="addTitleButton" Class="button" type="button" value="Agregar Titulo">
				<input id="addParagraphButton" Class="button" type="button" value="Agregar Parrafo">
				<input id="sendButton" Class="button" type="button" value="Enviar">
			</section>
		</div>
		
		<section id="dynamicAnswer"></section>
		
		<script src="assets/js/Counter.js"></script>
		<script src="assets/js/DynamicForm.js"></script>
		<script src="assets/js/Main.js"></script>
	</body>
</html>