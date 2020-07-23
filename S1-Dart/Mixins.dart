void main() {
  final pato = new Pato();
  pato.volar();

  final pezVolador = new PezVolador();
  pezVolador.nadar();
}

abstract class Animal {}

abstract class Mamifero extends Animal {}

abstract class Ave extends Animal {}

abstract class Pez extends Animal {}

abstract class Volador {
  void volar() => print("Estoy volando");
}

abstract class Caminador {
  void caminar() => print("Estoy caminando");
}

abstract class Nadador {
  void nadar() => print("Estoy nadando");
}

class Delfin extends Mamifero with Nadador {}

class Murcielago extends Mamifero with Caminador, Volador {}

class Gato extends Mamifero with Caminador {}

class Paloma extends Ave with Caminador, Volador {}

class Pato extends Ave with Caminador, Volador, Nadador {}

class PezVolador extends Pez with Volador, Nadador {}
