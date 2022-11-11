
    var suma = 0
    var promedio = 0
    var notas = []
    for (i=0; i<3; i++){
    var nota = parseInt(prompt("Ingrese la nota del alumno."))
    if (nota>0 && nota<11){
    notas[i]=nota
    }
    else{
    var nota = parseInt(prompt("Error! La nota debe estar comprendida entre 1 y 10."))
    notas[i]=nota
    }
    suma += notas[i]
    }
promedio = suma/3
if (promedio<5){
console.log("Reprobado")
document.write("Reprobado")
}
else if (promedio>=5 && promedio<=8){
console.log("Aprobado")
document.write("Aprobado")
}
else {
console.log("Sobresaliente")
document.write("Sobresaliente")
}
console.log(notas)
console.log(suma)
console.log(promedio)
