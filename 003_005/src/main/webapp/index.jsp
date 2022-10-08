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
		<b>Hola mundo</b>
		<%
			EnrollSystem enrollSystem = new EnrollSystem(); 
			
			Teacher teacher = new Teacher();
			teacher.setEmployeeNumber("11110");
			
			ClassRoomSection section =  new ClassRoomSection();
			section.setTeacher(teacher);
			
			ArrayList<ClassRoomSection> sections = new ArrayList<>();
			sections.add(section);
			sections.add(section);
			sections.add(section);
			sections.add(section);
			sections.add(section);
			sections.add(section);
			sections.add(section);
			
			enrollSystem.setSections(sections);
			out.println(enrollSystem);
		%>
	
	</body>
</html>