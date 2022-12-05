<%@page import="programLibraries.DAOCSVResponse"%>
<%@page import="programLibraries.DAOCSV"%>
<%@page import="programLibraries.Validator"%>
<%@page import="programLibraries.DynamicForm"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
 
<%
	
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
	
%>
<% 
	/*
	//Apertura del objeto JavaScript generado mediante cadenas de texto
	StringBuilder json=new StringBuilder("{");
	Validator validator=new Validator();
	
	if(request.getParameter("emailInput")!=null && validator.isEmail(request.getParameter("emailInput").toString())
			&& request.getParameter("informationInput")!=null){
		String email=request.getParameter("emailInput");
		String informationInput=validator.removeSpecialCharacters(validator.removeHTML(request.getParameter("informationInput")));
		String documentCode = validator.removeSpecialCharacters(validator.removeHTML(request.getParameter("documentCode")));
		
		
		DAOCSV daoCSV = new DAOCSV();
		DAOCSVResponse daoCSVResponse = daoCSV.createModel("1",email,documentCode,informationInput);
		
		
		//Cuando existe una respuesta correctamente procesada
		if(daoCSVResponse.isStatus()){
			
			json.append(String.format("\"status\": %s,", true));
			json.append(String.format("\"content\": \"%s\",", daoCSVResponse.getContent()));
			json.append(String.format("\"path\": \"%s\"", daoCSVResponse.getPath()));
		}
		//Cuando los parametros recibidos no han generado una respuesta
		else{
			json.append(String.format("\"status\": %s,", false));
			json.append(String.format("\"message\": \"Ha ocurrido un fallo en la escritura del modelo. \""));
		}
	}
	else{
		json.append(String.format("\"status\": %s,", false));
		json.append(String.format("\"message\": \"Los parametros recibidos no han generado una respuesta.\""));
	}
	
	//Clausura del objeto JavaScript generado mediante cadenas de texto
	json.append("}");
	out.print(json.toString().replaceAll("((\\n+)|(\\t+))", ""));
	*/
	
%>