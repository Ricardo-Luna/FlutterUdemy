void main() {
  String mensaje = saludar(nombre: "Ricardo", texto: "Hola,");
  print(mensaje);
}

String saludar({String texto, String nombre}) {
  return '$texto $nombre';
}
