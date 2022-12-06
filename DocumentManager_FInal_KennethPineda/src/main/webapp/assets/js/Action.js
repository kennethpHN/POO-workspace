class Action {
	/**
	Clase concreta para la ejecución de una acción.
	@author jose.inestroza@unah.edu.hn
	@version 0.1.0
	@date 2022-12-02
 */

	constructor() {
		this.modalId = ``;
	}

	setId(modalId) {
		this.modalId = modalId;
	}

	/**
	Metodo para ejecutar la acción deseada.
	@author jose.inestroza@unah.edu.hn
	@version 0.1.0
	@date 2022-12-02 
	  */

	callFirstModal() {
		let modal = new bootstrap.Modal(document.querySelector(`#${this.modalId}`));
		modal.show();
	}

	/**
	Metodo para visualizar contadores de la lista de documentos
	@author jose.inestroza@unah.edu.hn
	@version 0.1.0
	@date 2022-12-06
	 */
	docCount() {
		let documentCounter = document.querySelector("p#documentCount").nextSibling;
		let typeOneCounter = document.querySelector("div#typeOneCounter");
		let typeTwoCounter = document.querySelector("div#typeTwoCounter");
		let typeThreeCounter = document.querySelector("div#typeThreeCounter");
		let typeFourCounter = document.querySelector("div#typeFourCounter");

		let counterOne = 0;
		let counterTwo = 0;
		let counterThree = 0;
		let counterFour = 0;

		try {
			let lastchildList = document.querySelector("ul#docList").lastElementChild;
			let elementWithCode = lastchildList.querySelector("div#documentCodeDescriptor");
			if (lastchildList != null) {
				documentCounter.innerHTML = "";
				documentCounter.innerHTML = elementWithCode.dataset.code;
				for (const element of document
					.querySelector("ul#docList")
					.querySelectorAll("h4")) {

					if (element.innerHTML.match("Documento - Revista")) {
						counterOne++;
					}
					if (element.innerHTML.match("Documento - Libro")) {
						counterTwo++;
					}
					if (element.innerHTML.match("Documento - Texto")) {
						counterThree++;
					}
					if (element.innerHTML.match("Documento - Imagen")) {
						counterFour++;
					}

				}
				typeOneCounter.innerHTML = counterOne + " Documentos de tipo Revista";
				typeTwoCounter.innerHTML = counterTwo + " Documentos de tipo Libro";
				typeThreeCounter.innerHTML = counterThree + " Documentos de tipo Texto";
				typeFourCounter.innerHTML = counterFour + " Documentos de tipo Imagen";
			}



		} catch (error) {
			documentCounter.innerHTML = "";
			documentCounter.innerHTML = "0";

			typeOneCounter.innerHTML = counterOne + " Documentos de tipo Revista";
			typeTwoCounter.innerHTML = counterTwo + " Documentos de tipo Libro";
			typeThreeCounter.innerHTML = counterThree + " Documentos de tipo Texto";
			typeFourCounter.innerHTML = counterFour + " Documentos de tipo Imagen";
		}




	}


}