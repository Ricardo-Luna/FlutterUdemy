void main() {
  Map<String, dynamic> persona = {
    'nombre': 'Carlos',
    'edad': 32,
    'soltero': true
  };

  print(persona['nombre']);
  print(persona['edad']);

  Map<int, String> personas = {1: "Tony", 2: "Juan", 3: "Peter", 4: "Strange"};

  personas.addAll({4: 'Banner'});
  print(personas);
  print(personas[2]);
}
