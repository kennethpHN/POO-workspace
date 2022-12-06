/**
	Permite construir los formularios dinamicos generados por el FrontEnd
	@author jose.inestroza@unah.edu.hn
	@author kenneth.pineda@unah.hn
	@version 0.1.5
	@date 2022-12-05
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

							dynamicAnswer.innerHTML += json.html;

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
	sendModalRequest() {
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
						let dynamicAnswer = document.querySelector("div#infoModal").querySelector("div.modal-content");

						//Se limpia la seccion de respuesta dinamica por si existe una respuesta anterior
						//Status == true
						if (json.status) {
							dynamicAnswer.innerHTML = json.html;
							
							let infoModalAction = new Action();
							infoModalAction.setId("infoModal");
							infoModalAction.callFirstModal();
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
			document
				.querySelector("ul#docList")
				.querySelector("#documentCodeDescriptor")
		);

		xhr.send(params);
	}
}