class Action{
	/**
	Clase concreta para la ejecución de una acción.
	@author jose.inestroza@unah.edu.hn
	@version 0.1.0
	@date 2022-12-02
 */
 
	constructor(){
		this.modalId = ``;
	}

	setId(modalId){
		this.modalId = modalId;
	}

	/**
	Metodo para ejecutar la acción deseada.
	@author jose.inestroza@unah.edu.hn
	@version 0.1.0
	@date 2022-12-02 
 	*/

	callFirstModal(){
		let modal = new bootstrap.Modal(document.querySelector(`#${this.modalId}`));
		modal.show();
	}
	
	test(event){
		
		let elementId = event.target.id;
		let parent = event.target.parentNode.parentNode.className;
		//let id = elem.id();
		//alert(elem);
		if(elementId.match("infoModalWindow")){

			alert("prueba"+parent);
		
		}
	
	}
	
	docCount(){
		let documentCounter = document.querySelector("p#documentCount").nextSibling;
		try{
			let lastchildList = document.querySelector("ul#docList").lastElementChild;
			let elementWithCode = lastchildList.querySelector("div#documentCodeDescriptor");
			if(lastchildList!=null){
				documentCounter.innerHTML = "";
				documentCounter.innerHTML = elementWithCode.dataset.code;		
			}
			}catch(error){
			}
		
		
	
	}
	
	
}