<%@page import="programLibraries.Box"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Box box = new Box();
	out.print("Imprime información en la página web");
	System.out.print("Imprime información en la consola del servidor");
%>
<!DOCTYPE html>
<html>
	<head>
		<meta name="author" content="kenneth.pineda@unah.hn">
		<meta name="version" content="0.1.0">
		<meta name="date" content="2022-09-22">
		<meta charset="UTF-8">
		<title>Demostración de Objeto tipo Caja</title>
	</head>
	<body>
	
		<%=box %>
		<script type="text/javascript">
		
			//En Javascript existe el alcance var y let.
			if(true){
				let div = document.querySelector("div");
				console.log("Imprime información en la consola del WebBrowser");
				document.write("Imprime información en la página web");
				
				console.log(div);
			}
		
		</script>
		
	</body>
</html>