/**
 * Llamado principal de los componentes de JavaScript.
 * @author jose.inestroza@unah.edu.hn
 * @version 0.1.1
 */
 
 let email=document.querySelector("input#email");
 let description=document.querySelector("input#description");
 let response=document.querySelector("div#response");
 
 let actions=new Action(email,description,response);
 
 let sendButton=document.querySelector("input#sendButton");
 sendButton.addEventListener("click",actions.send.bind(actions));
 
 
