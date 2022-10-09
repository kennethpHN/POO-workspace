<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta name="author" content="kenneth.pineda@unah.hn">
		<meta name="version" content="0.1.0">
		<meta name="date" content="2022-09-23">
		<meta charset="UTF-8">
		<title>Formulario de nombre y número de teléfono</title>
	</head>
	<body>
	
		<form method="GET" action="service.jsp">
			<input name="userName" type="text" placeholder="Escriba un nombre"><br>
			<input name="phoneNumber" type="text" placeholder="Escriba un número de teléfono"><br>
			<input type="submit" value="Enviar">
		</form>
	</body>
</html>