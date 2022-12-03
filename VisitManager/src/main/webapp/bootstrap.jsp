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
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" 
		integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
		
		<style type="text/css">
			div#box{
				height: 100vh;
			}
		</style>
	</head>
	<body>
		<div class="container">
			<div id="box" class="d-flex justify-content-center">
				<div class="align-self-center">
					<h1 class="display-1"><%=count%></h1>
				</div>
			</div>
		</div>
		
				<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" 
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
	</body>
</html>