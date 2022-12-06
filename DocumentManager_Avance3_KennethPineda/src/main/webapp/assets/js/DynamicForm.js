/**
	Permite construir los formularios dinamicos generados por el FrontEnd
	@author jose.inestroza@unah.edu.hn
	@author kenneth.pineda@unah.hn
	@version 0.1.4
	@date 2022-12-04
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

						/*//Se limpia la seccion de respuesta dinamica por si existe una respuesta anterior
						dynamicAnswer.innerHTML = "";
						dynamicAnswer.appendChild(document.createElement("br"));*/

						/*//Se crea una pista visual de color para identificar exito o fracaso de la peticion
						let colorHint = document.createElement("div");
						colorHint.innerHTML = "&nbsp";
						colorHint.style.width = "100%";
						colorHint.style.height = "3px";*/

						//Se genera un nuevo objeto para insertar el HTML y el hint de color
						//let finalContent = document.createElement("div");

						//Status == true
						if (json.status) {

							/*colorHint.style.backgroundColor = "green";
							finalContent.appendChild(colorHint);*/

							dynamicAnswer.innerHTML += json.html;

							//finalContent.outerHTML = json.html;

						}

						//Status == false
						else {

							/*colorHint.style.backgroundColor = "red";
							finalContent.appendChild(colorHint);
							
							let html = document.createElement("p");
							html.innerText = json.message;
							
							finalContent.appendChild(html);*/

							//pendiente - Agregar funcionalidad para crear una modal con mensaje de error
							alert(`${json.message}`);
						}

						//Se guardan los objetos creados dentro de la seccion dinamica
						//dynamicAnswer.appendChild(finalContent);

					} catch (exception) {

						/*let body = document.querySelector("body");
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
						body.appendChild(html);*/

						//pendiente - Agregar funcionalidad para excepciones
						alert(`Ha ocurrido un error en la pagina web: ${exception}`);

					}

				} else {

					/*let body = document.querySelector("body");
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
					body.appendChild(html);*/

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
						//dynamicAnswer.innerHTML = "e";
						//dynamicAnswer.appendChild(document.createElement("br"));

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