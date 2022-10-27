/**
 * 
 */

let boxes = document.querySelectorAll("div");
let actions = new Action(boxes);

let div = document.querySelector("div");
div.addEventListener("click", actions.changeColor.bind(actions));
document.addEventListener("mousemove", actions.moveBox.bind(actions));