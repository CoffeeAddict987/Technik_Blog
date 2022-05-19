var bt1 = document.getElementById("my-link");
bt1.addEventListener('click', new_content);

function new_content(){
const node = document.createElement("p");
const textnode = document.createTextNode("New Content");
node.appendChild(textnode);
document.getElementById("add-content").appendChild(node);
}