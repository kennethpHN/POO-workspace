<%@page import="programFiles.DynamicForm" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	DynamicForm dynamicForm = new DynamicForm();
	String result = dynamicForm.readForm(request);
%>    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="author" content="kenneth.pineda@unah.edu.hn">
		<meta name="version" content="0.1.1">
		<meta name="author" content="2022-02-17">
		<title>Creación dinámica de títulos y párrafos</title>
		<link rel="stylesheet" href="assets/css/style.css">
	</head>
	<body>
	
		<%=result%>
	
	</body>
</html>