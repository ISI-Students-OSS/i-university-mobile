import 'package:flutter/material.dart';
import 'package:fpbm/services/AboutTheUniversity.dart';
import 'package:fpbm/models/AboutUniversity.dart';
import 'package:flutter/cupertino.dart';
import 'dart:async';

//I use this link as reference for getting data -
// from  API https://flutter.dev/docs/cookbook/networking/fetch-data

class AbouttheUniversity extends StatefulWidget {
  @override
  _AbouttheUniversityState createState() => _AbouttheUniversityState();
}

class _AbouttheUniversityState extends State<AbouttheUniversity> {

  String universityImage = 'assets/space-2.jpg';
  String aboutuniversity = 'Dans le cadre de la politique de décentralisation, '
          'le centre des études universitaires des lettres et des sciences humaines '
          'a été créé par décret du ministre de léducation nationale nº 758-87 du 26 mai 1987. '
          'Quatre ans plus tard, le décret ministériel nº 290-554 du 8 janvier 1991 le transforme en faculté '
          'des lettres et des sciences humaines. Depuis lors, létablissement ne cesse de connaître des '
          'changements importants qui se remarquent au niveau de leffectif des étudiants, du corps enseignant '
          'et du personnel administratif, des activités scientifiques et culturelles, '
          'ainsi que des infrastructures et des équipements.';

  final AboutTheUniversity universityServices =  AboutTheUniversity();
  Future<AboutUniversity> futureMotPresident;

  @override
  void initState() {
    super.initState();
    futureMotPresident = universityServices.fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'About The university',
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
                  backgroundImage: AssetImage('$universityImage'),
                  radius: 60.0,
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(7.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                     Text('$aboutuniversity'),
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
