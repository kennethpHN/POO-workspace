/**
 * 
 */

 let actions = new Action();

 let div = document.querySelector("div");
 div.addEventListener("click", actions.changeColor.bind(actions));