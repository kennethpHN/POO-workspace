
<%@page import="programFiles.DynamicForm"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%

//La mayoria del codigo se tomo de los ejercicios desarollados por el Ing. José Inestroza, y se le acreditan los mismos. Se marcarán las partes desarolladas por mi persona.

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
