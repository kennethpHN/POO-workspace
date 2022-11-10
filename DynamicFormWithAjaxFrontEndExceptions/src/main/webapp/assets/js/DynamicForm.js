/**
	Permite construir los formularios dinamicos generados por el FrontEnd
	@author jose.inestroza@unah.edu.hn
	@version 0.1.3
 */
 
 class DynamicForm{
	
	constructor(){
		this.method = "post";
		this.action = "service.jsp";
	}
	
	createTitle(){
		
		let input = document.createElement("input");
		input.name = `${titleCounter.get()}`;
		input.value = ``;
		input.placeholder = '';
		
		this.appendChild(input);
		this.appendChild(document.createElement("br"));
		
	}
	
	createParagraph(){
		
		let textarea = document.createElement("textarea");
		textarea.name = `${paragraphCounter.get()}`;
		textarea.value = ``;
		textarea.placeholder = '';
		textarea.rows = 3;
		textarea.cols = 27;
		
		this.appendChild(textarea);
		this.appendChild(document.createElement("br"));
		
	}
	
	getParamsFrom(inputsAndTextareas){
		
		let validator = new Validator();
		let params = [];
		
		for(let element of inputsAndTextareas){
			
			let value = validator.removeHTML(element.value);
			value = validator.removeSpecialCharacters(value);
			
			params.push(`${element.name}=${value}`);
		}
		
		return params.join("&");
	}
	
	send(){
		
		let xhr = new XMLHttpRequest();
		xhr.open(this.method, this.action, true);
		
		xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
		
		xhr.onreadystatechange = function() {
			if (this.readyState === XMLHttpRequest.DONE) {
				
				if (this.status === 200){
					
					try{
						
						//Se convierte el texto de respuesta recibido mediante AJAX, a un objeto de javascript
						let json = JSON.parse(this.responseText);
						
						//Se genera un acceso a la seccion de respuesta dinamica
						let dynamicAnswer = document.querySelector("section#dynamicAnswer");
						
						//Se limpia la seccion de respuesta dinamica por si existe una respuesta anterior
						dynamicAnswer.innerHTML = "";
						dynamicAnswer.appendChild(document.createElement("br"));
						
						//Se crea una pista visual de color para identificar exito o fracaso de la peticion
						let colorHint = document.createElement("div");
						colorHint.innerHTML = "&nbsp";
						colorHint.style.width = "100%";
						colorHint.style.height = "3px";
						
						//Se genera un nuevo objeto para insertar el HTML y el hint de color
						let finalContent = document.createElement("div");
						
						//Status == true
						if (json.status){
						
							colorHint.style.backgroundColor = "green";
							finalContent.appendChild(colorHint);
							
							finalContent.innerHTML += json.html;
						}
						
						//Status == false
						else{
							
							colorHint.style.backgroundColor = "red";
							finalContent.appendChild(colorHint);
							
							let html = document.createElement("p");
							html.innerText = json.message;
							
							finalContent.appendChild(html);
						}
						
						//Se guardan los objetos creados dentro de la seccion dinamica
						dynamicAnswer.appendChild(finalContent);
					
					}catch(exception){
						
						let body = document.querySelector("body");
						body.style.backgroundColor = "red";
						body.style.color = "white";
						
						let html = document.createElement("p");
						html.style.border = "solid 1px white";
						html.style.color = "white";
						html.innerText = `Se ha generado un error en la pagina web. Favor presione F5 para refrescar su navegador y vuelva a intentarlo`;
						body.appendChild(html);
						
						html = document.createElement("p");
						html.style.border = "solid 1px white";
						html.style.color = "white";
						html.innerText = `La excepcion generada por el sitio, es: ${exception}`;
						body.appendChild(html);
					}
					
				}else{
					
						let body = document.querySelector("body");
						body.style.backgroundColor = "red";
						body.style.color = "white";
						
						let html = document.createElement("p");
						html.style.border = "solid 1px white";
						html.style.color = "white";
						html.innerText = `Se ha generado un error en la pagina web. Favor presione F5 para refrescar su navegador y vuelva a intentarlo`;
						body.appendChild(html);
						
						html = document.createElement("p");
						html.style.border = "solid 1px white";
						html.style.color = "white";
						html.innerText = `El codigo de respuesta, es: ${this.status}`;
						body.appendChild(html);
					
				}
				
			}
		}
		
		let params = this.getParamsFrom(
			document
			.querySelector("section#dynamicSection")
			.querySelectorAll("input, textarea")
		);
		
		xhr.send(params);
	}
	
}