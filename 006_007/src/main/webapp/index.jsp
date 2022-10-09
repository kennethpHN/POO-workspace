<%@page import="java.util.ArrayList"%>
<%@page import="programLibraries.Teacher"%>
<%@page import="programLibraries.ClassRoomSection"%>
<%@page import="programLibraries.EnrollSystem"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		Hola mundo.<br>
		<b>Hola mundo</b><br>
		<%
		EnrollSystem enrollSystem = new EnrollSystem(); 
		
		Teacher teacher = new Teacher();
		teacher.setEmployeeNumber("11110");
		teacher.setName("Pedro Juan");
		
		Teacher teacher1 = new Teacher();
		teacher1.setEmployeeNumber("11120");
		teacher1.setName("Pedro Pedro");
		
		ClassRoomSection section =  new ClassRoomSection();
		section.setTeacher(teacher);
		
		ClassRoomSection section1 =  new ClassRoomSection();
		section1.setTeacher(teacher1);
		
		ArrayList<ClassRoomSection> sections = new ArrayList<>();
		sections.add(section);
		sections.add(section1);
		
		enrollSystem.setSections(sections);
		
		out.println(enrollSystem);
		%>
	
	</body>
</html>