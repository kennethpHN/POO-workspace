/**
 * Permite contruir los formularios dinamicos generados por el FrontEnd.
 * @author jose.inestroza@unah.edu.hn
 * @version 0.1.2
 */
 
class Action{
	constructor(email,description,response){
		this.method="post";
		this.action="service.jsp";
		
		this.email=email;
		this.description=description;
		this.response=response;
	}
	
	send(){
		let _this=this;
		
		let xhr=new XMLHttpRequest();
		xhr.open(this.method,this.action,true);
		
		xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
		
		xhr.onreadystatechange=function(){
			if(this.readyState === XMLHttpRequest.DONE){
				if(this.status===200){
					//Se convierte el texto de respuesta recibido mediante AJAX, a un objeto de JavaScript
					let json=JSON.parse(this.responseText);
					
					//Se genera un acceso a la seccion de respuesta dinamica
					let dynamicAnswer=_this.response;
					
					//Se limpia la seccion de respuesta dinamica por si existe una respuesta anterior
					dynamicAnswer.innerHtml="";
					dynamicAnswer.appendChild(document.createElement("br"));
					
					//Se crea una pista visual de color para identificar el exito o fracaso de la peticion
					let colorHint=document.createElement("div");
					colorHint.innerHTML="&nbsp";
					colorHint.style.width="100%";
					colorHint.style.heigth="3px";
					
					//Se genera un nuevo objeto para insertar el HTML y el hint de color
					let finalContent=document.createElement("div");
					
					//status==true
					if(json.status){
						colorHint.style.backgroundColor="green";
						finalContent.appendChild(colorHint);
						
						finalContent.innerHTML+=json.content;
					}					
					//status == false
					else{
						colorHint.style.backgroundColor="red";
						finalContent.appendChild(colorHint);
						
						let html=document.createElement("p");
						html.innerText=json.message;
						
						finalContent.appendChild(html);	
					}
					
					//Se guardan los objetos creados dentro de la seccion dinamica
					dynamicAnswer.appendChild(finalContent);
				}
				else{
					
				}
			}
		}
		
		let validator=new Validator();
		if(validator.isEmail(this.email.value)){
			/** Se leen los parametros */
			let params=[];
			params.push(this.extractInfoFromDOMObject(this.email));
			this.description.value=validator.removeSpecialCharacters(validator.removeHTML(this.description.value));
			params.push(this.extractInfoFromDOMObject(this.description));
			
			/** Se envian los parametros */
			xhr.send(params.join("&"));
		}
		else{
			//"Error: El correo no es valido."
			//Se genera un acceso a la seccion de respuesta dinamica
			let dynamicAnswer=this.response;
			
			//Se limpia la seccipon de respuesta dinamica por si existe una respuesta anterior
			dynamicAnswer.innerHTML="";
			dynamicAnswer.appendChild(document.createElement("br"));
			
			//Se crea una pista visual de color para identificar el exito o fracaso de la peticion
			let colorHint=document.createElement("div");
			colorHint.innerHTML="&nbsp";
			colorHint.style.width="100%";
			colorHint.style.heigth="3px";
			
			//Se genera un nuevo objeto para insertar el HTML y el hint de color
			let finalContent=document.createElement("div");
			
			colorHint.style.backgroundColor="red";
			finalContent.appendChild(colorHint);
			
			let html=document.createElement("p");
			html.innerText="Error: El correo no es valido.";			
			finalContent.appendChild(html);
			
			//Se guardan los objetos creados dentro de la seccion dinamica
			dynamicAnswer.appendChild(finalContent);
		}
	}
	
	extractInfoFromDOMObject(DOMObject){
		return `${DOMObject.id}=${DOMObject.value}`;
	}
}