/**
 * 
 */



class Action{
	
	constructor(objs){
		this.count = 0;
		this.colors = ["salmon",
		"red",
		"orange",
		"lightyellow",
		"olive",
		"teal",
		"dodgerblue",
		"purple",
		"goldenrod",
		"brown"],
	this.objs = objs;
	}
	
    changeColor(event){
        //Ejercicio para el estudiante: haga un proceso que cambie el color ciclicamente de entre un número
        //finito de colores.
        let div = event.target;
        div.style.backgroundColor = this.colors[this.count%this.colors.length];
    	this.count++;
    }
    
    
    moveBox(event){
	
		let x = event.clientX;
		let y = event.clientY;
		
		let boxes = this.objs;
		
		for (let i = 0; i<boxes.length; i++){
			
			let box = boxes[i];
			
			box.style.top = `${y}px`; //Cadenas con formato de Javascript
			box.style.left = `${x}px`;
			
		}
	
}
    
}