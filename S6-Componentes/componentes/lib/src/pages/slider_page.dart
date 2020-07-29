import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _val = 50.0;
  bool _check = true;
  String _url =
      "https://i.pinimg.com/originals/97/b0/a0/97b0a08b632359ef539063a715cfdce5.jpg";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Slider"),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 50.0),
        child: Column(
          children: <Widget>[
            _crearSlider(),
            Divider(),
            _checkBox(),
            Divider(),
            _switch(),
            Center(child: Text(_val.toInt().toString())),
            _crearImagen(),
          ],
        ),
      ),
    );
  }

  Widget _crearSlider() {
    return Slider(
        activeColor: Colors.indigoAccent,
        label: 'Tamaño de la imagen',
        // divisions: 20,
        value: _val,
        min: 0,
        max: 411.0,
        onChanged: (!_check
            ? null
            : (valor) {
                setState(() {
                  _val = valor;
                });
              }));
  }

  Widget _crearImagen() {
    return Image(
      image: NetworkImage(_url),
      width: _val,
      fit: BoxFit.contain,
    );
  }

  Widget _checkBox() {
    return Container(
      padding: EdgeInsets.only(right: 20, left: 20),
      child: CheckboxListTile(
        title: Text("Bloquear Slider"),
        value: _check,
        onChanged: (valor) {
          setState(() {
            _check = valor;
          });
        },
      ),
    );

    //return Checkbox(
    //  value: _check,
    //  onChanged: (valor) {
    //    setState(() {
    //      _check = valor;
    //    });
    //  },
    //);
  }

  Widget _switch() {
    return Container(
      padding: EdgeInsets.only(right: 20, left: 20),
      child: SwitchListTile(
        title: Text("Bloquear Slider"),
        value: _check,
        onChanged: (valor) {
          setState(() {
            _check = valor;
          });
        },
      ),
    );
  }
}
