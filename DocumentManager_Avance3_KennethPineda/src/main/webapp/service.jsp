<%@page import="programLibraries.DAOCSV"%>
<%@page import="programLibraries.Validator"%>
<%@page import="programLibraries.DynamicForm"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
 
<%
	/*
	DynamicForm dynamicForm = new DynamicForm();
	String result = dynamicForm.readForm(request);
	
	//Apertura del objeto de javascript generado mediante cadenas de texto
	StringBuilder json = new StringBuilder("{");
	
		//Cuando existe una respuesta correctamente procesada
		if (result.strip().length() > 0){
			
			json.append(String.format("\"status\": %s,", true));
			json.append(String.format("\"html\": \"%s\"", result));
		}
		//Cuando los parametros recibidos no han generado una respuesta
		else{
			
			json.append(String.format("\"status\": %s", false));
			json.append(String.format("\"message\": \" Los parametros recibidos no han generado una respuesta\""));
		}
		
	//Clausura del objeto de Javascript generado mediante cadenas de texto
	json.append("}");
	
	out.print(
		json.toString()
		.replaceAll("\\n+", "")
	);
	*/
%>
<% 
	//Apertura del objeto JavaScript generado mediante cadenas de texto
	StringBuilder json=new StringBuilder("{");
	Validator validator=new Validator();
	
	if(request.getParameter("emailInput")!=null && validator.isEmail(request.getParameter("emailInput").toString())
			&& request.getParameter("informationInput")!=null){
		String email=request.getParameter("emailInput");
		String description=validator.removeSpecialCharacters(validator.removeHTML(request.getParameter("informationInput")));
		
		
		DAOCSV daoCSV = new DAOCSV();
		
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