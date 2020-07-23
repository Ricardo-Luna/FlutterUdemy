void main() {
  //final perro = new Animal();
  //No se puede crear la instancia de una clase abstracta,
  //
  final perro = new Perro();
  perro.emitirSonido();
  final gato = new Gato();
  gato.emitirSonido();
}

abstract class Animal {
  int patas;
  void emitirSonido();
}

class Perro implements Animal {
  int patas;
  int colas;
  void emitirSonido() => print('Guauuuuu');
}

class Gato implements Animal {
  int patas;
  int colas;
  void emitirSonido() => print('Guauuuuu');
}
