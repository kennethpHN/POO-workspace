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
		
		let elem = event.target.id;
		let pare = event.target.parentNode.parentNode.className;
		//let id = elem.id();
		//alert(elem);
		if(elem.match("infoModalWindow")){

			alert("prueba"+pare);
		
		}
	
	}
	
	
}