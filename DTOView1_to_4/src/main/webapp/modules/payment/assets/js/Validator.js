/**
	Aplica Validaciones de expresiones regulares sobre contenido.
	@author jose.inestroza@unah.edu.hn
	@version 0.1.1
 */
 
class Validator{
	
	constructor(){}
	
	removeHTML (text){
		return `${text}`.trim().replace(/<[^>]+>/g,"");
	}
	
	removeSpecialCharacters(text){
		return `${text}`.trim().replace(/[^\w \t.,-:áéíóúüÁÉÍÓÚÜñÑ]+/g,"");
	}
	
	onlyNumbers(text){
		return `${text}`.trim().replace(/\D+/g,"");	//reemplazo global(/ /g) a todo lo que NO sea un digito(\D)
	}
}