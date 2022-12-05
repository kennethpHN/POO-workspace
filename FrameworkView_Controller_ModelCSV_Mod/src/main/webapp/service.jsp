<%@page import="programLibraries.FileManager" %>
<%@page import="programLibraries.FileManagerResponse" %>
<%@page import="programLibraries.CSV" %>
<%@page import="programLibraries.Validator" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% 
	//Apertura del objeto JavaScript generado mediante cadenas de texto
	StringBuilder json=new StringBuilder("{");
	Validator validator=new Validator();
	
	if(request.getParameter("email")!=null && validator.isEmail(request.getParameter("email").toString())
			&& request.getParameter("description")!=null){
		String email=request.getParameter("email");
		String description=validator.removeSpecialCharacters(validator.removeHTML(request.getParameter("description")));
		
		CSV csvObj=new CSV(email,description);
		
		String content=csvObj.toString();
		
		FileManager fm=new FileManager();
		String path=fm.path();
		FileManagerResponse createResponse=fm.create("Documentos/temporalFile.csv",content);
		FileManagerResponse readResponse=fm.read("Documentos/temporalFile.csv");
		
		//Cuando existe una respuesta correctamente procesada
		if(createResponse.isStatus() && readResponse.isStatus()){
			json.append(String.format("\"status\": %s,", true));
			json.append(String.format("\"content\": \"%s\",", readResponse.getContent()));
			json.append(String.format("\"path\": \"%s\"", path));
		}
		//Cuando los parametros recibidos no han generado una respuesta
		else{
			json.append(String.format("\"status\": %s,", false));
			json.append(String.format("\"message\": \"Ha ocurrido un fallo en la escritura del modelo. %s\"", createResponse.getError()));
		}
	}
	else{
		json.append(String.format("\"status\": %s,", false));
		json.append(String.format("\"message\": \"Los parametros recibidos no han generado una respyesta.\""));
	}
	
	//Clausura del objeto JavaScript generado mediante cadenas de texto
	json.append("}");
	out.print(json.toString().replaceAll("((\\n+)|(\\t+))", ""));
	
%>