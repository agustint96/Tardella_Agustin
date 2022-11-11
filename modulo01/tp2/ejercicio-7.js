var texto = prompt("Ingrese el texto que desea dar vuelta")
function Alreves(texto){
var textoalreves = "";
for (var i = texto.length - 1; i >= 0; i --) {
textoalreves = textoalreves + texto[i]
}
return textoalreves;
}
console.log(Alreves(texto))
