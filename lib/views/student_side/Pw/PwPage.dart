import 'package:flutter/material.dart';
import 'package:fpbm/services/MotPresidentServices.dart';
import 'package:fpbm/models/MotPresident.dart';
import 'package:flutter/cupertino.dart';
import 'dart:async';

//I use this link as reference for getting data -
// from  API https://flutter.dev/docs/cookbook/networking/fetch-data

class MotDuPresident extends StatefulWidget {
  @override
  _MotDuPresidentState createState() => _MotDuPresidentState();
}

class _MotDuPresidentState extends State<MotDuPresident> {

  String presidentImage = 'assets/president-4.png';
  String motpresident = 'AL\'université Sultan Moulay Slimane constitue un ensemble '
      'd\'établissements de la région de Béni Mellal - '
      'Khénifra, au Maroc, dont la majorité se trouve à Béni Mellal.';

  final MotPresidentServices presidentServices =  MotPresidentServices();
  Future<MotPresident> futureMotPresident;

  @override
  void initState() {
    super.initState();
    futureMotPresident = presidentServices.fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Mot du président',
          style: TextStyle(
            fontSize: 20.0,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Center(
              child: Container(
                margin: EdgeInsets.fromLTRB(0, 14, 0, 10),
                decoration: BoxDecoration(
                    color: Colors.grey,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        offset: const Offset(3.0, 3.0),
                        blurRadius: 5.0,
                        spreadRadius: 2.0,
                      ),
                    ]
                ),
                child: CircleAvatar(
                  backgroundImage: AssetImage('$presidentImage'),
                  radius: 70.0,
                ),
              ),
            ),
            SizedBox(height: 0.0),
            Card(
              semanticContainer: true,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              elevation: 5,
              margin: EdgeInsets.all(10),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                     Text(
                         '$motpresident',
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.grey[700],
                          ),
                     ),
                    Text(
                      '$motpresident',
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.grey[700],
                      ),
                    ),
                    Text(
                      '$motpresident',
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.grey[700],
                      ),
                    ),
                    /* FutureBuilder<MotPresident>(
                      future: futureMotPresident,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Text(snapshot.data.mot);
                        } else if (snapshot.hasError) {
                          return Text("${snapshot.error}");
                        }
                        // By default, show a loading spinner.
                        return CircularProgressIndicator();
                      },
                    ),*/
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
