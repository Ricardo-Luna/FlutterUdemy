import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedContainerPage extends StatefulWidget {
  @override
  _AnimatedContainerPageState createState() => _AnimatedContainerPageState();
}

int numColor = 100;

class _AnimatedContainerPageState extends State<AnimatedContainerPage> {
  double _width = 50.0;
  double _height = 50.0;

  Color _color = Colors.red[numColor];

  BorderRadiusGeometry _borderRadius = BorderRadius.circular(8.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Animated Container')),
      body: Center(
        child: AnimatedContainer(
          curve: Curves.easeInOutBack,
          duration: Duration(milliseconds: 500),
          width: _width,
          height: _height,
          decoration: BoxDecoration(borderRadius: _borderRadius, color: _color),
        ),
      ),
      floatingActionButton: _crearBotones(),
      //floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget _crearBotones() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        SizedBox(
          width: 25.0,
        ),
        FloatingActionButton(
          heroTag: "child1",
          child: Icon(Icons.exposure_zero),
          onPressed: () {
            unExpected();
          },
        ),
        Expanded(
          child: SizedBox(
            width: 5.0,
          ),
        ),
        FloatingActionButton(
          heroTag: "child2",
          child: Icon(Icons.minimize),
          onPressed: () {
            _reducirForma();
          },
        ),
        SizedBox(
          width: 15.0,
        ),
        FloatingActionButton(
          heroTag: "child3",
          child: Icon(Icons.add),
          onPressed: () {
            _aumentarForma();
          },
        ),
        SizedBox(
          width: 5.0,
        ),
      ],
    );
  }

  void unExpected() {
    final random = Random();
    setState(() {
      _width = random.nextInt(200).toDouble();
      _height = random.nextInt(200).toDouble();
      _color = Color.fromRGBO(
          random.nextInt(255), random.nextInt(255), random.nextInt(255), 1);
    });
    _borderRadius = BorderRadius.circular(random.nextInt(100).toDouble());
  }

  void _reducirForma() {
    setState(() {
      _width -= 50.0;
      _height -= 50.0;
      if (numColor > 50 && numColor < 90) {
        numColor = numColor + 100;
      }

      _color = Colors.red[numColor];
    });
  }

  void _aumentarForma() {
    setState(() {
      _width += 50.0;
      _height += 50.0;
      if (numColor < 900) {
        numColor = numColor + 100;
      }

      _color = Colors.red[numColor];
    });
  }
}
