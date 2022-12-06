<%@page import="programLibraries.DynamicForm"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
DynamicForm dynamicForm = new DynamicForm();
String result = dynamicForm.cleanDataModel(request);

StringBuilder json = new StringBuilder("{");
if (result.equals("true")) {

	json.append(String.format("\"status\": %s,", true));
	json.append(String.format("\"message\": \" Modelo de datos eliminado correctamente\""));

} else {

	json.append(String.format("\"status\": %s,", result));
	json.append(String.format("\"message\": \" No se ha encontrado el modelo de datos solicitado\""));
}

json.append("}");
out.print(json.toString().replaceAll("\\n+", ""));

%>
