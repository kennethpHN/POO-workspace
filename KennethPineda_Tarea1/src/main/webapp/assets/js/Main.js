/**
	Llamado principal de los componentes de Javascript.
	@author kenneth.pineda@unah.edu.hn
	@version 0.1.0
 */

let dynamicForm = new DynamicForm();

let sendButton = document.querySelector("input#sendButton");
sendButton.addEventListener("click",dynamicForm.send.bind(dynamicForm));
