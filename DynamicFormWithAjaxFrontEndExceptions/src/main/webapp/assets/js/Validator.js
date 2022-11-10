/**
	Aplica Validaciones de expresiones regulares sobre contenido.
	@author jose.inestroza@unah.edu.hn
	@version 0.1.0
 */
 
class Validator{
	
	constructor(){}
	
	removeHTML (text){
		return `${text}`.trim().replace(/<[^>]+>/g,"");
	}
	
	removeSpecialCharacters(text){
		return `${text}`.trim().replace(/[^\w \t.,-:áéíóúüÁÉÍÓÚÜñÑ]+/g,"");
	}
}