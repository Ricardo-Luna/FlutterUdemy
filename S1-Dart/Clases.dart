void main() {
  var wolverine = new Heroe(nombre: "James Howlett", poder: "Regeneración");
  print(wolverine);
  print(wolverine.nombre);
  print(wolverine.poder);
}

class Heroe {
  String nombre;
  String poder;
  Heroe({String nombre, String poder}) {
    this.nombre = nombre;
    this.poder = poder;
  }
}
