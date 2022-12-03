/**
	Llamado principal de los componentes de Javascript.
	@author jose.inestroza@unah.edu.hn
	@version 0.1.0
	@date 2022-12-02
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

let infoModalAction = new Action();
infoModalAction.setId("infoModal");
let infoModalWindow = document.querySelector("button#infoModalWindow");
infoModalWindow.addEventListener("click", infoModalAction.callFirstModal.bind(infoModalAction));