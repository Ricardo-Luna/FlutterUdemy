import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  static final pageName = 'avatar';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Avatar Page'),
        actions: <Widget>[
          Container(
            margin: EdgeInsets.only(
                right: 10.0), //Modifica únicamente el espacio de un lugar
            child: Container(
              padding: EdgeInsets.all(1.0),
              child: CircleAvatar(
                // child: Text('RLT'),
                backgroundColor: Colors.red,
                radius: 30.0,
                backgroundImage: NetworkImage(
                    "https://store.playstation.com/store/api/chihiro/00_09_000/container/ES/es/999/EP1004-CUSA08519_00-AV00000000000004/1594312864000/image?w=240&h=240&bg_color=000000&opacity=100&_version=00_09_000"),
              ),
            ),
          )
        ],
      ),
      body: Center(
        child: FadeInImage(
            placeholder: AssetImage('assets/jarldn.gif'),
            //fadeInDuration: Duration(microseconds: 200),
            image: NetworkImage(
                "https://pm1.narvii.com/7022/86266a7d589b482cd543be10e14e8dea4c66dbd9r1-1280-868v2_00.jpg")),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_back_ios),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
