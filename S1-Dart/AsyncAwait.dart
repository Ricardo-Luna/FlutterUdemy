void main() async {
  print('Estamos a punto de pedir datos');

  final data = await httpGet('https://pokeapi.co/api/v2/pokemon/ditto');

  print(data);

  print('Ultima linea');
}

Future<String> httpGet(String url) {
  return Future.delayed(new Duration(seconds: 4), () {
    return 'Hola Mundo';
  });
}
