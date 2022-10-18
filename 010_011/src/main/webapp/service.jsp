<%@page import="programLibraries.BoxGenerator"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	BoxGenerator boxGenerator = new BoxGenerator();
	String result = boxGenerator.createBoxes(request);
%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<meta name="author" content="kenneth.pineda@unah.hn">
	<meta name="version" content="0.1.0">
	<meta name="date" content="2022-09-26">
	<title>Cajas HTML</title>
	</head>
	<body>
	
		<%=result%>
		
	</body>
</html>