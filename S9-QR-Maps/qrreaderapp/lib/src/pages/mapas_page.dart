import 'package:flutter/material.dart';
import 'package:qrreaderapp/src/bloc/scan_bloc.dart';
import 'package:qrreaderapp/src/providers/db_provider.dart';
import 'package:qrreaderapp/src/utils/utils.dart' as utils;

class MapasPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final scansBloc = new ScansBloc();
    return StreamBuilder<List<ScanModel>>(
      stream: scansBloc.scansStream,
      builder: (BuildContext context, AsyncSnapshot<List<ScanModel>> snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        final scans = snapshot.data;

        if (scans.length == 0) {
          return Center(
            child: Text('No hay información'),
          );
        }
        return ListView.builder(
            itemCount: scans.length,
            itemBuilder: (context, index) => Dismissible(
                  key: UniqueKey(),
                  background: Container(
                    color: Colors.red[900],
                  ),
                  onDismissed: (direction) =>
                      {scansBloc.borrarScan(scans[index].id)},
                  child: ListTile(
                    leading: Icon(
                      Icons.cloud_queue,
                      color: Theme.of(context).primaryColor,
                    ),
                    title: Text(scans[index].valor),
                    subtitle: Text("${scans[index].id}"),
                    trailing: Icon(
                      Icons.keyboard_arrow_right,
                      color: Colors.grey,
                    ),
                    onTap: () {
                      utils.abrirScan(context, scans[index]);
                    },
                  ),
                ));
      },
    );
  }
}
