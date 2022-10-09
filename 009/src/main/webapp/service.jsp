<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String userName = request.getParameter("userName");
	String phoneNumber = request.getParameter("phoneNumber");
	
	String result = String.format("Se han recibido los datos de nombre ('%s') y número de teléfono ('%s').", userName, phoneNumber);
%>
<!DOCTYPE html>
<html>
	<head>
		<meta name="author" content="kenneth.pineda@unah.hn">
		<meta name="version" content="0.1.0">
		<meta name="date" content="2022-09-23">
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<%=result%>
	</body>
</html>