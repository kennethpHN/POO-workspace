<%@page import="programLibraries.ServerTime"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%

	ServerTime serverTime = new ServerTime();
	StringBuilder json = new StringBuilder("{");

		json.append(String.format("\"status\": %s,", true));
		json.append(String.format("\"seconds\": %s,", serverTime.getSeconds()));
		json.append(String.format("\"minute\": %s,", serverTime.getMinute()));
		json.append(String.format("\"hour\": %s,", serverTime.getHour()));
		
	json.append("}");
			
			out.print(
				json.toString()
				.replaceAll("\\n+", "")
			);



%>