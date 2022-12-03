<%@ page import="programLibraries.VisitManager" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	VisitManager visitManager=new VisitManager();
	session=visitManager.setCount(session); //session es un objeto de HttpSession que ya esta predefinido por Java, asi como el objeto 'request'
	int count=visitManager.getCount(session); 
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="author" content="jose.inestroza@unah.edu.hn">
		<meta name="version" content="0.1.0">
		<title>Session Handling-Counter</title>
		<style type="text/css">
			.centerPage{
				position: absolute;
				top: 30vh;
				width: 100vw;
				text-align: center;
			}
			
			.bigSize{
				font-size: 7vw;
			}
			
			.red{
				color: red;
			}
		</style>
	</head>
	<body>
		<div class="centerPage bigSize red"><%=count%></div>
	</body>
</html>