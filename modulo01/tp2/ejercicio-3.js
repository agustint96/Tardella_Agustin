var numero = prompt("Ingrese un número entero positivo y obtendrá su factorial");
var factorial = numero;
for ( i = numero-1; i >= 1; i--) {
factorial = factorial * i;
}
console.log("El factorial del numero", numero, "es igual a", factorial);
