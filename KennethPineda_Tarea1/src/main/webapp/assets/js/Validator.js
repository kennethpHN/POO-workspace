/**
	Aplica Validaciones de expresiones regulares sobre contenido.
	@author kenneth.pineda@unah.hn
	@version 0.1.0
 */

// La mayoria del codigo se tomo de los ejercicios desarollados por el Ing. José Inestroza, y se le acreditan los mismos. Se marcarán las partes desarolladas por mi persona.

class Validator{
	
	constructor(){}
	
	//Codigo propio
	filterHTML(content, regex) {
	  let re = new RegExp(regex, "g");
    	return [...content.matchAll(re)].join(" ");
    }
}