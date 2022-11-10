<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="author" content="kenneth.pineda@unah.hn">
		<meta name="version" content="0.1.0">
		<title>Tarea de Investigación</title>
		<link rel ="stylesheet" href="assets/css/style.css">
		
	</head>
	<body>
		<p><b>Agrega un texto cualquiera filtrar sus palabras</b></p>
		<p>HTML cualquiera</p>
		<section id="formSection">
		
			<textarea name="HTMLParagraph" placeholder="" rows="3" cols="27"></textarea>
			<br>
			<p>Expresión Regular</p>
			<br>
			<textarea name="REGEXParagraph" placeholder="" rows="1" cols="27"></textarea>
			<br>
			<input id="sendButton" Class="button" type="button" value="Aplicar expresión">
		
		</section>
		
		<section id="dynamicAnswer"></section>
		
		<script src="assets/js/Validator.js"></script>
		<script src="assets/js/DynamicForm.js"></script>
		<script src="assets/js/Main.js"></script>
		
	</body>
</html>