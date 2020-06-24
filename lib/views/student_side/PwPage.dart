import 'package:flutter/material.dart';
import 'package:fpbm/views/menu/menu.dart';

class PresedentPage extends StatefulWidget {
  @override
  _PresedentPage createState() => _PresedentPage();
}

class _PresedentPage extends State<PresedentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
          backgroundColor: Colors.blue,
          
          title: Text(
            "Mot du président",
            textAlign: TextAlign.center,
          ),
        ),
        drawer: Menu(),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              'Mot De Presedent Page',
              style: TextStyle(fontSize: 50),
            ),
          ],
        ),
      ),
    );
  }
}