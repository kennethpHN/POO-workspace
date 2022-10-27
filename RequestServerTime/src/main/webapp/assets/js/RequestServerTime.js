/**
	Implementacion concreta de la peticion asincrona
 */
 
 class RequestServerTime{
	
	constructor(){
		this.method = "get";
		this.action = "service.jsp";
	}
	
	request(){
			
		let xhr = new XMLHttpRequest();
		
		xhr.open(this.method, this.action,true);
		xhr.onreadystatechange = function(){
			if (this.readyState === XMLHttpRequest.DONE){
				if(this.status === 200){
					try{
						
						let json = JSON.parse(this.responseText);
						console.log(json);
						console.table(json);
					}catch(exception){
						
					}
				}else{
					
				}
			}
		}
		xhr.send();	
	}
}