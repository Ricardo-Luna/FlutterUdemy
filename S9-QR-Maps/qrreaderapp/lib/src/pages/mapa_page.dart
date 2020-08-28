import 'package:flutter/material.dart';

import 'package:flutter_map/flutter_map.dart';
//import 'package:latlong/latlong.dart';

import 'package:qrreaderapp/src/models/scan_model.dart';

class MapaPage extends StatefulWidget {
  @override
  _MapaPageState createState() => _MapaPageState();
}

class _MapaPageState extends State<MapaPage> {
  final map = new MapController();

  String tipoMapa = 'streets-v11';

  @override
  Widget build(BuildContext context) {
    final ScanModel scan = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text('Coordenadas QR'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.my_location),
            onPressed: () {
              map.move(scan.getLatLng(), 18);
            },
          )
        ],
      ),
      body: _crearFlutterMap(scan),
      floatingActionButton: _crearBotonFlotante(context),
    );
  }

  Widget _crearBotonFlotante(context) {
    return FloatingActionButton(
        onPressed: () {
          if (tipoMapa == 'streets-v11') {
            tipoMapa = 'dark-v10';
          } else {
            if (tipoMapa == 'dark-v10') {
              tipoMapa = 'light-v10';
            } else {
              if (tipoMapa == 'light-v10') {
                tipoMapa = 'outdoors-v11';
              } else {
                if (tipoMapa == 'outdoors-v11') {
                  tipoMapa = 'satellite-v9';
                } else {
                  if (tipoMapa == 'satellite-v9') {
                    tipoMapa = 'satellite-streets-v11';
                  } else {
                    if (tipoMapa == 'satellite-streets-v11') {
                      tipoMapa = 'streets-v11';
                    }
                  }
                }
              }
            }
          }
          setState(() {});
        },
        child: Icon(Icons.track_changes),
        backgroundColor: Theme.of(context).primaryColor);
  }

  Widget _crearFlutterMap(ScanModel scan) {
    return FlutterMap(
      mapController: map,
      options: MapOptions(center: scan.getLatLng(), zoom: 18),
      layers: [_crearMapa(), _crearMarcadores(scan)],
    );
  }

  _crearMapa() {
    return TileLayerOptions(
        urlTemplate:
            'https://api.mapbox.com/styles/v1/{id}/tiles/{z}/{x}/{y}?access_token={accessToken}',
        additionalOptions: {
          'accessToken':
              'pk.eyJ1Ijoicmlja3lsdW5hdCIsImEiOiJja2VhYXU0Y3AyZXlhMnpwOHFjY2dpOXFlIn0.n39zAClv937B2oA7BfCb7g',
          'id': 'mapbox/$tipoMapa'
        });
  }

  _crearMarcadores(ScanModel scan) {
    return MarkerLayerOptions(markers: <Marker>[
      Marker(
          width: 100.0,
          height: 100.0,
          point: scan.getLatLng(),
          builder: (context) => Container(
                child: Icon(
                  Icons.location_on,
                  color: Theme.of(context).primaryColor,
                ),
              )),
    ]);
  }
}
