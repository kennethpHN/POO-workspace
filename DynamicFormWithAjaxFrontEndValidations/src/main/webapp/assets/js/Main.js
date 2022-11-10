/**
	Llamado principal de los componentes de Javascript.
	@author jose.inestroza@unah.edu.hn
	@version 0.1.0
 */

let titleCounter = new Counter(`title`);
let paragraphCounter = new Counter(`paragraph`);

let dynamicForm = new DynamicForm();

let dynamicSection = document.querySelector("section#dynamicSection");

let addTitleButton = document.querySelector("input#addTitleButton");
addTitleButton.addEventListener("click",dynamicForm.createTitle.bind(dynamicSection));

let addParagraphButton = document.querySelector("input#addParagraphButton");
addParagraphButton.addEventListener("click",dynamicForm.createParagraph.bind(dynamicSection));

let sendButton = document.querySelector("input#sendButton");
sendButton.addEventListener("click",dynamicForm.send.bind(dynamicForm));
