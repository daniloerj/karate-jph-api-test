function suma(cadena,separador) {
  var array = cadena.split(separador);
  var result = 0;
  for (let index = 0; index < array.length; index++) {
       result=result+ parseInt(array[index]);
  }
  return result;
}