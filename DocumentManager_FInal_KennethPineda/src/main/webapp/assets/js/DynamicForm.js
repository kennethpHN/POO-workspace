/**
	Permite construir los formularios dinamicos generados por el FrontEnd
	@author jose.inestroza@unah.edu.hn
	@author kenneth.pineda@unah.hn
	@version 0.1.6
	@date 2022-12-06
 */

class DynamicForm {

	constructor() {
		this.method = "post";
		this.action = "service.jsp";
	}

	getParamsFrom(inputValues) {

		let validator = new Validator();
		let params = [];

		for (let element of inputValues) {

			let value = validator.removeHTML(element.value);

			if (validator.emailValidate(value)) {
				params.push(`${element.name}=${value}`);
			} else {
				value = validator.removeSpecialCharacters(value);
				params.push(`${element.name}=${value}`);
			}
			
			

		}
		
			try{
			let lastchildList = document.querySelector("ul#docList").lastElementChild;
			let elementWithCode = lastchildList.querySelector("div#documentCodeDescriptor");
			if(lastchildList!=null){
				params.push(`${elementWithCode.dataset.name}=${Number.parseInt(elementWithCode.dataset.code)+1}`);
			}
			}catch(error){
				params.push("documentListCode=1");
			}
			
		return params.join("&");
	}

	getDocumentListCode(inputValue) {

		let validator = new Validator();
		let params = "";

		let value = validator.removeHTML(inputValue.dataset.code);

		value = validator.removeSpecialCharacters(value);

		params = `${inputValue.dataset.name}=${inputValue.dataset.code}`;
		return params;
	}
	
	getCleanCode(inputValue) {
		let validator = new Validator();
		let params = "";

		let value = validator.removeHTML(inputValue.dataset.code);

		value = validator.removeSpecialCharacters(value);

		params = `${inputValue.dataset.code}=${inputValue.dataset.code}`;
		return params;
	}

	send() {
		let xhr = new XMLHttpRequest();
		xhr.open(this.method, this.action, true);

		xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");

		xhr.onreadystatechange = function() {
			if (this.readyState === XMLHttpRequest.DONE) {

				if (this.status === 200) {
					try {

						//Se convierte el texto de respuesta recibido mediante AJAX, a un objeto de javascript
						let json = JSON.parse(this.responseText);

						//Se genera un acceso a la seccion de respuesta dinamica
						let dynamicAnswer = document.querySelector("ul#docList");

						//Status == true
						if (json.status) {

							let htmlResponse = document.createElement("li");
							htmlResponse.setAttribute("class", "list-document-item list-group-item");
							htmlResponse.innerHTML = json.html;

							dynamicAnswer.appendChild(htmlResponse);
							let action = new Action();
							action.docCount();
							

						}

						//Status == false
						else {
							//pendiente - Agregar funcionalidad para crear una modal con mensaje de error
							alert(`${json.message}`);
						}

					} catch (exception) {
						//pendiente - Agregar funcionalidad para excepcion
						alert(`Ha ocurrido un error en la pagina web: ${exception}`);

					}

				} else {
					//pendiente - Agregar funcionalidad para status de error
					alert(`Ha ocurrido un error en la pagina web. El codigo de respuesta, es: ${this.status}`);


				}

			}
		}

		let params = this.getParamsFrom(
			document
				.querySelector("div#addDocModal")
				.querySelectorAll("input,select,textarea")
		);

		xhr.send(params);
	}

	/**
	Envia una petición para visualizar un modal con la información del documento
	 */
	sendModalRequest(event) {
		let elem = event.target.id;
		if (elem.match("infoModalWindow")) {
			let parent = event.target.parentNode;
			let xhr = new XMLHttpRequest();
			xhr.open(this.method, "descriptionService.jsp", true);

			xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");

			xhr.onreadystatechange = function() {

				if (this.readyState === XMLHttpRequest.DONE) {

					if (this.status === 200) {
						try {

							//Se convierte el texto de respuesta recibido mediante AJAX, a un objeto de javascript
							let json = JSON.parse(this.responseText);

							//Se genera un acceso a la seccion de respuesta dinamica
							let dynamicAnswer = document.querySelector("div#infoModal").querySelector("div");

							//Se limpia la seccion de respuesta dinamica por si existe una respuesta anterior
							//Status == true
							if (json.status) {

								let htmlResponse = document.createElement("div");
								htmlResponse.setAttribute("class", "modal-content");
								htmlResponse.innerHTML = json.html;
								dynamicAnswer.innerHTML = "";
								//dynamicAnswer.innerHTML = json.html;
								dynamicAnswer.appendChild(htmlResponse);


								let infoModalAction = new Action();
								infoModalAction.setId("infoModal");
								infoModalAction.callFirstModal();

								/*
								
								let htmlResponse = document.createElement("li");
								htmlResponse.setAttribute("class","list-document-item list-group-item");
								htmlResponse.innerHTML = json.html;
								
								dynamicAnswer.appendChild(htmlResponse);
								
								
								*/
							}

							//Status == false
							else {
								//pendiente - Agregar funcionalidad para crear una modal con mensaje de error
								alert(`${json.message}`);
							}

						} catch (exception) {
							//pendiente - Agregar funcionalidad para excepciones
							alert(`Ha ocurrido un error en la pagina web: ${exception}`);

						}

					} else {
						//pendiente - Agregar funcionalidad para status de error
						alert(`Ha ocurrido un error en la pagina web. El codigo de respuesta, es: ${this.status}`);


					}

				}
			}
			let params = this.getDocumentListCode(
				parent
			);

			xhr.send(params);
		}
	}
	
	sendCleanRequest(event){
		let xhr = new XMLHttpRequest();
		xhr.open(this.method, "cleanService.jsp", true);

		xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");

		xhr.onreadystatechange = function() {
			if (this.readyState === XMLHttpRequest.DONE) {

				if (this.status === 200) {
					try {
						//Se convierte el texto de respuesta recibido mediante AJAX, a un objeto de javascript
						let json = JSON.parse(this.responseText);

						//Status == true
						if (json.status) {
							let listToClean = document.querySelector("ul#docList");
							listToClean.innerHTML="";
							
							let action = new Action();
							action.docCount();
							
							alert("lista eliminada con exito");
						}

						//Status == false
						else {
							//pendiente - Agregar funcionalidad para crear una modal con mensaje de error
							alert(`${json.message}`);
						}

					} catch (exception) {
						//pendiente - Agregar funcionalidad para excepcion
						alert(`Ha ocurrido un error en la pagina web: ${exception}`);

					}

				} else {
					//pendiente - Agregar funcionalidad para status de error
					alert(`Ha ocurrido un error en la pagina web. El codigo de respuesta, es: ${this.status}`);


				}

			}
		}

		let params = this.getCleanCode(
			document.querySelector("button#clr-doc-btn"));

		xhr.send(params);
	}
}