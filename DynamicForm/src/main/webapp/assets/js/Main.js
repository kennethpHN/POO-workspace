/**
	Llamado principal de los componentes de Javascript.
	@author jose.inestroza@unah.edu.hn
	@version 0.1.0
	@date 2022-02-17
 */

let titleCounter = new Counter(`title`);
let paragraphCounter = new Counter(`paragraph`);

let dynamicForm = new DynamicForm();

let dynamicSection = document.querySelector("section#dynamicSection");
let dynamicFormTag = document.querySelector("form#dynamicForm")

//El selector para identificar ID es el numeral (#).
//El selector para identificar CLASS es el punto (.).
//etiqueta + tipo de identificador + ID/CLASS
let addTitleButton = document.querySelector("input#addTitleButton");
addTitleButton.addEventListener("click",dynamicForm.createTitle.bind(dynamicSection));

let addPragraphButton = document.querySelector("input#addPragraphButton");
addPragraphButton.addEventListener("click",dynamicForm.createParagraph.bind(dynamicSection));

let sendButton = document.querySelector("input#sendButton");
sendButton.addEventListener("click",dynamicForm.send.bind(dynamicFormTag));
