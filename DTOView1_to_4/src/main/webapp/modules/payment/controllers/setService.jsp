<%@ page import="programLibraries.PaymentManager" %>
<%@ page import="programLibraries.PaymentDTO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	/**
		Controlador para establecer el servicio seleccionado por el usario.
		@author jose.inestroza@unah.edu.hn
		@version 0.1.0
	*/
	PaymentManager paymentService=new PaymentManager();
	int serviceCode=paymentService.getServiceCode(request);
	String serviceName=paymentService.getServiceName(serviceCode);
	
	//Apertura del objeto JavaScript generado mediante cadenas
	StringBuilder json=new StringBuilder("{");
	
	if(serviceName.matches("[Nn]ull")){
		json.append(String.format("\"status\": %s,", false));
		json.append(String.format("\"message\": \"%s\"", "Error!! El servicio es desconocido."));
		
		session.removeValue(PaymentManager.PAYMENT_DTO_ATTRIBUTE);
	}
	else{
		json.append(String.format("\"status\": %s", true));
		
		PaymentDTO paymentDTO=new PaymentDTO();
		paymentDTO.setServiceCode(serviceCode);
		paymentDTO.setServiceName(serviceName); 
		session.setAttribute(PaymentManager.PAYMENT_DTO_ATTRIBUTE, paymentDTO);
	}
	
	json.append("}");
	out.print(json.toString().replaceAll("\\n+", ""));
	
%>