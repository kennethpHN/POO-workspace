/**
	Permite construir una peticion asincrona desde el FrontEnd
	@author jose.inestroza@unah.edu.hn
	@version 0.1.4
 */
 
 class DynamicForm{
	
	constructor(method,action,successRedirect,failRedirect){
		this.method = method;
		this.action = action;
		this.successRedirect = successRedirect;
		this.failRedirect = failRedirect;
	}
	
	getParamsFrom(name,selectedOPtions){
		
		let validator = new Validator();
		let params = [];
		
		for(let element of selectedOPtions){
			
			let value = validator.onlyNumbers(element.value);
			
			params.push(`${name}=${element.value}`);
		}
		
		return params.join("&");
	}
	
	send(){
		let thisDynamicForm=this;
		
		let xhr = new XMLHttpRequest();
		xhr.open(this.method, this.action, true);
		
		xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
		
		xhr.onreadystatechange = function() {
			if (this.readyState === XMLHttpRequest.DONE) {
				if (this.status === 200){					
					try{						
						//Se convierte el texto de respuesta recibido mediante AJAX, a un objeto de javascript
						let json = JSON.parse(this.responseText);
						
						//Status == true
						if (json.status){
							location.href=thisDynamicForm.successRedirect;
						}						
						//Status == false
						else{
							location.href=thisDynamicForm.failRedirect;
						}					
					}catch(exception){
						location.href=thisDynamicForm.failRedirect;
					}
					
				}
				else{
					location.href=thisDynamicForm.failRedirect;	
				}
				
			}
		}
		
		let params = this.getParamsFrom("serviceCode",document.querySelector("select#serviceCode").selectedOptions);
		
		xhr.send(params);
	}
	
}