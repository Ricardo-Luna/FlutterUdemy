import 'package:flutter/material.dart';
import 'package:qrreaderapp/src/bloc/scan_bloc.dart';
import 'package:qrreaderapp/src/models/scan_model.dart';
import 'package:qrreaderapp/src/pages/direcciones_page.dart';
import 'package:qrreaderapp/src/pages/mapas_page.dart';
//import 'package:barcode_scan/barcode_scan.dart';
import 'package:qrreaderapp/src/providers/db_provider.dart';
import 'package:qrreaderapp/src/utils/utils.dart' as utils;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final scansBloc = new ScansBloc();
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('QR Scanner'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.delete_forever),
            onPressed: () {
              scansBloc.borrarScanTodos();
            },
          )
        ],
      ),
      body: _callPage(currentIndex),
      bottomNavigationBar: _crearBottomNavigationBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        child: Icon(Icons.filter_center_focus),
        onPressed: () {
          scanQR();
        },
      ),
    );
  }

  scanQR() async {
    //https://pub.dev/packages/barcode_scan
    //geo:19.702555301679208,-103.46414938410648
    dynamic futureString = 'https://pub.dev/packages/barcode_scan';
    dynamic fs2 = 'geo:19.702555301679208,-103.46414938410648';
    if (futureString != null) {
      final scan = ScanModel(valor: futureString);
      scansBloc.agregarScan(scan);
      final scan2 = ScanModel(valor: fs2);
      scansBloc.agregarScan(scan2);
      utils.abrirScan(context, scan);
    }

    // try {
    //   futureString = await BarcodeScanner.scan();
    // } catch (e) {
    //   futureString = e.toString();
    // }
    // print('Future String: ${futureString.rawContent}');
  }

  Widget _crearBottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (index) {
        setState(() {
          currentIndex = index;
        });
      },
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.map), title: Text('Mapas')),
        BottomNavigationBarItem(
            icon: Icon(Icons.directions), title: Text('Direcciones'))
      ],
    );
  }

  Widget _callPage(int paginaActual) {
    switch (paginaActual) {
      case 0:
        return MapasPage();
      case 1:
        return DireccionesPage();
      default:
        return MapasPage();
    }
  }
}
//scanQR() async {
//
//    dynamic futureString ='';
//
//    try {
//      futureString = await BarcodeScanner.scan();
//    }catch(e){
//      futureString=e.toString();
//    }
//
//  print('Future String: ${futureString.rawContent}');

//return TileLayerOptions(
//        urlTemplate: 'https://api.tiles.mapbox.com/v4/'
//            '{id}/{z}/{x}/{y}@2x.png?access_token={accessToken}',
//        additionalOptions: {
//        'accessToken':'pk.eyJ1Ijoicmlja3lsdW5hdCIsImEiOiJja2U4eGZ6ZTMxOXA3MnNyM2tlYzNiMHd4In0.QcXLbUv_hzKnNn0J5B0crA',
//        'id': 'mapbox.streets'
//        }
//);