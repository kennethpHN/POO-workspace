/**
	Permite construir los formularios dinamicos generados por el FrontEnd
	@author jose.inestroza@unah.edu.hn
	@version 0.1.0
	@date 2022-02-17
 */
 
 class DynamicForm{
	
	constructor(){}
	
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
	
	send(){
		
		this.submit();
		//Queda pendiente aplicar validaciones en el FrontEnd
	}
	
}