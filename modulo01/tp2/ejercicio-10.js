var mes=parseInt(prompt("Ingrese el número de mes a consultar"))
function diasEnUnMes(mes, año) {
return new Date(año, mes, 0).getDate();
}
var date = new Date();
var año = 2022;
//mes= mes+1
console.log("El "+ mes + "º mes del año " + año + " tiene " +
diasEnUnMes(mes,año) + " días")
