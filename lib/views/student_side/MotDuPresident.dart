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

  String presidentImage = 'assets/space-2.jpg';
  String motpresident = 'Adding a shadow or glow to your UI can '
      'add a nice finishing touch to the design. Adding elevation is nice '
      'for a feeling of depth, but we don’t have too much control over it: '
      'the shadow is what it is based on how elevated the widget is and we’re '
      'not able to give the shadow a nice color. Let’s take a look at how we can '
      'create our own shadow or glow and give our UI that finishing touch!';

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
      body: Padding(
        padding: EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0.0),
        child: Column(
          children: <Widget>[
            Center(
              child: Container(
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
                  radius: 60.0,
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                     Text('$motpresident'),
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
