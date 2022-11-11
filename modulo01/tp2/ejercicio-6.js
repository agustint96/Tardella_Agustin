var vocales = ["a","e","i","o","u"];
var palabra = prompt("Ingrese una palabra para analizar");
var palabra_a_minusculas = palabra.toLowerCase();
var posicion = 0
var parar = false
for (var i = 0; i < palabra_a_minusculas.length; i++) {
for (var x = 0; x < vocales.length; x++){
if (vocales[x] == palabra_a_minusculas.charAt[i]) {
posicion = i + 1;
parar = true;
break;
}
}
if (parar){
break;
}
}
document.write("En la palabra " + palabra + " la primera vocal se encuentra en la posición " + posicion)

