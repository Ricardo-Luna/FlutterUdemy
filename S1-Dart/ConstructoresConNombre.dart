import 'dart:convert';

void main() {
  //final wolverine = new Heroe(nombre: "Logan", poder: "Garras");
  final rawJson = '{"nombre": "Logan", "poder": "Garras"}';
  final Map parsedJson = json.decode(rawJson);

  final wolverine = new Heroe.fromJson(parsedJson);

  print(wolverine.poder);
  print(wolverine.nombre);
}

class Heroe {
  String nombre;
  String poder;

  Heroe({this.nombre, this.poder});

  Heroe.fromJson(Map parsedJson) {
    nombre = parsedJson['nombre'];
    poder = parsedJson['poder'];
  }
}
