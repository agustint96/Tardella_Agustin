var verdadero=0, char=0, masletras=0, aux=0, suma=0, resta=0,
multiplicacion=0, division=0
var ordenadas=[]
var numeros=[]
var valores = [verdadero, false, 2, "hola", "mundo", 3, char]
for (i = 0; i < valores.length; i++) {
var total = contar(valores[i])
if (total>0) {
ordenadas.push(valores[i])
if (total>masletras){
masletras = total
palabra = i
total = 0
}
}
}
var num = ordenadas.length-1
for (i = 0; i <= ordenadas.length; i++) {
for (j = i+1; j <= num ; j++) {
if (ordenadas[i].length > ordenadas[j].length){
aux = ordenadas[i]
ordenadas[i] = ordenadas[j]
ordenadas[j] = aux
}
}
}
for (i = 0; i < valores.length; i++) {
if (typeof valores[i]==="number"){
if (valores[i]!=0){
numeros.push(valores[i])
}
}
}

suma = numeros[0] + numeros[1]
resta = numeros[0] - numeros[1]
multiplicacion = numeros[0] * numeros[1]
division = numeros[0] / numeros[1]
function contar(letras){
return letras.length
}
console.log('La palabra "'+valores[palabra] + '" es la que mas
letras tiene, con ' +
masletras + ' letras.')
console.log(ordenadas)
console.log(suma)
console.log(resta)
console.log(multiplicacion)
console.log(division)
