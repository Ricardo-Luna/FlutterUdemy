void main() {
  final cuadrado = new Cuadrado();
  cuadrado.lado = 10;
  print(cuadrado);
  print('Area: ${cuadrado.area}');
}

class Cuadrado {
  double _lado;
  //double _area;

  set lado(double valor) {
    if (valor <= 0) {
      throw ('El lado no puedo puede ser menor a 0');
    }
    _lado = valor;
  }

  double get area => _lado * _lado;

  toString() => 'Lado: $_lado';
}
