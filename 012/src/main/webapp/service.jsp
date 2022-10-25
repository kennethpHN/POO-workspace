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
		<meta name="date" content="2022-09-29">
		<title>Insert title here</title>
	</head>
	<body>
	<%=result%>
	
	<script>
			/*
			Primer forma para crear objetos en JavaScript
			no sera usada en clase.
			function Student(name){
				this.name = name;
			}
			
			let student = new Student("POO");
			
			-----------------------------------
			
			Segunda forma para crear objetos en JavaScript
			JSON: Javascript Object Notation
			En clase usaremos JSON pero no se usará para crear "Clases"
			student = {
					"name": null,
					"enroll":function(){}
			};
			
			----------------------------------------
			
			Tercera forma para crear objetos en JavaScript
			Esta es la unica forma permitida en clse.
			*/
			
			class Student{
				
				
				constructor(name,accountNumber){
					
					
					this.name = name;
					this.accountNumber = accountNumber;
				}
				
				setName(name){
					this.name = name;
				}
				
				getName(){
					return this.name;
				}
				
				//Metodo enroll en la clase EnrollSystem
				enroll(student){
					this.classRoomSections.get("1000").students.push(student);
					return true;
				}
			}
			
			student1 = new Student("POO",1);
			student2 = new Student();
			
		</script>
	</body>
</html>