import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:mapbox_gl/mapbox_gl.dart';

class FullScreenMap extends StatefulWidget {
  @override
  _FullScreenMapState createState() => _FullScreenMapState();
}

class _FullScreenMapState extends State<FullScreenMap> {
  MapboxMapController mapController;

  final obscuro = "mapbox://styles/rickylunat/ckgb1sjx4395819qt5y8hyxu1";
  final streets = "mapbox://styles/rickylunat/ckgb1v2po1b6419pg8ddmf0jx";
  String selectedStyle = "mapbox://styles/rickylunat/ckgb1v2po1b6419pg8ddmf0jx";
  final center = LatLng(37.810575, -122.477174);
  void _onMapCreated(MapboxMapController controller) {
    mapController = controller;
    _onStyleLoaded();
  }

  void _onStyleLoaded() {
    addImageFromAsset("assetImage", "assets/custom-icon.png");
    addImageFromUrl("networkImage", "https://via.placeholder.com/50");
  }

  Future<void> addImageFromAsset(String name, String assetName) async {
    final ByteData bytes = await rootBundle.load(assetName);
    final Uint8List list = bytes.buffer.asUint8List();
    return mapController.addImage(name, list);
  }

  /// Adds a network image to the currently displayed style
  Future<void> addImageFromUrl(String name, String url) async {
    var response = await http.get(url);
    return mapController.addImage(name, response.bodyBytes);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: crearMapa(),
      floatingActionButton: botonesFlotantes(),
    );
  }

  Column botonesFlotantes() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        //Símbolos
        FloatingActionButton(
            child: Icon(Icons.block),
            onPressed: () {
              mapController.addSymbol(SymbolOptions(
                  geometry: center,
                  textField: 'Montaña creada aquí',
                  iconImage: "networkImage",
                  textOffset: Offset(0, 2)));
              //CameraUpdate.tilt() para inclinar
            }),
        SizedBox(
          height: 5,
        ),
        //Zoom in
        FloatingActionButton(
            child: Icon(Icons.zoom_in),
            onPressed: () {
              mapController.animateCamera(CameraUpdate.zoomIn());
              //CameraUpdate.tilt() para inclinar
            }),
        SizedBox(
          height: 5,
        ),
        FloatingActionButton(
            child: Icon(Icons.zoom_out),
            onPressed: () {
              mapController.animateCamera(CameraUpdate.zoomOut());
              //CameraUpdate.tilt() para inclinar
            }),
        SizedBox(
          height: 5,
        ),
        //Cambiar estilo
        FloatingActionButton(
          child: Icon(Icons.add_to_home_screen),
          onPressed: () {
            if (selectedStyle == obscuro) {
              selectedStyle = streets;
            } else {
              selectedStyle = obscuro;
            }
            setState(() {
              _onStyleLoaded();
            });
          },
        ),
      ],
    );
  }

  MapboxMap crearMapa() {
    return MapboxMap(
      styleString: selectedStyle,
      onMapCreated: _onMapCreated,
      initialCameraPosition: CameraPosition(target: center, zoom: 10),
    );
  }
}
