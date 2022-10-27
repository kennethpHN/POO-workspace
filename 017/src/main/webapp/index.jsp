<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta name="author" content="kenneth.pineda@unah.hn">
		<meta name="version" content="0.1.0">
		<meta name="date" content="2022-10-14">
		<meta charset="UTF-8">
		<title>Demostración de XHR para la generación de cajas</title>
	</head>
	<body>
	
		<input name="numberOfBoxes" type="text" placeholder="Número de cajas a crear"><br>
		<input type="button" value="Enviar">

		<script>
			 
			class Event{
				
				constructor(numberOfBoxes,objDOMforResponse){
					
					//Guarda al objeto que posee el input de la cantidad de cajas
					this.numberOfBoxes = numberOfBoxes;
					
					//En este objeto se guardará la respuesta
					this.objDOMforResponse = objDOMforResponse;
					
					//Pagina destino
					this.actionURL = "service.jsp?numberOfBoxes=";
					
				}
				
				createBoxes(event){
					
					//Ejecicion de la peticion asincrona
					this.send();
					
				}
				
				processRequest(event){
					//console.log("this ", this); 
					//console.log("event ", event);
					let html = event.target.responseText;
					this.objDOMforResponse.innerHTML = html;
				}
				
				send(){
					
					
					//Numero de cajas escrito por el usuario
					let numberOfBoxes = this.numberOfBoxes.value;
					
					//Objeto para crear la peticion asincrona
					let xhr = new XMLHttpRequest(); 

			        
			        xhr.addEventListener("load",this.processRequest.bind(this));
			        xhr.open("GET",this.actionURL+numberOfBoxes,true);
			        xhr.send();
					
				}
				
			}
			
			//Objeto DOM input que contiene la cantidad de cajas escrita por el usuario
			let numberOfBoxes = document.querySelectorAll("input")[0];
			
			//objeto DOM div donde se guardara la respuesta del HTTP Request
			let div = document.querySelector("div");
			
			//Instancia del objeto que nos permite manejar nuestros propios eventos
			let events = new Event(numberOfBoxes,div);
			
			//objeto DOM input (button) que permite iniciar todo el proceso asincrono
			let sendButton = document.querySelectorAll("input")[1];
			sendButton.addEventListener("click",events.createBoxes.bind(events));
		</script>
	</body>
</html>