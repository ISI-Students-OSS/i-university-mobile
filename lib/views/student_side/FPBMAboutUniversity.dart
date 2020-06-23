import 'package:flutter/material.dart';
import 'package:fpbm/services/AboutUniversityServices.dart';
import 'package:fpbm/models/AboutUniversity.dart';
import 'package:flutter/cupertino.dart';
import 'dart:async';

//I use this link as reference for getting data -
// from  API https://flutter.dev/docs/cookbook/networking/fetch-data

class FPBMAboutUniversity extends StatefulWidget {
  @override
  _FPBMAboutUniversityState createState() => _FPBMAboutUniversityState();
}

class _FPBMAboutUniversityState extends State<FPBMAboutUniversity> {

  String universityImage = 'assets/logo-2.jpg';
  String universityTitle = 'Faculté Polydisciplinaire - Université Sultan Moulay Slimane ';
  String aboutFpUniversity = 'La faculté polydisciplinaire de Béni Mellal '
      'est un établissement universitaire de l’Université Sultan Moulay Slimane '
      'ouvert à partir de l’année universitaire 2003-2004 pour améliorer l’offre de '
      'formation de l’université et répondre aux attentes de son environnement socioéconomique régional et national.';
  String fillier = 'Filières';




  final AboutUniversityServices aboutUniversityServices =  AboutUniversityServices();
  Future<AboutUniversity> futureAboutUniversity;

  @override
  void initState() {
    super.initState();
    futureAboutUniversity = aboutUniversityServices.fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'FPBM en bref',
          style: TextStyle(
            fontSize: 20.0,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Card(
              semanticContainer: true,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              elevation: 5,
              margin: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                    SizedBox(
                    height: 200.0,
                    child: Stack(
                    children: <Widget>[
                    Positioned.fill(
                      child: Ink.image(
                      image: AssetImage('$universityImage'),
                      fit: BoxFit.cover,
                    ),
                    ),
                    ],
                    ),
                    ),
                   SizedBox(height: 20.0),
                   Padding(
                     padding: const EdgeInsets.all(10.0),
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: <Widget>[
                         Text(
                             '$universityTitle',
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                         ),
                         SizedBox(height: 20.0),
                         Text(
                           '$aboutFpUniversity',
                           style: TextStyle(
                             fontSize: 17.0,
                           ),
                         ),
                         SizedBox(height: 20.0),
                         Text(
                             '$fillier',
                              style: TextStyle(
                                fontSize: 17.0,
                                fontWeight: FontWeight.bold,
                              ),
                         ),
                         SizedBox(height: 10.0),
                         Padding(
                           padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                           child: Column(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: <Widget>[
                               Text(
                                 'Licence fondamentale',
                                 style: TextStyle(
                                   fontSize: 17.0,
                                 ),
                               ),
                               Text(
                                 'Licence professionnelle',
                                 style: TextStyle(
                                   fontSize: 17.0,
                                 ),
                               ),
                               Text(
                                 'Master',
                                 style: TextStyle(
                                   fontSize: 17.0,
                                 ),
                               ),
                             ],
                           ),
                         ),
                         SizedBox(height: 20.0),
                         Text(
                           'Contactez-nous',
                           style: TextStyle(
                             fontSize: 17.0,
                             fontWeight: FontWeight.bold,
                           ),
                         ),
                         SizedBox(height: 10.0),
                         Padding(
                           padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                           child: Column(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: <Widget>[
                               Text(
                                 'Faculté Polydisciplinaire - Université Sultan Moulay Slimane Mghila BP: 592 Beni Mellal ',
                                 style: TextStyle(
                                   fontSize: 17.0,
                                 ),
                               ),
                               Text(
                                 'Tél : +212(0)5234246',
                                 style: TextStyle(
                                   fontSize: 17.0,
                                 ),
                               ),
                               Text(
                                 'Fax : +212(0)52342459',
                                 style: TextStyle(
                                   fontSize: 17.0,
                                 ),
                               ),
                             ],
                           ),
                         ),

                       ],
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
          ],
        ),
      ),
    );
  }
}
