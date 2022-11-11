var inicio = 1
var fin = 100;
var segmento = []
while(segmento.length < fin ){
numeroAleatorio = aleatorio(inicio,fin)
var existe = false;
for(var i=0;i<segmento.length;i++){
if(segmento [i] === numeroAleatorio){
existe = true;
break;
}
}
if(!existe){
segmento[segmento.length] = numeroAleatorio;
}
}
for(var i=0;i<fin;i++){
document.write("</br>")
document.write(segmento[i]);
}
function aleatorio(numero){
var numero = Math.floor(Math.random() * (fin) + inicio)
return numero
}
