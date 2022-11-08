/**
	Permite generar un conteo de valores consecutivos.
	@author jose.inestroza@unah.edu.hn
	@version 0.1.0
	@date 2022-02-17
 */
 
Class Counter{
	
	constructor(name){
		this.name = name;
		this.count = -1;
	}
	
	increment(){
		this.count++;
	}
	
	get(){
		this.increment();
		return `${this.name}_${this.count}`;
	}
	
}