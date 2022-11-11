var cadena = prompt("Ingrese una cadena de texto para analizar")
function MayusMinus (cadena) {
if (cadena === cadena.toUpperCase()) {
console.log("La cadena está formada solo por mayúsculas")
} else if (cadena === cadena.toLowerCase()) {
console.log("La cadena está formada solo por minúsculas")
} else {
console.log("La cadena está formada por mayúsculas y minúsculas")
}
}
console.log(MayusMinus(cadena))
