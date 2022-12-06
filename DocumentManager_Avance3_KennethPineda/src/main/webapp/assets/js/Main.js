/**
	Llamado principal de los componentes de Javascript.
	@author jose.inestroza@unah.edu.hn
	@author kenneth.pineda@unah.hn
	@version 0.1.1
	@date 2022-12-04
 */

let authorModalAction = new Action();
authorModalAction.setId("authorModal");
let modalWindow = document.querySelector("button#authorModalWindow");
modalWindow.addEventListener("click", authorModalAction.callFirstModal.bind(authorModalAction));

let addDocModalAction = new Action();
addDocModalAction.setId("addDocModal");
let addDocmodalWindow = document.querySelector("button#addDocModalWindow");
addDocmodalWindow.addEventListener("click", addDocModalAction.callFirstModal.bind(addDocModalAction));

let clearListModalAction = new Action();
clearListModalAction.setId("clearListModal");
let clearListModalWindow = document.querySelector("button#clearListModalWindow");
clearListModalWindow.addEventListener("click", clearListModalAction.callFirstModal.bind(clearListModalAction));





let dynamicForm = new DynamicForm();

let sendButton = document.querySelector("div#addDocModal").querySelector("button#send-doc-btn");
sendButton.addEventListener("click",dynamicForm.send.bind(dynamicForm));

let modalDescriptionButton = document.querySelector("button#infoModalWindow");
modalDescriptionButton.addEventListener("click",dynamicForm.sendModalRequest.bind(dynamicForm));



/*let infoModalAction = new Action();
infoModalAction.setId("infoModal");
let infoModalWindow = document.querySelector("button#infoModalWindow");
infoModalWindow.addEventListener("click", infoModalAction.callFirstModal.bind(infoModalAction));*/




