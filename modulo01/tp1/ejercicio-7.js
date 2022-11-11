let dato, resultado;
val1 = window.prompt("Introduce tu nombre", "...");
val2 = window.prompt("Introduce tu apellido", "...");
//Con windows.prompt nos permite asignarle un valor a las variables "val1" y "val2"
resultado = `Concatenado tu nombre y apellido es: ${val1} ${val2} ` ;
//aquí se concatenan las variables y se almacenan en la variable
resultado
document.write(resultado); //aquí con document.write muestra el contenido de la variable resultado